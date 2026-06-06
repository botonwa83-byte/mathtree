# 公式树 MathTree — iOS App 完整设计方案

> 核心主张：用大学数学的视角俯瞰高中数学，让高考题目从"需要记忆"变成"显然成立"。

---

## 目录

1. 产品定位与核心哲学
2. 技术架构（Xcode / SwiftUI）
3. 公式知识图谱
4. 超前学习系统：用高阶公式秒杀高考
5. 练习题系统设计
6. SwiftUI 界面与交互设计
7. 数据模型
8. 核心算法
9. 开发路线图

---

## 一、产品定位与核心哲学

### 1.1 核心问题

现有数学 App 的通病：把知识切成碎片，每个公式独立背诵，学生只知道"是什么"，不知道"为什么"，更不知道"背后是什么"。结果是：学了微积分还是不会解高考压轴题，因为他们没有建立连接。

### 1.2 设计哲学：向上兼容

MathTree 的核心思想来自数学本身的结构：**高阶理论是低阶规则的统一解释**。

- 欧拉公式 $e^{i\theta} = \cos\theta + i\sin\theta$ 统一了所有三角恒等式
- 微积分导数统一了所有函数极值问题
- 线性代数统一了高中所有向量、圆锥曲线、空间几何问题
- 母函数统一了所有排列组合恒等式

当学生理解了高阶理论，高考的那些"规律"就不再需要死记，而是**自然推出**的结论。这不是超纲，而是**从更高处俯瞰**。

### 1.3 目标用户

- 主要：初中生、高中生（初一至高三）
- 次要：参加高考的复读生、对数学感兴趣的成人学习者
- 核心痛点：高考数学不满分、公式记不住、不理解原理、刷题无效率

### 1.4 核心差异化

| 竞品 | 模式 | MathTree |
|------|------|----------|
| 猿题库 / 学而思 | 题海战术，被动刷题 | 公式图谱，主动理解 |
| 可汗学院 | 线性课程，无跳跃 | 动态路径，超前解锁 |
| Photomath | 解题工具，无学习 | 深度理解，建立直觉 |
| GeoGebra | 几何工具 | 几何 + 代数 + 微积分联动 |

---

## 二、技术架构（Xcode / SwiftUI）

### 2.1 总体架构

```
MathTree
├── Presentation Layer       SwiftUI Views + ViewModels (MVVM)
├── Domain Layer             Use Cases, Formula Graph Engine
├── Data Layer               Core Data + CloudKit + Local JSON
└── Infrastructure           KaTeX Renderer, ML Engine, Analytics
```

### 2.2 核心技术选型

**界面框架**

```swift
// 全面使用 SwiftUI + Combine
import SwiftUI
import Combine

// 图形与动画
import SpriteKit          // 公式知识图谱的节点动画
import SceneKit           // 3D 几何可视化（立体几何模块）
import Charts             // Swift Charts：学习进度可视化
```

**数学公式渲染**

采用 `WKWebView` 内嵌 KaTeX，封装为 SwiftUI 原生组件：

```swift
struct FormulaView: UIViewRepresentable {
    let latex: String
    let displayMode: Bool
    
    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.isOpaque = false
        webView.backgroundColor = .clear
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let html = """
        <!DOCTYPE html><html>
        <head>
          <link rel="stylesheet" 
            href="https://cdn.jsdelivr.net/npm/katex/dist/katex.min.css">
          <script src="https://cdn.jsdelivr.net/npm/katex/dist/katex.min.js">
          </script>
        </head>
        <body style="background:transparent;margin:0;padding:8px;">
          <div id="formula"></div>
          <script>
            katex.render(`\(latex)`, document.getElementById('formula'), 
              { displayMode: \(displayMode), throwOnError: false });
          </script>
        </body></html>
        """
        webView.loadHTMLString(html, baseURL: nil)
    }
}
```

**数据持久化**

```swift
// Core Data：本地学习进度、公式掌握度
// CloudKit：跨设备同步（iCloud）
// JSON Bundle：公式数据库（随 App 安装，可更新）

struct FormulaDatabase {
    static func load() -> [Formula] {
        guard let url = Bundle.main.url(
            forResource: "formulas", withExtension: "json")
        else { return [] }
        let data = try! Data(contentsOf: url)
        return try! JSONDecoder().decode([Formula].self, from: data)
    }
}
```

**自适应学习引擎**

```swift
import CoreML

// 内置 Core ML 模型：预测下一道题的最优难度
// 输入特征：历史正确率、响应时长、遗忘曲线衰减率
// 输出：推荐下一个复习的公式 ID + 建议题目难度 [0, 1]
class AdaptiveEngine {
    let model: DifficultyPredictor   // .mlmodel 编译入 App
    
    func nextFormula(for student: StudentProfile) -> FormulaRecommendation {
        let input = DifficultyPredictorInput(
            daysSinceLastReview: student.daysSinceReview,
            historicalAccuracy: student.accuracy,
            formulaComplexity: student.currentFormulaLevel
        )
        let output = try? model.prediction(input: input)
        return FormulaRecommendation(
            formulaId: output?.recommendedFormulaId ?? "",
            difficulty: output?.targetDifficulty ?? 0.5
        )
    }
}
```

**Swift Package 依赖**

```swift
// Package.swift
dependencies: [
    .package(url: "https://github.com/airbnb/lottie-spm", from: "4.0.0"),
    // Lottie：公式推导动画、解锁特效
    
    .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.52.0"),
]
```

### 2.3 项目结构

```
MathTree.xcodeproj
├── App/
│   ├── MathTreeApp.swift
│   └── AppDelegate.swift
├── Features/
│   ├── FormulaGraph/          # 知识图谱
│   │   ├── GraphView.swift
│   │   ├── NodeView.swift
│   │   └── GraphViewModel.swift
│   ├── Study/                 # 学习模块
│   │   ├── FormulaDetailView.swift
│   │   ├── DerivationView.swift
│   │   └── GeometryCanvasView.swift
│   ├── Practice/              # 练习模块
│   │   ├── ProblemView.swift
│   │   ├── HintSystem.swift
│   │   └── SolutionStepsView.swift
│   ├── Leapfrog/              # 超前学习模块（核心）
│   │   ├── LeapfrogPathView.swift
│   │   ├── AdvancedUnlockView.swift
│   │   └── GaokaoSlayerView.swift
│   └── Progress/              # 学习统计
│       ├── DashboardView.swift
│       └── MasteryMapView.swift
├── Core/
│   ├── Models/                # Swift 数据模型
│   ├── Engine/                # 图谱算法、间隔重复
│   └── Renderer/              # FormulaView、GeometryRenderer
├── Resources/
│   ├── formulas.json          # 公式数据库
│   ├── problems.json          # 题库
│   └── paths.json             # 学习路径定义
└── ML/
    └── DifficultyPredictor.mlmodel
```

---

## 三、公式知识图谱

### 3.1 图谱结构设计

公式知识图谱是 MathTree 的灵魂。每个公式是一个节点，节点之间的有向边表示"可以推导出"或"是特例"的关系。

```swift
struct Formula: Identifiable, Codable {
    let id: String
    let name: String
    let latex: String                    // KaTeX 字符串
    let level: FormulaLevel              // .elementary / .middle / .high / .university
    let category: Category
    let prerequisites: [String]          // 依赖的公式 ID
    let derivations: [String]            // 可以推出的公式 ID
    let advancedForm: String?            // 更高阶的等价公式 ID（超前通道）
    let gaokaoRelevance: Double          // 0-1，高考相关度
    let tags: [String]
    let intuition: String                // 直觉描述（非公式语言）
}

enum FormulaLevel: String, Codable {
    case elementary    // 小学
    case middle        // 初中
    case high          // 高中
    case university    // 大学（超前内容）
    case advanced      // 研究生水平（挑战内容）
}
```

### 3.2 核心公式脉络（部分示例）

以下是图谱中几条关键的"公式链"，每条链从基础延伸至高阶：

**链 1：从面积到积分**
```
矩形面积 S=ab
  → 三角形面积 S=½bh
    → 梯形面积 S=½(a+b)h
      → 曲线围成面积（直觉）
        → 黎曼积分定义 ∫f(x)dx
          → 微积分基本定理 F(b)-F(a)
            → 广义积分、多重积分
```

**链 2：从乘法到欧拉公式（三角函数统一）**
```
乘法交换律
  → 复数定义 a+bi
    → 复数乘法（模与辐角）
      → 棣莫弗定理 (cosθ+isinθ)^n
        → 欧拉公式 e^(iθ) = cosθ+isinθ
          → 所有三角恒等式（一个公式推出所有）
            → 傅里叶变换直觉
```

**链 3：从方程到线性代数**
```
一元一次方程
  → 二元一次方程组
    → 消元法（高斯消元）
      → 矩阵表示 Ax=b
        → 行列式与克拉默法则
          → 特征值与特征向量
            → 二次型（圆锥曲线的本质）
              → 主成分分析（数据科学入口）
```

**链 4：从等差数列到微积分**
```
等差数列通项 aₙ=a₁+(n-1)d
  → 等差数列求和 Sₙ=n(a₁+aₙ)/2
    → 等比数列求和
      → 数列极限直觉
        → ε-δ 极限定义
          → 导数定义 f'(x)=lim[f(x+h)-f(x)]/h
            → 导数法则（秒杀所有极值题）
              → 泰勒展开（逼近任何函数）
```

**链 5：从勾股定理到微分几何**
```
勾股定理 a²+b²=c²
  → 距离公式 d=√[(x₂-x₁)²+(y₂-y₁)²]
    → 圆的方程 x²+y²=r²
      → 向量内积 a·b=|a||b|cosθ
        → n维欧几里得空间
          → 黎曼曲率（广义相对论入口）
```

### 3.3 图谱可视化逻辑（SpriteKit 实现）

```swift
class FormulaGraphScene: SKScene {
    // 每个公式 = 一个 SKNode
    // 边 = SKShapeNode（带箭头）
    // 不同层级用颜色和大小区分
    // 用 force-directed layout 自动排布（参考 D3 force simulation）
    
    func setupGraph(formulas: [Formula]) {
        for formula in formulas {
            let node = FormulaNode(formula: formula)
            node.position = randomPosition()   // 初始随机，之后物理引擎收敛
            addChild(node)
        }
        // 添加弹簧连接
        for formula in formulas {
            for prereqId in formula.prerequisites {
                addSpringEdge(from: formula.id, to: prereqId)
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        applyForceDirectedLayout()  // 每帧更新节点位置
    }
}
```

---

## 四、超前学习系统：用高阶公式秒杀高考

### 4.1 核心理念："降维打击"

高考数学本质是用初等方法解决复杂问题。但如果学生掌握高阶工具，同样的问题用两步就能解决。这不是作弊，而是数学的本质：**更深的理解产生更简洁的解法**。

### 4.2 高考高频题型与高阶武器对照表

| 高考题型 | 常规方法 | 高阶武器 | 速度比 |
|---------|---------|---------|-------|
| 二次函数极值 | 配方法，顶点公式 | 导数 f'(x)=0 | 3× 快 |
| 三角恒等变换 | 背 20+ 个公式 | 欧拉公式推导所有 | 只需记 1 个 |
| 等差数列求和 | 公式 Sₙ=n(a₁+aₙ)/2 | 积分直觉，梯形面积 | 直觉理解，永不忘 |
| 圆锥曲线切线 | 斜率公式代入 | 隐函数求导 | 5× 快 |
| 向量夹角证明 | 坐标暴力计算 | 内积空间性质 | 优雅且快 |
| 数列递推求解 | 待定系数，换元 | 特征方程 | 系统化秒杀 |
| 排列组合恒等式 | 逐项列举 | 生成函数/组合恒等式 | 一行证明 |
| 三角形面积最大值 | 辅助函数，分类讨论 | 拉格朗日乘数法直觉 | 思路清晰 |
| 数学归纳法 | 机械步骤 | 理解为递推不动点 | 不会忘记怎么写 |
| 复数运算 | 坐标分量计算 | 辐角与模的几何意义 | 几何直觉秒出答案 |

### 4.3 超前路径：四条快车道

**快车道 A：微积分解锁代数与函数**

```
解锁条件：完成高中函数模块 70% 掌握度
解锁内容：
  - 极限的直觉（ε-δ 非必须，直觉优先）
  - 导数的几何含义（切线斜率）
  - 常用求导法则（幂函数、三角、指数）
  - 链式法则

解锁后秒杀：
  ✓ 所有函数单调性、极值问题
  ✓ 切线方程（不需要配凑）
  ✓ 不等式证明（单调性替代代数技巧）
  ✓ 参数方程曲线形状分析

典型案例：
  题目：f(x) = x³ - 3x + 2，求极值
  
  传统方法：
    令 x³-3x+2=0，分解因式... （5步，容易算错）
  
  微积分方法：
    f'(x) = 3x² - 3 = 0 → x = ±1
    f''(1) = 6 > 0 极小值，f''(-1) = -6 < 0 极大值
    （2步，不会算错）
```

**快车道 B：欧拉公式解锁三角函数**

```
解锁条件：理解复数基本运算
解锁内容：
  - 复数的极坐标表示 r(cosθ + isinθ)
  - 欧拉公式 e^(iθ) = cosθ + isinθ
  - 复数乘法 = 旋转 + 缩放

解锁后秒杀：
  ✓ 和差化积、积化和差（不需要背）
  ✓ 二倍角、半角公式（令 n=2 即得）
  ✓ 正余弦辅助角公式（复数模长）
  ✓ 三角方程求解（辐角方程）

核心推导（App 中有动画演示）：
  e^(iA) · e^(iB) = e^(i(A+B))
  (cosA + isinA)(cosB + isinB) = cos(A+B) + isin(A+B)
  展开左边，实部 = cos(A+B)，虚部 = sin(A+B)
  → sin(A+B) = sinAcosB + cosAsinB  ✓ 自然推出
```

**快车道 C：线性代数解锁几何**

```
解锁条件：理解向量的基本运算
解锁内容：
  - 矩阵 = 线性变换（旋转、拉伸、反射）
  - 特征值、特征向量的几何含义
  - 二次型 xᵀAx 的几何意义（等高线形状）

解锁后秒杀：
  ✓ 圆锥曲线的类型判断（特征值符号决定）
  ✓ 空间几何中的法向量（叉积）
  ✓ 平面方程、直线方程统一框架
  ✓ 几何变换（旋转矩阵）

典型案例：
  题目：方程 x² + 4xy + y² = 1 是什么曲线？
  
  传统方法：配方，转轴，判断... （复杂）
  
  线性代数方法：
    矩阵 A = [[1,2],[2,1]]，特征值 λ₁=3，λ₂=-1
    特征值一正一负 → 双曲线（1秒判断）
```

**快车道 D：概率论解锁排列组合与统计**

```
解锁条件：掌握高中概率基础
解锁内容：
  - 随机变量与期望的线性性
  - 母函数（生成函数）直觉
  - 大数定律的直觉

解锁后秒杀：
  ✓ 复杂计数问题（用期望倒推数量）
  ✓ 排列组合恒等式（生成函数一行证）
  ✓ 条件概率与贝叶斯（系统化不出错）

典型案例：
  题目：证明 C(n,0)+C(n,1)+...+C(n,n)=2ⁿ
  
  传统方法：数学归纳法（3步）
  
  生成函数方法：
    (1+x)ⁿ 展开系数和 = 令 x=1 得 2ⁿ
    （一行，完全自然）
```

### 4.4 解锁机制设计

```swift
struct LeapfrogUnlock {
    let prerequisiteFormulas: [String]   // 需要掌握的公式 ID
    let prerequisiteMastery: Double      // 掌握度阈值（0-1）
    let advancedPathId: String           // 解锁的超前路径
    let gaokaoSlayCount: Int             // 能秒杀的高考题型数量
}

// 解锁动画：节点从"幽灵态"（灰色，半透明）
// 过渡到"激活态"（彩色，带光环特效）
// Lottie 动画：金色粒子爆炸 + 公式从模糊到清晰
```

---

## 五、练习题系统设计

### 5.1 题型分层架构

MathTree 的题目系统分为四个层次，每个公式节点都有对应四层的题目：

**第一层：模式识别（5秒内作答）**
- 给出一道题，问"该用哪个公式？"
- 给出一个公式，问"它能解决哪类问题？"
- 目的：建立公式与问题场景的条件反射

**第二层：直接应用（1分钟内作答）**
- 给出完整条件，直接套公式计算
- 数字填空，逐步引导
- 目的：巩固公式的计算步骤

**第三层：逆向推导（3分钟内作答）**
- 给出结果，反推条件（如：已知面积求高）
- 给出错误步骤，找出问题
- 目的：深化对公式结构的理解

**第四层：高阶降维（5分钟，挑战题）**
- 用高阶方法（微积分、线代、复数）解决初高中题目
- 同一道题，展示两种解法（常规 vs 高阶），比较速度
- 目的：建立"大学视角看高中数学"的思维

### 5.2 题目数据结构

```swift
struct Problem: Identifiable, Codable {
    let id: String
    let type: ProblemType
    let tier: Int                         // 1-4，对应上面四层
    let formulaIds: [String]              // 涉及的公式
    let content: ProblemContent
    let answer: Answer
    let difficulty: Double                // 0.0-1.0
    let averageTime: TimeInterval         // 历史平均作答时间
    let hints: [String]                   // 逐级提示，最多3级
    let solution: SolutionPath           // 完整解题步骤
    let advancedSolution: SolutionPath?  // 高阶解法（快车道题目特有）
    let gaokaoYear: Int?                 // 如果是真题，标注年份
    let tags: [String]
}

struct SolutionPath: Codable {
    let steps: [SolutionStep]
    let keyInsight: String   // 解题关键一句话
    let commonMistakes: [String]
}

struct SolutionStep: Codable {
    let description: String
    let latex: String        // 该步的公式表达
    let annotation: String   // 为什么这样做
}
```

### 5.3 巧妙题目设计原则

**原则 1：一题三看**
每道题都从三个角度呈现：
- 几何直觉图（看到即理解）
- 代数符号式（公式形式）
- 数值具体例（代入数字验证）

**原则 2：错误导向设计**
系统故意预设常见错误选项，答错后显示"你的错误说明你这样理解的…其实…"，把错误变成学习触发器。

**原则 3：压缩难度梯度**
同一知识点，系统会自动生成从"极简"到"高考压轴"的8个难度版本，允许学生从最容易的开始，逐步提升。

**原则 4：超前对比题**
每道高中题都配一道"用大学方法秒解"的版本。学生完成常规解法后，看到高阶解法时会产生"原来还能这样！"的顿悟体验——这是解锁动机的关键设计。

### 5.4 练习流程（SwiftUI 状态机）

```swift
enum PracticeState {
    case reading           // 阅读题目
    case thinking          // 作答中（计时）
    case hintRequested(level: Int)  // 请求了第 n 级提示
    case submitted(answer: Answer)  // 已提交
    case reviewing         // 查看解析
    case advancedView      // 查看高阶解法
    case nextProblem       // 进入下一题
}

class PracticeViewModel: ObservableObject {
    @Published var state: PracticeState = .reading
    @Published var elapsedTime: TimeInterval = 0
    @Published var hintsUsed: Int = 0
    
    func submitAnswer(_ answer: Answer) {
        let isCorrect = evaluate(answer)
        let masteryDelta = computeMasteryDelta(
            correct: isCorrect,
            time: elapsedTime,
            hintsUsed: hintsUsed
        )
        updateMastery(masteryDelta)
        state = .submitted(answer: answer)
    }
    
    private func computeMasteryDelta(
        correct: Bool, time: TimeInterval, hintsUsed: Int
    ) -> Double {
        // 基础分：答对+0.15，答错-0.05
        // 时间奖惩：快于平均时间*0.7 额外+0.05
        // 提示扣分：每用一次提示 -0.03
        var delta = correct ? 0.15 : -0.05
        if correct && time < problem.averageTime * 0.7 { delta += 0.05 }
        delta -= Double(hintsUsed) * 0.03
        return delta
    }
}
```

---

## 六、SwiftUI 界面与交互设计

### 6.1 主导航结构

```
TabView
├── Tab 1: 探索（公式图谱）        主功能，全屏交互图
├── Tab 2: 学习（公式详情）        浏览 + 深度学习
├── Tab 3: 练习（自适应题目）      日常练习入口
├── Tab 4: 超前（快车道）          核心差异化功能
└── Tab 5: 我的（进度 + 设置）     数据仪表盘
```

### 6.2 关键界面描述

**界面 1：公式图谱（FormulaGraphView）**

用 SpriteKit 渲染的力导向图。节点大小 = 掌握度（越熟越大）。颜色 = 年级（小学橙，初中绿，高中紫，大学金）。

交互：
- 双指捏合/展开：缩放图谱
- 单击节点：展开简介卡片
- 长按节点：进入公式详情
- 拖拽：平移图谱
- "超前预览"模式：激活后，大学级节点从透明幽灵变为半可见，显示解锁路径

```swift
struct FormulaGraphView: View {
    @StateObject var vm = FormulaGraphViewModel()
    
    var body: some View {
        ZStack {
            SpriteView(scene: vm.graphScene)
                .ignoresSafeArea()
            
            // 悬浮工具栏
            VStack {
                Spacer()
                HStack(spacing: 16) {
                    GraphToolButton(icon: "leapfrog", label: "超前预览") {
                        vm.toggleLeapfrogOverlay()
                    }
                    GraphToolButton(icon: "magnify", label: "搜索公式") {
                        vm.showSearch = true
                    }
                    GraphToolButton(icon: "scope", label: "我的位置") {
                        vm.centerOnCurrentNode()
                    }
                }
                .padding()
                .background(.ultraThinMaterial, in: Capsule())
                .padding(.bottom, 20)
            }
        }
    }
}
```

**界面 2：公式详情（FormulaDetailView）**

分为四个滚动区块：

区块 A — 公式呈现
- 大号 KaTeX 渲染
- 变量说明卡片（可展开）
- "我的掌握度"进度环

区块 B — 几何直觉
- 可交互的 SVG/SwiftUI 几何图
- 参数滑块（拖动改变三角形高度，实时看面积变化）
- "这个公式的直觉"：一句话解释，不用数学语言

区块 C — 推导来源
- 动画展示"这个公式是怎么从更基础的公式推出来的"
- 用 Lottie 动画逐步展开推导步骤

区块 D — 超前视角
- 灰色锁定状态（未解锁时）
- 解锁后显示：这个公式背后的高阶理论是什么，用大学方法怎么更优雅地处理同类问题

**界面 3：练习界面（PracticeView）**

```swift
struct PracticeView: View {
    @StateObject var vm: PracticeViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            // 进度条 + 计时器
            PracticeHeaderView(
                progress: vm.sessionProgress,
                elapsedTime: vm.elapsedTime
            )
            
            // 题目区域（可滑动）
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // 题目文字（含 LaTeX inline 公式）
                    ProblemTextView(content: vm.currentProblem.content)
                    
                    // 几何图示（如果有）
                    if let geo = vm.currentProblem.geometry {
                        InteractiveGeometryView(geometry: geo)
                    }
                    
                    // 答案输入区（根据题型变化）
                    AnswerInputView(
                        type: vm.currentProblem.type,
                        onSubmit: vm.submitAnswer
                    )
                }
                .padding(20)
            }
            
            // 底部工具栏
            PracticeToolbar(
                onHint: { vm.requestHint() },
                onSkip: { vm.skipProblem() },
                hintsRemaining: 3 - vm.hintsUsed
            )
        }
    }
}
```

**界面 4：超前快车道（LeapfrogView）**

展示四条快车道，每条以卡片形式显示：
- 解锁进度条（当前掌握度 / 解锁门槛）
- 解锁后能秒杀的高考题型数量
- "尝一口"按钮：看一个20秒的高阶概念动画预告

解锁后，每条快车道展开为一个迷你课程：
- 5分钟内可以完成的核心概念介绍
- 3道"高阶方法 vs 常规方法"对比练习
- 高考真题实战演练

**界面 5：进度仪表盘（DashboardView）**

```
┌─────────────────────────────────────────┐
│  今日学习                                │
│  ●●●○○  已学公式 3个  连续 12天          │
├────────────────┬────────────────────────┤
│  掌握地图       │  快车道进度             │
│  [热力图]      │  微积分 ████░ 73%       │
│  颜色=掌握度   │  欧拉   ██░░░ 41%       │
│               │  线代   █░░░░ 18%       │
├────────────────┴────────────────────────┤
│  高考预测得分                            │
│  [折线图：过去30天，预测分从102→128]     │
│  目标：150分     当前预测：128分         │
├─────────────────────────────────────────┤
│  薄弱公式（需复习）                      │
│  • 余弦定理   上次学习：5天前             │
│  • 等比数列   错误率：47%               │
└─────────────────────────────────────────┘
```

---

## 七、数据模型

### 7.1 Core Data 模型

```swift
// 学生掌握度（持久化）
@objc(FormulaMastery)
class FormulaMastery: NSManagedObject {
    @NSManaged var formulaId: String
    @NSManaged var masteryLevel: Double     // 0.0 - 1.0
    @NSManaged var reviewCount: Int32
    @NSManaged var lastReviewedAt: Date
    @NSManaged var nextReviewAt: Date       // 间隔重复计算
    @NSManaged var easeFactor: Double       // SM-2 算法参数
}

// 练习记录
@objc(PracticeRecord)
class PracticeRecord: NSManagedObject {
    @NSManaged var problemId: String
    @NSManaged var solvedAt: Date
    @NSManaged var isCorrect: Bool
    @NSManaged var responseTime: Double     // 秒
    @NSManaged var hintsUsed: Int16
    @NSManaged var usedAdvancedMethod: Bool // 是否用了高阶方法
}

// 超前路径解锁记录
@objc(LeapfrogProgress)
class LeapfrogProgress: NSManagedObject {
    @NSManaged var pathId: String
    @NSManaged var unlockedAt: Date?
    @NSManaged var currentMastery: Double
    @NSManaged var completedSteps: [String] // JSON 编码的步骤 ID 数组
}
```

### 7.2 公式 JSON 数据库格式

```json
{
  "formulas": [
    {
      "id": "trig_euler",
      "name": "欧拉公式",
      "latex": "e^{i\\theta} = \\cos\\theta + i\\sin\\theta",
      "level": "university",
      "category": "trigonometry",
      "prerequisites": ["complex_basic", "exp_function"],
      "derivations": [
        "sin_addition", "cos_addition", "double_angle",
        "half_angle", "product_to_sum"
      ],
      "advancedForm": null,
      "gaokaoRelevance": 0.95,
      "intuition": "在单位圆上转 θ 角，x 坐标是 cosθ，y 坐标是 sinθ",
      "tags": ["三角", "复数", "欧拉", "超前"],
      "leapfrogKey": true,
      "unlockedBy": "leapfrog_path_B"
    }
  ]
}
```

---

## 八、核心算法

### 8.1 间隔重复算法（改进版 SM-2）

```swift
struct SpacedRepetitionEngine {
    
    // 基于 SM-2，针对"公式学习"的特殊优化：
    // 1. 区分"认识公式"和"能应用公式"两种记忆深度
    // 2. 考虑"超前理解"：理解了高阶理论后，低阶公式的遗忘曲线变平
    
    func nextReview(
        mastery: FormulaMastery,
        hasLeapfrogUnderstanding: Bool
    ) -> Date {
        let baseInterval = computeBaseInterval(mastery: mastery)
        
        // 超前理解奖励：遗忘速度减半
        let leapfrogMultiplier: Double = hasLeapfrogUnderstanding ? 2.0 : 1.0
        
        let adjustedInterval = baseInterval * leapfrogMultiplier
        return Date().addingTimeInterval(adjustedInterval * 86400)
    }
    
    private func computeBaseInterval(mastery: FormulaMastery) -> Double {
        switch mastery.reviewCount {
        case 0: return 1      // 第一次：明天复习
        case 1: return 3      // 第二次：3天后
        default:
            let newInterval = Double(mastery.lastInterval) * mastery.easeFactor
            return min(newInterval, 180)   // 最长半年
        }
    }
}
```

### 8.2 高考预测评分模型

```swift
struct GaokaoPredictor {
    
    // 高考数学 150 分，按知识点权重分配
    let weightMap: [String: Double] = [
        "functions_and_graphs":    0.18,  // 函数与图像 ~27分
        "trigonometry":            0.12,  // 三角函数 ~18分
        "sequences":               0.08,  // 数列 ~12分
        "inequalities":            0.07,  // 不等式 ~10分
        "conic_sections":          0.12,  // 圆锥曲线 ~18分
        "solid_geometry":          0.10,  // 空间几何 ~15分
        "probability_statistics":  0.12,  // 概率统计 ~18分
        "vectors":                 0.08,  // 向量 ~12分
        "derivatives_application": 0.08,  // 导数应用 ~12分
        "parametric_polar":        0.05,  // 参数方程/极坐标 ~8分
    ]
    
    func predictScore(masteryMap: [String: Double]) -> Double {
        var predictedScore = 0.0
        for (topic, weight) in weightMap {
            let mastery = masteryMap[topic] ?? 0.0
            // 掌握度到得分率的非线性映射
            // 0.8 以上掌握度 → 接近满分该题
            // 0.5 掌握度 → 约 70% 得分率（会做但容易出错）
            let scoreRate = scoreRateFromMastery(mastery)
            predictedScore += weight * 150 * scoreRate
        }
        return predictedScore
    }
    
    private func scoreRateFromMastery(_ mastery: Double) -> Double {
        // Sigmoid 映射：0.5 → 0.65，0.8 → 0.92，1.0 → 0.98
        return 0.98 / (1 + exp(-8 * (mastery - 0.7)))
    }
}
```

### 8.3 学习路径规划（Dijkstra 变体）

```swift
struct LearningPathPlanner {
    
    // 给定"当前掌握状态"和"目标公式"
    // 找出学习代价最小的路径（类似导航）
    
    func optimalPath(
        from currentMastery: [String: Double],
        to targetFormulaId: String,
        preferLeapfrog: Bool    // 是否优先走超前路径
    ) -> [FormulaNode] {
        
        // 边的权重 = 预计学习时间（分钟）
        // 考虑：当前掌握度、公式复杂度、是否有超前捷径
        
        var distances = [String: Double]()
        var previous = [String: String]()
        var unvisited = Set<String>()
        
        // 初始化：当前已掌握的公式距离为 0
        for (id, mastery) in currentMastery where mastery > 0.7 {
            distances[id] = 0
        }
        
        // Dijkstra 搜索...
        // 找到达 targetFormulaId 的最短学习路径
        
        return reconstructPath(
            from: targetFormulaId, 
            previous: previous,
            graph: formulaGraph
        )
    }
}
```

---

## 九、开发路线图

### Phase 1 — MVP（第 1-3 个月）

目标：能用，有核心功能，可以给种子用户体验。

技术：
- SwiftUI 基础架构搭建
- 公式 JSON 数据库（初高中，约 200 个公式）
- KaTeX 渲染组件
- 简单列表式公式浏览（不是图谱，先用列表）
- 练习题系统 Level 1-2（直接应用题，约 500 道）
- Core Data 基础进度存储

功能：
- 按年级/主题浏览公式
- 每个公式有：大号渲染 + 变量说明 + 简单几何图
- 每日练习：系统推荐 10 道题
- 基础间隔重复提醒（UserNotifications）

### Phase 2 — 核心产品（第 4-6 个月）

目标：差异化功能上线，留住用户。

技术：
- SpriteKit 公式图谱（力导向图）
- 可交互几何画板（SwiftUI + Core Graphics）
- 公式推导动画（Lottie）
- 超前学习系统（4条快车道，第一期实现微积分快车道）
- Level 3-4 题目（逆向推导 + 高阶降维）
- Core ML 自适应难度模型

功能：
- 全功能公式图谱（可缩放、可搜索）
- 微积分快车道解锁（首个超前功能）
- 公式推导动画（让学生"看到"公式是怎么来的）
- "高阶 vs 常规"对比解法
- CloudKit 同步（多设备）

### Phase 3 — 上线打磨（第 7-8 个月）

目标：App Store 上线，建立口碑。

功能：
- 4 条超前快车道全部上线
- 高考预测评分系统
- 进度仪表盘（Swift Charts 可视化）
- 高考真题题库（近 10 年，约 300 道）
- Widget（桌面小组件：今日公式 + 复习提醒）
- iPad 版本适配（大屏图谱更好用）

### Phase 4 — 增长（第 9-12 个月）

- 社区功能：学习小组、挑战赛
- 老师端：布置公式练习、查看班级掌握度
- AI 生成题目（基于 Anthropic API，动态生成个性化题目）
- 大学数学模块扩展（线性代数、概率论完整课程）
- Apple Watch 版本（碎片化复习，每日公式卡片）

---

## 附录：技术关键决策说明

### 为什么用 SpriteKit 而不是 SwiftUI 来渲染图谱

公式图谱有数百个节点需要每帧更新位置（力导向算法），SwiftUI 的 `Canvas` 虽然支持即时模式绘制，但在节点数 > 100 时性能下降明显。SpriteKit 有成熟的物理引擎和 Metal 加速渲染，更适合这类场景。

### 为什么 KaTeX 用 WKWebView 而不是原生实现

iOS 上目前没有成熟的原生 LaTeX 渲染库。完全原生实现一套 TeX 解析器工作量极大且容易出 bug。用 WKWebView 内嵌 KaTeX 可以：① 渲染质量与网页版一致 ② 维护成本低 ③ KaTeX 本身极快（< 1ms）。代价是内存占用略高，每个公式视图有独立 WebView 开销，可通过复用池（WKWebView pool）优化。

### 公式数据库为何用 JSON Bundle 而不是服务器

初期用 Bundle 内置 JSON 的好处：① 离线可用 ② 无服务器成本 ③ App 审核不依赖后端。等到题库 > 5000 题，引入后端 API 实现增量更新（类似字典 App 的数据包下载）。

---

*文档版本：v1.0 | 设计日期：2026年5月*
