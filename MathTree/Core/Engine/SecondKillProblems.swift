import SwiftUI

// MARK: - 降维打击 · 秒杀殿堂 数据层
//
// 产品灵魂：用「高维」数学工具（大学知识 / 纲内深用技巧）秒杀近二十年高考压轴题。
// 每个战例 = 一道压轴题 + 双解对决：
//   · standardMethod（常规法）：高中老师会教的、正确但繁琐的硬解
//   · descentMethod（降维秒杀）：用一把"武器"几步拿下
// 数据复用现有 Problem / DualSolution 模型；额外的展示元数据放在 SecondKillCase。
//
// ⚠️ 诚信原则：题型源自历年高考压轴高频题型（部分为改编），不臆造"某年某卷某题"的精确出处。
// ⚠️ 使用守则：超纲武器（洛必达/泰勒/中值/对数平均/积分放缩）直接写进高考大题可能不被认可，
//    其正确定位是——选择填空直接秒杀、大题用来"先秒出答案再倒推标准步骤 / 检验 / 定方向"。

// MARK: - 武器（按"工具"组织，而非按章节）

enum KillWeapon: String, CaseIterable, Identifiable {
    case secondDerivative   // 二次求导 · 凹凸性 / Jensen
    case taylor             // 泰勒展开
    case lopital            // 洛必达法则
    case extremumOffset     // 极值点偏移（对数平均不等式）
    case tangentLine        // 切线放缩
    case lagrange           // 拉格朗日中值定理
    case integralBound      // 定积分放缩
    case lagrangeMultiplier // 拉格朗日乘数法（多元条件极值）
    case eulerFormula       // 欧拉公式（三角求和 / 复数）
    case recurrence         // 特征根法 · 不动点（递推数列通项）
    case cauchyPower        // 柯西 · 权方和（分式和最值）
    case quadraticForm      // 二次型 · 特征值（圆上二次式范围）
    case sosDecomposition   // SOS 配方法（平方和）
    case trigSubstitution   // 三角换元
    case rolleTheorem       // 罗尔定理 · 构造原函数（存在性）
    // ── 高考选择/填空题「技巧型」秒杀（纲内，学校讲得浅）──
    case specialValue       // 特殊值 / 赋值法
    case optionElimination  // 选项代入 · 排除法
    case numberShape        // 数形结合 · 几何意义
    case estimation         // 估算 · 特例比较
    case symmetryPeriod     // 对称性 · 周期速算
    case vieta              // 韦达定理 · 根与系数
    case substitution       // 整体代换 · 换元
    case complement         // 正难则反 · 补集法
    case trigGraph          // 三角图象 · 五点定参
    case extremePosition    // 极端位置 · 临界值
    case amgmTrick          // 基本不等式 · 取等
    case coordinateMethod   // 坐标化 · 建系秒算
    case homomorphism       // 同构法 · exp-ln
    case paramSeparation    // 参数分离 · 恒成立
    case hiddenZero         // 隐零点 · 虚设零点
    case pointDifference    // 点差法 · 中点弦
    case constructCompare   // 构造函数 · 比大小
    case polarization       // 极化恒等式 · 向量
    case necessityProbe     // 必要性探路 · 端点
    case sequencePeriod     // 数列周期 · 找规律
    case telescoping        // 裂项相消 · 望远镜求和
    case scaling            // 放缩法 · 数列不等式
    case conicVieta         // 设而不求 · 韦达整体代
    case induction          // 数学归纳法 · 多米诺
    case oddConstruct       // 奇偶构造 · 抽公因式
    case linearProgramming  // 线性规划 · 可行域顶点
    case basicQuantity      // 基本量法 · 等差等比
    case complexNumber      // 复数运算 · 模与共轭
    // ── 立体几何 · 概率统计 · 排列组合（高频选填速杀）──
    case normalVector       // 法向量法 · 空间角/距离秒算
    case circumSphere       // 外接球 · 补形 / 球心定位
    case projectionArea     // 射影面积法 · 二面角
    case binomialMoment     // 二项分布 · 期望方差直出
    case totalProbability   // 全概率 / 贝叶斯
    case indicatorExpectation // 示性变量 · 期望线性性
    case insertionGap       // 插空法 · 不相邻排列
    case bundling           // 捆绑法 · 相邻排列
    case partition          // 隔板法 · 正整数分配
    case derangement        // 错位重排 · 不动点公式
    // ── 第 5 批（数列求和 / 三角 / 系数比较 / 解析几何 / 组合 / 对数 / 函数）──
    case staggeredSum       // 错位相减法 · 等差×等比
    case triLaw             // 正余弦定理 · 面积公式
    case undetermined       // 待定系数 · 比较系数
    case contactChord       // 切点弦方程 · T=0
    case pigeonhole         // 鸽巢原理 · 存在性
    case groupedSum         // 分组分项求和 · 奇偶拆分
    case logChange          // 换底公式 · 对数链
    case zeroCount          // 图形数零点 · 方程解个数
    case vectorBasis        // 向量基底 · 平面分解
    case absValue           // 绝对值不等式 · 几何距离

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .secondDerivative: return "二次求导 · 凹凸性"
        case .taylor:           return "泰勒展开"
        case .lopital:          return "洛必达法则"
        case .extremumOffset:   return "极值点偏移"
        case .tangentLine:      return "切线放缩"
        case .lagrange:         return "拉格朗日中值定理"
        case .integralBound:    return "定积分放缩"
        case .lagrangeMultiplier: return "拉格朗日乘数法"
        case .eulerFormula:     return "欧拉公式"
        case .recurrence:       return "特征根法 · 不动点"
        case .cauchyPower:      return "柯西 · 权方和"
        case .quadraticForm:    return "二次型 · 特征值"
        case .sosDecomposition: return "SOS 配方法"
        case .trigSubstitution: return "三角换元"
        case .rolleTheorem:     return "罗尔定理 · 构造原函数"
        case .specialValue:     return "特殊值 · 赋值法"
        case .optionElimination: return "选项代入 · 排除法"
        case .numberShape:      return "数形结合 · 几何意义"
        case .estimation:       return "估算 · 特例比较"
        case .symmetryPeriod:   return "对称性 · 周期速算"
        case .vieta:            return "韦达定理 · 根与系数"
        case .substitution:     return "整体代换 · 换元"
        case .complement:       return "正难则反 · 补集法"
        case .trigGraph:        return "三角图象 · 五点定参"
        case .extremePosition:  return "极端位置 · 临界值"
        case .amgmTrick:        return "基本不等式 · 取等"
        case .coordinateMethod: return "坐标化 · 建系秒算"
        case .homomorphism:     return "同构法 · exp-ln"
        case .paramSeparation:  return "参数分离 · 恒成立"
        case .hiddenZero:       return "隐零点 · 虚设零点"
        case .pointDifference:  return "点差法 · 中点弦"
        case .constructCompare: return "构造函数 · 比大小"
        case .polarization:     return "极化恒等式 · 向量"
        case .necessityProbe:   return "必要性探路 · 端点"
        case .sequencePeriod:   return "数列周期 · 找规律"
        case .telescoping:      return "裂项相消 · 望远镜求和"
        case .scaling:          return "放缩法 · 数列不等式"
        case .conicVieta:       return "设而不求 · 韦达整体代"
        case .induction:        return "数学归纳法 · 多米诺"
        case .oddConstruct:     return "奇偶构造 · 抽公因式"
        case .linearProgramming: return "线性规划 · 可行域顶点"
        case .basicQuantity:    return "基本量法 · 等差等比"
        case .complexNumber:    return "复数运算 · 模与共轭"
        case .normalVector:     return "法向量法 · 空间角"
        case .circumSphere:     return "外接球 · 补形定心"
        case .projectionArea:   return "射影面积法 · 二面角"
        case .binomialMoment:   return "二项分布 · 期望方差"
        case .totalProbability: return "全概率 · 贝叶斯"
        case .indicatorExpectation: return "示性变量 · 期望线性"
        case .insertionGap:     return "插空法 · 不相邻"
        case .bundling:         return "捆绑法 · 相邻"
        case .partition:        return "隔板法 · 整数分配"
        case .derangement:      return "错位重排 · 不动点"
        case .staggeredSum:     return "错位相减法 · 等差×等比"
        case .triLaw:           return "正余弦定理 · 面积"
        case .undetermined:     return "待定系数 · 比较系数"
        case .contactChord:     return "切点弦方程 · T=0"
        case .pigeonhole:       return "鸽巢原理 · 存在性"
        case .groupedSum:       return "分组分项求和"
        case .logChange:        return "换底公式 · 对数链"
        case .zeroCount:        return "图形数零点 · 解的个数"
        case .vectorBasis:      return "向量基底 · 平面分解"
        case .absValue:         return "绝对值不等式 · 距离"
        }
    }

    /// 一句话武器定位
    var tagline: String {
        switch self {
        case .secondDerivative: return "二阶导定凹凸，Jensen 一步压住一串"
        case .taylor:           return "把函数拆成多项式，极限与放缩瞬间看穿"
        case .lopital:          return "0/0、∞/∞ 直接求导，绕开重要极限拼凑"
        case .extremumOffset:   return "双零点之和/积，对数平均一击夹定"
        case .tangentLine:      return "用切线 eˣ≥x+1、lnx≤x-1 整段放缩"
        case .lagrange:         return "把函数增量化成 f'(ξ)·Δx，区间一夹即证"
        case .integralBound:    return "数列求和卡住？用积分把每一项夹住再求和"
        case .lagrangeMultiplier: return "多元条件极值，梯度平行一步定驻点"
        case .eulerFormula:     return "e^{iθ}=cosθ+isinθ，三角求和化几何级数"
        case .recurrence:       return "递推数列通项，特征方程/不动点直接给闭式"
        case .cauchyPower:      return "分式平方和，(Σa)²/(Σb) 一步压到最小"
        case .quadraticForm:    return "圆上二次式的范围 = 对称矩阵的两个特征值"
        case .sosDecomposition: return "把式子配成平方和，非负性一眼可见"
        case .trigSubstitution: return "带根号或 x²+y² 约束？换到角度世界"
        case .rolleTheorem:     return "构造原函数，两端相等必有驻点"
        case .specialValue:     return "抽象函数/恒等式？代特殊值瞬间出数"
        case .optionElimination: return "别正算，把选项代回去，对的留下"
        case .numberShape:      return "代数式翻译成斜率/距离/面积，看图秒答"
        case .estimation:       return "选择题只要量级，估出大小直接排除"
        case .symmetryPeriod:   return "对称轴/中心+周期，f(很大的数) 折回近处"
        case .vieta:            return "不解方程，两根的对称式直接由系数出"
        case .substitution:     return "把重复结构当整体，方程瞬间降次"
        case .complement:       return "至少/至多型，算对立面 1−P 反而简单"
        case .trigGraph:        return "y=Asin(ωx+φ)：周期定ω、特殊点定φ"
        case .extremePosition:  return "动态最值取边界，圆/椭圆一步定范围"
        case .amgmTrick:        return "1的代换破分式，和定积最大、积定和最小"
        case .coordinateMethod: return "向量几何建系，点乘模长退化成算术"
        case .homomorphism:     return "eˣ 与 ln 凑成同一函数 f(t)=teᵗ，比单调性"
        case .paramSeparation:  return "恒成立 a≥g(x) ⟺ a≥g(x) 的最大值"
        case .hiddenZero:       return "导数零点解不出？设 x₀ 满足 f'(x₀)=0 整体代换"
        case .pointDifference:  return "中点弦斜率：两点代入作差，一步出 k"
        case .constructCompare: return "aᵇ 与 bᵃ 比大小？构造 f(x)=lnx/x 比单调"
        case .polarization:     return "a·b=¼(|a+b|²−|a−b|²)，点乘秒变模长"
        case .necessityProbe:   return "含参恒成立，先代端点求出参数必要条件锁死"
        case .sequencePeriod:   return "递推算前几项找周期，a₂₀₂₄ 落回一格"
        case .telescoping:      return "每项拆成相邻两块的差，求和首尾对消"
        case .scaling:          return "精确求和算不出？把每项放大/缩小到能求和"
        case .conicVieta:       return "联立得二次，x₁+x₂、x₁x₂ 整体代入不解根"
        case .induction:        return "n=1 成立 + 假设 n=k 推 n=k+1，整串自动成立"
        case .oddConstruct:     return "f(x)=g(x)+b，g 奇，则 f(a)+f(−a)=2b"
        case .linearProgramming: return "目标 z=ax+by 的最值，必在可行域顶点取到"
        case .basicQuantity:    return "等差设 a₁,d；等比设 a₁,q，条件列方程一解到底"
        case .complexNumber:    return "i 四次一循环、|z₁z₂|=|z₁||z₂|、共轭对称速算"
        case .normalVector:     return "建系给法向量，二面角/线面角/点面距全退化成点乘"
        case .circumSphere:     return "三棱锥补成长方体，体对角线一半就是外接球半径"
        case .projectionArea:   return "cosθ=S射影/S原，二面角不必在棱上找垂线"
        case .binomialMoment:   return "X~B(n,p)：E=np、D=np(1−p)，公式直出免列分布列"
        case .totalProbability: return "拆成几条互斥路径，P=ΣP(Bᵢ)P(A|Bᵢ) 一行加完"
        case .indicatorExpectation: return "复杂计数的期望？拆成 0-1 示性变量逐个概率相加"
        case .insertionGap:     return "不相邻排列：先排其余，再把它们插进空位里"
        case .bundling:         return "相邻排列：捆成一个整体先排，再乘内部顺序"
        case .partition:        return "n 个相同球放 m 盒每盒至少 1：C(n−1,m−1) 插隔板"
        case .derangement:      return "全部错位的方法数 Dₙ：D₄=9、D₅=44，公式秒报"
        case .staggeredSum:     return "等差×等比混积数列？错位相减一步拆解"
        case .triLaw:           return "正余弦定理解三角形，面积公式一键出角"
        case .undetermined:     return "设好系数代入比较，恒等式一步定全部"
        case .contactChord:     return "切点弦 T=0 直接写方程，无需联立验证"
        case .pigeonhole:       return "n+1 个球放 n 个盒，必有两球同盒"
        case .groupedSum:       return "奇偶项分组，各组等差/等比分别求和"
        case .logChange:        return "换底公式统一底数，对数链一行出结果"
        case .zeroCount:        return "图形交点个数即方程实根个数"
        case .vectorBasis:      return "任意向量用基底线性表出，坐标直接列系数"
        case .absValue:         return "|x−a|+|x−b|=几何距离，最小值=两点之距"
        }
    }

    var icon: String {
        switch self {
        case .secondDerivative: return "function"
        case .taylor:           return "chart.xyaxis.line"
        case .lopital:          return "divide"
        case .extremumOffset:   return "arrow.left.and.right"
        case .tangentLine:      return "line.diagonal"
        case .lagrange:         return "ruler"
        case .integralBound:    return "sum"
        case .lagrangeMultiplier: return "circle.grid.cross.fill"
        case .eulerFormula:     return "wave.3.forward"
        case .recurrence:       return "arrow.triangle.2.circlepath"
        case .cauchyPower:      return "chart.bar.xaxis"
        case .quadraticForm:    return "rectangle.split.2x2"
        case .sosDecomposition: return "square.grid.2x2.fill"
        case .trigSubstitution: return "triangle.fill"
        case .rolleTheorem:     return "waveform.path"
        case .specialValue:     return "1.circle.fill"
        case .optionElimination: return "checklist.checked"
        case .numberShape:      return "ruler.fill"
        case .estimation:       return "lessthan.circle.fill"
        case .symmetryPeriod:   return "circle.lefthalf.filled"
        case .vieta:            return "plusminus.circle.fill"
        case .substitution:     return "square.on.square"
        case .complement:       return "minus.diamond.fill"
        case .trigGraph:        return "wave.3.right"
        case .extremePosition:  return "arrow.up.left.and.arrow.down.right"
        case .amgmTrick:        return "equal.circle.fill"
        case .coordinateMethod: return "grid"
        case .homomorphism:     return "arrow.left.arrow.right.circle.fill"
        case .paramSeparation:  return "a.circle.fill"
        case .hiddenZero:       return "circle.dashed"
        case .pointDifference:  return "chart.dots.scatter"
        case .constructCompare: return "arrow.up.arrow.down.circle.fill"
        case .polarization:     return "diamond.circle.fill"
        case .necessityProbe:   return "target"
        case .sequencePeriod:   return "repeat.circle.fill"
        case .telescoping:      return "scissors"
        case .scaling:          return "arrow.up.and.down.circle"
        case .conicVieta:       return "questionmark.circle.fill"
        case .induction:        return "list.number"
        case .oddConstruct:     return "circle.righthalf.filled"
        case .linearProgramming: return "pentagon.fill"
        case .basicQuantity:    return "number.square"
        case .complexNumber:    return "i.circle.fill"
        case .normalVector:     return "cube"
        case .circumSphere:     return "circle.circle"
        case .projectionArea:   return "square.on.square.dashed"
        case .binomialMoment:   return "chart.bar.fill"
        case .totalProbability: return "arrow.triangle.branch"
        case .indicatorExpectation: return "plus.forwardslash.minus"
        case .insertionGap:     return "text.insert"
        case .bundling:         return "rectangle.compress.vertical"
        case .partition:        return "rectangle.split.3x1"
        case .derangement:      return "shuffle"
        case .staggeredSum:     return "arrow.left.and.right.text.vertical"
        case .triLaw:           return "triangle"
        case .undetermined:     return "equal.square.fill"
        case .contactChord:     return "pencil.tip"
        case .pigeonhole:       return "tray.2.fill"
        case .groupedSum:       return "square.split.2x1.fill"
        case .logChange:        return "arrow.2.squarepath"
        case .zeroCount:        return "chart.line.uptrend.xyaxis"
        case .vectorBasis:      return "arrow.up.right.and.arrow.down.left"
        case .absValue:         return "ruler"
        }
    }

    var tint: Color {
        switch self {
        case .secondDerivative: return .apexLava
        case .taylor:           return .apexStarBlue
        case .lopital:          return .apexMystery
        case .extremumOffset:   return .rainbowOrange
        case .tangentLine:      return .apexEmerald
        case .lagrange:         return .rainbowIndigo
        case .integralBound:    return .apexGold
        case .lagrangeMultiplier: return .rainbowPurple
        case .eulerFormula:     return .rainbowBlue
        case .recurrence:       return .rainbowTeal
        case .cauchyPower:      return .rainbowGreen
        case .quadraticForm:    return .rainbowYellow
        case .sosDecomposition: return .rainbowRed
        case .trigSubstitution: return .levelElementary
        case .rolleTheorem:     return .levelUniversity
        case .specialValue:     return .apexGold
        case .optionElimination: return .apexEmerald
        case .numberShape:      return .apexStarBlue
        case .estimation:       return .rainbowOrange
        case .symmetryPeriod:   return .rainbowPurple
        case .vieta:            return .apexStarBlue
        case .substitution:     return .rainbowTeal
        case .complement:       return .rainbowOrange
        case .trigGraph:        return .rainbowBlue
        case .extremePosition:  return .rainbowRed
        case .amgmTrick:        return .apexEmerald
        case .coordinateMethod: return .rainbowGreen
        case .homomorphism:     return .apexLava
        case .paramSeparation:  return .apexStarBlue
        case .hiddenZero:       return .apexMystery
        case .pointDifference:  return .rainbowIndigo
        case .constructCompare: return .apexGold
        case .polarization:     return .rainbowPurple
        case .necessityProbe:   return .apexEmerald
        case .sequencePeriod:   return .rainbowTeal
        case .telescoping:      return .rainbowYellow
        case .scaling:          return .rainbowOrange
        case .conicVieta:       return .rainbowBlue
        case .induction:        return .rainbowGreen
        case .oddConstruct:     return .rainbowPurple
        case .linearProgramming: return .apexEmerald
        case .basicQuantity:    return .rainbowYellow
        case .complexNumber:    return .rainbowTeal
        case .normalVector:     return .rainbowBlue
        case .circumSphere:     return .rainbowIndigo
        case .projectionArea:   return .apexStarBlue
        case .binomialMoment:   return .rainbowGreen
        case .totalProbability: return .rainbowTeal
        case .indicatorExpectation: return .apexEmerald
        case .insertionGap:     return .rainbowOrange
        case .bundling:         return .apexGold
        case .partition:        return .rainbowPurple
        case .derangement:      return .rainbowRed
        case .staggeredSum:     return .apexStarBlue
        case .triLaw:           return .apexEmerald
        case .undetermined:     return .rainbowOrange
        case .contactChord:     return .apexMystery
        case .pigeonhole:       return .rainbowTeal
        case .groupedSum:       return .rainbowYellow
        case .logChange:        return .apexGold
        case .zeroCount:        return .rainbowBlue
        case .vectorBasis:      return .rainbowGreen
        case .absValue:         return .apexLava
        }
    }

    /// 是否纲内（绿色）；超纲武器为 false。
    var inSyllabus: Bool {
        switch self {
        case .secondDerivative, .tangentLine, .cauchyPower, .sosDecomposition, .trigSubstitution,
             .specialValue, .optionElimination, .numberShape, .estimation,
             .symmetryPeriod, .vieta, .substitution, .complement, .trigGraph,
             .extremePosition, .amgmTrick, .coordinateMethod,
             .homomorphism, .paramSeparation, .hiddenZero, .pointDifference,
             .constructCompare, .necessityProbe, .sequencePeriod,
             .telescoping, .scaling, .conicVieta, .induction,
             .oddConstruct, .linearProgramming, .basicQuantity, .complexNumber,
             .normalVector, .circumSphere, .projectionArea, .binomialMoment,
             .totalProbability, .indicatorExpectation,
             .insertionGap, .bundling, .partition,
             .staggeredSum, .triLaw, .undetermined, .contactChord,
             .groupedSum, .logChange, .zeroCount, .vectorBasis, .absValue: return true
        default: return false   // polarization、derangement、pigeonhole 超纲
        }
    }

    /// 是否为「选择/填空题技巧」类武器（纲内、靠机智不靠公式）。
    var isExamTechnique: Bool {
        switch self {
        case .specialValue, .optionElimination, .numberShape, .estimation,
             .symmetryPeriod, .vieta, .substitution, .complement, .trigGraph,
             .extremePosition, .amgmTrick, .coordinateMethod,
             .constructCompare, .polarization, .necessityProbe, .sequencePeriod,
             .oddConstruct, .linearProgramming, .basicQuantity, .complexNumber,
             .circumSphere, .projectionArea, .binomialMoment,
             .insertionGap, .bundling, .partition, .derangement,
             .triLaw, .undetermined, .logChange, .zeroCount, .absValue: return true
        default: return false
        }
    }

    /// 武器原理：为什么它能"降维"。
    var principle: String {
        switch self {
        case .secondDerivative:
            return "对函数求二阶导可判断凹凸性：f''>0 下凸、f''<0 上凸。一阶导分不清单调时，二阶导能定下一阶导的单调性，从而钉死原函数走势；配合 Jensen 不等式，凹（凸）函数能把 n 个点的和一次性压到/抬到端点，整串不等式一步搞定。"
        case .taylor:
            return "任何光滑函数在某点附近都可展成多项式：eˣ=1+x+x²/2+…，ln(1+x)=x−x²/2+…，sinx=x−x³/6+…。把超越函数换成多项式后，极限、估值、不等式放缩都退化成「比系数」，难度断崖式下降。"
        case .lopital:
            return "对 0/0 或 ∞/∞ 型极限，lim f/g = lim f'/g'（满足条件时）。直接对分子分母求导，绕开高中「凑重要极限」的技巧依赖，可反复使用直到不再是未定式。"
        case .extremumOffset:
            return "极值点两侧函数不对称（「偏移」）。处理双零点/双解的和与积时，对数平均不等式 √(ab) < (a−b)/(lna−lnb) < (a+b)/2 能把 x₁、x₂ 的对称组合一步夹定，免去繁琐的构造对称函数。"
        case .tangentLine:
            return "凸函数恒在其切线上方、凹函数恒在下方。于是 eˣ≥x+1、ln x≤x−1、ln(1+x)≤x 这些「切线不等式」对全定义域成立，可逐项替换、整段放缩，把超越式压成线性式。"
        case .lagrange:
            return "若 f 在 [a,b] 连续、(a,b) 可导，则存在 ξ∈(a,b) 使 f(b)−f(a)=f'(ξ)(b−a)。它把「函数值之差」一步换成「导数值×自变量之差」，再用 ξ 的范围夹逼，证不等式快得离谱。"
        case .integralBound:
            return "单调函数在 [k,k+1] 上的值可被定积分夹住：递减时 ∫_k^{k+1}f < f(k) < ∫_{k-1}^{k}f。把数列每一项换成可积的面积条，求和即化为可直接算的定积分，攻克「和式估计」压轴。"
        case .lagrangeMultiplier:
            return "求 f 在约束 g=0 下的极值，极值点处两函数梯度平行：∇f=λ∇g。联立 ∇f=λ∇g 与 g=0 解出驻点，免去『消元代入再单变量求导』的繁琐，多元、非对称约束尤其管用。"
        case .eulerFormula:
            return "e^{iθ}=cosθ+isinθ 把三角与指数打通。于是 Σcos kθ、Σsin kθ 就是复指数等比数列求和的实/虚部；而 cosⁿθ 可由二项式展开 (e^{iθ}+e^{-iθ})ⁿ/2ⁿ 取实部，瞬间线性降幂。"
        case .recurrence:
            return "线性递推 a_{n+2}=p·a_{n+1}+q·a_n 的通项由特征方程 x²=px+q 的根决定：相异根 r₁,r₂ 给 A·r₁ⁿ+B·r₂ⁿ，重根 r 给 (A+Bn)rⁿ；一阶分式递推则用『不动点』把它化成等比/等差数列。"
        case .cauchyPower:
            return "权方和不等式（柯西的分式形式）：当 bᵢ>0，Σ aᵢ²/bᵢ ≥ (Σaᵢ)²/Σbᵢ，等号当所有 aᵢ/bᵢ 相等。它把一串分式之和一步压缩成单个分式，是分式型最值的核武器。"
        case .quadraticForm:
            return "形如 ax²+bxy+cy² 的二次式对应对称矩阵 [[a, b/2],[b/2, c]]。在单位圆 x²+y²=1 上，它的取值范围正好是该矩阵的最小、最大特征值 [λ_min, λ_max]；λ 由特征方程 λ²−(a+c)λ+(ac−b²/4)=0 解出，省去三角配辅助角。"
        case .sosDecomposition:
            return "Sum of Squares：把多项式恒等地写成若干平方之和，则它的非负性一目了然，取等条件就是各平方同时为 0。它把『证不等式』变成『配方』，是对称/轮换不等式的万能起手式。"
        case .trigSubstitution:
            return "看到 √(1−x²)、x²+y²=r²、或限定在 [−1,1] 的变量，就令 x=cosθ（或 x=r cosθ、x=tanθ）。根号被 sin/cos 化掉、约束自动满足，问题从代数世界跳到角度世界，辅助角与有界性立刻可用。"
        case .rolleTheorem:
            return "罗尔定理：f 在 [a,b] 连续、(a,b) 可导且 f(a)=f(b)，则存在 ξ∈(a,b) 使 f'(ξ)=0。证『某方程有根 / 某导数等式成立』时，反向构造一个两端取等的原函数 F，对它用罗尔，存在性立得。"
        case .specialValue:
            return "选择/填空题的条件若对『任意 x』『任意参数』成立，那它对任何你挑的特殊值也成立。给抽象函数、含参恒等式、二项式系数题代入 x=0、1、−1（或特殊角、特殊数列），未知量瞬间被解出——这是高考最高频的省时手段。"
        case .optionElimination:
            return "选择题答案就藏在四个选项里。与其正向硬算，不如把选项（或题目给的特殊点）代回条件验证：算 a₁、a₂ 看哪个通项对得上、把根代进方程、用奇偶/单调性筛。对的留下，错的秒删。"
        case .numberShape:
            return "把代数式翻译成几何量：(y₂−y₁)/(x₂−x₁) 是斜率、√((x−a)²+(y−b)²) 是距离、|x−a|+|x−b| 是数轴距离和、行列式是面积。画出图形，最值/范围一眼读出，免去繁琐代数。"
        case .estimation:
            return "选择题只需要『落在哪个区间/谁大谁小』，不需要精确值。对幂、对数、根式取公共乘方或与基准值（0、1、1/2、e）比较，估出量级即可锁定唯一选项，比精确计算快十倍。"
        case .symmetryPeriod:
            return "函数的对称性与周期把『远处的值』搬回『近处』：f(−x)=f(x)（偶/轴对称 x=a）、f(x)+f(2a−x)=2b（中心对称 (a,b)）、f(x+T)=f(x)（周期）。求 f(很大的数) 或一串等距点之和时，先用周期把自变量落回一个周期内，再用对称把它折到已知区间——全程无需求出解析式。"
        case .vieta:
            return "一元二次 ax²+bx+c=0 的两根满足 x₁+x₂=−b/a、x₁x₂=c/a。任何关于两根的对称式（x₁²+x₂²、1/x₁+1/x₂、(x₁−x₂)²、x₁/x₂+x₂/x₁ 等）都能用这两个基本对称式表出，于是『不解方程』直接由系数算出结果。"
        case .substitution:
            return "把题中反复出现的复杂结构（如 x+1、2ˣ、sinx、x²+x）整体看作一个新变量 t，原式往往瞬间降次、化简成熟悉的二次或一次问题；解出 t 再回代。关键是认出那个『反复出现的整体』。"
        case .complement:
            return "对『至少 / 至多』型计数与概率，正面分类讨论往往情形繁多，而它的对立面通常只有一种或极少情形。用 所求 = 全集 − 补集（概率 P(A)=1−P(Ā)）一步绕过繁琐分类。"
        case .trigGraph:
            return "y=Asin(ωx+φ)+k 的四个参数各管一件事：A 由最值定（(max−min)/2）、k 由中线定、ω 由周期定（ω=2π/T）、φ 由一个特殊点（最值点 / 过零上升点 / 对称轴）定。逐个击破，不必联立方程组。"
        case .extremePosition:
            return "当某个量随动点 / 参数连续变化时，它的最大、最小值只可能在『边界 / 端点 / 相切 / 共线』这些极端位置取到。直接跳到极端位置算一个值——圆上点到定点（线）的距离 d±r、椭圆上点到焦点的距离 a±c、线性目标在可行域顶点的取值，都是如此，省去求导或联立。"
        case .amgmTrick:
            return "基本不等式 a+b≥2√(ab)（a,b>0）：和为定值时积最大、积为定值时和最小。遇到分式求最值常配合『1 的代换』（把约束 x+y=1 乘进式子）或对勾函数凑配，把分式压成可取等的定值。一正二定三相等，缺一不可。"
        case .coordinateMethod:
            return "向量与平面几何中的垂直、平行、夹角、长度，一旦建立直角坐标系赋上坐标，全部退化成坐标的加减与点乘 x₁x₂+y₁y₂。选一个让多数点坐标简单的原点和轴向，几何直觉题就变成纯算术。"
        case .homomorphism:
            return "同构（同形）思想：把不等式两边整理成同一个函数 f 在不同自变量处的值 f(A) 与 f(B)，再用 f 的单调性把『f(A)≥f(B)』直接降为『A≥B』。处理 eˣ 与 ln x 混合的压轴不等式时，常借 x=e^{ln x}、xeˣ=e^{x+ln x} 把两边凑成 f(t)=teᵗ 的同一形式，超越不等式瞬间变成解一次/二次。"
        case .paramSeparation:
            return "含参不等式恒成立求参数范围时，先把参数 a 单独移到一侧：a≥g(x) 恒成立 ⟺ a≥g(x) 的最大值；a≤g(x) 恒成立 ⟺ a≤g(x) 的最小值。参数从『讨论对象』降为一条水平线，只需对不含参的 g(x) 求一次最值，免去对 a 分类讨论。"
        case .hiddenZero:
            return "求最值时若 f'(x)=0 解不出显式根（如 eˣ−1/x=0），就『虚设』一个零点 x₀ 满足 f'(x₀)=0，把这个等式当隐含条件。算 f(x₀) 时用 f'(x₀)=0 反解超越项（如 e^{x₀}=1/x₀ ⟹ ln x₀=−x₀）整体代入消元，最值便能化简并估出范围。"
        case .pointDifference:
            return "圆锥曲线的弦 AB 两端点都在曲线上，把两点坐标分别代入曲线方程再相减，平方差自动分解出『中点坐标 (x₁+x₂, y₁+y₂)』与『斜率 (y₁−y₂)/(x₁−x₂)』。于是中点一给定，弦的斜率一步解出，无需联立直线与曲线、再用韦达。"
        case .constructCompare:
            return "比较 aᵇ 与 bᵃ、或一串 (ln xᵢ)/xᵢ 的大小时，两边取对数化成 (ln a)/a 与 (ln b)/b，构造 f(x)=ln x / x。它在 (0,e) 递增、(e,+∞) 递减，把『比大小』转成『看自变量落在单调区间的哪一侧』，一眼定序。"
        case .polarization:
            return "极化恒等式 a·b=¼(|a+b|²−|a−b|²)，或三角形中线形式：M 为 BC 中点时 AB·AC=AM²−(BC/2)²。它把不易直接算的数量积换成『模长的平方差』，在只给对角线/中线/和差模长的题里一步出数。"
        case .necessityProbe:
            return "含参恒成立题，先抓住使两边相等的『端点/取等点』x₀：因为 x₀ 是差函数 g 的最小值点，必有 g'(x₀)=0（甚至 g''(x₀)≥0），由此解出参数的必要条件，往往直接锁定答案。选填只需必要性即可秒选，解答题再补一句充分性验证。"
        case .sequencePeriod:
            return "由递推 a_{n+1}=f(a_n)（或 a_{n+2}=f(a_n,a_{n+1})）定义的数列，挨个算出前几项，常会发现『绕一圈又回到起点』的周期 T。求 a_{2024}、S_{2024} 时，只要把下标对 T 取余落回一个周期内，或用『周期和』整除，瞬间得到结果。"
        case .telescoping:
            return "把数列每一项 aₖ 拆成相邻两项的差 aₖ=bₖ−bₖ₊₁（如 1/[k(k+1)]=1/k−1/(k+1)），求和时中间项首尾相消（望远镜求和），Σ 只剩首尾两项 b₁−bₙ₊₁。复杂求和瞬间坍缩成一次减法。"
        case .scaling:
            return "数列和的不等式若无法精确求和，就对通项整体放大或缩小成『可求和』的形式：常用 1/k² < 1/[k(k−1)]=1/(k−1)−1/k、2(√(k+1)−√k)<1/√k<2(√k−√(k−1))、或等比放缩。放完再求和，不等式一步证出，关键是放缩的『度』要恰到好处。"
        case .conicVieta:
            return "直线与圆锥曲线相交，联立消元得关于 x（或 y）的一元二次方程，交点坐标不必解出，只用韦达定理写出 x₁+x₂、x₁x₂，再把弦长、中点、面积、斜率等目标用这两个对称式整体表示。『设而不求』一步绕开解析几何里最繁的解坐标。"
        case .induction:
            return "对与正整数 n 有关的命题 P(n)：① 验证 P(1) 成立（奠基）；② 假设 P(k) 成立，推出 P(k+1) 也成立（递推）。两步齐备，命题对一切 n≥1 成立——像推倒一排多米诺。它把『证无穷多个命题』降为『证一个起点 + 一次传递』。"
        case .oddConstruct:
            return "若 f(x) 能写成『一个奇函数 g(x) 加常数 b』，即 f(x)=g(x)+b，则对称两点之和 f(a)+f(−a)=g(a)+g(−a)+2b=2b——与 a 无关。遇到 f(x)=ln(√(x²+1)+x)+c、或奇次幂/正弦叠加常数的函数，求对称点和、或对称区间上的『最大值+最小值』，先剥出奇函数部分，答案瞬间。"
        case .linearProgramming:
            return "线性约束（一组一次不等式）围成的可行域是凸多边形，线性目标 z=ax+by 的等值线平移时，最大、最小值必在多边形的顶点（或边界）处取到。于是只需求出各顶点坐标，代入目标函数比一比，最值立得，无需逐点扫描。"
        case .basicQuantity:
            return "等差数列由首项 a₁ 与公差 d 完全确定，等比数列由首项 a₁ 与公比 q 完全确定（aₙ、Sₙ 都是它们的式子）。把题目条件统统翻译成关于这两个『基本量』的方程，联立一解，整个数列就定了——无需找规律或凑通项。"
        case .complexNumber:
            return "复数三件套：① i 的幂四次一周期 i,−1,−i,1；② 模的乘除性 |z₁z₂|=|z₁|·|z₂|、|z₁/z₂|=|z₁|/|z₂|，比逐个算实虚部快得多；③ 共轭 z·z̄=|z|²、z+z̄=2Re(z)。算复数的模、高次幂、共轭表达式时，用这三条绕开暴力展开。"
        case .normalVector:
            return "在空间直角坐标系里，平面的方向由它的法向量 n 完全刻画。于是空间角与距离全部退化成点乘：二面角 cosθ=±(n₁·n₂)/(|n₁||n₂|)（正负由图形开口判断）；线面角 sinφ=|a·n|/(|a||n|)；点到平面距离 d=|AP·n|/|n|（A 为面内任一点）。一旦建系，『找垂足、作辅助线』的空间想象全变成坐标的加减与点乘。"
        case .circumSphere:
            return "外接球球心到各顶点等距，两条捷径定心：① 补形——三条两两垂直的棱可补成长方体，外接球即长方体外接球，直径=体对角线，R=½√(a²+b²+c²)；② 球心定位——球心必在底面外接圆圆心正上方，设高为 h，由『到顶点距离相等』列一个方程得 R²=r²+h²（r 为底面外接圆半径）。免去纯几何找球心。"
        case .projectionArea:
            return "射影面积定理：平面图形（面积 S）在另一平面上的正射影面积 S′=S·cosθ，θ 为两平面所成二面角，故 cosθ=S射影/S原。求二面角时不必在棱上找公垂线、作平面角再解三角形，只要算出原图形与它投影的面积相除即得余弦——投影恰为规则图形时极快。"
        case .binomialMoment:
            return "若 X 服从二项分布 B(n,p)（n 次独立重复试验中成功概率为 p 的成功次数），则期望 E(X)=np、方差 D(X)=np(1−p) 有现成公式，无需写出整张分布列再求 Σk·P(X=k)。再配线性性质 E(aX+b)=aE(X)+b、D(aX+b)=a²D(X)，任意线性变换的期望方差一并秒出。"
        case .totalProbability:
            return "全概率公式：若 B₁,…,Bₙ 两两互斥且并为全集（完备事件组），则 P(A)=ΣP(Bᵢ)P(A|Bᵢ)——把 A 按发生前提拆成几条互斥路径，各路径概率相加。反过来由结果 A 反推某前提 Bᵢ 用贝叶斯 P(Bᵢ|A)=P(Bᵢ)P(A|Bᵢ)/P(A)。两式把多步条件概率化成一次代入。"
        case .indicatorExpectation:
            return "期望的线性性 E(X₁+…+Xₙ)=E(X₁)+…+E(Xₙ) 对任意随机变量都成立，不要求独立。于是把复杂的计数型变量 X 拆成若干『示性变量（0-1 变量）』之和 X=ΣXᵢ，其中 Xᵢ=1 表示第 i 个事件发生，则 E(Xᵢ)=P(第 i 个事件发生)。只需算每个简单事件概率再相加，绕开求 X 的整张分布列。"
        case .insertionGap:
            return "排列中要求某几个元素两两不相邻时用『插空法』：先把其余元素排好（A 种），它们之间及两端共形成若干『空位』，再把要求不相邻的元素逐个插进不同空位。先排后插，自动保证不相邻，避免正面分类或反面容斥的繁琐。"
        case .bundling:
            return "排列中要求某几个元素必须相邻时用『捆绑法』：先把这几个相邻元素看成一个『大整体』与其余元素一起排列，再乘上整体内部各元素的排列数。先捆后排，把『相邻』约束一次性消化掉。"
        case .partition:
            return "把 n 个完全相同的物品分给 m 个不同对象、每对象至少 1 个，等价于在排成一列的 n 个物品的 (n−1) 个间隙里插入 (m−1) 块隔板，方法数 C(n−1, m−1)。这正是方程 x₁+…+xₘ=n 的正整数解组数；若允许为 0，先给每个变量 +1 转化为正整数情形再用隔板。"
        case .derangement:
            return "n 个元素全部不在原位置上的排列称为错位排列，其个数 Dₙ 满足递推 Dₙ=(n−1)(Dₙ₋₁+Dₙ₋₂)，或 Dₙ=n!·(1−1/1!+1/2!−…+(−1)ⁿ/n!)。常用值 D₁=0、D₂=1、D₃=2、D₄=9、D₅=44。遇到『信放错信封』『帽子全拿错』『编号全不对应』这类全错位计数，直接报数。"
        case .staggeredSum:
            return "数列每一项为等差数列项与等比数列项之积（如 nqⁿ⁻¹、(2n−1)·3ⁿ），直接求和没有公式可用。错位相减法：令 Sₙ=Σaₙbₙ，再算 q·Sₙ=Σaₙbₙ₊₁（乘公比错一位），两式相减后等差部分消成等差数列之和，等比部分化成普通等比，两者均可求，再除以 (1−q) 即得 Sₙ。"
        case .triLaw:
            return "在任意三角形 ABC 中，正弦定理 a/sinA=b/sinB=c/sinC=2R 把三条边与对角统一表示；余弦定理 c²=a²+b²−2ab cosC 把三边与夹角互化。面积公式 S=½ab sinC 把边与角结合。三者配合可解任意三角形：已知两边一角（SSA）用正弦定理出第三边或角，注意钝角二义性；已知三边或两边夹角（SSS/SAS）用余弦定理。"
        case .undetermined:
            return "比较系数法（待定系数法）：若两个多项式恒等（对一切 x 成立），则同次项系数必须相等。把待求多项式设为 A + Bx + Cx² + …，代入已知恒等式展开，逐次比较常数项、一次项、二次项…的系数，列方程组解出 A、B、C……。也可取若干个特殊 x 值建立方程（取值法），本质等价。"
        case .contactChord:
            return "设椭圆 x²/a²+y²/b²=1 上一点 P(x₀,y₀)，过 P 的切线方程为 xx₀/a²+yy₀/b²=1——形如曲线方程把 x²→xx₀、y²→yy₀。这就是 T=0 形式（切点弦方程）。由曲线外一点 Q 向椭圆作两条切线，两切点连线（切点弦）方程恰好也写成 T=0 形式，即 xXQ/a²+yYQ/b²=1。直接写方程，免去联立求切点的全部过程。"
        case .pigeonhole:
            return "鸽巢原理（抽屉原理）：把 n+1 只鸽子放进 n 个巢，至少一个巢有 2 只或以上。精确表述：若 m 个元素分配给 n 个集合，则至少有一个集合含 ⌈m/n⌉ 个元素。用于存在性证明：要证『必然存在两个满足某关系的元素』，构造合适的『巢（等价类）』，元素数超过巢数，结论立得，无需显式找出那两个元素。"
        case .groupedSum:
            return "数列 {aₙ} 若按奇偶项、或按某个周期 k 分成若干组，每组内部满足等差或等比，则分组分别求和再相加。常见形式：① aₙ=f(n)+g(n)（一项拆两项，各自求和）；② 奇数项/偶数项各自为等差或等比；③ 含 (−1)ⁿ 因子导致正负交替，配对后每两项之和为常数（配对法）。"
        case .logChange:
            return "换底公式：logₐb = log c / log a (c为任意正数≠1)，或 logₐb = 1/logᵦa。把不同底的对数统一到同一底（通常取 10 或 e），再用对数运算法则 log(mn)=logm+logn、log(m/n)=logm−logn、log mⁿ=n·logm。对数链：logₐb · logᵦc · log꜀d = logₐd（中间底消掉），多步换底串联可直接化简。"
        case .zeroCount:
            return "方程 f(x)=g(x) 的实数解个数等于曲线 y=f(x) 与 y=g(x) 的交点个数。把方程化为 F(x)=0，实根个数等于 F(x) 穿越零轴的次数（结合单调性与导数分析）。当参数 k 变化时，画出 y=f(x) 和直线 y=kx（或水平线 y=k），直线与曲线的切点是根数发生变化的临界，切线斜率即临界 k 值。"
        case .vectorBasis:
            return "平面内两个不共线向量 e₁、e₂ 构成基底：该平面内任意向量 p 可唯一写成 p=xe₁+ye₂，坐标 (x,y) 可由联立方程直接解出。在三角形或平行四边形中，常以两邻边向量 a、b 为基底，把所有向量（中点、重心、分点等）用 a、b 线性表示，再利用 λ+μ=1（三点共线条件）或比例关系列方程。"
        case .absValue:
            return "绝对值不等式核心：|x−a| 表示数轴上 x 到 a 的距离。|x−a|+|x−b| 为 x 到两点 a、b 的距离之和，最小值为 |a−b|（x 在 [a,b] 之间时取等）；|x−a|−|x−b| 的范围是 [−|a−b|, |a−b|]（三角不等式）。解含绝对值不等式时分区间讨论（临界点为绝对值内表达式等于 0 处），或用数轴图示直接读出解集。"
        }
    }

    /// 触发信号：题目出现什么特征，就掏这把武器。
    var signal: String {
        switch self {
        case .secondDerivative:
            return "一阶导符号判不清；恒成立求参且 g(0)=g'(0)=0；三角/对数的和式求最值（凹凸 + Jensen）。"
        case .taylor:
            return "含参极限要求「有限/存在」反求参数；高阶（x³、x⁴）未定式极限；要把 eˣ、ln、sin 估到某一阶。"
        case .lopital:
            return "选择/填空中出现 0/0 或 ∞/∞ 型极限，且无法一眼套重要极限。"
        case .extremumOffset:
            return "两个零点/两个解 x₁、x₂，要证它们的「和」或「积」满足某不等式（x₁+x₂>2、x₁x₂>e² 之类）。"
        case .tangentLine:
            return "要证含 eˣ 或 ln 的不等式；或数列求和与 ln(n+1)、调和级数作比较。"
        case .lagrange:
            return "出现 f(b)−f(a) 形式的差、或 (lnb−lna)/(b−a) 这类「差商」，要夹在两个表达式之间。"
        case .integralBound:
            return "要证形如 Σ1/k、Σ1/√k、Σln k 的和式不等式，且右边是个「连续」的封闭表达式。"
        case .lagrangeMultiplier:
            return "多元函数在等式约束下求最大/最小：圆/椭圆/球面/平面上的最值、和为定值求平方和、约束下求乘积等。"
        case .eulerFormula:
            return "求 Σcos kθ 或 Σsin kθ；推导 n 倍角恒等式；把 cosⁿθ 线性化为各次余弦之和（积分预备）。"
        case .recurrence:
            return "给定二阶线性递推 a_{n+2}=p·a_{n+1}+q·a_n，或一阶分式递推 a_{n+1}=(αa_n+β)/(γa_n+δ)，要求通项公式。"
        case .cauchyPower:
            return "求形如 Σ(常数²/变量) 或 Σ aᵢ²/bᵢ 的最小值，且分母之和为定值或可控。"
        case .quadraticForm:
            return "在单位圆 / x²+y²=定值 上，求二次式 ax²+bxy+cy² 的最大、最小值或取值范围。"
        case .sosDecomposition:
            return "证对称或轮换的二次（多次）不等式恒成立，尤其右边为 0、要找取等条件时。"
        case .trigSubstitution:
            return "出现 √(1−x²)、√(a²−x²)、x²+y²=r² 约束，或变量限定 [−1,1] 求值域/最值。"
        case .rolleTheorem:
            return "要证『某方程在区间内有根』或『存在 ξ 使某导数等式成立』这类存在性命题。"
        case .specialValue:
            return "抽象函数（只给 f(x+y)=… 之类性质）、含参恒等式对任意 x 成立、二项式展开求系数和。"
        case .optionElimination:
            return "选择题求数列通项/解析式/方程的根，且四个选项形式具体、便于代入验证时。"
        case .numberShape:
            return "求 √(…)+√(…) 的最值、(sinθ)/(cosθ−a) 的范围、|x−a|+|x−b| 的最小值等『有几何味』的式子。"
        case .estimation:
            return "比较若干幂/对数/根式的大小，或判断某表达式落在哪个区间（选择题）。"
        case .symmetryPeriod:
            return "求 f(很大的数) 或 f(a)+f(b)+… 一串等距点之和；题目给出 f(−x)=f(x)、f(x)+f(2−x)=常数、f(x+T)=f(x) 这类对称/周期条件。"
        case .vieta:
            return "出现『两根 x₁,x₂』但不要求具体根，只问它们的对称组合（和、积、平方和、差的平方、倒数和、比值和）。"
        case .substitution:
            return "式子里反复出现同一个复杂结构（x+1、2ˣ、sinx、x²+x…）；或给 f(g(x)) 反求 f(x)。"
        case .complement:
            return "计数/概率题里出现『至少』『至多』『不全是』『至少一个』，且正面情形分类很多。"
        case .trigGraph:
            return "给三角函数 y=Asin(ωx+φ) 的图象、最值点、周期、对称轴或平移信息，反求 A、ω、φ 或解析式。"
        case .extremePosition:
            return "圆/椭圆上的点到定点或定直线的最值；可行域上线性目标最值；求一个随动点连续变化量的最大/最小。"
        case .amgmTrick:
            return "正数和为定值（或可配成定值）求分式/和式最小；积为定值求和最小；出现 1/x+k/y 配 x+y=1 这类结构。"
        case .coordinateMethod:
            return "正方形/矩形/等边三角形里的向量点乘、模长、夹角；或解析几何中垂直、距离关系——图形规整、易于建系。"
        case .homomorphism:
            return "不等式/方程里 eˣ 与 ln x（或 x 与 ln x）混杂，且两边能整理成『同一结构作用在不同变量上』，常见 xeˣ 与 a·ln a 这类。"
        case .paramSeparation:
            return "含参不等式『对任意 x 恒成立』求参数范围，且参数能从主变量中分离（一次项或可整体移项）。"
        case .hiddenZero:
            return "求含 eˣ 与 x（或 ln x 与 x）混合函数的最值/极值，而导数方程 f'(x)=0 无法解出初等根。"
        case .pointDifference:
            return "圆锥曲线（椭圆/双曲线/抛物线）给出弦的中点，求该弦所在直线的斜率或方程。"
        case .constructCompare:
            return "比较两个『底与指数互换』的幂 aᵇ 与 bᵃ，或比较若干 (ln xᵢ)/xᵢ 形式数的大小。"
        case .polarization:
            return "求向量数量积 a·b，但只给了 |a+b| 与 |a−b|，或在三角形中给了中线长与底边长。"
        case .necessityProbe:
            return "含参恒成立/存在题，存在一个使两边恰好相等的特殊点（端点、对称点），从它入手最快。"
        case .sequencePeriod:
            return "由递推式定义的数列求很靠后的某一项 a_{2024} 或前若干项之和，且递推反复迭代呈现循环。"
        case .telescoping:
            return "求和的通项是分式且分母为相邻整数（或等差）之积，如 1/[k(k+1)]、1/[(2k−1)(2k+1)]，或 √(k+1)−√k 型。"
        case .scaling:
            return "证形如 Σ1/k²、Σ1/√k、Σ1/(2ᵏ−1) 的和式不等式，且和无法精确求出，只需卡住一个界。"
        case .conicVieta:
            return "直线与椭圆/抛物线/双曲线相交，求弦长、中点、面积、|AB| 等只依赖两交点对称组合的量。"
        case .induction:
            return "证明对一切正整数 n 成立的等式、不等式、整除或数列通项，且 P(k)→P(k+1) 有清晰的递推联系。"
        case .oddConstruct:
            return "求 f(a)+f(−a)、或函数在对称区间 [−m,m] 上的『最大值+最小值』，f 含 ln(√(x²+1)+x)、x³、sinx 等奇函数加常数。"
        case .linearProgramming:
            return "给一组一次不等式约束，求线性目标 z=ax+by（或斜率型、距离型）的最大/最小值。"
        case .basicQuantity:
            return "等差/等比数列给出若干项或前 n 项和的条件，求某项、公差公比、通项或另一个和。"
        case .complexNumber:
            return "求复数的模 |z|、高次幂 iⁿ 或 zⁿ、共轭 z̄ 相关表达式，尤其分式 |z|=|分子|/|分母| 型。"
        case .normalVector:
            return "立体几何求二面角、线面角、点到平面距离，且图形便于建立直角坐标系（有两两垂直的棱或可补出）。"
        case .circumSphere:
            return "求三棱锥/四棱锥/直棱柱的外接球半径、表面积或体积，尤其出现『两两垂直的棱』或『一条棱垂直底面』。"
        case .projectionArea:
            return "求二面角的余弦，且其中一个面或它的投影是容易算面积的规则图形。"
        case .binomialMoment:
            return "n 次独立重复试验求成功次数的期望/方差，或已知 E、D 反求 n、p，或求其线性变换的期望方差。"
        case .totalProbability:
            return "概率分几种互斥前提（不同机器/不同盒子/分两步抽取）求最终事件概率；或已知结果反求来自某前提的概率。"
        case .indicatorExpectation:
            return "求『满足某条件的个数』的期望（匹配数、空盒数、不同元素数），直接列分布列很繁。"
        case .insertionGap:
            return "排列计数中出现『某几个元素互不相邻 / 两两不相邻』的限制。"
        case .bundling:
            return "排列计数中出现『某几个元素必须相邻 / 排在一起』的限制。"
        case .partition:
            return "把相同物品分给不同对象（每份至少若干个），或求方程的正整数/非负整数解的组数。"
        case .derangement:
            return "n 个对象与 n 个位置一一对应，要求『没有一个对应正确 / 全部错位』的方法数。"
        case .staggeredSum:
            return "数列通项为等差×等比（如 n·qⁿ、(2n+1)·rⁿ），或含 nqⁿ 形式，直接套等差/等比公式无法求和。"
        case .triLaw:
            return "三角形中给出两边一对角（SSA）、或两边夹角（SAS）、或要用面积公式 S=½ab sinC 反求角。"
        case .undetermined:
            return "要求多项式 f 满足某恒等式（对所有 x 成立），f 的系数待定；或函数方程 f(x+y)=… 里设 f 为二次。"
        case .contactChord:
            return "已知椭圆/双曲线/抛物线上一点（或曲线外一点）求切线方程，或由两切线切点求切点弦方程。"
        case .pigeonhole:
            return "题目要求『必然存在』两个满足某整除/距离/奇偶关系的元素，而元素数恰好比分组数多一。"
        case .groupedSum:
            return "数列含 (−1)ⁿ 因子（正负交替）、或奇偶项分别等差/等比、或通项可拆成两个独立数列之和/差。"
        case .logChange:
            return "出现不同底的对数相加减（logₐb + log꜀d 之类），或 logₐb · logᵦc 的连乘，需统一化简。"
        case .zeroCount:
            return "求方程关于参数 k 的实根个数随 k 变化，或判断某超越方程（2ˣ=3−x 等）实根个数，直接解析式解不出。"
        case .vectorBasis:
            return "平面几何或向量题给出三角形/平行四边形的两边向量 a、b，要用它们表示分点、中线、重心等向量。"
        case .absValue:
            return "出现 |x−a|+|x−b|（两点距离和）或 |x−a|−|x−b| 的最值/范围，或解含绝对值的不等式。"
        }
    }

    /// 高考大题里能否直接书写（诚实标注）。
    var examSafe: Bool {
        switch self {
        case .secondDerivative, .tangentLine, .cauchyPower, .sosDecomposition, .trigSubstitution,
             .specialValue, .optionElimination, .numberShape, .estimation,
             .symmetryPeriod, .vieta, .substitution, .complement, .trigGraph,
             .extremePosition, .amgmTrick, .coordinateMethod,
             .homomorphism, .paramSeparation, .hiddenZero, .pointDifference,
             .constructCompare, .necessityProbe, .sequencePeriod,
             .telescoping, .scaling, .conicVieta, .induction,
             .oddConstruct, .linearProgramming, .basicQuantity, .complexNumber,
             .normalVector, .circumSphere, .projectionArea, .binomialMoment,
             .totalProbability, .indicatorExpectation,
             .insertionGap, .bundling, .partition,
             .staggeredSum, .triLaw, .undetermined, .contactChord,
             .groupedSum, .logChange, .zeroCount, .vectorBasis, .absValue: return true
        default: return false   // polarization、derangement、pigeonhole 超纲，大题不直接认
        }
    }

    /// 使用守则（针对大题书写）。
    var examNote: String {
        switch self {
        case .secondDerivative:
            return "✅ 纲内方法，二阶导判凹凸、求最值可直接书写。Jensen 不等式建议在大题里改写为「构造函数 + 求最值」的等价过程更稳妥。"
        case .tangentLine:
            return "✅ 切线不等式属常用技巧，大题可用，但建议先用一句「构造 g(x)=eˣ−x−1，g'(x)=eˣ−1」现场证明再引用，更稳。"
        case .taylor:
            return "⚠️ 带 o(xⁿ) 的泰勒展开高考大题不被认可。选择填空可直接秒；大题请改用「泰勒指引方向 + 标准构造函数」补全步骤。"
        case .lopital:
            return "⚠️ 洛必达高考大题明确不认，写了判 0 分。它是选择/填空的极限神器，大题只用来「心算出答案再倒推标准解」。"
        case .extremumOffset:
            return "⚠️ 对数平均不等式属超纲。选填可直接用；大题需先证明该不等式（或改用构造对称函数 F(x)=f(x)−f(2c−x)）。"
        case .lagrange:
            return "⚠️ 中值定理高中不在考纲。选填可秒；大题需先用单调性把结论等价转化，或现证中值结构。"
        case .integralBound:
            return "⚠️ 定积分放缩属超纲技巧。选填/检验可用；大题建议改写为数学归纳法或裂项放缩补全严格步骤。"
        case .lagrangeMultiplier:
            return "⚠️ 拉格朗日乘数法超纲。选填可直接用驻点定答案；大题需改用柯西不等式 / 消元 / 三角换元给出严格过程。"
        case .eulerFormula:
            return "⚠️ 欧拉公式与复指数超纲。选填可借它心算；大题需改用积化和差裂项或数学归纳补全。"
        case .recurrence:
            return "⚠️ 特征根法超纲。选填/验证可秒得通项；大题需用『构造等比数列』的纲内写法——而特征根正好告诉你该怎么构造。"
        case .cauchyPower:
            return "✅ 权方和（柯西-施瓦茨推论）大题可用，但建议注明它源自柯西不等式，或现场用柯西证一句，更稳妥。"
        case .quadraticForm:
            return "⚠️ 特征值方法超纲。选填可直接报 [λ_min, λ_max]；大题需改用三角换元 + 辅助角给出严格过程。"
        case .sosDecomposition:
            return "✅ 配方法（SOS）完全纲内，可直接书写，是最稳的不等式证法之一——把恒等变形写清楚即可。"
        case .trigSubstitution:
            return "✅ 三角换元纲内常用，可直接书写；注意写明新变量 θ 的取值范围以保证等价。"
        case .rolleTheorem:
            return "⚠️ 罗尔/达布定理高考不在考纲。选填/思路可用；大题构造原函数后宜改用零点定理 + 单调性书写。"
        case .specialValue:
            return "✅ 选择/填空题直接用，又快又稳。注意：仅当条件对『任意』成立时才能代特殊值；解答题求通项仍需完整推导。"
        case .optionElimination:
            return "✅ 选择题专用利器，代入验证完全合法。填空/解答题没有选项，需回到正向求解。"
        case .numberShape:
            return "✅ 数形结合纲内核心思想，选填可直接读图作答；解答题需把几何结论再用代数严格写出。"
        case .estimation:
            return "✅ 选择题估算合法且高效。但只用于『比大小/定区间』，需要精确值的填空/解答题不可估。"
        case .symmetryPeriod:
            return "✅ 函数对称性与周期是纲内核心，选填可直接用对称/周期化简求值；解答题写明对称（周期）的推导依据即可。"
        case .vieta:
            return "✅ 韦达定理（根与系数关系）纲内，可直接书写。注意先验证判别式 Δ≥0 保证两根存在再使用。"
        case .substitution:
            return "✅ 换元/整体代换纲内通法，选填解答都能用；解答题须写明新元的取值范围以保证等价。"
        case .complement:
            return "✅ 正难则反（补集思想）纲内，计数与概率均可直接书写：所求 = 全部 − 对立面。"
        case .trigGraph:
            return "✅ 三角函数图象与 ω、φ 的求法纲内高频，选填解答均可直接用；注意 φ 受 |φ| 范围约束取唯一值。"
        case .extremePosition:
            return "✅ 取极端/临界位置是选填速判利器；解答题须用代数（判别式/单调性/距离公式）把『极端取到』严格论证。"
        case .amgmTrick:
            return "✅ 基本不等式纲内核心，可直接书写。务必三查：一正二定三相等——取等条件不满足则最值取不到。"
        case .coordinateMethod:
            return "✅ 坐标法/建系纲内通法，向量与解析几何均可直接书写；选好原点与坐标轴能让点乘、模长退化成算术。"
        case .homomorphism:
            return "✅ 同构本质是构造单调函数，纲内可写。大题须显式写出『令 f(t)=…，f 在区间 … 上单调』再比较，不能只说『由同构』。"
        case .paramSeparation:
            return "✅ 分离参数+求最值是纲内主流解法，可直接书写。注意：分离时若两边除以含 x 的式子，要按其正负讨论，否则不等号方向出错。"
        case .hiddenZero:
            return "✅ 虚设零点是纲内常用技巧，大题可写。须先用单调性+零点存在定理说明『存在唯一 x₀ 使 f'(x₀)=0』，再代入整体化简。"
        case .pointDifference:
            return "✅ 点差法纲内常用，大题可写。须补两点：① 说明弦斜率存在（不竖直）；② 验证中点确在曲线内部（保证弦存在）。"
        case .constructCompare:
            return "✅ 构造函数比大小是纲内通法，选填解答都能用；解答题须写出 f(x)=ln x/x 的求导与单调区间。"
        case .polarization:
            return "⚠️ 极化恒等式高中不在考纲，选填可直接闪电得数；大题须改用基底或建系（AB·AC=(AM+MB)·(AM−MB)=AM²−MB²）现场推导。"
        case .necessityProbe:
            return "✅ 选填中代端点求必要条件极快、可直接定答案；解答题得到必要范围后，必须再证明充分性（该范围下确实恒成立）才完整。"
        case .sequencePeriod:
            return "✅ 找周期纯属纲内计算，选填解答都能用。注意下标与项号的对应（a₁ 是第 1 项），余数为 0 时落在周期最后一项。"
        case .telescoping:
            return "✅ 裂项相消纲内通法，大题可直接书写。务必写出裂项的恒等变形，并核对相消后剩下的首尾项（最易错在边界）。"
        case .scaling:
            return "✅ 放缩法纲内压轴常用，大题可写。注意放缩不能过头（否则界不够紧），且常需从第 2 项起放缩、首项单独留。"
        case .conicVieta:
            return "✅ 设而不求+韦达是解析几何主流解法，大题必备。务必先写判别式 Δ>0 保证相交；弦长用 |AB|=√(1+k²)·√((x₁+x₂)²−4x₁x₂)。"
        case .induction:
            return "✅ 数学归纳法纲内（选修），大题可直接书写。两步缺一不可，递推步必须『用到归纳假设 P(k)』，否则不成立。"
        case .oddConstruct:
            return "✅ 构造奇函数纲内，选填解答都能用。关键是正确剥离常数项 b，并验证剩余部分确为奇函数 g(−x)=−g(x)。"
        case .linearProgramming:
            return "✅ 线性规划纲内，选填解答均可。注意：① 先画准可行域、定顶点；② 非线性目标（斜率/距离）需结合几何意义而非只代顶点。"
        case .basicQuantity:
            return "✅ 基本量法是数列纲内根本方法，选填解答都能用。注意等比数列要留意 q=1 的特殊情形与 q≠0 的隐含条件。"
        case .complexNumber:
            return "✅ 复数运算纲内，选填解答都能用。模的乘除性、i 的周期、z·z̄=|z|² 是最常用的三个加速点。"
        case .normalVector:
            return "✅ 空间向量法是新课标立体几何主流解法，大题可直接书写。务必写清坐标系的建立、各点坐标与法向量的求法；二面角是锐角还是钝角需结合图形再判定符号。"
        case .circumSphere:
            return "✅ 补形法与球心定位均为纲内常用手段，选填解答都能用。大题须说明球心位置的几何依据（到各顶点等距），再列方程求 R。"
        case .projectionArea:
            return "⚠️ 射影面积公式 S′=S·cosθ 结论常用但不在必学定理之列，选填可直接套；大题建议改用法向量或定义法作出二面角，或先证明该射影关系再使用。"
        case .binomialMoment:
            return "✅ 二项分布的 E=np、D=np(1−p) 是纲内公式，选填解答均可直接引用。注意先确认确为『独立重复试验』（有放回 / 每次概率不变）才是二项分布。"
        case .totalProbability:
            return "✅ 全概率公式与贝叶斯公式已入新课标，大题可直接书写。务必写明所分的几个前提两两互斥且穷尽（构成完备事件组）。"
        case .indicatorExpectation:
            return "✅ 期望的线性性纲内成立，大题可用。须显式写出『令 Xᵢ 为第 i 个事件的示性变量，X=ΣXᵢ』并说明 E(Xᵢ)=P(事件 i)，再求和——不能跳步直接报数。"
        case .insertionGap:
            return "✅ 插空法是排列组合纲内通法，选填解答都能用。注意空位含两端、插入通常有序（用排列数 A）；要求不相邻的元素若有 k 个，空位数须不少于 k。"
        case .bundling:
            return "✅ 捆绑法纲内通法，可直接书写。切记最后要乘上被捆元素的内部排列数；若整体内部有顺序限制（如甲在乙左），则内部不再全排。"
        case .partition:
            return "✅ 隔板法纲内常用，选填解答均可。注意适用前提：物品必须相同、每份至少 1 个；允许为 0 或有下限时，先做 +1（或减去下限）的变量代换再用。"
        case .derangement:
            return "⚠️ 错位重排公式 Dₙ 与其递推不在考纲，选填可直接报数（牢记 D₃=2、D₄=9、D₅=44）；大题须用枚举、容斥原理或现场建立递推 Dₙ=(n−1)(Dₙ₋₁+Dₙ₋₂) 给出过程。"
        case .staggeredSum:
            return "✅ 错位相减法纲内通法，大题可直接书写。务必：① 令 T=q·Sₙ 再用 Sₙ−T；② 写清楚最后一项 q^n 的保留；③ 公比 q=1 时退化为等差，需单独讨论。"
        case .triLaw:
            return "✅ 正余弦定理与面积公式均为纲内核心，大题可直接引用。注意：① SSA（已知两边一角）可能有两解（大角对大边），需验证两个角的合法性；② 余弦定理用来判断钝/锐角时先看 c²与 a²+b² 的大小关系。"
        case .undetermined:
            return "✅ 比较系数法（待定系数法）纲内，大题可直接书写。须写明『对所有 x 成立，比较各次项系数』；取值法时须取足够多的特殊点（系数个数）保证方程组有唯一解。"
        case .contactChord:
            return "✅ 切点弦方程（T=0 形式）是解析几何纲内技巧，大题可用。注意：T=0 对椭圆、抛物线成立（推导略有不同），须先写出具体曲线的切线形式再应用；联立得切点坐标时仍需验证点在曲线上。"
        case .pigeonhole:
            return "⚠️ 鸽巢原理高中不在必学考纲，选填中可直接用结论；大题须显式写出『构造 n 个分类（…），共 n+1 个元素，由鸽巢原理至少有两个在同一类中』，并说明同类元素满足结论。"
        case .groupedSum:
            return "✅ 分组求和纲内通法，大题可直接书写。须写清楚每组的通项、首项与公比/公差，并核对奇数项个数（n 为奇时末组只有 1 项）；配对法须验证 S₂ₙ 与 S₂ₙ₊₁ 的关系。"
        case .logChange:
            return "✅ 换底公式纲内，大题可直接引用 logₐb=lgb/lga。注意底数满足 a>0、a≠1、b>0；比较不同底对数大小时，换底后再用单调性判断；对数链 logₐb·logᵦc=logₐc 可直接用于简化连乘。"
        case .zeroCount:
            return "✅ 图形法数零点纲内核心（零点存在定理+单调性），大题可写。须：① 说明 f 在区间内连续且端点函数值异号（或画出导数分析极值点）；② 参数 k 的临界值须由切点处 f'=k 且 f(x₀)=kx₀ 两个方程联立给出，不能凭图估读。"
        case .vectorBasis:
            return "✅ 向量基底分解纲内，大题可直接书写。须写明『设 a、b 是不共线向量，故构成基底』，再列系数方程；三点共线条件须显式写出『存在实数 λ 使 OP=OA+λAB』或 λ+μ=1（用基底表示时）。"
        case .absValue:
            return "✅ 绝对值不等式纲内，大题可直接书写。分区间讨论时须列出所有临界点并验证端点取等；几何意义法须写明『|x−a| 表示数轴上 x 到 a 的距离』再给出图示结论，不能只写结果。"
        }
    }
}

// MARK: - 战例（压轴题 + 展示元数据）

struct SecondKillCase: Identifiable {
    let id: String
    let weapon: KillWeapon
    let title: String          // 钩子标题
    let source: String         // 题型出处（诚实标注）
    let standardMinutes: Int   // 常规法预估耗时（分钟）
    let killSeconds: Int       // 降维秒杀预估耗时（秒）
    let signal: String         // 本题的"识别信号"
    let problem: Problem       // 含 dualSolution 的完整题目

    /// 省时倍数（用于"震撼对比"）。
    var speedup: Double {
        let std = Double(standardMinutes) * 60
        return std / Double(max(killSeconds, 1))
    }
}

extension SampleData {

    // ⚠️ 拆段说明：原本是一个 136 元素的巨型数组字面量，单表达式类型检查耗时 ~11s，
    // 在 Release(-O + 全模块优化) 下被优化器放大，会让 Xcode Archive 卡死数分钟。
    // 拆成 4 段各自的小数组（独立快速类型检查），文件末尾用 + 拼回 secondKillCases。
    private static let secondKillCasesA: [SecondKillCase] = [

        // 1 ── 泰勒展开：恒成立求参
        skCase(
            id: "sk_001", weapon: .taylor,
            title: "恒成立卡住的参数，泰勒比系数一眼定",
            source: "函数与导数 · 恒成立求参（高考压轴高频）",
            standardMinutes: 9, killSeconds: 45,
            signal: "x≥0 恒成立、且 g(0)=g'(0)=0——二阶导能定，泰勒更快。",
            content: "当 x≥0 时，恒有 eˣ ≥ 1 + x + (a/2)x²，求实数 a 的最大值。",
            contentLatex: #"x\ge 0\ \text{时恒有}\ e^{x}\ge 1+x+\tfrac a2 x^{2},\ \ a_{\max}=?"#,
            answer: "a 的最大值为 1",
            difficulty: 0.74, tier: 5,
            formulaIds: ["taylor_series"],
            stdSteps: [
                skStep(1, "构造作差函数", #"g(x)=e^{x}-1-x-\tfrac a2x^{2},\quad g(0)=0"#),
                skStep(2, "一阶导仍为 0/0 型", #"g'(x)=e^{x}-1-ax,\quad g'(0)=0"#),
                skStep(3, "二次求导定符号", #"g''(x)=e^{x}-a"#),
                skStep(4, "讨论 a≤1", #"x\ge0\Rightarrow e^{x}\ge1\ge a\Rightarrow g''\ge0\Rightarrow g'\nearrow\Rightarrow g'\ge g'(0)=0\Rightarrow g\nearrow\Rightarrow g\ge0"#),
                skStep(5, "讨论 a>1 失效", #"g''(0)=1-a<0,\ \text{近 }0\text{ 处 }g'<0\Rightarrow g<0,\ \text{不成立}"#),
                skStep(6, "结论", #"a_{\max}=1"#)
            ],
            killSteps: [
                skStep(1, "泰勒展开 eˣ", #"e^{x}=1+x+\tfrac{x^{2}}{2}+\tfrac{x^{3}}{6}+\cdots\ (x\ge0\text{ 各项非负})"#),
                skStep(2, "立得 a=1 成立", #"e^{x}\ge 1+x+\tfrac{x^{2}}{2}\Rightarrow a=1\text{ 时恒成立}"#),
                skStep(3, "比 x² 系数定上界", #"a>1\Rightarrow x\to0^{+}\ \text{主项}\ \tfrac{1-a}{2}x^{2}<0\ \text{必破坏}\Rightarrow a_{\max}=1"#)
            ],
            stdKey: "二次求导定一阶导单调性，再回推原函数非负，分类讨论定出 a。",
            killKey: "eˣ 的泰勒展开自带 x²/2，比较二次项系数即知 a 最大为 1。",
            mistakes: ["忘记验证 g(0)=g'(0)=0 两个边界", "a>1 时未说明在 x→0⁺ 处失效"]
        ),

        // 2 ── 洛必达：选填极限直接秒
        skCase(
            id: "sk_002", weapon: .lopital,
            title: "(x−sinx)/x³ 这种极限，洛必达连捅三刀",
            source: "极限 · 选择填空（高考/竞赛常见）",
            standardMinutes: 6, killSeconds: 40,
            signal: "0/0 型且凑不出重要极限——直接洛必达。",
            content: "求极限 lim(x→0) (x − sin x) / x³。",
            contentLatex: #"\lim_{x\to0}\frac{x-\sin x}{x^{3}}=?"#,
            answer: "1/6",
            difficulty: 0.66, tier: 4,
            formulaIds: ["lopital_rule", "taylor_series"],
            stdSteps: [
                skStep(1, "中学思路：泰勒/夹逼", #"\sin x=x-\tfrac{x^{3}}{6}+o(x^{3})"#),
                skStep(2, "代入作差", #"x-\sin x=\tfrac{x^{3}}{6}+o(x^{3})"#),
                skStep(3, "求值", #"\frac{x-\sin x}{x^{3}}\to\frac16"#)
            ],
            killSteps: [
                skStep(1, "洛必达第一刀", #"\frac{x-\sin x}{x^{3}}\xrightarrow{0/0}\frac{1-\cos x}{3x^{2}}"#),
                skStep(2, "第二刀", #"\xrightarrow{0/0}\frac{\sin x}{6x}"#),
                skStep(3, "第三刀（或重要极限）", #"\xrightarrow{0/0}\frac{\cos x}{6}=\frac16"#)
            ],
            stdKey: "纯高中只能靠泰勒或夹逼，思路门槛高。",
            killKey: "0/0 型连续洛必达三次，机械求导即得 1/6，无需任何技巧。",
            mistakes: ["每步都要确认仍是 0/0 型才能继续洛必达", "大题不能直接写洛必达"]
        ),

        // 3 ── 泰勒展开：高阶未定式
        skCase(
            id: "sk_003", weapon: .taylor,
            title: "x⁴ 量级的极限，洛必达要四次，泰勒一步",
            source: "极限 · 高阶未定式（压轴选填）",
            standardMinutes: 10, killSeconds: 50,
            signal: "分母 x⁴ 高阶，洛必达要求导到崩溃——泰勒展开到四阶。",
            content: "求极限 lim(x→0) (cos x − e^(−x²/2)) / x⁴。",
            contentLatex: #"\lim_{x\to0}\frac{\cos x-e^{-x^{2}/2}}{x^{4}}=?"#,
            answer: "−1/12",
            difficulty: 0.80, tier: 5,
            formulaIds: ["taylor_series", "lopital_rule"],
            stdSteps: [
                skStep(1, "洛必达需连用四次", #"\text{分母 }x^{4}\Rightarrow\text{每次降一阶，求导式越来越长}"#),
                skStep(2, "极易算错", #"\text{四阶导后代入才得 }-\tfrac1{12}\ (\text{过程繁、易错})"#)
            ],
            killSteps: [
                skStep(1, "两个函数都展到 x⁴", #"\cos x=1-\tfrac{x^{2}}{2}+\tfrac{x^{4}}{24}+o(x^{4})"#),
                skStep(2, "指数展开", #"e^{-x^{2}/2}=1-\tfrac{x^{2}}{2}+\tfrac{x^{4}}{8}+o(x^{4})"#),
                skStep(3, "作差只剩四次项", #"\cos x-e^{-x^{2}/2}=\Big(\tfrac1{24}-\tfrac18\Big)x^{4}+o(x^{4})=-\tfrac{x^{4}}{12}+o(x^{4})"#),
                skStep(4, "求值", #"\Rightarrow\ \lim=-\frac1{12}"#)
            ],
            stdKey: "硬洛必达要对分子分母各求导四次，计算量巨大且极易出错。",
            killKey: "两函数同展到 x⁴，二次项恰好抵消，四次项系数 1/24−1/8=−1/12 直接读出。",
            mistakes: ["e^(−x²/2) 的 x⁴ 项是 (x²/2)²/2 = x⁴/8，别漏 1/2!", "展开阶数不足会得 0/0 错觉"]
        ),

        // 4 ── 极值点偏移：对数平均不等式
        skCase(
            id: "sk_004", weapon: .extremumOffset,
            title: "双零点之和 x₁+x₂>2，对数平均一击夹定",
            source: "导数 · 极值点偏移（全国卷经典压轴）",
            standardMinutes: 12, killSeconds: 70,
            signal: "两点函数值相等，要证它们的和——极值点偏移。",
            content: "设 f(x) = x·e^(−x)。若 f(x₁) = f(x₂) 且 x₁ ≠ x₂，证明 x₁ + x₂ > 2。",
            contentLatex: #"f(x)=xe^{-x},\ f(x_1)=f(x_2),\ x_1\ne x_2\Rightarrow x_1+x_2>2"#,
            answer: "成立，x₁+x₂>2（极大值点 x=1，左右偏移）",
            difficulty: 0.82, tier: 5,
            formulaIds: ["lagrange_mean"],
            stdSteps: [
                skStep(1, "构造对称差函数", #"\text{设 }x_1<1<x_2,\ F(x)=f(x)-f(2-x),\ x>1"#),
                skStep(2, "求导判单调", #"F'(x)=f'(x)+f'(2-x),\ \text{证 }F'>0\ (\text{需细致放缩})"#),
                skStep(3, "推出不等关系", #"F(x_2)>F(1)=0\Rightarrow f(x_2)>f(2-x_2)"#),
                skStep(4, "结合单调性比较", #"f(x_1)=f(x_2)>f(2-x_2),\ x_1,2-x_2<1\ \text{且 }f\nearrow\Rightarrow x_1>2-x_2"#),
                skStep(5, "结论", #"\Rightarrow x_1+x_2>2"#)
            ],
            killSteps: [
                skStep(1, "取对数化简条件", #"x_1e^{-x_1}=x_2e^{-x_2}\Rightarrow \ln x_1-x_1=\ln x_2-x_2"#),
                skStep(2, "整理出差商=1", #"x_2-x_1=\ln x_2-\ln x_1\Rightarrow\frac{x_2-x_1}{\ln x_2-\ln x_1}=1"#),
                skStep(3, "对数平均不等式", #"\frac{x_2-x_1}{\ln x_2-\ln x_1}<\frac{x_1+x_2}{2}"#),
                skStep(4, "一步夹定", #"1<\frac{x_1+x_2}{2}\Rightarrow x_1+x_2>2"#)
            ],
            stdKey: "构造 F(x)=f(x)−f(2−x) 证单调，再借单调性比较——步骤多、放缩繁。",
            killKey: "条件取对数后差商恰为 1，对数平均不等式上界 (x₁+x₂)/2 直接给出 >2。",
            mistakes: ["对数平均不等式大题需先证明", "注意 f(x)=xe⁻ˣ 在 x>0 才有两零点结构"]
        ),

        // 5 ── 切线放缩：调和和与 ln 比较
        skCase(
            id: "sk_005", weapon: .tangentLine,
            title: "调和和 > ln(n+1)，切线不等式一行求和",
            source: "数列 · 与对数的放缩证明（高考压轴）",
            standardMinutes: 8, killSeconds: 50,
            signal: "数列求和 ↔ ln(n+1)——用 ln(1+x)<x 切线放缩。",
            content: "证明：对任意正整数 n，1 + 1/2 + 1/3 + … + 1/n > ln(n+1)。",
            contentLatex: #"\sum_{k=1}^{n}\frac1k>\ln(n+1)\quad(n\in\mathbb N^{*})"#,
            answer: "成立",
            difficulty: 0.70, tier: 4,
            formulaIds: ["deriv_log"],
            stdSteps: [
                skStep(1, "数学归纳：奠基", #"n=1:\ 1>\ln2\approx0.693\ \checkmark"#),
                skStep(2, "归纳假设", #"\sum_{k=1}^{n}\tfrac1k>\ln(n+1)"#),
                skStep(3, "递推需再证一步", #"\text{需 }\tfrac1{n+1}>\ln(n+2)-\ln(n+1)=\ln\!\big(1+\tfrac1{n+1}\big)"#),
                skStep(4, "仍回到切线不等式", #"\text{即证 }\ln(1+x)<x,\ x=\tfrac1{n+1}\ \checkmark"#)
            ],
            killSteps: [
                skStep(1, "切线不等式", #"\ln(1+x)<x\quad(x>0)\ \ [\,y=x\ \text{是}\ \ln(1+x)\ \text{在 }0\text{ 处切线}\,]"#),
                skStep(2, "逐项取 x=1/k", #"\ln\frac{k+1}{k}=\ln\!\Big(1+\tfrac1k\Big)<\frac1k"#),
                skStep(3, "裂项求和", #"\ln(n+1)=\sum_{k=1}^{n}\ln\frac{k+1}{k}<\sum_{k=1}^{n}\frac1k"#)
            ],
            stdKey: "归纳法绕一圈，最后递推步仍要用到 ln(1+x)<x。",
            killKey: "直接用切线不等式逐项放缩，对数和裂项成 ln(n+1)，一次求和到位。",
            mistakes: ["ln((k+1)/k) 要写成 ln(1+1/k) 才好套切线不等式", "求和后是 ln(n+1) 不是 ln n"]
        ),

        // 6 ── 拉格朗日中值：对数双边夹
        skCase(
            id: "sk_006", weapon: .lagrange,
            title: "ln(b/a) 夹在两式之间，中值定理一步到位",
            source: "导数 · 对数不等式（高考压轴）",
            standardMinutes: 9, killSeconds: 55,
            signal: "出现 lnb−lna 的差，要夹在两个分式之间——拉格朗日。",
            content: "设 0 < a < b，证明：(b−a)/b < ln(b/a) < (b−a)/a。",
            contentLatex: #"0<a<b\Rightarrow\frac{b-a}{b}<\ln\frac ba<\frac{b-a}{a}"#,
            answer: "成立",
            difficulty: 0.72, tier: 4,
            formulaIds: ["lagrange_mean", "deriv_log"],
            stdSteps: [
                skStep(1, "左不等式构造函数", #"\varphi(x)=\ln x-\ln a-\frac{x-a}{x},\ \varphi(a)=0"#),
                skStep(2, "求导判单调", #"\varphi'(x)=\frac1x-\frac{a}{x^{2}}=\frac{x-a}{x^{2}}>0\Rightarrow\varphi(b)>0"#),
                skStep(3, "右不等式另构造", #"\psi(x)=\frac{x-a}{a}-\ln\frac xa,\ \psi'(x)=\frac1a-\frac1x>0\Rightarrow\psi(b)>0"#),
                skStep(4, "合并", #"\Rightarrow\frac{b-a}{b}<\ln\frac ba<\frac{b-a}{a}"#)
            ],
            killSteps: [
                skStep(1, "对 lnx 用中值定理", #"\ln b-\ln a=\frac1\xi(b-a),\quad \xi\in(a,b)"#),
                skStep(2, "夹住 1/ξ", #"a<\xi<b\Rightarrow\frac1b<\frac1\xi<\frac1a"#),
                skStep(3, "乘正数 (b−a)", #"\frac{b-a}{b}<\frac{b-a}{\xi}=\ln\frac ba<\frac{b-a}{a}"#)
            ],
            stdKey: "要分别构造两个辅助函数各证一边，工作量翻倍。",
            killKey: "中值定理把 lnb−lna 一次写成 (b−a)/ξ，再用 ξ∈(a,b) 同时夹出双边。",
            mistakes: ["乘 (b−a) 时注意它为正不变号", "中值定理大题需先转化为单调性"]
        ),

        // 7 ── 二次求导（凹凸 + Jensen）
        skCase(
            id: "sk_007", weapon: .secondDerivative,
            title: "三角和的最值，凹凸性 + Jensen 一步封顶",
            source: "三角 / 不等式 · 多元最值（高考压轴）",
            standardMinutes: 11, killSeconds: 60,
            signal: "三个角的 sin 求和最值——sin 在 (0,π) 上凹，Jensen。",
            content: "在三角形 ABC 中，证明：sin A + sin B + sin C ≤ 3√3/2。",
            contentLatex: #"\triangle ABC:\ \sin A+\sin B+\sin C\le\frac{3\sqrt3}{2}"#,
            answer: "成立，当 A=B=C=π/3 时取等",
            difficulty: 0.76, tier: 5,
            formulaIds: ["sum_to_product"],
            stdSteps: [
                skStep(1, "两两和差化积", #"\sin A+\sin B=2\sin\frac{A+B}{2}\cos\frac{A-B}{2}\le2\sin\frac{A+B}{2}"#),
                skStep(2, "固定 C 放缩", #"\le 2\cos\frac C2,\ \text{再处理 }\sin C=2\sin\frac C2\cos\frac C2"#),
                skStep(3, "化单变量求最值", #"\text{令 }t=\sin\frac C2,\ \text{求三次函数最大值（繁）}"#),
                skStep(4, "结论", #"\Rightarrow\le\frac{3\sqrt3}{2}"#)
            ],
            killSteps: [
                skStep(1, "二次求导判凹凸", #"f(x)=\sin x,\ f''(x)=-\sin x<0\ (x\in(0,\pi))\Rightarrow f\ \text{上凹(concave)}"#),
                skStep(2, "Jensen 不等式", #"\frac{\sin A+\sin B+\sin C}{3}\le\sin\frac{A+B+C}{3}=\sin\frac\pi3"#),
                skStep(3, "代入求和", #"\Rightarrow \sin A+\sin B+\sin C\le3\cdot\frac{\sqrt3}{2}=\frac{3\sqrt3}{2}"#)
            ],
            stdKey: "和差化积后被迫化成单变量三次函数求最值，步骤长。",
            killKey: "sin 的二阶导 <0 即上凹，Jensen 把三项均值压到 sin(π/3)，一步封顶。",
            mistakes: ["A+B+C=π 是 Jensen 取等的关键", "凹函数 Jensen 是 ≤，方向别反"]
        ),

        // 8 ── 定积分放缩
        skCase(
            id: "sk_008", weapon: .integralBound,
            title: "Σ1/√k 的下界，用积分把每项夹住再求和",
            source: "数列 · 和式估计（高考压轴）",
            standardMinutes: 10, killSeconds: 60,
            signal: "Σ1/√k 要证 > 连续表达式——定积分放缩。",
            content: "证明：对任意正整数 n，1/√1 + 1/√2 + … + 1/√n > 2(√(n+1) − 1)。",
            contentLatex: #"\sum_{k=1}^{n}\frac1{\sqrt k}>2\big(\sqrt{n+1}-1\big)"#,
            answer: "成立",
            difficulty: 0.74, tier: 5,
            formulaIds: ["fundamental_theorem", "int_power"],
            stdSteps: [
                skStep(1, "数学归纳：奠基", #"n=1:\ 1>2(\sqrt2-1)\approx0.828\ \checkmark"#),
                skStep(2, "归纳假设 + 递推", #"\text{需证 }\tfrac1{\sqrt{n+1}}>2(\sqrt{n+2}-\sqrt{n+1})"#),
                skStep(3, "有理化验证", #"2(\sqrt{n+2}-\sqrt{n+1})=\frac{2}{\sqrt{n+2}+\sqrt{n+1}}<\frac{2}{2\sqrt{n+1}}=\tfrac1{\sqrt{n+1}}\ \checkmark"#)
            ],
            killSteps: [
                skStep(1, "1/√x 递减 → 积分夹住每项", #"\frac1{\sqrt k}>\int_{k}^{k+1}\frac{dx}{\sqrt x}\quad(\tfrac1{\sqrt x}\downarrow)"#),
                skStep(2, "算出该积分", #"\int_{k}^{k+1}\frac{dx}{\sqrt x}=\big[2\sqrt x\big]_{k}^{k+1}=2\big(\sqrt{k+1}-\sqrt k\big)"#),
                skStep(3, "裂项求和", #"\sum_{k=1}^{n}\frac1{\sqrt k}>2\sum_{k=1}^{n}\big(\sqrt{k+1}-\sqrt k\big)=2\big(\sqrt{n+1}-1\big)"#)
            ],
            stdKey: "归纳法需要把递推步有理化验证，技巧性强。",
            killKey: "把每项 1/√k 用定积分从下方夹住，求和后望远镜式抵消，直接得 2(√(n+1)−1)。",
            mistakes: ["1/√x 递减时 1/√k > ∫ₖ^{k+1}，方向别反", "求和望远镜后下界是 √1=1"]
        ),

        // 9 ── 洛必达：比值型未定式
        skCase(
            id: "sk_009", weapon: .lopital,
            title: "(tanx−x)/(x−sinx)，洛必达两刀变 2sec³x",
            source: "极限 · 比值型 0/0（压轴选填）",
            standardMinutes: 7, killSeconds: 40,
            signal: "两个三次无穷小相比，凑不出重要极限——洛必达。",
            content: "求极限 lim(x→0) (tan x − x)/(x − sin x)。",
            contentLatex: #"\lim_{x\to0}\frac{\tan x-x}{x-\sin x}=?"#,
            answer: "2",
            difficulty: 0.70, tier: 4,
            formulaIds: ["lopital_rule", "taylor_series"],
            stdSteps: [
                skStep(1, "中学需双泰勒", #"\tan x=x+\tfrac{x^{3}}{3}+o,\quad x-\sin x=\tfrac{x^{3}}{6}+o"#),
                skStep(2, "比值", #"\frac{x^{3}/3}{x^{3}/6}=2"#)
            ],
            killSteps: [
                skStep(1, "洛必达第一刀", #"\frac{\tan x-x}{x-\sin x}\xrightarrow{0/0}\frac{\sec^{2}x-1}{1-\cos x}"#),
                skStep(2, "第二刀", #"\xrightarrow{0/0}\frac{2\sec^{2}x\tan x}{\sin x}=\frac{2\sec^{2}x}{\cos x}=2\sec^{3}x"#),
                skStep(3, "代入", #"\to 2\sec^{3}0=2"#)
            ],
            stdKey: "纯高中要同时记 tan、sin 的三阶泰勒。",
            killKey: "两次洛必达后整理成 2sec³x，代 0 即 2，无需记忆展开式。",
            mistakes: ["每步都要核对仍为 0/0 型", "sec²x−1=tan²x 别漏"]
        ),

        // 10 ── 泰勒：幂指型极限
        skCase(
            id: "sk_010", weapon: .taylor,
            title: "((1+x)^(1/x)−e)/x，取对数泰勒一步得 −e/2",
            source: "极限 · 幂指型（压轴选填）",
            standardMinutes: 9, killSeconds: 55,
            signal: "出现 (1+x)^(1/x) 这种 1^∞ 结构——先取对数再泰勒。",
            content: "求极限 lim(x→0) ((1+x)^(1/x) − e) / x。",
            contentLatex: #"\lim_{x\to0}\frac{(1+x)^{1/x}-e}{x}=?"#,
            answer: "−e/2",
            difficulty: 0.82, tier: 5,
            formulaIds: ["taylor_series"],
            stdSteps: [
                skStep(1, "硬洛必达极繁", #"\text{需对 }(1+x)^{1/x}\text{ 求导，含 }\ln(1+x)/x\text{ 的复合，易错}"#)
            ],
            killSteps: [
                skStep(1, "取对数再泰勒", #"\ln(1+x)^{1/x}=\frac{\ln(1+x)}{x}=1-\frac x2+\frac{x^{2}}{3}-\cdots"#),
                skStep(2, "还原指数", #"(1+x)^{1/x}=e^{\,1-\frac x2+o(x)}=e\Big(1-\frac x2+o(x)\Big)"#),
                skStep(3, "作差求极限", #"\frac{(1+x)^{1/x}-e}{x}=\frac{-\tfrac e2 x+o(x)}{x}\to-\frac e2"#)
            ],
            stdKey: "直接洛必达要对幂指函数求导，计算链很长。",
            killKey: "先把底数对数 ln(1+x)/x 泰勒成 1−x/2+…，再 e^(…) 展开，一次得 −e/2。",
            mistakes: ["ln(1+x)/x 的常数项是 1，别漏", "e^(1−x/2)=e·e^(−x/2) 要再展一阶"]
        ),

        // 11 ── 洛必达：无穷远未定式
        skCase(
            id: "sk_011", weapon: .lopital,
            title: "x(π/2−arctanx) 当 x→∞，洛必达一步得 1",
            source: "极限 · ∞·0 型（压轴选填）",
            standardMinutes: 7, killSeconds: 45,
            signal: "x→∞ 的 ∞·0 型——化成 0/0 再洛必达。",
            content: "求极限 lim(x→+∞) x·(π/2 − arctan x)。",
            contentLatex: #"\lim_{x\to+\infty}x\Big(\frac\pi2-\arctan x\Big)=?"#,
            answer: "1",
            difficulty: 0.72, tier: 4,
            formulaIds: ["lopital_rule"],
            stdSteps: [
                skStep(1, "估计 arctan 余量（繁）", #"\frac\pi2-\arctan x=\arctan\frac1x\approx\frac1x-\frac1{3x^{3}}"#),
                skStep(2, "相乘", #"x\Big(\frac1x-\frac1{3x^{3}}\Big)=1-\frac1{3x^{2}}\to1"#)
            ],
            killSteps: [
                skStep(1, "化 0/0 型", #"x\Big(\frac\pi2-\arctan x\Big)=\frac{\frac\pi2-\arctan x}{1/x}\quad(0/0)"#),
                skStep(2, "洛必达", #"\xrightarrow{\text{洛}}\frac{-\frac1{1+x^{2}}}{-\frac1{x^{2}}}=\frac{x^{2}}{1+x^{2}}"#),
                skStep(3, "取极限", #"\to1"#)
            ],
            stdKey: "中学要把 π/2−arctanx 转成 arctan(1/x) 再级数估计。",
            killKey: "∞·0 改写成 (π/2−arctanx)/(1/x) 的 0/0，洛必达一步化为 x²/(1+x²)→1。",
            mistakes: ["∞·0 必须先化成 0/0 或 ∞/∞ 才能洛必达", "求导别漏负号"]
        ),

        // 12 ── 泰勒：连乘余弦
        skCase(
            id: "sk_012", weapon: .taylor,
            title: "(1−cosx·cos2x·cos3x)/x²，泰勒读出 1+4+9 的一半",
            source: "极限 · 连乘三角（压轴选填）",
            standardMinutes: 9, killSeconds: 50,
            signal: "多个余弦连乘的 0/0——每个 cos(kx) 展到二阶即可。",
            content: "求极限 lim(x→0) (1 − cos x · cos 2x · cos 3x)/x²。",
            contentLatex: #"\lim_{x\to0}\frac{1-\cos x\cos 2x\cos 3x}{x^{2}}=?"#,
            answer: "7",
            difficulty: 0.78, tier: 5,
            formulaIds: ["taylor_series"],
            stdSteps: [
                skStep(1, "和差化积逐步合并（繁）", #"\text{反复积化和差，三因子展开冗长}"#)
            ],
            killSteps: [
                skStep(1, "各 cos 展到二阶", #"\cos kx=1-\tfrac{(kx)^{2}}{2}+o(x^{2})"#),
                skStep(2, "连乘只留二次项", #"\prod_{k=1}^{3}\cos kx=1-\frac{(1^{2}+2^{2}+3^{2})}{2}x^{2}+o(x^{2})=1-7x^{2}+o(x^{2})"#),
                skStep(3, "作差求值", #"\frac{1-(1-7x^{2})}{x^{2}}\to 7"#)
            ],
            stdKey: "硬展三因子乘积或反复积化和差，过程冗长易错。",
            killKey: "每个 cos(kx) 取 1−(kx)²/2，乘积二次项系数为 −(1+4+9)/2，直接得 7。",
            mistakes: ["连乘时只需保留到 x² 项，高阶丢弃", "系数是 Σk²/2=14/2=7"]
        ),

        // 13 ── 泰勒：e^x·sinx 型
        skCase(
            id: "sk_013", weapon: .taylor,
            title: "(eˣsinx − x(1+x))/x³，泰勒乘开只剩三次项",
            source: "极限 · 混合超越（压轴选填）",
            standardMinutes: 9, killSeconds: 55,
            signal: "分母 x³、含 eˣsinx——两个泰勒相乘到三阶。",
            content: "求极限 lim(x→0) (eˣ·sin x − x(1+x)) / x³。",
            contentLatex: #"\lim_{x\to0}\frac{e^{x}\sin x-x(1+x)}{x^{3}}=?"#,
            answer: "1/3",
            difficulty: 0.80, tier: 5,
            formulaIds: ["taylor_series", "lopital_rule"],
            stdSteps: [
                skStep(1, "洛必达需三次", #"\text{分母 }x^{3}\Rightarrow\text{三次求导，乘积求导项数爆炸}"#)
            ],
            killSteps: [
                skStep(1, "两因子展到三阶", #"e^{x}=1+x+\tfrac{x^{2}}2+\tfrac{x^{3}}6,\ \ \sin x=x-\tfrac{x^{3}}6"#),
                skStep(2, "相乘保留到 x³", #"e^{x}\sin x=x+x^{2}+\Big(\tfrac12-\tfrac16\Big)x^{3}+o=x+x^{2}+\tfrac{x^{3}}3+o"#),
                skStep(3, "作差求值", #"\frac{(x+x^{2}+\tfrac{x^{3}}3)-(x+x^{2})}{x^{3}}\to\frac13"#)
            ],
            stdKey: "洛必达对 eˣsinx 连续三次求导，乘积法则使项数迅速膨胀。",
            killKey: "eˣ、sinx 各展到三阶相乘，一二次项与 x(1+x) 抵消，三次项系数 1/2−1/6=1/3。",
            mistakes: ["相乘时收集 x³ 项要齐全", "x(1+x)=x+x² 恰好消去低次"]
        ),

        // 14 ── 二次求导（凹）+ Jensen：根式和最值
        skCase(
            id: "sk_014", weapon: .secondDerivative,
            title: "a+b+c=3 时 √a+√b+√c 的最大值，凹函数 Jensen 封顶",
            source: "不等式 · 多元最值（压轴）",
            standardMinutes: 8, killSeconds: 50,
            signal: "约束和为定值、求根式之和最值——√ 上凹，Jensen。",
            content: "已知 a, b, c > 0 且 a + b + c = 3，求 √a + √b + √c 的最大值。",
            contentLatex: #"a,b,c>0,\ a+b+c=3,\ \sqrt a+\sqrt b+\sqrt c\ \text{的最大值}=?"#,
            answer: "最大值 3（a=b=c=1 时取得）",
            difficulty: 0.72, tier: 4,
            formulaIds: ["deriv_power"],
            stdSteps: [
                skStep(1, "柯西不等式", #"(\sqrt a+\sqrt b+\sqrt c)^{2}\le 3(a+b+c)=9"#),
                skStep(2, "开方", #"\Rightarrow \sqrt a+\sqrt b+\sqrt c\le 3"#)
            ],
            killSteps: [
                skStep(1, "二次求导判凹", #"f(x)=\sqrt x,\ f''(x)=-\tfrac14 x^{-3/2}<0\Rightarrow f\ \text{上凹}"#),
                skStep(2, "Jensen", #"\frac{\sqrt a+\sqrt b+\sqrt c}{3}\le\sqrt{\frac{a+b+c}{3}}=\sqrt1=1"#),
                skStep(3, "结论", #"\Rightarrow \sqrt a+\sqrt b+\sqrt c\le 3,\ \text{等号 }a=b=c=1"#)
            ],
            stdKey: "柯西虽快，但要凑出 (Σ√)²≤3Σ 的结构。",
            killKey: "√ 的二阶导 <0 即上凹，Jensen 把均值压到 √(均值)=1，三倍即上界 3。",
            mistakes: ["凹函数 Jensen 是 ≤", "取等条件是三者相等"]
        ),

        // 15 ── 二次求导（凸）+ Jensen：锐角三角
        skCase(
            id: "sk_015", weapon: .secondDerivative,
            title: "锐角三角形 tanA+tanB+tanC≥3√3，凸函数 Jensen 托底",
            source: "三角 · 多元最值（压轴）",
            standardMinutes: 10, killSeconds: 55,
            signal: "锐角三角形三个 tan 求和下界——tan 在 (0,π/2) 上凸，Jensen。",
            content: "在锐角三角形 ABC 中，证明：tan A + tan B + tan C ≥ 3√3。",
            contentLatex: #"\text{锐角}\triangle ABC:\ \tan A+\tan B+\tan C\ge 3\sqrt3"#,
            answer: "成立，A=B=C=π/3 取等",
            difficulty: 0.78, tier: 5,
            formulaIds: ["deriv_chain"],
            stdSteps: [
                skStep(1, "恒等式", #"A+B+C=\pi\Rightarrow \tan A+\tan B+\tan C=\tan A\tan B\tan C"#),
                skStep(2, "记 s=Σtan，由 AM-GM", #"s=\tan A\tan B\tan C\le\Big(\tfrac s3\Big)^{3}"#),
                skStep(3, "解不等式", #"s\le \tfrac{s^{3}}{27}\Rightarrow s^{2}\ge27\Rightarrow s\ge 3\sqrt3\ (s>0)"#)
            ],
            killSteps: [
                skStep(1, "二次求导判凸", #"f(x)=\tan x,\ f''(x)=2\sec^{2}x\tan x>0\ \text{在}(0,\tfrac\pi2)\Rightarrow f\ \text{下凸}"#),
                skStep(2, "Jensen", #"\frac{\tan A+\tan B+\tan C}{3}\ge\tan\frac{A+B+C}{3}=\tan\frac\pi3=\sqrt3"#),
                skStep(3, "结论", #"\Rightarrow \tan A+\tan B+\tan C\ge 3\sqrt3"#)
            ],
            stdKey: "需先证 tanA+tanB+tanC=tanAtanBtanC 恒等式，再 AM-GM 反解。",
            killKey: "tan 在 (0,π/2) 二阶导 >0 即下凸，Jensen 把均值托到 tan(π/3)=√3，三倍得下界。",
            mistakes: ["必须是锐角三角形才能保证三角都在 (0,π/2) 凸区间", "凸函数 Jensen 是 ≥"]
        ),

        // 16 ── 极值点偏移（对数平均）：积的下界
        skCase(
            id: "sk_016", weapon: .extremumOffset,
            title: "(lnx)/x 双解之积 x₁x₂>e²，化归对数平均",
            source: "导数 · 极值点偏移（全国卷经典压轴）",
            standardMinutes: 13, killSeconds: 75,
            signal: "(lnx)/x 取相同值的两点，证其积——换元化成对数平均。",
            content: "设 f(x) = (ln x)/x。若 f(x₁) = f(x₂) 且 x₁ ≠ x₂，证明 x₁·x₂ > e²。",
            contentLatex: #"f(x)=\frac{\ln x}{x},\ f(x_1)=f(x_2),\ x_1\ne x_2\Rightarrow x_1x_2>e^{2}"#,
            answer: "成立（极大值点 x=e，两交点之积 >e²）",
            difficulty: 0.84, tier: 5,
            formulaIds: ["lagrange_mean", "deriv_log"],
            stdSteps: [
                skStep(1, "设 1<x₁<e<x₂，构造", #"F(x)=f(x)-f\Big(\tfrac{e^{2}}{x}\Big),\ \text{证单调与符号（繁）}"#),
                skStep(2, "比较得偏移", #"\Rightarrow f(x_2)\ \text{与}\ f(e^{2}/x_1)\ \text{比较，结合单调性}"#),
                skStep(3, "结论", #"\Rightarrow x_1x_2>e^{2}"#)
            ],
            killSteps: [
                skStep(1, "换元 s=lnx₁, t=lnx₂", #"\frac{\ln x_1}{x_1}=\frac{\ln x_2}{x_2}\Rightarrow s\,e^{-s}=t\,e^{-t}"#),
                skStep(2, "再取对数", #"\ln s-s=\ln t-t\Rightarrow\frac{t-s}{\ln t-\ln s}=1"#),
                skStep(3, "对数平均不等式", #"1=\frac{t-s}{\ln t-\ln s}<\frac{s+t}{2}\Rightarrow s+t>2"#),
                skStep(4, "还原", #"\ln x_1+\ln x_2>2\Rightarrow x_1x_2>e^{2}"#)
            ],
            stdKey: "极值点偏移构造 F(x)=f(x)−f(e²/x) 并证单调，步骤繁、放缩难。",
            killKey: "令 s=lnx₁,t=lnx₂ 后条件化成 se⁻ˢ=te⁻ᵗ，再用对数平均把 s+t 一步夹到 >2。",
            mistakes: ["两交点都 >1，保证 s,t>0", "对数平均不等式大题需先证"]
        ),

        // 17 ── 极值点偏移（对数平均）：和的下界
        skCase(
            id: "sk_017", weapon: .extremumOffset,
            title: "lnx=ax 双零点之和 x₁+x₂>2/a，对数平均一击",
            source: "导数 · 零点与参数（压轴）",
            standardMinutes: 12, killSeconds: 70,
            signal: "方程 lnx=ax 两根求和的下界——对数平均直击。",
            content: "已知函数 f(x) = ln x − a x（a>0）有两个零点 x₁ < x₂，证明 x₁ + x₂ > 2/a。",
            contentLatex: #"f(x)=\ln x-ax\ (a>0)\ \text{有两零点}\ x_1<x_2\Rightarrow x_1+x_2>\frac2a"#,
            answer: "成立",
            difficulty: 0.82, tier: 5,
            formulaIds: ["lagrange_mean", "deriv_log"],
            stdSteps: [
                skStep(1, "构造对称差函数", #"\text{设 }g(x)=f\Big(\tfrac2{a}-x\Big)\ \text{与}\ f(x)\ \text{比较，证偏移（繁）}"#),
                skStep(2, "单调性推断", #"\Rightarrow x_1>\tfrac2a-x_2"#),
                skStep(3, "结论", #"\Rightarrow x_1+x_2>\tfrac2a"#)
            ],
            killSteps: [
                skStep(1, "两零点方程", #"\ln x_1=ax_1,\ \ln x_2=ax_2"#),
                skStep(2, "相减得 a", #"\ln x_2-\ln x_1=a(x_2-x_1)\Rightarrow a=\frac{\ln x_2-\ln x_1}{x_2-x_1}"#),
                skStep(3, "对数平均不等式", #"\frac{x_2-x_1}{\ln x_2-\ln x_1}<\frac{x_1+x_2}{2}\Rightarrow\frac1a<\frac{x_1+x_2}{2}"#),
                skStep(4, "结论", #"\Rightarrow x_1+x_2>\frac2a"#)
            ],
            stdKey: "极值点偏移需构造 f(2/a−x) 比较单调，过程长。",
            killKey: "两零点相减直接解出 a=(lnx₂−lnx₁)/(x₂−x₁)，对数平均上界即给出 x₁+x₂>2/a。",
            mistakes: ["对数平均不等式大题需先证明", "a=差商这一步是关键桥梁"]
        ),

        // 18 ── 切线放缩：经典极限不等式
        skCase(
            id: "sk_018", weapon: .tangentLine,
            title: "(1+1/n)ⁿ<e，切线不等式一行搞定",
            source: "数列 · 与 e 的比较（压轴）",
            standardMinutes: 7, killSeconds: 40,
            signal: "要比较 (1+1/n)ⁿ 与 e——取对数后套 ln(1+x)<x。",
            content: "证明：对任意正整数 n，(1 + 1/n)ⁿ < e。",
            contentLatex: #"\Big(1+\frac1n\Big)^{n}<e\quad(n\in\mathbb N^{*})"#,
            answer: "成立",
            difficulty: 0.70, tier: 4,
            formulaIds: ["deriv_log"],
            stdSteps: [
                skStep(1, "二项式展开", #"\Big(1+\tfrac1n\Big)^{n}=\sum_{k=0}^{n}\binom nk\frac1{n^{k}}"#),
                skStep(2, "逐项放缩", #"\binom nk\frac1{n^{k}}=\frac1{k!}\prod_{j=1}^{k-1}\Big(1-\tfrac jn\Big)<\frac1{k!}"#),
                skStep(3, "求和", #"<\sum_{k=0}^{n}\frac1{k!}<\sum_{k=0}^{\infty}\frac1{k!}=e"#)
            ],
            killSteps: [
                skStep(1, "取对数", #"\ln\Big(1+\tfrac1n\Big)^{n}=n\ln\Big(1+\tfrac1n\Big)"#),
                skStep(2, "切线不等式", #"\ln(1+x)<x\ (x>0)\Rightarrow \ln\Big(1+\tfrac1n\Big)<\tfrac1n"#),
                skStep(3, "结论", #"\Rightarrow n\ln\Big(1+\tfrac1n\Big)<1\Rightarrow\Big(1+\tfrac1n\Big)^{n}<e"#)
            ],
            stdKey: "二项式展开后逐项与 1/k! 比较再求和，步骤多。",
            killKey: "取对数后用切线不等式 ln(1+1/n)<1/n，乘 n 得 <1，指数还原即 <e。",
            mistakes: ["取对数方向不变（指数函数单调增）", "ln(1+x)<x 仅对 x>0"]
        ),

        // 19 ── 切线放缩：调和级数上界
        skCase(
            id: "sk_019", weapon: .tangentLine,
            title: "调和和 < 1+ln n，下切线 ln(1+x)>x/(1+x) 收口",
            source: "数列 · 调和级数估计（压轴）",
            standardMinutes: 9, killSeconds: 55,
            signal: "要给 Σ1/k 一个 ln 上界——用下切线 ln(1+x)>x/(1+x)。",
            content: "证明：对任意正整数 n，1 + 1/2 + … + 1/n < 1 + ln n。",
            contentLatex: #"\sum_{k=1}^{n}\frac1k<1+\ln n\quad(n\ge1)"#,
            answer: "成立",
            difficulty: 0.74, tier: 5,
            formulaIds: ["deriv_log"],
            stdSteps: [
                skStep(1, "数学归纳/积分", #"\text{需对每步比较 }\tfrac1k\ \text{与}\ \ln k-\ln(k-1)"#),
                skStep(2, "归纳验证", #"\text{逐步累加，过程繁琐}"#)
            ],
            killSteps: [
                skStep(1, "下切线不等式", #"\ln(1+x)>\frac{x}{1+x}\ (x>0)\ \ [\,g'(x)=\tfrac{x}{(1+x)^2}>0\,]"#),
                skStep(2, "取 x=1/(k−1)，k≥2", #"\ln\frac{k}{k-1}=\ln\Big(1+\tfrac1{k-1}\Big)>\frac{1}{k}"#),
                skStep(3, "求和裂项", #"\sum_{k=2}^{n}\frac1k<\sum_{k=2}^{n}\big(\ln k-\ln(k-1)\big)=\ln n"#),
                skStep(4, "补回首项", #"1+\sum_{k=2}^{n}\frac1k<1+\ln n"#)
            ],
            stdKey: "归纳法需逐项验证 1/k<ln(k/(k−1))，繁琐。",
            killKey: "用下切线 ln(1+x)>x/(1+x) 反向放缩出 1/k<ln k−ln(k−1)，裂项求和得上界。",
            mistakes: ["这里用的是『下切线』ln(1+x)>x/(1+x)，方向与上界 ln(1+x)<x 相反", "首项 1 单独留出"]
        ),

        // 20 ── 拉格朗日中值：反正切双边
        skCase(
            id: "sk_020", weapon: .lagrange,
            title: "arctanb−arctana 夹在两式间，中值定理一夹即得",
            source: "导数 · 反三角不等式（压轴）",
            standardMinutes: 9, killSeconds: 50,
            signal: "出现 arctanb−arctana 的差要双边夹——拉格朗日。",
            content: "设 0 < a < b，证明：(b−a)/(1+b²) < arctan b − arctan a < (b−a)/(1+a²)。",
            contentLatex: #"0<a<b\Rightarrow\frac{b-a}{1+b^{2}}<\arctan b-\arctan a<\frac{b-a}{1+a^{2}}"#,
            answer: "成立",
            difficulty: 0.74, tier: 4,
            formulaIds: ["lagrange_mean"],
            stdSteps: [
                skStep(1, "左边构造函数", #"\varphi(x)=\arctan x-\arctan a-\frac{x-a}{1+x^{2}}\ \text{证 }\varphi(b)>0"#),
                skStep(2, "右边另构造", #"\psi(x)=\frac{x-a}{1+a^{2}}-(\arctan x-\arctan a)\ \text{证 }\psi(b)>0"#),
                skStep(3, "合并", #"\Rightarrow\text{双边成立}"#)
            ],
            killSteps: [
                skStep(1, "对 arctan 用中值定理", #"\arctan b-\arctan a=\frac{1}{1+\xi^{2}}(b-a),\ \xi\in(a,b)"#),
                skStep(2, "夹 1/(1+ξ²)", #"a<\xi<b\Rightarrow\frac1{1+b^{2}}<\frac1{1+\xi^{2}}<\frac1{1+a^{2}}"#),
                skStep(3, "乘正数 (b−a)", #"\Rightarrow\frac{b-a}{1+b^{2}}<\arctan b-\arctan a<\frac{b-a}{1+a^{2}}"#)
            ],
            stdKey: "要分别构造两个辅助函数各证一侧。",
            killKey: "(arctan)'=1/(1+x²)，中值定理一步写成 (b−a)/(1+ξ²)，再用 ξ∈(a,b) 双边夹。",
            mistakes: ["1/(1+x²) 随 x 增大而减小，夹的方向要对", "乘 (b−a)>0 不变号"]
        ),

        // 21 ── 拉格朗日中值：正弦差双边
        skCase(
            id: "sk_021", weapon: .lagrange,
            title: "siny−sinx 夹在 (y−x)cosy 与 (y−x)cosx 之间",
            source: "导数 · 三角不等式（压轴）",
            standardMinutes: 9, killSeconds: 50,
            signal: "sin 之差要被 cos 端点夹住——拉格朗日 + cos 单调。",
            content: "设 0 < x < y < π/2，证明：(y−x)cos y < sin y − sin x < (y−x)cos x。",
            contentLatex: #"0<x<y<\tfrac\pi2\Rightarrow(y-x)\cos y<\sin y-\sin x<(y-x)\cos x"#,
            answer: "成立",
            difficulty: 0.74, tier: 4,
            formulaIds: ["lagrange_mean"],
            stdSteps: [
                skStep(1, "和差化积", #"\sin y-\sin x=2\cos\frac{x+y}{2}\sin\frac{y-x}{2}"#),
                skStep(2, "双边放缩 sin 与 cos（繁）", #"\text{需分别用 }\sin t<t,\ \sin t>\tfrac{2}{\pi}t\ \text{等估计}"#)
            ],
            killSteps: [
                skStep(1, "对 sin 用中值定理", #"\sin y-\sin x=\cos\xi\,(y-x),\ \xi\in(x,y)"#),
                skStep(2, "cos 在 (0,π/2) 递减", #"x<\xi<y\Rightarrow \cos y<\cos\xi<\cos x"#),
                skStep(3, "乘正数 (y−x)", #"\Rightarrow(y-x)\cos y<\sin y-\sin x<(y-x)\cos x"#)
            ],
            stdKey: "和差化积后还要对 sin、cos 分别精细放缩。",
            killKey: "中值定理把 siny−sinx 写成 cosξ·(y−x)，cos 在 (0,π/2) 递减直接给双边。",
            mistakes: ["cos 在 (0,π/2) 递减，故 cosy<cosξ<cosx", "区间端点严格不取等"]
        ),

        // 22 ── 定积分放缩：调和级数上界
        skCase(
            id: "sk_022", weapon: .integralBound,
            title: "1/2+…+1/n < ln n，用 1/x 的积分压住每项",
            source: "数列 · 和式估计（压轴）",
            standardMinutes: 8, killSeconds: 50,
            signal: "要给去掉首项的调和和一个 ln 上界——1/x 积分放缩。",
            content: "证明：对 n ≥ 2，1/2 + 1/3 + … + 1/n < ln n。",
            contentLatex: #"\sum_{k=2}^{n}\frac1k<\ln n\quad(n\ge2)"#,
            answer: "成立",
            difficulty: 0.72, tier: 4,
            formulaIds: ["fundamental_theorem", "int_log"],
            stdSteps: [
                skStep(1, "数学归纳", #"n=2:\ \tfrac12<\ln2\approx0.693\ \checkmark"#),
                skStep(2, "递推需再证", #"\text{需 }\tfrac1{n+1}<\ln(n+1)-\ln n=\ln\big(1+\tfrac1n\big)\ (\text{切线不等式})"#)
            ],
            killSteps: [
                skStep(1, "1/x 递减→上方夹每项", #"\frac1k<\int_{k-1}^{k}\frac{dx}{x}\quad(\tfrac1x\downarrow)"#),
                skStep(2, "算积分", #"\int_{k-1}^{k}\frac{dx}{x}=\ln k-\ln(k-1)"#),
                skStep(3, "裂项求和", #"\sum_{k=2}^{n}\frac1k<\sum_{k=2}^{n}\big(\ln k-\ln(k-1)\big)=\ln n"#)
            ],
            stdKey: "归纳法递推步仍要用到切线不等式 ln(1+1/n)>1/(n+1)。",
            killKey: "1/x 递减，1/k 比左邻积分 ∫_{k−1}^k 小，求和望远镜抵消得 ln n。",
            mistakes: ["1/x 递减时 1/k<∫_{k−1}^k，下标方向别反", "从 k=2 起求和，结果是 ln n"]
        ),

        // 23 ── 定积分放缩：根号和上界
        skCase(
            id: "sk_023", weapon: .integralBound,
            title: "√1+…+√n < (2/3)(n+1)^{3/2}，√x 积分托住每项",
            source: "数列 · 幂和估计（压轴）",
            standardMinutes: 9, killSeconds: 55,
            signal: "Σ√k 要一个连续上界——√x 递增用右邻积分夹。",
            content: "证明：对任意正整数 n，√1 + √2 + … + √n < (2/3)·(n+1)^(3/2)。",
            contentLatex: #"\sum_{k=1}^{n}\sqrt k<\frac23(n+1)^{3/2}"#,
            answer: "成立（更精确 < (2/3)[(n+1)^{3/2}−1]）",
            difficulty: 0.74, tier: 5,
            formulaIds: ["fundamental_theorem", "int_power"],
            stdSteps: [
                skStep(1, "数学归纳", #"\text{n=1: }1<\tfrac23\cdot2^{3/2}\approx1.886\ \checkmark"#),
                skStep(2, "递推需有理化验证", #"\text{需 }\sqrt{n+1}<\tfrac23\big[(n+2)^{3/2}-(n+1)^{3/2}\big]\ (\text{繁})"#)
            ],
            killSteps: [
                skStep(1, "√x 递增→右邻积分托住", #"\sqrt k<\int_{k}^{k+1}\sqrt x\,dx\quad(\sqrt x\uparrow)"#),
                skStep(2, "算积分", #"\int_{k}^{k+1}\sqrt x\,dx=\frac23\big[(k+1)^{3/2}-k^{3/2}\big]"#),
                skStep(3, "裂项求和", #"\sum_{k=1}^{n}\sqrt k<\frac23\big[(n+1)^{3/2}-1\big]<\frac23(n+1)^{3/2}"#)
            ],
            stdKey: "归纳法递推步要对幂式有理化估计，技巧性强。",
            killKey: "√x 递增，√k 比右邻积分小，望远镜求和得 (2/3)[(n+1)^{3/2}−1]。",
            mistakes: ["√x 递增时 √k<∫_k^{k+1}，方向别反", "∫√x=(2/3)x^{3/2}"]
        ),

        // 24 ── 定积分放缩：阶乘对数下界（斯特林味）
        skCase(
            id: "sk_024", weapon: .integralBound,
            title: "ln(n!) > n ln n − n + 1，lnx 积分托底",
            source: "数列 · 阶乘估计（压轴，斯特林雏形）",
            standardMinutes: 11, killSeconds: 60,
            signal: "要给 ln(n!)=Σln k 一个封闭下界——lnx 积分放缩。",
            content: "证明：对 n ≥ 2，ln(n!) > n·ln n − n + 1。",
            contentLatex: #"\ln(n!)>n\ln n-n+1\quad(n\ge2)"#,
            answer: "成立",
            difficulty: 0.80, tier: 5,
            formulaIds: ["fundamental_theorem", "int_log"],
            stdSteps: [
                skStep(1, "数学归纳", #"n=2:\ \ln2\approx0.693>2\ln2-1\approx0.386\ \checkmark"#),
                skStep(2, "递推需估计", #"\text{需 }\ln(n+1)>(n+1)\ln(n+1)-n\ln n-1\ (\text{繁})"#)
            ],
            killSteps: [
                skStep(1, "lnx 递增→右值高于积分", #"\ln k>\int_{k-1}^{k}\ln x\,dx\quad(\ln x\uparrow)"#),
                skStep(2, "求和接力", #"\ln(n!)=\sum_{k=2}^{n}\ln k>\int_{1}^{n}\ln x\,dx"#),
                skStep(3, "算定积分", #"\int_{1}^{n}\ln x\,dx=\big[x\ln x-x\big]_{1}^{n}=n\ln n-n+1"#)
            ],
            stdKey: "归纳法递推步对数估计繁琐。",
            killKey: "lnx 递增，每项 ln k 大于左邻积分，求和接成 ∫₁ⁿlnx dx=n ln n−n+1。",
            mistakes: ["lnx 递增时 ln k>∫_{k−1}^k", "∫lnx dx=x lnx−x，别漏 +1"]
        ),

        // 25 ── 拉格朗日乘数法：和定求平方和最小
        skCase(
            id: "sk_025", weapon: .lagrangeMultiplier,
            title: "x+2y+3z=6 下 x²+y²+z² 的最小值，梯度平行一步定",
            source: "多元最值 · 线性约束（压轴）",
            standardMinutes: 8, killSeconds: 50,
            signal: "线性约束下求平方和最小——梯度平行 ∇f=λ∇g。",
            content: "已知实数 x, y, z 满足 x + 2y + 3z = 6，求 x² + y² + z² 的最小值。",
            contentLatex: #"x+2y+3z=6,\ \ (x^{2}+y^{2}+z^{2})_{\min}=?"#,
            answer: "18/7",
            difficulty: 0.74, tier: 4,
            formulaIds: ["vector_dot"],
            stdSteps: [
                skStep(1, "柯西不等式", #"(x+2y+3z)^{2}\le(1^{2}+2^{2}+3^{2})(x^{2}+y^{2}+z^{2})"#),
                skStep(2, "代入约束", #"36\le 14(x^{2}+y^{2}+z^{2})\Rightarrow x^{2}+y^{2}+z^{2}\ge\frac{18}{7}"#)
            ],
            killSteps: [
                skStep(1, "梯度平行", #"\nabla(x^{2}+y^{2}+z^{2})=\lambda\nabla(x+2y+3z)\Rightarrow(2x,2y,2z)=\lambda(1,2,3)"#),
                skStep(2, "解出比例", #"x=\tfrac\lambda2,\ y=\lambda,\ z=\tfrac{3\lambda}2"#),
                skStep(3, "代回约束求 λ", #"\tfrac\lambda2+2\lambda+\tfrac{9\lambda}2=7\lambda=6\Rightarrow\lambda=\tfrac67"#),
                skStep(4, "算最小值", #"x^{2}+y^{2}+z^{2}=\lambda^{2}\Big(\tfrac14+1+\tfrac94\Big)=\tfrac{36}{49}\cdot\tfrac72=\frac{18}{7}"#)
            ],
            stdKey: "柯西需凑出 (1²+2²+3²) 的配对结构，取等条件还要单独验证。",
            killKey: "∇f=λ∇g 给出 (2x,2y,2z)∝(1,2,3)，代回约束解 λ，直接算出 18/7。",
            mistakes: ["驻点 (x,y,z)∝(1,2,3) 与柯西取等条件一致", "拉氏乘数大题需改柯西书写"]
        ),

        // 26 ── 拉格朗日乘数法：椭圆内接矩形最大面积
        skCase(
            id: "sk_026", weapon: .lagrangeMultiplier,
            title: "椭圆内接矩形最大面积 2ab，乘数法直取驻点",
            source: "解析几何 · 约束最值（压轴）",
            standardMinutes: 9, killSeconds: 55,
            signal: "椭圆上一点使面积最大——∇(面积)∥∇(椭圆)。",
            content: "求椭圆 x²/a² + y²/b² = 1（a,b>0）的内接矩形（边平行坐标轴）的最大面积。",
            contentLatex: #"\frac{x^{2}}{a^{2}}+\frac{y^{2}}{b^{2}}=1,\ \text{内接矩形最大面积}=?"#,
            answer: "2ab",
            difficulty: 0.76, tier: 5,
            formulaIds: ["ellipse_eq"],
            stdSteps: [
                skStep(1, "参数化", #"x=a\cos\theta,\ y=b\sin\theta\ (\theta\in(0,\tfrac\pi2))"#),
                skStep(2, "面积函数", #"S=4xy=4ab\cos\theta\sin\theta=2ab\sin2\theta"#),
                skStep(3, "取最大", #"\sin2\theta\le1\Rightarrow S_{\max}=2ab"#)
            ],
            killSteps: [
                skStep(1, "目标与约束", #"\max S=4xy,\quad g=\frac{x^{2}}{a^{2}}+\frac{y^{2}}{b^{2}}-1=0"#),
                skStep(2, "梯度平行", #"(4y,4x)=\lambda\Big(\tfrac{2x}{a^{2}},\tfrac{2y}{b^{2}}\Big)\Rightarrow\frac{x^{2}}{a^{2}}=\frac{y^{2}}{b^{2}}"#),
                skStep(3, "结合约束", #"\Rightarrow\frac{x^{2}}{a^{2}}=\frac{y^{2}}{b^{2}}=\frac12\Rightarrow x=\tfrac{a}{\sqrt2},\ y=\tfrac{b}{\sqrt2}"#),
                skStep(4, "算面积", #"S=4xy=4\cdot\frac{ab}{2}=2ab"#)
            ],
            stdKey: "三角参数化后化为 2ab·sin2θ 求最大，需引入辅助角。",
            killKey: "∇S=λ∇g 直接逼出 x²/a²=y²/b²=1/2，对称点立得最大面积 2ab。",
            mistakes: ["矩形四个顶点，面积是 4xy 不是 xy", "驻点处 x²/a²=y²/b²=1/2"]
        ),

        // 27 ── 欧拉公式：余弦求和闭式
        skCase(
            id: "sk_027", weapon: .eulerFormula,
            title: "cosθ+cos2θ+…+cosnθ，欧拉公式化等比一步求和",
            source: "三角 · 数列求和（压轴）",
            standardMinutes: 10, killSeconds: 60,
            signal: "一串等差角的余弦求和——复指数等比数列取实部。",
            content: "求和：cos θ + cos 2θ + … + cos nθ（θ ≠ 2kπ）。",
            contentLatex: #"\sum_{k=1}^{n}\cos k\theta=?\quad(\theta\ne 2k\pi)"#,
            answer: "sin(nθ/2)·cos((n+1)θ/2) / sin(θ/2)",
            difficulty: 0.80, tier: 5,
            formulaIds: ["euler_formula", "geometric_sum"],
            stdSteps: [
                skStep(1, "乘 2sin(θ/2) 裂项", #"2\sin\tfrac\theta2\cos k\theta=\sin\big((k+\tfrac12)\theta\big)-\sin\big((k-\tfrac12)\theta\big)"#),
                skStep(2, "望远镜求和", #"2\sin\tfrac\theta2\sum_{k=1}^{n}\cos k\theta=\sin\big((n+\tfrac12)\theta\big)-\sin\tfrac\theta2"#),
                skStep(3, "整理", #"\Rightarrow\sum=\frac{\sin\frac{n\theta}{2}\cos\frac{(n+1)\theta}{2}}{\sin\frac\theta2}"#)
            ],
            killSteps: [
                skStep(1, "视为复指数实部", #"\sum_{k=1}^{n}\cos k\theta=\mathrm{Re}\sum_{k=1}^{n}e^{ik\theta}"#),
                skStep(2, "等比数列求和", #"\sum_{k=1}^{n}e^{ik\theta}=e^{i\theta}\frac{e^{in\theta}-1}{e^{i\theta}-1}=e^{i\frac{(n+1)\theta}{2}}\frac{\sin\frac{n\theta}{2}}{\sin\frac\theta2}"#),
                skStep(3, "取实部", #"\Rightarrow\sum_{k=1}^{n}\cos k\theta=\frac{\sin\frac{n\theta}{2}\cos\frac{(n+1)\theta}{2}}{\sin\frac\theta2}"#)
            ],
            stdKey: "需记住『乘 2sin(θ/2) 裂项』这一非显然技巧。",
            killKey: "Σe^{ikθ} 是等比数列，提取半角因子后取实部，闭式自然浮现。",
            mistakes: ["提因子用 e^{iα}−e^{-iα}=2i sinα", "结果分母是 sin(θ/2)"]
        ),

        // 28 ── 欧拉公式：幂次降幂线性化
        skCase(
            id: "sk_028", weapon: .eulerFormula,
            title: "cos⁵θ 拆成各次余弦，欧拉二项式一步降幂",
            source: "三角 · 降幂（积分预备，压轴）",
            standardMinutes: 9, killSeconds: 55,
            signal: "高次幂三角要线性化——(e^{iθ}+e^{-iθ})ⁿ 展开。",
            content: "将 cos⁵θ 表示为 cos θ、cos 3θ、cos 5θ 的线性组合。",
            contentLatex: #"\cos^{5}\theta=?\ (\text{用}\ \cos\theta,\cos3\theta,\cos5\theta\ \text{表示})"#,
            answer: "(1/16)(cos5θ + 5cos3θ + 10cosθ)",
            difficulty: 0.78, tier: 5,
            formulaIds: ["euler_formula", "binomial_theorem"],
            stdSteps: [
                skStep(1, "反复用倍角/积化和差", #"\cos^{2}\theta=\tfrac{1+\cos2\theta}{2},\ \text{逐层代入（繁、易错）}"#),
                skStep(2, "合并同类", #"\text{多次和差化积后整理}"#)
            ],
            killSteps: [
                skStep(1, "欧拉写法", #"\cos\theta=\frac{e^{i\theta}+e^{-i\theta}}{2}\Rightarrow\cos^{5}\theta=\frac{(e^{i\theta}+e^{-i\theta})^{5}}{2^{5}}"#),
                skStep(2, "二项式展开配对", #"(e^{i\theta}+e^{-i\theta})^{5}=2\cos5\theta+10\cos3\theta+20\cos\theta"#),
                skStep(3, "整理", #"\cos^{5}\theta=\frac{1}{16}\big(\cos5\theta+5\cos3\theta+10\cos\theta\big)"#)
            ],
            stdKey: "纯三角降幂要反复套倍角公式，层层嵌套极易出错。",
            killKey: "(e^{iθ}+e^{-iθ})⁵ 用二项式展开，对称项 e^{ikθ}+e^{-ikθ}=2cos kθ 自动配对，系数即 C(5,k)。",
            mistakes: ["配对系数来自 C(5,0)=1,C(5,1)=5,C(5,2)=10（对称翻倍）", "总除以 2⁵=32，约简后分母 16"]
        ),

        // 29 ── 特征根法：二阶线性递推
        skCase(
            id: "sk_029", weapon: .recurrence,
            title: "aₙ₊₂=5aₙ₊₁−6aₙ 的通项，特征方程秒出 2,3",
            source: "数列 · 二阶递推通项（压轴）",
            standardMinutes: 9, killSeconds: 55,
            signal: "二阶常系数线性递推求通项——写特征方程。",
            content: "数列 {aₙ} 满足 a₁=1, a₂=2, a_{n+2}=5a_{n+1}−6a_n，求通项 aₙ。",
            contentLatex: #"a_1=1,a_2=2,\ a_{n+2}=5a_{n+1}-6a_n,\ a_n=?"#,
            answer: "aₙ = 2^(n−1)",
            difficulty: 0.74, tier: 4,
            formulaIds: ["geometric_sum"],
            stdSteps: [
                skStep(1, "凑两个等比", #"a_{n+2}-2a_{n+1}=3(a_{n+1}-2a_n),\ a_{n+2}-3a_{n+1}=2(a_{n+1}-3a_n)"#),
                skStep(2, "求两组比值", #"a_{n+1}-2a_n=0\cdot3^{n-1}=0,\ a_{n+1}-3a_n=-1\cdot2^{n-1}"#),
                skStep(3, "联立解 aₙ", #"\Rightarrow a_n=2^{n-1}"#)
            ],
            killSteps: [
                skStep(1, "特征方程", #"x^{2}=5x-6\Rightarrow x^{2}-5x+6=0\Rightarrow x=2,\,3"#),
                skStep(2, "通解形式", #"a_n=A\cdot2^{n}+B\cdot3^{n}"#),
                skStep(3, "代初值定系数", #"2A+3B=1,\ 4A+9B=2\Rightarrow A=\tfrac12,\ B=0"#),
                skStep(4, "结论", #"a_n=\tfrac12\cdot2^{n}=2^{\,n-1}"#)
            ],
            stdKey: "要同时凑出两个等比数列，再联立消元，构造不直观。",
            killKey: "特征方程 x²−5x+6=0 给根 2、3，通解 A·2ⁿ+B·3ⁿ 代初值即得 2^(n−1)。",
            mistakes: ["特征根相异用 A·r₁ⁿ+B·r₂ⁿ", "B=0 说明此数列纯由根 2 主导"]
        ),

        // 30 ── 不动点：一阶分式递推（重根）
        skCase(
            id: "sk_030", weapon: .recurrence,
            title: "分式递推 aₙ₊₁=(3aₙ−4)/(aₙ−1)，不动点重根化等差",
            source: "数列 · 分式递推通项（压轴）",
            standardMinutes: 11, killSeconds: 65,
            signal: "分式递推求通项——先解不动点，重根取倒数化等差。",
            content: "数列 {aₙ} 满足 a₁=3, a_{n+1}=(3aₙ−4)/(aₙ−1)，求通项 aₙ。",
            contentLatex: #"a_1=3,\ a_{n+1}=\frac{3a_n-4}{a_n-1},\ a_n=?"#,
            answer: "aₙ = (2n+1)/n",
            difficulty: 0.82, tier: 5,
            formulaIds: [],
            stdSteps: [
                skStep(1, "迭代算前几项", #"a_1=3,\ a_2=\tfrac52,\ a_3=\tfrac73,\ a_4=\tfrac94,\dots"#),
                skStep(2, "猜想 + 归纳证明", #"\text{猜 }a_n=\tfrac{2n+1}{n},\ \text{再数学归纳验证（繁）}"#)
            ],
            killSteps: [
                skStep(1, "解不动点", #"x=\frac{3x-4}{x-1}\Rightarrow x^{2}-4x+4=0\Rightarrow x=2\ (\text{重根})"#),
                skStep(2, "重根取倒数", #"a_{n+1}-2=\frac{a_n-2}{a_n-1}\Rightarrow\frac1{a_{n+1}-2}=\frac{a_n-1}{a_n-2}=1+\frac1{a_n-2}"#),
                skStep(3, "得等差数列", #"b_n=\tfrac1{a_n-2}:\ b_{n+1}=b_n+1,\ b_1=\tfrac1{3-2}=1\Rightarrow b_n=n"#),
                skStep(4, "还原", #"a_n=2+\frac1n=\frac{2n+1}{n}"#)
            ],
            stdKey: "硬迭代只能『算几项→猜→归纳』，没有方向感。",
            killKey: "不动点 x=2 是重根，于是 1/(aₙ−2) 成等差数列，一步写出闭式 (2n+1)/n。",
            mistakes: ["不动点重根 → 取倒数化等差；相异根则取比化等比", "初值 a₁≠不动点 2，b₁ 才有意义"]
        ),

        // 31 ── 权方和：分式和最小（约束 x+y=1）
        skCase(
            id: "sk_031", weapon: .cauchyPower,
            title: "1/x+4/y（x+y=1）最小值 9，权方和一步压死",
            source: "不等式 · 分式最值（压轴）",
            standardMinutes: 6, killSeconds: 35,
            signal: "分式之和、分母和为定值——权方和 (Σa)²/Σb。",
            content: "已知 x>0, y>0 且 x+y=1，求 1/x + 4/y 的最小值。",
            contentLatex: #"x,y>0,\ x+y=1,\ \Big(\frac1x+\frac4y\Big)_{\min}=?"#,
            answer: "9",
            difficulty: 0.66, tier: 4,
            formulaIds: ["cauchy_schwarz"],
            stdSteps: [
                skStep(1, "乘 1 = x+y", #"\frac1x+\frac4y=(x+y)\Big(\frac1x+\frac4y\Big)=5+\frac yx+\frac{4x}y"#),
                skStep(2, "基本不等式", #"\frac yx+\frac{4x}y\ge2\sqrt4=4\Rightarrow\ge9"#)
            ],
            killSteps: [
                skStep(1, "权方和不等式", #"\frac1x+\frac4y=\frac{1^{2}}{x}+\frac{2^{2}}{y}\ge\frac{(1+2)^{2}}{x+y}"#),
                skStep(2, "代约束", #"=\frac{9}{1}=9\quad(\text{等号 }\tfrac1x=\tfrac2y,\ \text{即 }y=2x)"#)
            ],
            stdKey: "需要主动『乘 1=x+y』再用基本不等式，构造有门槛。",
            killKey: "权方和把 1²/x+2²/y 一步压到 (1+2)²/(x+y)=9，分母正好是约束 1。",
            mistakes: ["权方和分子要写成平方 1²、2²", "取等条件 1/x=2/y → y=2x"]
        ),

        // 32 ── 权方和：三元轮换分式
        skCase(
            id: "sk_032", weapon: .cauchyPower,
            title: "Σ a²/(a+b) 的最小值，权方和一击得 (a+b+c)/2",
            source: "不等式 · 轮换分式（压轴）",
            standardMinutes: 10, killSeconds: 50,
            signal: "轮换分式平方和、分母之和可控——权方和。",
            content: "已知 a, b, c > 0 且 a+b+c=1，求 a²/(a+b) + b²/(b+c) + c²/(c+a) 的最小值。",
            contentLatex: #"a,b,c>0,a+b+c=1,\ \Big(\frac{a^{2}}{a+b}+\frac{b^{2}}{b+c}+\frac{c^{2}}{c+a}\Big)_{\min}=?"#,
            answer: "1/2",
            difficulty: 0.80, tier: 5,
            formulaIds: ["cauchy_schwarz"],
            stdSteps: [
                skStep(1, "逐项配凑（难）", #"\frac{a^{2}}{a+b}=a-\frac{ab}{a+b},\ \text{需再处理 }\sum\frac{ab}{a+b}\ (\text{繁})"#),
                skStep(2, "放缩验证", #"\text{综合 AM-GM 估计，过程曲折}"#)
            ],
            killSteps: [
                skStep(1, "权方和", #"\sum\frac{a^{2}}{a+b}\ge\frac{(a+b+c)^{2}}{(a+b)+(b+c)+(c+a)}"#),
                skStep(2, "化简分母", #"=\frac{(a+b+c)^{2}}{2(a+b+c)}=\frac{a+b+c}{2}"#),
                skStep(3, "代约束", #"=\frac12\quad(\text{等号 }a=b=c=\tfrac13)"#)
            ],
            stdKey: "逐项裂成 a−ab/(a+b) 后还要处理 Σab/(a+b)，思路曲折。",
            killKey: "权方和把三个分式合成 (a+b+c)²/[2(a+b+c)]=(a+b+c)/2=1/2，一步到底。",
            mistakes: ["分母三项相加=2(a+b+c)", "取等 a=b=c=1/3"]
        ),

        // 33 ── 二次型·特征值：圆上二次式范围
        skCase(
            id: "sk_033", weapon: .quadraticForm,
            title: "x²+y²=1 上 x²+4xy+y² 的范围 = 特征值 [−1,3]",
            source: "解析几何/代数 · 圆上二次式（压轴）",
            standardMinutes: 8, killSeconds: 45,
            signal: "单位圆上求二次式范围——对称矩阵两个特征值即上下界。",
            content: "已知 x² + y² = 1，求 x² + 4xy + y² 的取值范围。",
            contentLatex: #"x^{2}+y^{2}=1,\ x^{2}+4xy+y^{2}\in?"#,
            answer: "[−1, 3]",
            difficulty: 0.74, tier: 4,
            formulaIds: [],
            stdSteps: [
                skStep(1, "三角换元", #"x=\cos\theta,\ y=\sin\theta"#),
                skStep(2, "化辅助角", #"\cos^{2}\theta+4\cos\theta\sin\theta+\sin^{2}\theta=1+2\sin2\theta"#),
                skStep(3, "求范围", #"\sin2\theta\in[-1,1]\Rightarrow 1+2\sin2\theta\in[-1,3]"#)
            ],
            killSteps: [
                skStep(1, "写成对称矩阵", #"x^{2}+4xy+y^{2}\leftrightarrow M=\begin{pmatrix}1&2\\2&1\end{pmatrix}"#),
                skStep(2, "特征方程", #"\lambda^{2}-(1+1)\lambda+(1\cdot1-2^{2})=0\Rightarrow\lambda^{2}-2\lambda-3=0"#),
                skStep(3, "解得范围", #"\lambda=3,\,-1\Rightarrow\text{范围}=[\lambda_{\min},\lambda_{\max}]=[-1,3]"#)
            ],
            stdKey: "三角换元后还要凑辅助角才能定上下界。",
            killKey: "二次式对应矩阵 [[1,2],[2,1]]，单位圆上的范围正是其特征值 −1 与 3。",
            mistakes: ["矩阵非对角元是 b/2=4/2=2", "范围两端就是 λ_min、λ_max"]
        ),

        // 34 ── 二次型·特征值：非对称系数
        skCase(
            id: "sk_034", weapon: .quadraticForm,
            title: "x²+y²=1 上 5x²+4xy+8y² 的最值 = 特征值 4 与 9",
            source: "代数 · 条件二次最值（压轴）",
            standardMinutes: 9, killSeconds: 50,
            signal: "系数不对称的圆上二次式最值——还是特征值。",
            content: "已知 x² + y² = 1，求 5x² + 4xy + 8y² 的最大值与最小值。",
            contentLatex: #"x^{2}+y^{2}=1,\ 5x^{2}+4xy+8y^{2}\ \text{的最值}=?"#,
            answer: "最大 9，最小 4",
            difficulty: 0.76, tier: 5,
            formulaIds: [],
            stdSteps: [
                skStep(1, "三角换元降幂", #"5\cos^{2}\theta+4\cos\theta\sin\theta+8\sin^{2}\theta=\tfrac{13}{2}-\tfrac32\cos2\theta+2\sin2\theta"#),
                skStep(2, "合成辅助角", #"=\tfrac{13}{2}+\tfrac52\sin(2\theta-\varphi),\ \ \sqrt{(\tfrac32)^{2}+2^{2}}=\tfrac52"#),
                skStep(3, "求最值", #"\Rightarrow\Big[\tfrac{13}{2}-\tfrac52,\ \tfrac{13}{2}+\tfrac52\Big]=[4,9]"#)
            ],
            killSteps: [
                skStep(1, "对称矩阵", #"M=\begin{pmatrix}5&2\\2&8\end{pmatrix}"#),
                skStep(2, "特征方程", #"\lambda^{2}-13\lambda+(40-4)=0\Rightarrow\lambda^{2}-13\lambda+36=0"#),
                skStep(3, "解根", #"\lambda=\frac{13\pm5}{2}=9,\,4\Rightarrow\max=9,\ \min=4"#)
            ],
            stdKey: "降幂后要算振幅 √((3/2)²+2²)=5/2 再合成，易算错。",
            killKey: "矩阵 [[5,2],[2,8]]：迹 13、行列式 36，特征值 9、4 即为最大最小值。",
            mistakes: ["特征方程 λ²−(迹)λ+(行列式)=0", "行列式 5·8−2²=36"]
        ),

    ]

    private static let secondKillCasesB: [SecondKillCase] = [

        // 35 ── SOS 配方：对称二次不等式
        skCase(
            id: "sk_035", weapon: .sosDecomposition,
            title: "a²+b²+c²≥ab+bc+ca，配成平方和一眼非负",
            source: "不等式 · 对称二次（压轴基石）",
            standardMinutes: 6, killSeconds: 35,
            signal: "对称二次不等式右边可移项为 0——配平方和。",
            content: "证明：对任意实数 a, b, c，a² + b² + c² ≥ ab + bc + ca。",
            contentLatex: #"a^{2}+b^{2}+c^{2}\ge ab+bc+ca"#,
            answer: "成立，a=b=c 时取等",
            difficulty: 0.66, tier: 4,
            formulaIds: ["sos_inequality"],
            stdSteps: [
                skStep(1, "三式基本不等式", #"a^{2}+b^{2}\ge2ab,\ b^{2}+c^{2}\ge2bc,\ c^{2}+a^{2}\ge2ca"#),
                skStep(2, "相加除 2", #"2(a^{2}+b^{2}+c^{2})\ge2(ab+bc+ca)"#)
            ],
            killSteps: [
                skStep(1, "直接配平方和", #"a^{2}+b^{2}+c^{2}-ab-bc-ca=\tfrac12\big[(a-b)^{2}+(b-c)^{2}+(c-a)^{2}\big]"#),
                skStep(2, "非负显然", #"\ge0,\ \text{等号}\Leftrightarrow a=b=c"#)
            ],
            stdKey: "三次基本不等式相加，取等条件需另说明。",
            killKey: "恒等配成 ½[(a−b)²+(b−c)²+(c−a)²]，非负与取等条件同时读出。",
            mistakes: ["系数是 1/2，别漏", "取等当三个平方同时为 0，即 a=b=c"]
        ),

        // 36 ── SOS 配方：含 1 的非对称式
        skCase(
            id: "sk_036", weapon: .sosDecomposition,
            title: "x²+y²+1≥xy+x+y，2 倍后配三平方",
            source: "不等式 · 配方/判别式（压轴）",
            standardMinutes: 7, killSeconds: 40,
            signal: "两元二次恒成立——配平方和（或判别式）。",
            content: "证明：对任意实数 x, y，x² + y² + 1 ≥ xy + x + y。",
            contentLatex: #"x^{2}+y^{2}+1\ge xy+x+y"#,
            answer: "成立，x=y=1 时取等",
            difficulty: 0.70, tier: 4,
            formulaIds: ["sos_inequality"],
            stdSteps: [
                skStep(1, "视为 x 的二次", #"x^{2}-(y+1)x+(y^{2}-y+1)\ge0"#),
                skStep(2, "判别式", #"\Delta=(y+1)^{2}-4(y^{2}-y+1)=-3(y-1)^{2}\le0"#),
                skStep(3, "结论", #"\text{开口向上且 }\Delta\le0\Rightarrow\ge0\ \text{恒成立}"#)
            ],
            killSteps: [
                skStep(1, "乘 2 配平方", #"2(x^{2}+y^{2}+1-xy-x-y)=(x-y)^{2}+(x-1)^{2}+(y-1)^{2}"#),
                skStep(2, "非负显然", #"\ge0,\ \text{等号}\Leftrightarrow x=y=1"#)
            ],
            stdKey: "判别式法要把它当作 x 的二次再算 Δ，步骤稍绕。",
            killKey: "乘 2 后恰好配成 (x−y)²+(x−1)²+(y−1)²，非负一目了然。",
            mistakes: ["先乘 2 才能配出整系数平方", "取等需三平方同时为 0：x=y=1"]
        ),

        // 37 ── 三角换元：根式函数值域
        skCase(
            id: "sk_037", weapon: .trigSubstitution,
            title: "y=x+√(1−x²) 的值域，令 x=cosθ 一步辅助角",
            source: "函数 · 根式值域（压轴）",
            standardMinutes: 8, killSeconds: 45,
            signal: "含 √(1−x²) 且 x∈[−1,1]——令 x=cosθ。",
            content: "求函数 y = x + √(1 − x²) 的值域。",
            contentLatex: #"y=x+\sqrt{1-x^{2}}\ \text{的值域}=?"#,
            answer: "[−1, √2]",
            difficulty: 0.72, tier: 4,
            formulaIds: ["aux_angle"],
            stdSteps: [
                skStep(1, "定义域+求导", #"x\in[-1,1],\ y'=1-\frac{x}{\sqrt{1-x^{2}}}=0\Rightarrow x=\tfrac{1}{\sqrt2}"#),
                skStep(2, "比较驻点与端点", #"y(\tfrac1{\sqrt2})=\sqrt2,\ y(-1)=-1,\ y(1)=1"#),
                skStep(3, "结论", #"\Rightarrow\text{值域}=[-1,\sqrt2]"#)
            ],
            killSteps: [
                skStep(1, "三角换元", #"\text{令 }x=\cos\theta,\ \theta\in[0,\pi]\Rightarrow\sqrt{1-x^{2}}=\sin\theta"#),
                skStep(2, "合成辅助角", #"y=\cos\theta+\sin\theta=\sqrt2\sin\!\Big(\theta+\tfrac\pi4\Big)"#),
                skStep(3, "用范围定值域", #"\theta+\tfrac\pi4\in[\tfrac\pi4,\tfrac{5\pi}4]\Rightarrow\sin\in[-\tfrac{\sqrt2}2,1]\Rightarrow y\in[-1,\sqrt2]"#)
            ],
            stdKey: "求导要处理根式分母，还要比较驻点与两端点。",
            killKey: "x=cosθ 把根号化掉，y=√2 sin(θ+π/4)，由 θ 的范围直接读出值域。",
            mistakes: ["√(1−x²)=sinθ 需 θ∈[0,π] 保证非负", "辅助角后看 θ+π/4 的实际区间"]
        ),

        // 38 ── 三角换元：双圆约束不等式
        skCase(
            id: "sk_038", weapon: .trigSubstitution,
            title: "a²+b²=1,c²+d²=1 ⇒ ac+bd≤1，双角换元化 cos(α−β)",
            source: "不等式 · 单位圆约束（压轴）",
            standardMinutes: 7, killSeconds: 40,
            signal: "两组『平方和=1』的约束——各设一个角。",
            content: "已知 a²+b²=1，c²+d²=1，证明 ac + bd ≤ 1。",
            contentLatex: #"a^{2}+b^{2}=1,\ c^{2}+d^{2}=1\Rightarrow ac+bd\le1"#,
            answer: "成立",
            difficulty: 0.70, tier: 4,
            formulaIds: ["aux_angle", "cauchy_schwarz"],
            stdSteps: [
                skStep(1, "柯西不等式", #"(ac+bd)^{2}\le(a^{2}+b^{2})(c^{2}+d^{2})=1"#),
                skStep(2, "开方", #"\Rightarrow|ac+bd|\le1\Rightarrow ac+bd\le1"#)
            ],
            killSteps: [
                skStep(1, "两组角换元", #"a=\cos\alpha,b=\sin\alpha,\ c=\cos\beta,d=\sin\beta"#),
                skStep(2, "和角公式", #"ac+bd=\cos\alpha\cos\beta+\sin\alpha\sin\beta=\cos(\alpha-\beta)"#),
                skStep(3, "有界性", #"\cos(\alpha-\beta)\le1"#)
            ],
            stdKey: "柯西要先平方再开方，且需说明取正。",
            killKey: "两组约束各设一角后，ac+bd 正好是 cos(α−β)，余弦不超过 1。",
            mistakes: ["换元后恰好凑成余弦和角公式", "cos≤1 等号当 α=β"]
        ),

        // 39 ── 罗尔定理：多项式系数条件 → 有根
        skCase(
            id: "sk_039", weapon: .rolleTheorem,
            title: "系数和 Σaₖ/(k+1)=0 ⇒ 多项式在 (0,1) 有根，构造原函数+罗尔",
            source: "存在性 · 方程有根（压轴）",
            standardMinutes: 10, killSeconds: 55,
            signal: "要证多项式在区间有根，但符号判不了——构造原函数用罗尔。",
            content: "设 a₀ + a₁/2 + a₂/3 + … + aₙ/(n+1) = 0，证明方程 a₀ + a₁x + … + aₙxⁿ = 0 在 (0,1) 内必有实根。",
            contentLatex: #"a_0+\tfrac{a_1}2+\cdots+\tfrac{a_n}{n+1}=0\Rightarrow a_0+a_1x+\cdots+a_nx^{n}=0\ \text{在}(0,1)\text{有根}"#,
            answer: "成立",
            difficulty: 0.82, tier: 5,
            formulaIds: [],
            stdSteps: [
                skStep(1, "零点定理难直接", #"\text{多项式 }P(x)\text{ 在 }0,1\text{ 的符号无法确定，零点定理无从下手}"#)
            ],
            killSteps: [
                skStep(1, "构造原函数", #"F(x)=a_0x+\tfrac{a_1}2x^{2}+\cdots+\tfrac{a_n}{n+1}x^{n+1}"#),
                skStep(2, "两端相等", #"F(0)=0,\ F(1)=a_0+\tfrac{a_1}2+\cdots+\tfrac{a_n}{n+1}=0"#),
                skStep(3, "罗尔定理", #"\exists\,\xi\in(0,1):\ F'(\xi)=0"#),
                skStep(4, "还原", #"F'(x)=a_0+a_1x+\cdots+a_nx^{n}\Rightarrow P(\xi)=0"#)
            ],
            stdKey: "直接用零点定理时多项式端点符号不确定，根本判不了。",
            killKey: "把多项式视为某个 F 的导数：积出的 F 恰好 F(0)=F(1)=0，罗尔保证 F'=P 有零点。",
            mistakes: ["条件 Σaₖ/(k+1) 正是 F(1) 的值", "罗尔要求 F(0)=F(1) 且连续可导"]
        ),

        // 40 ── 罗尔定理：三零点 → 二阶导有零点
        skCase(
            id: "sk_040", weapon: .rolleTheorem,
            title: "f(0)=f(1)=f(2)=0 ⇒ f″ 在 (0,2) 有零点，两次罗尔",
            source: "存在性 · 高阶导数（压轴）",
            standardMinutes: 9, killSeconds: 50,
            signal: "函数有三个零点，要证二阶导有零点——罗尔接力。",
            content: "设 f(x) 在 [0,2] 上二阶可导，且 f(0)=f(1)=f(2)=0，证明存在 ξ∈(0,2) 使 f″(ξ)=0。",
            contentLatex: #"f(0)=f(1)=f(2)=0\Rightarrow\exists\,\xi\in(0,2):\ f''(\xi)=0"#,
            answer: "成立",
            difficulty: 0.78, tier: 5,
            formulaIds: [],
            stdSteps: [
                skStep(1, "直接分析无从下手", #"\text{仅知三点函数值为 0，难以直接定位 }f''\text{ 的零点}"#)
            ],
            killSteps: [
                skStep(1, "第一层罗尔", #"f(0)=f(1)\Rightarrow\exists\,p\in(0,1):f'(p)=0;\ f(1)=f(2)\Rightarrow\exists\,q\in(1,2):f'(q)=0"#),
                skStep(2, "第二层罗尔", #"f'(p)=f'(q)=0\Rightarrow\exists\,\xi\in(p,q):\ f''(\xi)=0"#),
                skStep(3, "结论", #"\xi\in(p,q)\subset(0,2)"#)
            ],
            stdKey: "只盯 f 本身无法定位二阶导零点。",
            killKey: "对相邻零点用罗尔得 f′ 的两个零点，再对 f′ 用一次罗尔，f″ 的零点自动出现。",
            mistakes: ["罗尔接力：n+1 个零点 → n 个一阶导零点 → …", "ξ 落在 (p,q)⊂(0,2)"]
        ),

        // 41 ── 特殊值/赋值：奇函数 + 常数平移
        skCase(
            id: "sk_041", weapon: .specialValue,
            title: "f(x)=ax⁵+bx³+cx+8，由 f(−3)=5 秒求 f(3)",
            source: "函数 · 奇偶性（高考选择高频）",
            standardMinutes: 5, killSeconds: 20,
            signal: "只有奇次项+常数，问对称两点的函数值——剥去常数看奇函数。",
            content: "已知 f(x) = ax⁵ + bx³ + cx + 8（a,b,c 为常数），且 f(−3) = 5，则 f(3) = ?",
            contentLatex: #"f(x)=ax^{5}+bx^{3}+cx+8,\ f(-3)=5\Rightarrow f(3)=?"#,
            answer: "11",
            difficulty: 0.55, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "试图解 a,b,c", #"\text{三个未知数仅一个方程，无法逐一求出}"#),
                skStep(2, "被迫整体处理", #"\text{需观察 }f(3)+f(-3)\text{ 的结构}"#)
            ],
            killSteps: [
                skStep(1, "剥常数得奇函数", #"g(x)=f(x)-8=ax^{5}+bx^{3}+cx\ \text{为奇函数}"#),
                skStep(2, "奇函数对称", #"g(3)=-g(-3)=-(f(-3)-8)=-(5-8)=3"#),
                skStep(3, "还原", #"f(3)=g(3)+8=11"#)
            ],
            stdKey: "三未知一方程，正面求 a,b,c 是死路。",
            killKey: "f(x)−8 是奇函数，f(3)+f(−3)=16，由 f(−3)=5 立得 f(3)=11。",
            mistakes: ["常数项 8 不具奇偶性，要先剥离", "f(3)+f(−3)=2×常数=16"],
            type: .multipleChoice,
            options: ["11", "−11", "5", "13"]
        ),

        // 42 ── 赋值法：二项式系数和
        skCase(
            id: "sk_042", weapon: .specialValue,
            title: "(1+x)¹⁰ 的 a₁+a₂+…+a₁₀，赋值 x=1、x=0 两步",
            source: "二项式定理 · 系数和（高考选择高频）",
            standardMinutes: 5, killSeconds: 20,
            signal: "求展开式系数之和——给 x 赋特殊值 1、−1、0。",
            content: "设 (1+x)¹⁰ = a₀ + a₁x + a₂x² + … + a₁₀x¹⁰，则 a₁ + a₂ + … + a₁₀ = ?",
            contentLatex: #"(1+x)^{10}=\sum_{k=0}^{10}a_kx^{k},\ a_1+a_2+\cdots+a_{10}=?"#,
            answer: "1023",
            difficulty: 0.50, tier: 3,
            formulaIds: ["binomial_theorem"],
            stdSteps: [
                skStep(1, "逐项算组合数", #"a_k=\binom{10}{k},\ \text{再求 }\sum_{k=1}^{10}\binom{10}{k}\ (\text{繁})"#)
            ],
            killSteps: [
                skStep(1, "赋值 x=1（取全部和）", #"a_0+a_1+\cdots+a_{10}=(1+1)^{10}=1024"#),
                skStep(2, "赋值 x=0（取 a₀）", #"a_0=(1+0)^{10}=1"#),
                skStep(3, "相减", #"a_1+\cdots+a_{10}=1024-1=1023"#)
            ],
            stdKey: "逐个算 C(10,k) 再求和，又慢又易错。",
            killKey: "x=1 得所有系数和 2¹⁰=1024，x=0 得 a₀=1，一减即 1023。",
            mistakes: ["求全部系数和令 x=1", "题目不含 a₀，要减去 a₀=1"],
            type: .multipleChoice,
            options: ["1023", "1024", "1022", "512"]
        ),

        // 43 ── 选项代入排除：由 Sₙ 求 aₙ
        skCase(
            id: "sk_043", weapon: .optionElimination,
            title: "Sₙ=n²+n 求 aₙ，算 a₁、a₂ 代选项秒排除",
            source: "数列 · 由和求项（高考选择）",
            standardMinutes: 5, killSeconds: 25,
            signal: "选择题求通项，选项具体——算前两项代回排除。",
            content: "已知数列 {aₙ} 的前 n 项和 Sₙ = n² + n，则 aₙ = ?",
            contentLatex: #"S_n=n^{2}+n,\ a_n=?"#,
            answer: "2n",
            difficulty: 0.45, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "分类讨论", #"a_n=S_n-S_{n-1}\ (n\ge2),\ a_1=S_1\ \text{单独验证}"#),
                skStep(2, "计算", #"a_n=(n^{2}+n)-((n-1)^{2}+(n-1))=2n\ (n\ge2),\ a_1=2\ \text{符合}"#)
            ],
            killSteps: [
                skStep(1, "算前两项", #"a_1=S_1=2,\ a_2=S_2-S_1=6-2=4"#),
                skStep(2, "代选项验证", #"\text{要 }a_1=2,a_2=4:\ \text{仅 }a_n=2n\ \text{同时满足}"#)
            ],
            stdKey: "需对 n=1 与 n≥2 分类讨论并验证衔接。",
            killKey: "选择题只要 a₁=2、a₂=4 两个数，四个选项里只有 aₙ=2n 全中。",
            mistakes: ["a₁ 要用 S₁ 而非通项公式", "代两项通常足以排除三个选项"],
            type: .multipleChoice,
            options: ["2n", "n² + n", "2n − 1", "n + 1"]
        ),

        // 44 ── 选项代入：抽象解析式
        skCase(
            id: "sk_044", weapon: .optionElimination,
            title: "f(x+1)=x²+2x 求 f(x)，取特殊值验证选项",
            source: "函数 · 解析式（高考选择）",
            standardMinutes: 4, killSeconds: 20,
            signal: "求解析式且有选项——代特殊点验证最快。",
            content: "已知 f(x+1) = x² + 2x，则 f(x) = ?",
            contentLatex: #"f(x+1)=x^{2}+2x,\ f(x)=?"#,
            answer: "x² − 1",
            difficulty: 0.45, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "换元", #"\text{令 }t=x+1\Rightarrow x=t-1"#),
                skStep(2, "代入化简", #"f(t)=(t-1)^{2}+2(t-1)=t^{2}-1\Rightarrow f(x)=x^{2}-1"#)
            ],
            killSteps: [
                skStep(1, "取 x=0 算锚点", #"f(0+1)=0\Rightarrow f(1)=0"#),
                skStep(2, "选项代 x=1 筛选", #"x^{2}-1\big|_{1}=0\ \checkmark,\ \text{其余选项 }f(1)\ne0"#)
            ],
            stdKey: "换元法要细心代入展开，易出符号错。",
            killKey: "由 x=0 得 f(1)=0，四个选项里只有 x²−1 在 x=1 取 0。",
            mistakes: ["换元后是 f(t)=t²−1", "代一个特殊点通常即可锁定"],
            type: .multipleChoice,
            options: ["x² − 1", "x² + 1", "x² − 2x", "x² + 2x"]
        ),

        // 45 ── 数形结合：根式和的最小值（距离和）
        skCase(
            id: "sk_045", weapon: .numberShape,
            title: "√((x−1)²+1)+√((x+2)²+4) 最小值，化两点距离和",
            source: "函数 · 根式最值（高考选择/填空）",
            standardMinutes: 9, killSeconds: 40,
            signal: "两个根号各是『距离』，求和最小——数轴上点到两定点+对称。",
            content: "求 y = √(x²−2x+2) + √(x²+4x+8) 的最小值。",
            contentLatex: #"y=\sqrt{x^{2}-2x+2}+\sqrt{x^{2}+4x+8}\ \text{的最小值}=?"#,
            answer: "3√2",
            difficulty: 0.74, tier: 4,
            formulaIds: [],
            stdSteps: [
                skStep(1, "求导", #"y'=\frac{x-1}{\sqrt{(x-1)^{2}+1}}+\frac{x+2}{\sqrt{(x+2)^{2}+4}}=0\ (\text{方程难解})"#),
                skStep(2, "数值求解", #"\text{需解无理方程定驻点，繁琐}"#)
            ],
            killSteps: [
                skStep(1, "配方看作距离", #"y=\sqrt{(x-1)^{2}+1^{2}}+\sqrt{(x+2)^{2}+2^{2}}"#),
                skStep(2, "几何意义", #"=\text{点 }P(x,0)\text{ 到 }A(1,1),\ B(-2,2)\text{ 的距离和}"#),
                skStep(3, "对称求最短", #"A\text{ 关于 }x\text{ 轴对称点 }A'(1,-1),\ |A'B|=\sqrt{3^{2}+3^{2}}=3\sqrt2"#)
            ],
            stdKey: "求导得到无理方程，定驻点非常麻烦。",
            killKey: "两根号是 P(x,0) 到 A(1,1)、B(−2,2) 的距离；把 A 对 x 轴对称，|A′B|=3√2 即最短。",
            mistakes: ["配方成 (x−h)²+k² 才能读出定点坐标", "两定点在 x 轴同侧，需对称一个点"],
            type: .multipleChoice,
            options: ["3√2", "2√5", "√13", "5"]
        ),

        // 46 ── 数形结合：分式范围（斜率）
        skCase(
            id: "sk_046", weapon: .numberShape,
            title: "sinθ/(cosθ−2) 的范围，看成单位圆点到 (2,0) 的斜率",
            source: "三角 · 范围（高考选择）",
            standardMinutes: 8, killSeconds: 40,
            signal: "(sinθ−0)/(cosθ−2) 是斜率结构——单位圆上点到定点连线斜率。",
            content: "求 (sin θ)/(cos θ − 2) 的取值范围。",
            contentLatex: #"\frac{\sin\theta}{\cos\theta-2}\ \text{的取值范围}=?"#,
            answer: "[−√3/3, √3/3]",
            difficulty: 0.74, tier: 4,
            formulaIds: [],
            stdSteps: [
                skStep(1, "设 k 去分母", #"k=\frac{\sin\theta}{\cos\theta-2}\Rightarrow \sin\theta-k\cos\theta=-2k"#),
                skStep(2, "辅助角有解条件", #"\sqrt{1+k^{2}}\ge|2k|\Rightarrow1+k^{2}\ge4k^{2}\Rightarrow k^{2}\le\tfrac13"#)
            ],
            killSteps: [
                skStep(1, "几何意义", #"k=\frac{\sin\theta-0}{\cos\theta-2}=\text{单位圆上点 }(\cos\theta,\sin\theta)\text{ 与 }(2,0)\text{ 连线斜率}"#),
                skStep(2, "切线临界", #"\text{过 }(2,0)\text{ 作圆切线，}\frac{|2k|}{\sqrt{k^{2}+1}}=1\Rightarrow k=\pm\tfrac{\sqrt3}{3}"#),
                skStep(3, "结论", #"k\in\Big[-\tfrac{\sqrt3}{3},\tfrac{\sqrt3}{3}\Big]"#)
            ],
            stdKey: "去分母后用辅助角『有解』条件解不等式，需小心。",
            killKey: "该式是单位圆上动点到 (2,0) 的斜率，最大最小由两条切线给出 ±√3/3。",
            mistakes: ["切线条件：圆心到直线距离=半径 1", "范围是闭区间，切点可取到"],
            type: .multipleChoice,
            options: ["[−√3/3, √3/3]", "[−√3, √3]", "[−1, 1]", "[−1/2, 1/2]"]
        ),

        // 47 ── 估算：指对幂比大小
        skCase(
            id: "sk_047", weapon: .estimation,
            title: "比较 2^0.3、0.3²、log₀.₃2，按量级一眼排序",
            source: "指对函数 · 比大小（高考选择高频）",
            standardMinutes: 5, killSeconds: 20,
            signal: "幂、指、对数混比——用 0、1 当分界估量级。",
            content: "设 a = 2^0.3，b = 0.3²，c = log₀.₃2，则 a、b、c 的大小关系是？",
            contentLatex: #"a=2^{0.3},\ b=0.3^{2},\ c=\log_{0.3}2,\ \text{比较 }a,b,c"#,
            answer: "c < b < a",
            difficulty: 0.50, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "尝试精确估值", #"a\approx1.23,\ b=0.09,\ c\approx-0.63\ (\text{需查表/换底)}"#)
            ],
            killSteps: [
                skStep(1, "a 与 1 比", #"a=2^{0.3}>2^{0}=1"#),
                skStep(2, "b 落在 (0,1)", #"b=0.3^{2}=0.09\in(0,1)"#),
                skStep(3, "c 为负", #"\text{底 }0.3<1,\ \text{真数 }2>1\Rightarrow c=\log_{0.3}2<0"#),
                skStep(4, "排序", #"c<0<b<1<a\Rightarrow c<b<a"#)
            ],
            stdKey: "逐个求近似值要换底、估幂，慢且依赖记忆。",
            killKey: "只看量级：a>1、b∈(0,1)、c<0，三者大小立判 c<b<a。",
            mistakes: ["底数<1 且真数>1 时对数为负", "比大小常以 0、1 为分界"],
            type: .multipleChoice,
            options: ["c < b < a", "a < b < c", "b < c < a", "c < a < b"]
        ),

        // 48 ── 估算/特例比较：根式比大小（公共乘方）
        skCase(
            id: "sk_048", weapon: .estimation,
            title: "√2 与 ∛3 谁大？取 6 次方比 8 与 9",
            source: "根式 · 比大小（高考选择）",
            standardMinutes: 4, killSeconds: 20,
            signal: "不同次根号比大小——取指数最小公倍数同时乘方。",
            content: "比较 √2 与 ∛3（即 2^(1/2) 与 3^(1/3)）的大小。",
            contentLatex: #"\sqrt2\ \text{与}\ \sqrt[3]{3}\ \text{的大小}=?"#,
            answer: "∛3 > √2",
            difficulty: 0.48, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "取对数比较", #"\tfrac12\ln2\ \text{vs}\ \tfrac13\ln3\Rightarrow 3\ln2\ \text{vs}\ 2\ln3"#),
                skStep(2, "即 ln8 vs ln9", #"\ln2^{3}=\ln8<\ln9=\ln3^{2}"#)
            ],
            killSteps: [
                skStep(1, "同时取 6 次方", #"(\sqrt2)^{6}=2^{3}=8,\quad(\sqrt[3]{3})^{6}=3^{2}=9"#),
                skStep(2, "比较即得", #"8<9\Rightarrow\sqrt[3]{3}>\sqrt2"#)
            ],
            stdKey: "取对数还要再化成 ln8 与 ln9，多绕一步。",
            killKey: "两个指数 1/2、1/3 的公倍数是 6，同时 6 次方变成比 8 与 9，直接见分晓。",
            mistakes: ["乘方次数取分母 2、3 的最小公倍数 6", "乘方保序需两数为正"],
            type: .multipleChoice,
            options: ["∛3 > √2", "√2 > ∛3", "√2 = ∛3", "无法比较"]
        ),

        // 49 ── 对称性·周期：偶函数+周期求远处值
        skCase(
            id: "sk_049", weapon: .symmetryPeriod,
            title: "f(2025.5) 不用解析式，周期一折偶一翻就出",
            source: "函数性质 · 对称+周期求值（高考选填高频）",
            standardMinutes: 5, killSeconds: 25,
            signal: "给偶函数且 f(x+2)=f(x)——周期把大数折回，偶性翻到已知段。",
            content: "偶函数 f(x) 满足 f(x+2)=f(x)，当 0≤x≤1 时 f(x)=x，求 f(2025.5)。",
            contentLatex: #"f\text{偶},\ f(x+2)=f(x),\ f(x)=x\,(0\le x\le1),\ f(2025.5)=?"#,
            answer: "f(2025.5) = 1/2",
            difficulty: 0.46, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "先按周期不断减 2", #"f(2025.5)=f(2025.5-1012\times2)=f(1.5)"#),
                skStep(2, "1.5 不在 [0,1]，再减一个周期", #"f(1.5)=f(1.5-2)=f(-0.5)"#),
                skStep(3, "用偶函数翻到正半轴", #"f(-0.5)=f(0.5)=0.5"#)
            ],
            killSteps: [
                skStep(1, "周期 2：自变量模 2 落回 [-1,1]", #"2025.5\equiv1.5\equiv-0.5\ (\bmod\ 2)"#),
                skStep(2, "偶性折到 [0,1] 直读", #"f(-0.5)=f(0.5)=0.5"#)
            ],
            stdKey: "逐步减周期、再判区间、再用偶性，三步分开走容易绕。",
            killKey: "周期先把大数压进一个周期，偶性再把负的翻成正的——两步落到 f(x)=x 直接代。",
            mistakes: ["周期是 2 不是 4", "1.5 仍要再减一个周期才落进 [-1,1]", "偶函数是 f(-x)=f(x)，别和奇函数搞混"],
            type: .multipleChoice,
            options: ["1/2", "3/2", "1", "0"]
        ),

        // 50 ── 对称性·周期：中心对称配对求和
        skCase(
            id: "sk_050", weapon: .symmetryPeriod,
            title: "五个点求和，认出中心(1,2)两两配对秒加",
            source: "函数性质 · 中心对称求和（高考选填）",
            standardMinutes: 4, killSeconds: 20,
            signal: "给 f(x)+f(2-x)=4——图象关于点(1,2)中心对称，等距点配对。",
            content: "函数 f(x) 满足 f(x)+f(2-x)=4，求 f(-1)+f(0)+f(1)+f(2)+f(3)。",
            contentLatex: #"f(x)+f(2-x)=4,\ \ \sum_{k=-1}^{3}f(k)=?"#,
            answer: "和为 10",
            difficulty: 0.44, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "由条件试代具体值", #"f(0)+f(2)=4,\ f(-1)+f(3)=4"#),
                skStep(2, "中点处自配", #"f(1)+f(1)=4\Rightarrow f(1)=2"#),
                skStep(3, "相加", #"4+4+2=10"#)
            ],
            killSteps: [
                skStep(1, "识别中心对称 (1,2)", #"f(x)+f(2-x)=4\Rightarrow\text{关于}(1,2)\text{对称}"#),
                skStep(2, "对称点两两配 4，中心点 f(1)=2", #"(f(-1)+f(3))+(f(0)+f(2))+f(1)=4+4+2=10"#)
            ],
            stdKey: "硬代每个值也行，但要逐一凑出哪两项配对。",
            killKey: "看出对称中心 (1,2)，离中心等距的两点之和恒为 4，剩中心一点取 2，配对即得。",
            mistakes: ["f(x)+f(2-x)=4 对称中心是 (1,2)，纵坐标 4/2=2", "中心点 x=1 处 f(1)=2 不可漏", "配对要按到中心的距离配"],
            type: .multipleChoice,
            options: ["10", "8", "12", "20"]
        ),

        // 51 ── 韦达定理：对称式由系数出
        skCase(
            id: "sk_051", weapon: .vieta,
            title: "不解方程，x₁²+x₂² 与倒数和由系数直出",
            source: "一元二次 · 根与系数关系（高考选填）",
            standardMinutes: 4, killSeconds: 20,
            signal: "只问两根的对称组合，不要求具体根——韦达直接套。",
            content: "设 x₁, x₂ 是方程 x²-3x+1=0 的两根，求 x₁²+x₂² 与 1/x₁+1/x₂。",
            contentLatex: #"x^2-3x+1=0\ \text{两根}\ x_1,x_2,\ \ x_1^2+x_2^2=?\ ,\ \tfrac1{x_1}+\tfrac1{x_2}=?"#,
            answer: "x₁²+x₂²=7，1/x₁+1/x₂=3",
            difficulty: 0.40, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "求根公式解出两根", #"x=\frac{3\pm\sqrt5}{2}"#),
                skStep(2, "代入平方相加、通分", #"x_1^2+x_2^2,\ \frac{x_1+x_2}{x_1x_2}\ \text{再化简}"#)
            ],
            killSteps: [
                skStep(1, "韦达写出和与积", #"x_1+x_2=3,\quad x_1x_2=1"#),
                skStep(2, "对称式用和积表出", #"x_1^2+x_2^2=(x_1+x_2)^2-2x_1x_2=9-2=7"#),
                skStep(3, "倒数和=和/积", #"\frac1{x_1}+\frac1{x_2}=\frac{x_1+x_2}{x_1x_2}=\frac31=3"#)
            ],
            stdKey: "求出带根号的根再代入，平方化简反而易错。",
            killKey: "x₁+x₂=−b/a=3、x₁x₂=c/a=1，所有对称式都拿这两个拼，免去解根。",
            mistakes: ["x₁²+x₂²=(x₁+x₂)²−2x₁x₂，别漏 −2x₁x₂", "倒数和通分分子是和、分母是积", "用前先看 Δ=5>0 两根存在"],
            type: .fillInBlank
        ),

        // 52 ── 韦达定理：比值和
        skCase(
            id: "sk_052", weapon: .vieta,
            title: "x₁/x₂+x₂/x₁ 通分后又是和与积",
            source: "一元二次 · 根与系数关系（高考选填）",
            standardMinutes: 4, killSeconds: 22,
            signal: "比值之和 x₁/x₂+x₂/x₁，通分后分子是平方和、分母是积。",
            content: "设 x₁, x₂ 是方程 2x²-4x+1=0 的两根，求 x₁/x₂ + x₂/x₁。",
            contentLatex: #"2x^2-4x+1=0\ \text{两根},\ \ \frac{x_1}{x_2}+\frac{x_2}{x_1}=?"#,
            answer: "值为 6",
            difficulty: 0.44, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "解出两根", #"x=\frac{4\pm\sqrt{8}}{4}=1\pm\frac{\sqrt2}{2}"#),
                skStep(2, "代入比值和并有理化", #"\frac{x_1}{x_2}+\frac{x_2}{x_1}\ \text{逐项化简}"#)
            ],
            killSteps: [
                skStep(1, "韦达", #"x_1+x_2=2,\quad x_1x_2=\tfrac12"#),
                skStep(2, "通分=平方和/积", #"\frac{x_1^2+x_2^2}{x_1x_2}=\frac{(x_1+x_2)^2-2x_1x_2}{x_1x_2}"#),
                skStep(3, "代入", #"=\frac{4-1}{1/2}=\frac{3}{1/2}=6"#)
            ],
            stdKey: "带根号根代进比值再有理化，步骤长且易算错。",
            killKey: "比值和通分=（和²−2积）/积，全用 x₁+x₂=2、x₁x₂=1/2 拼出。",
            mistakes: ["x₁x₂=c/a=1/2 别忘了除 a", "分子 (x₁+x₂)²−2x₁x₂", "除以 1/2 等于乘 2"],
            type: .multipleChoice,
            options: ["6", "4", "8", "3"]
        ),

        // 53 ── 整体代换：抽象函数求解析式
        skCase(
            id: "sk_053", weapon: .substitution,
            title: "f(x+1)=x²+2x，凑成 x+1 的式子一眼读出",
            source: "函数 · 换元求解析式（高考选填）",
            standardMinutes: 4, killSeconds: 20,
            signal: "给 f(整体)=… 反求 f(x)——令整体为 t 或把右边凑成整体。",
            content: "已知 f(x+1) = x² + 2x，求 f(x) 的解析式。",
            contentLatex: #"f(x+1)=x^2+2x,\ \ f(x)=?"#,
            answer: "f(x) = x² - 1",
            difficulty: 0.42, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "令 t=x+1，则 x=t-1", #"x=t-1"#),
                skStep(2, "代入展开", #"f(t)=(t-1)^2+2(t-1)=t^2-2t+1+2t-2=t^2-1"#),
                skStep(3, "换回 x", #"f(x)=x^2-1"#)
            ],
            killSteps: [
                skStep(1, "把右边凑成 (x+1) 的式子", #"x^2+2x=(x+1)^2-1"#),
                skStep(2, "整体对照直接读", #"f(x+1)=(x+1)^2-1\Rightarrow f(x)=x^2-1"#)
            ],
            stdKey: "换元法稳妥，但要展开再合并同类项。",
            killKey: "右边配方成 (x+1)²−1，与左边 f(x+1) 整体一一对应，把括号里的整体替成 x 即得。",
            mistakes: ["配方 x²+2x=(x+1)²−1，常数 −1 别漏", "换元后定义域随之变化（本题为全体实数）"],
            type: .fillInBlank
        ),

        // 54 ── 整体代换：指数方程降为二次
        skCase(
            id: "sk_054", weapon: .substitution,
            title: "令 t=2ˣ，4ˣ−3·2ˣ+2=0 秒变二次",
            source: "指数方程 · 换元（高考选填）",
            standardMinutes: 4, killSeconds: 20,
            signal: "出现 4ˣ 与 2ˣ（前者是后者的平方）——令 t=2ˣ 整体降次。",
            content: "解方程 4ˣ - 3·2ˣ + 2 = 0。",
            contentLatex: #"4^{x}-3\cdot2^{x}+2=0,\ \ x=?"#,
            answer: "x = 0 或 x = 1",
            difficulty: 0.40, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "注意 4ˣ=(2ˣ)²", #"4^{x}=(2^{x})^{2}"#),
                skStep(2, "尝试因式分解", #"(2^{x})^{2}-3\cdot2^{x}+2=0"#),
                skStep(3, "解出 2ˣ 再取对数", #"2^{x}=1\ \text{或}\ 2,\ x=0\ \text{或}\ 1"#)
            ],
            killSteps: [
                skStep(1, "令 t=2ˣ (t>0)，整体换元", #"t^2-3t+2=0"#),
                skStep(2, "因式分解", #"(t-1)(t-2)=0\Rightarrow t=1\ \text{或}\ 2"#),
                skStep(3, "回代 2ˣ=t", #"2^{x}=1\Rightarrow x=0,\ \ 2^{x}=2\Rightarrow x=1"#)
            ],
            stdKey: "本质也是换元，只是没显式设 t 容易看乱。",
            killKey: "令 t=2ˣ 把超越方程变成熟悉的二次方程，解 t 后回代——注意 t>0 自动满足。",
            mistakes: ["t=2ˣ 必须 t>0，若解出负根要舍", "4ˣ=(2ˣ)² 不是 2·2ˣ", "回代别忘了求 x"],
            type: .multipleChoice,
            options: ["x=0 或 x=1", "x=1 或 x=2", "x=0 或 x=2", "x=±1"]
        ),

        // 55 ── 正难则反：至少一次正面
        skCase(
            id: "sk_055", weapon: .complement,
            title: "至少一次正面，算『全反』再用 1 减",
            source: "概率 · 对立事件（高考选填）",
            standardMinutes: 4, killSeconds: 18,
            signal: "『至少一次』正面分 1、2、3 次三类——补集只有『全反』一类。",
            content: "抛一枚均匀硬币 3 次，求至少出现一次正面的概率。",
            contentLatex: #"\text{抛硬币 3 次},\ P(\text{至少一次正面})=?"#,
            answer: "概率为 7/8",
            difficulty: 0.34, tier: 2,
            formulaIds: [],
            stdSteps: [
                skStep(1, "正面次数 ~ 二项分布", #"X\sim B(3,\tfrac12)"#),
                skStep(2, "分别算 1、2、3 次", #"P(X{=}1)=\tfrac38,\ P(X{=}2)=\tfrac38,\ P(X{=}3)=\tfrac18"#),
                skStep(3, "相加", #"\tfrac38+\tfrac38+\tfrac18=\tfrac78"#)
            ],
            killSteps: [
                skStep(1, "对立事件＝全是反面", #"\overline{A}:\text{三次全反}"#),
                skStep(2, "1 减补集", #"P(A)=1-\left(\tfrac12\right)^3=1-\tfrac18=\tfrac78"#)
            ],
            stdKey: "正面分三类各算一遍，组合数与概率都要乘。",
            killKey: "『至少一次』的反面是『一次都没有』=全反，只一种情形，1−(1/2)³ 直接出。",
            mistakes: ["补集是『三次全反』而非『一次反面』", "(1/2)³=1/8 不是 1/6", "P=1−P(补)"],
            type: .multipleChoice,
            options: ["7/8", "1/2", "3/8", "5/8"]
        ),

        // 56 ── 正难则反：至少一个偶数
        skCase(
            id: "sk_056", weapon: .complement,
            title: "至少一个偶数，用『总数 − 全奇』",
            source: "计数 · 补集法（高考选填）",
            standardMinutes: 5, killSeconds: 22,
            signal: "『至少一个偶数』正面分类多——补集『全是奇数』只一类。",
            content: "从 1~9 这九个数中任取三个不同的数，求至少含一个偶数的取法种数。",
            contentLatex: #"\text{从}\{1,\dots,9\}\text{取 3 个不同数, 至少 1 个偶数的取法}=?"#,
            answer: "74 种",
            difficulty: 0.48, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "按偶数个数分类（1/2/3 个偶）", #"C_4^1C_5^2+C_4^2C_5^1+C_4^3"#),
                skStep(2, "逐项计算", #"=4\cdot10+6\cdot5+4=40+30+4=74"#)
            ],
            killSteps: [
                skStep(1, "总取法", #"C_9^3=84"#),
                skStep(2, "补集＝全取奇数（奇数有 5 个）", #"C_5^3=10"#),
                skStep(3, "相减", #"84-10=74"#)
            ],
            stdKey: "分 1/2/3 个偶数三类，三个组合数都要算对。",
            killKey: "至少一偶的反面是『全奇』，奇数 1,3,5,7,9 共 5 个，84−C(5,3)=74。",
            mistakes: ["1~9 中偶数 4 个、奇数 5 个", "总数 C(9,3)=84", "补集只算『全奇』"],
            type: .multipleChoice,
            options: ["74", "64", "10", "80"]
        ),

        // 57 ── 三角图象：周期定ω、点定φ
        skCase(
            id: "sk_057", weapon: .trigGraph,
            title: "周期定 ω、过点定 φ，两步锁死解析式",
            source: "三角函数 · 求 ω,φ（高考选填高频）",
            standardMinutes: 5, killSeconds: 25,
            signal: "给周期和一个特殊点求 y=Asin(ωx+φ)——逐个参数击破。",
            content: "f(x)=2sin(ωx+φ)（ω>0，|φ|<π/2）最小正周期为 π，且 f(0)=1，求 ω 和 φ。",
            contentLatex: #"f(x)=2\sin(\omega x+\varphi),\ T=\pi,\ f(0)=1,\ \ \omega=?\ \varphi=?"#,
            answer: "ω=2，φ=π/6",
            difficulty: 0.46, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "由周期公式求 ω", #"T=\frac{2\pi}{\omega}=\pi\Rightarrow\omega=2"#),
                skStep(2, "代入 f(0)=1", #"2\sin\varphi=1\Rightarrow\sin\varphi=\tfrac12"#),
                skStep(3, "结合 |φ|<π/2 定 φ", #"\varphi=\tfrac\pi6"#)
            ],
            killSteps: [
                skStep(1, "ω 只由周期管", #"\omega=\frac{2\pi}{T}=2"#),
                skStep(2, "φ 只由那个点管", #"2\sin\varphi=1,\ |\varphi|<\tfrac\pi2\Rightarrow\varphi=\tfrac\pi6"#)
            ],
            stdKey: "方法本身就对，关键是别把 ω、φ 混在一个方程里联立。",
            killKey: "ω 归周期、φ 归特殊点，各管各的——周期给 ω=2，f(0)=1 给 sinφ=1/2，范围筛出 φ=π/6。",
            mistakes: ["ω=2π/T，周期 π 对应 ω=2", "sinφ=1/2 在 |φ|<π/2 内唯一取 π/6（非 5π/6）", "A=2 已给，不必再求"],
            type: .fillInBlank
        ),

        // 58 ── 三角图象：平移伸缩求解析式
        skCase(
            id: "sk_058", weapon: .trigGraph,
            title: "先平移后伸缩，φ 不随 ω 变才对",
            source: "三角函数 · 图象变换（高考选填）",
            standardMinutes: 4, killSeconds: 22,
            signal: "图象左右平移+横向伸缩求解析式——盯住变换顺序与 φ。",
            content: "将 y=sin x 的图象向左平移 π/3 个单位，再把横坐标缩短为原来的一半（纵坐标不变），求所得函数解析式。",
            contentLatex: #"y=\sin x\xrightarrow{\text{左移}\frac\pi3}\ \xrightarrow{\text{横坐标}\times\frac12}\ y=?"#,
            answer: "y = sin(2x + π/3)",
            difficulty: 0.44, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "左移 π/3：x→x+π/3", #"y=\sin\!\left(x+\tfrac\pi3\right)"#),
                skStep(2, "横坐标缩一半：x→2x", #"y=\sin\!\left(2x+\tfrac\pi3\right)"#)
            ],
            killSteps: [
                skStep(1, "左移加相位", #"\sin x\to\sin\!\left(x+\tfrac\pi3\right)"#),
                skStep(2, "缩短乘频率（只乘 x，不乘已加的 π/3）", #"\to\sin\!\left(2x+\tfrac\pi3\right)"#)
            ],
            stdKey: "本顺序为『先平移后伸缩』，平移量 π/3 不再被 ω 改变。",
            killKey: "左移先把 +π/3 加好，再把 x 换成 2x——φ=π/3 保持不变；若是『先伸缩后平移』结果会不同。",
            mistakes: ["先平移后伸缩时，相位 π/3 不乘 2", "横坐标缩一半是 x→2x（频率变 2）", "左移是 +，右移才是 −"],
            type: .multipleChoice,
            options: ["sin(2x+π/3)", "sin(2x+2π/3)", "sin(x/2+π/3)", "sin(2x−π/3)"]
        ),

        // 59 ── 极端位置：圆上点到直线最大距离
        skCase(
            id: "sk_059", weapon: .extremePosition,
            title: "圆上点到直线最远，圆心距加半径直接出",
            source: "解析几何 · 圆上动点最值（高考选填）",
            standardMinutes: 5, killSeconds: 22,
            signal: "圆上动点到定直线的最值——极端在过圆心的垂线上，d±r。",
            content: "求圆 x²+y²=1 上的点到直线 x+y-4=0 的距离的最大值。",
            contentLatex: #"\text{圆}\ x^2+y^2=1\ \text{上点到}\ x+y-4=0\ \text{距离最大值}=?"#,
            answer: "最大值为 2√2 + 1",
            difficulty: 0.46, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "设点 (cosθ, sinθ)", #"d=\frac{|\cos\theta+\sin\theta-4|}{\sqrt2}"#),
                skStep(2, "辅助角化简", #"=\frac{|\sqrt2\sin(\theta+\frac\pi4)-4|}{\sqrt2}"#),
                skStep(3, "取 sin=-1 时最大", #"\frac{\sqrt2+4}{\sqrt2}=1+2\sqrt2"#)
            ],
            killSteps: [
                skStep(1, "圆心到直线距离", #"d=\frac{|0+0-4|}{\sqrt2}=2\sqrt2"#),
                skStep(2, "极端位置：最远=圆心距+半径", #"d_{\max}=2\sqrt2+1"#)
            ],
            stdKey: "参数化+辅助角能算，但要处理绝对值取最值。",
            killKey: "动点最远必在『圆心→直线的垂线』延长线与圆的交点，结果就是圆心距 2√2 加半径 1。",
            mistakes: ["最大是 d+r，最小是 |d−r|", "圆心 (0,0)、半径 1", "点到线公式分母 √(1²+1²)=√2"],
            type: .multipleChoice,
            options: ["2√2+1", "2√2−1", "2√2", "4"]
        ),

        // 60 ── 极端位置：椭圆上点到焦点距离范围
        skCase(
            id: "sk_060", weapon: .extremePosition,
            title: "椭圆上点到焦点距离，端点 a±c 直接给范围",
            source: "解析几何 · 椭圆焦半径（高考选填）",
            standardMinutes: 5, killSeconds: 20,
            signal: "椭圆上动点到焦点距离的范围——长轴两端点取到 a+c 与 a−c。",
            content: "椭圆 x²/4 + y²/3 = 1 上的点到右焦点的距离的取值范围是？",
            contentLatex: #"\frac{x^2}{4}+\frac{y^2}{3}=1\ \text{上点到右焦点距离范围}=?"#,
            answer: "[1, 3]",
            difficulty: 0.48, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "焦半径公式", #"r=a-ex,\ e=\tfrac c a,\ x\in[-a,a]"#),
                skStep(2, "求 a,c", #"a=2,\ c=\sqrt{4-3}=1,\ e=\tfrac12"#),
                skStep(3, "x 取 ±2 得端点", #"r=2-\tfrac12 x\in[1,3]"#)
            ],
            killSteps: [
                skStep(1, "读出 a、c", #"a=2,\ c=\sqrt{a^2-b^2}=1"#),
                skStep(2, "极端位置：近地点 a−c、远地点 a+c", #"[a-c,\ a+c]=[1,3]"#)
            ],
            stdKey: "焦半径公式 r=a−ex 也行，但要记公式、定 x 范围。",
            killKey: "动点沿椭圆走，到焦点最近在同侧顶点 a−c、最远在对侧顶点 a+c，端点直接给区间 [1,3]。",
            mistakes: ["c²=a²−b²=4−3=1", "最小 a−c=1、最大 a+c=3", "别把 b=√3 当成 c"],
            type: .multipleChoice,
            options: ["[1, 3]", "[1, 4]", "[2−√3, 2+√3]", "[√3, 2]"]
        ),

        // 61 ── 基本不等式：1的代换
        skCase(
            id: "sk_061", weapon: .amgmTrick,
            title: "1/x+4/y 配 x+y=1，乘个『1』再均值",
            source: "基本不等式 · 1 的代换（高考选填高频）",
            standardMinutes: 5, killSeconds: 25,
            signal: "约束 x+y=1 求 1/x+4/y 最小——把约束当『1』乘进去。",
            content: "已知 x>0，y>0，且 x+y=1，求 1/x + 4/y 的最小值。",
            contentLatex: #"x,y>0,\ x+y=1,\ \ \frac1x+\frac4y\ \text{的最小值}=?"#,
            answer: "最小值为 9",
            difficulty: 0.50, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "用 y=1-x 消元", #"g(x)=\frac1x+\frac4{1-x},\ x\in(0,1)"#),
                skStep(2, "求导找驻点", #"g'(x)=-\frac1{x^2}+\frac4{(1-x)^2}=0\Rightarrow x=\tfrac13"#),
                skStep(3, "代回", #"g\!\left(\tfrac13\right)=3+6=9"#)
            ],
            killSteps: [
                skStep(1, "乘以 (x+y)=1", #"\frac1x+\frac4y=\left(\frac1x+\frac4y\right)(x+y)"#),
                skStep(2, "展开", #"=5+\frac yx+\frac{4x}y"#),
                skStep(3, "均值取等", #"\ge5+2\sqrt{\tfrac yx\cdot\tfrac{4x}y}=5+4=9"#)
            ],
            stdKey: "消元求导能做，但要解方程、验证极小。",
            killKey: "把 x+y=1 当『1』乘进原式，展开出 y/x+4x/y 用均值压到定值，取等 y=2x 即 x=1/3,y=2/3。",
            mistakes: ["乘的是 (x+y) 不是别的数", "y/x·4x/y=4，根号得 2，故 2·2=4", "取等需 y/x=4x/y，即 y=2x"],
            type: .multipleChoice,
            options: ["9", "8", "6", "5"]
        ),

        // 62 ── 基本不等式：凑配后取等
        skCase(
            id: "sk_062", weapon: .amgmTrick,
            title: "x+4/(x−1)，先借出一个 1 再凑积定",
            source: "基本不等式 · 凑配（高考选填）",
            standardMinutes: 4, killSeconds: 22,
            signal: "分母是 x−1，就把分子拆出 (x−1)，凑成积为定值。",
            content: "已知 x>1，求 x + 4/(x-1) 的最小值。",
            contentLatex: #"x>1,\ \ x+\frac4{x-1}\ \text{的最小值}=?"#,
            answer: "最小值为 5",
            difficulty: 0.46, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "求导", #"f'(x)=1-\frac4{(x-1)^2}"#),
                skStep(2, "令导数为 0", #"(x-1)^2=4\Rightarrow x=3\ (x>1)"#),
                skStep(3, "代回", #"f(3)=3+2=5"#)
            ],
            killSteps: [
                skStep(1, "拆出 (x−1) 凑配", #"x+\frac4{x-1}=(x-1)+\frac4{x-1}+1"#),
                skStep(2, "前两项积为定值 4，均值", #"(x-1)+\frac4{x-1}\ge2\sqrt4=4"#),
                skStep(3, "加上 1", #"\ge4+1=5,\ \text{取等}\ x-1=2,\ x=3"#)
            ],
            stdKey: "求导也快，但凑配法连取等点一起给出。",
            killKey: "把 x 写成 (x−1)+1，让 (x−1) 与 4/(x−1) 积为常数 4，均值得 4，再补回那个 1。",
            mistakes: ["必须凑出积为定值才能用均值", "x>1 保证 x−1>0", "别忘了补回拆出的 +1"],
            type: .multipleChoice,
            options: ["5", "4", "6", "3"]
        ),

        // 63 ── 坐标化：正方形对角线点乘
        skCase(
            id: "sk_063", weapon: .coordinateMethod,
            title: "正方形里建系，AC·BD 一算就是 0",
            source: "平面向量 · 建系求点乘（高考选填）",
            standardMinutes: 4, killSeconds: 18,
            signal: "正方形/矩形里求向量点乘——建直角系赋坐标，公式直算。",
            content: "正方形 ABCD 的边长为 1，求向量 AC 与 BD 的数量积 AC·BD。",
            contentLatex: #"\text{正方形}\ ABCD,\ \text{边长}1,\ \ \vec{AC}\cdot\vec{BD}=?"#,
            answer: "AC·BD = 0",
            difficulty: 0.40, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "用基底 AB、AD 表示", #"\vec{AC}=\vec{AB}+\vec{AD},\ \vec{BD}=\vec{AD}-\vec{AB}"#),
                skStep(2, "点乘展开（AB⊥AD）", #"(\vec{AB}+\vec{AD})\cdot(\vec{AD}-\vec{AB})=|\vec{AD}|^2-|\vec{AB}|^2"#),
                skStep(3, "等边相消", #"=1-1=0"#)
            ],
            killSteps: [
                skStep(1, "建系赋坐标", #"A(0,0),B(1,0),C(1,1),D(0,1)"#),
                skStep(2, "写出两向量", #"\vec{AC}=(1,1),\ \vec{BD}=(-1,1)"#),
                skStep(3, "坐标点乘", #"(1)(-1)+(1)(1)=0"#)
            ],
            stdKey: "基底法要小心 BD=AD−AB 的方向和平方差。",
            killKey: "正方形顶点直接给坐标，AC=(1,1)、BD=(−1,1)，点乘 x₁x₂+y₁y₂=−1+1=0（对角线本就垂直）。",
            mistakes: ["BD 从 B 指向 D：D−B=(−1,1)", "点乘是对应分量乘积之和", "坐标按 A,B,C,D 逆时针赋值"],
            type: .multipleChoice,
            options: ["0", "1", "−1", "2"]
        ),

        // 64 ── 坐标化：等边三角形向量和的模
        skCase(
            id: "sk_064", weapon: .coordinateMethod,
            title: "等边三角形建系，|AB+AC| 直接量出 2√3",
            source: "平面向量 · 建系求模长（高考选填）",
            standardMinutes: 4, killSeconds: 20,
            signal: "等边三角形里求向量和的模——建系赋坐标，模长公式直算。",
            content: "等边三角形 ABC 的边长为 2，求 |AB + AC|（向量 AB 与 AC 之和的模）。",
            contentLatex: #"\text{等边}\triangle ABC,\ \text{边长}2,\ \ |\vec{AB}+\vec{AC}|=?"#,
            answer: "|AB+AC| = 2√3",
            difficulty: 0.44, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "模长平方展开", #"|\vec{AB}+\vec{AC}|^2=|\vec{AB}|^2+2\vec{AB}\cdot\vec{AC}+|\vec{AC}|^2"#),
                skStep(2, "代入夹角 60°", #"=4+2\cdot2\cdot2\cos60^\circ+4=4+4+4=12"#),
                skStep(3, "开方", #"|\vec{AB}+\vec{AC}|=2\sqrt3"#)
            ],
            killSteps: [
                skStep(1, "建系赋坐标", #"A(0,0),B(2,0),C(1,\sqrt3)"#),
                skStep(2, "向量相加", #"\vec{AB}+\vec{AC}=(2,0)+(1,\sqrt3)=(3,\sqrt3)"#),
                skStep(3, "模长公式", #"\sqrt{3^2+(\sqrt3)^2}=\sqrt{12}=2\sqrt3"#)
            ],
            stdKey: "数量积法要记 |a+b|²公式与夹角 60°。",
            killKey: "把 A 放原点、B 放 x 轴，C=(1,√3)，两向量相加得 (3,√3)，模长 √12=2√3，全程纯算术。",
            mistakes: ["等边三角形顶点 C=(1,√3)（高为 √3）", "模长是各分量平方和再开方", "√12=2√3"],
            type: .multipleChoice,
            options: ["2√3", "2", "4", "√3"]
        ),

        // 65 ── 同构法：xeˣ 与 x+lnx+1 凑 e^t≥t+1
        skCase(
            id: "sk_065", weapon: .homomorphism,
            title: "xeˣ≥x+lnx+1，凑 e^t≥t+1 一步证完",
            source: "函数与导数 · 指对同构（高考压轴高频）",
            standardMinutes: 10, killSeconds: 50,
            signal: "eˣ 与 lnx 混在一起，且 xeˣ 可写成 e^{x+lnx}——同构成同一函数。",
            content: "求证：当 x>0 时，xeˣ ≥ x + ln x + 1。",
            contentLatex: #"x>0\ \text{时},\ xe^{x}\ge x+\ln x+1"#,
            answer: "得证（取等 xeˣ=1，即 x+ln x=0）",
            difficulty: 0.78, tier: 5,
            formulaIds: [],
            stdSteps: [
                skStep(1, "构造作差函数", #"h(x)=xe^{x}-x-\ln x-1"#),
                skStep(2, "求导并因式分解", #"h'(x)=(x+1)e^{x}-1-\tfrac1x=(x+1)\!\left(e^{x}-\tfrac1x\right)"#),
                skStep(3, "导数零点仍需虚设", #"x>0:\ x+1>0,\ e^{x}-\tfrac1x\nearrow,\ \exists!\,x_0:\ e^{x_0}=\tfrac1{x_0}"#),
                skStep(4, "整体代入得最小值", #"h(x_0)=1-x_0-\ln x_0-1=-(x_0+\ln x_0)=0\Rightarrow h\ge0"#)
            ],
            killSteps: [
                skStep(1, "凑同构：xeˣ=e^{x+lnx}", #"xe^{x}=e^{\ln x}\cdot e^{x}=e^{x+\ln x},\ \text{令}\ t=x+\ln x"#),
                skStep(2, "两边化为同一函数", #"\text{原式}\iff e^{t}\ge t+1\quad(\text{右边}=x+\ln x+1=t+1)"#),
                skStep(3, "套切线不等式", #"e^{t}\ge t+1\ \text{对一切}\ t\ \text{成立, 得证, 取等}\ t=0"#)
            ],
            stdKey: "构造函数求导后，零点还要虚设 x₀ 整体代换，步骤长。",
            killKey: "看出 xeˣ=e^{x+lnx}，令 t=x+lnx，两边正好变成 eᵗ 与 t+1，直接套 eᵗ≥t+1。",
            mistakes: ["x=e^{ln x} 仅对 x>0 成立", "右边 x+ln x+1 恰是 t+1", "eᵗ≥t+1 取等于 t=0"],
            type: .proof
        ),

        // 66 ── 同构法：含参 a·e^{ax}≥lnx 求 a_min
        skCase(
            id: "sk_066", weapon: .homomorphism,
            title: "a·e^{ax}≥lnx 恒成立，乘个 x 凑 te^t 同构",
            source: "函数与导数 · 同构求参（高考压轴）",
            standardMinutes: 12, killSeconds: 60,
            signal: "两边乘 x 后出现 (ax)e^{ax} 与 (lnx)e^{lnx}——都是 f(t)=teᵗ。",
            content: "已知 a>0，且对任意 x>0 恒有 a·e^{ax} ≥ ln x，求 a 的最小值。",
            contentLatex: #"a>0,\ \forall x>0:\ a\,e^{ax}\ge\ln x,\ \ a_{\min}=?"#,
            answer: "a 的最小值为 1/e",
            difficulty: 0.82, tier: 5,
            formulaIds: [],
            stdSteps: [
                skStep(1, "分离参数困难，转构造", #"\text{直接分离 }a\text{ 不可解，需借助单调性}"#),
                skStep(2, "两边乘 x 整理", #"ax\,e^{ax}\ge x\ln x=\ln x\cdot e^{\ln x}"#),
                skStep(3, "据 f(t)=teᵗ 单调性归结", #"ax\ge\ln x\ (\text{当}\ \ln x>0),\ \text{即}\ a\ge\tfrac{\ln x}{x}"#),
                skStep(4, "求右边最大值", #"\left(\tfrac{\ln x}{x}\right)_{\max}=\tfrac1e\ (x=e)\Rightarrow a\ge\tfrac1e"#)
            ],
            killSteps: [
                skStep(1, "两边乘 x>0 凑同构", #"ax\cdot e^{ax}\ge \ln x\cdot e^{\ln x}"#),
                skStep(2, "f(t)=teᵗ 在 t≥0 递增", #"f(ax)\ge f(\ln x)\Rightarrow ax\ge\ln x\ (\ln x\le0\text{ 时自然成立})"#),
                skStep(3, "分离并取最值", #"a\ge\frac{\ln x}{x}\ \forall x>0\Rightarrow a\ge\max\frac{\ln x}{x}=\frac1e"#)
            ],
            stdKey: "不凑同构就只能死磕双变量，极难分离。",
            killKey: "乘 x 后两边都是 t·eᵗ 形，令 f(t)=teᵗ 用单调性脱壳得 ax≥lnx，再分离参数取 max(lnx/x)=1/e。",
            mistakes: ["乘 x 是为了把右边 xlnx 写成 (lnx)e^{lnx}", "f(t)=teᵗ 在 t≥0 单调递增", "max(lnx/x)=1/e 在 x=e 取得"],
            type: .fillInBlank
        ),

        // 67 ── 参数分离：eˣ≥ax 求 a_max
        skCase(
            id: "sk_067", weapon: .paramSeparation,
            title: "eˣ≥ax 恒成立，参数下台变 a≤eˣ/x",
            source: "函数与导数 · 恒成立求参（高考高频）",
            standardMinutes: 8, killSeconds: 40,
            signal: "含参 eˣ≥ax 恒成立，a 可整体除到一边——分离后求最值。",
            content: "若当 x>0 时，不等式 eˣ ≥ a x 恒成立，求实数 a 的最大值。",
            contentLatex: #"x>0\ \text{时}\ e^{x}\ge ax\ \text{恒成立},\ \ a_{\max}=?"#,
            answer: "a 的最大值为 e",
            difficulty: 0.62, tier: 4,
            formulaIds: [],
            stdSteps: [
                skStep(1, "构造 g(x)=eˣ-ax 讨论 a", #"g(x)=e^{x}-ax,\ g'(x)=e^{x}-a"#),
                skStep(2, "按 a 的正负分类", #"a\le0\ \text{显然成立};\ a>0\ \text{时极小在}\ x=\ln a"#),
                skStep(3, "令极小值≥0", #"g(\ln a)=a-a\ln a\ge0\Rightarrow\ln a\le1\Rightarrow a\le e"#)
            ],
            killSteps: [
                skStep(1, "x>0，两边除以 x 分离参数", #"a\le\frac{e^{x}}{x}"#),
                skStep(2, "求 g(x)=eˣ/x 的最小值", #"g'(x)=\frac{e^{x}(x-1)}{x^{2}},\ x=1\ \text{处最小}"#),
                skStep(3, "代入得界", #"g(1)=e\Rightarrow a\le e,\ a_{\max}=e"#)
            ],
            stdKey: "不分离就要对 a 正负、极值点 x=lna 分类，麻烦。",
            killKey: "除以 x>0 把 a 单独分离，问题变成求 eˣ/x 的最小值（x=1 处 =e），恒成立取 a≤min。",
            mistakes: ["除以 x>0 不变号", "eˣ/x 最小值在 x=1 取 e", "a≤g(x) 恒成立 ⟺ a≤g(x) 最小值"],
            type: .fillInBlank
        ),

        // 68 ── 参数分离：lnx≤ax 求 a_min
        skCase(
            id: "sk_068", weapon: .paramSeparation,
            title: "lnx≤ax 在[1,e]，分离成 a≥lnx/x 求最大",
            source: "函数与导数 · 恒成立求参（高考高频）",
            standardMinutes: 7, killSeconds: 35,
            signal: "含参 lnx≤ax 在闭区间恒成立——除以 x 分离，求 lnx/x 的最大值。",
            content: "若对任意 x∈[1, e]，不等式 ln x ≤ a x 恒成立，求实数 a 的最小值。",
            contentLatex: #"\forall x\in[1,e]:\ \ln x\le ax,\ \ a_{\min}=?"#,
            answer: "a 的最小值为 1/e",
            difficulty: 0.58, tier: 4,
            formulaIds: [],
            stdSteps: [
                skStep(1, "构造 g(x)=lnx-ax", #"g(x)=\ln x-ax\le0\ \text{在}\ [1,e]"#),
                skStep(2, "讨论 a 与单调性", #"g'(x)=\tfrac1x-a,\ \text{按}\ a\ \text{大小分类最大值位置}"#),
                skStep(3, "令最大值≤0解出 a", #"\text{综合得}\ a\ge\tfrac1e"#)
            ],
            killSteps: [
                skStep(1, "x>0，除以 x 分离", #"a\ge\frac{\ln x}{x}"#),
                skStep(2, "求 h(x)=lnx/x 在[1,e]最大", #"h'(x)=\frac{1-\ln x}{x^{2}}\ge0\ \text{在}\ [1,e],\ \text{递增}"#),
                skStep(3, "最大在 x=e", #"h(e)=\frac1e\Rightarrow a\ge\frac1e,\ a_{\min}=\frac1e"#)
            ],
            stdKey: "直接讨论 g(x)=lnx−ax 的最大值要按 a 分好几类。",
            killKey: "除以 x 分离成 a≥lnx/x，在[1,e]上 lnx/x 递增，最大值 h(e)=1/e，恒成立取 a≥max。",
            mistakes: ["[1,e] 上 1−lnx≥0 故 h 递增", "最大值在右端点 x=e 取 1/e", "a≥g(x) 恒成立 ⟺ a≥g(x) 最大值"],
            type: .fillInBlank
        ),

    ]

    private static let secondKillCasesC: [SecondKillCase] = [

        // 69 ── 隐零点：eˣ-lnx>2 虚设零点
        skCase(
            id: "sk_069", weapon: .hiddenZero,
            title: "eˣ-lnx>2，导数零点解不出就虚设它",
            source: "函数与导数 · 虚设零点（高考压轴高频）",
            standardMinutes: 10, killSeconds: 55,
            signal: "f'(x)=eˣ-1/x=0 解不出初等根——设 x₀ 满足它，整体代换。",
            content: "求证：当 x>0 时，eˣ - ln x > 2。",
            contentLatex: #"x>0\ \text{时},\ e^{x}-\ln x>2"#,
            answer: "得证（最小值 = x₀+1/x₀ > 2）",
            difficulty: 0.80, tier: 5,
            formulaIds: [],
            stdSteps: [
                skStep(1, "设 f(x)=eˣ-lnx，求导", #"f'(x)=e^{x}-\tfrac1x"#),
                skStep(2, "证 f' 递增且有唯一零点", #"f'\nearrow,\ f'(\tfrac12)<0,\ f'(1)>0\Rightarrow\exists!\,x_0\in(\tfrac12,1)"#),
                skStep(3, "x₀ 满足", #"e^{x_0}=\tfrac1{x_0}"#),
                skStep(4, "尝试估计最小值 f(x₀)", #"f(x_0)=e^{x_0}-\ln x_0\ \text{需进一步化简}"#)
            ],
            killSteps: [
                skStep(1, "虚设零点 x₀: f'(x₀)=0", #"e^{x_0}=\tfrac1{x_0}\ (x_0\in(\tfrac12,1))"#),
                skStep(2, "取对数得关系", #"x_0=-\ln x_0\Rightarrow\ln x_0=-x_0"#),
                skStep(3, "整体代入最小值", #"f(x_0)=\tfrac1{x_0}-(-x_0)=x_0+\tfrac1{x_0}\ge2,\ x_0\ne1\Rightarrow>2"#)
            ],
            stdKey: "求出零点是奢望，卡在 f(x₀) 化简上。",
            killKey: "设 x₀ 满足 e^{x₀}=1/x₀，取对数得 lnx₀=−x₀，代进 f(x₀) 消去超越项变成 x₀+1/x₀≥2。",
            mistakes: ["e^{x₀}=1/x₀ 取对数得 lnx₀=−x₀", "f(x₀)=1/x₀+x₀ 用均值≥2", "x₀≠1 故严格大于 2"],
            type: .proof
        ),

        // 70 ── 隐零点：最小值落区间（估算）
        skCase(
            id: "sk_070", weapon: .hiddenZero,
            title: "eˣ-lnx 最小值 m 落在哪？虚设零点+单调夹",
            source: "函数与导数 · 虚设零点估值（高考压轴）",
            standardMinutes: 9, killSeconds: 45,
            signal: "最小值用 x₀ 表示成 x₀+1/x₀，再用 x₀ 的范围把 m 夹住。",
            content: "设 f(x)=eˣ - ln x（x>0）的最小值为 m，则 m 的取值范围是（ ）。",
            contentLatex: #"f(x)=e^{x}-\ln x\ \text{的最小值}\ m\in?"#,
            answer: "2 < m < 5/2",
            difficulty: 0.76, tier: 5,
            formulaIds: [],
            stdSteps: [
                skStep(1, "导数零点 x₀ 满足", #"e^{x_0}=\tfrac1{x_0},\ \ln x_0=-x_0"#),
                skStep(2, "最小值化简", #"m=f(x_0)=x_0+\tfrac1{x_0}"#),
                skStep(3, "数值逼近 x₀≈0.567", #"m\approx2.33\ (\text{但需严格区间})"#)
            ],
            killSteps: [
                skStep(1, "虚设零点定范围", #"f'(\tfrac12)<0,\ f'(1)>0\Rightarrow x_0\in(\tfrac12,1)"#),
                skStep(2, "m=x₀+1/x₀，g 在(0,1)递减", #"g(x)=x+\tfrac1x\searrow\ \text{on}\ (0,1)"#),
                skStep(3, "端点代入夹住", #"m=g(x_0)\in(g(1),g(\tfrac12))=(2,\tfrac52)"#)
            ],
            stdKey: "想求精确值要数值解超越方程，选择题没必要。",
            killKey: "m=x₀+1/x₀，而 x₀∈(1/2,1)；g(x)=x+1/x 在(0,1)递减，端点 g(1)=2、g(1/2)=5/2 把 m 夹在 (2, 5/2)。",
            mistakes: ["x₀∈(1/2,1) 由 f'(1/2)<0、f'(1)>0 定", "g(x)=x+1/x 在 (0,1) 递减故大小反夹", "g(1/2)=1/2+2=5/2"],
            type: .multipleChoice,
            options: ["2 < m < 5/2", "5/2 < m < 3", "m = 2", "1 < m < 2"]
        ),

        // 71 ── 点差法：椭圆中点弦斜率
        skCase(
            id: "sk_071", weapon: .pointDifference,
            title: "椭圆中点弦，两点代入一减斜率自己跳出来",
            source: "解析几何 · 中点弦（高考高频）",
            standardMinutes: 7, killSeconds: 30,
            signal: "椭圆给出弦的中点求斜率——两端点代入作差，免联立。",
            content: "椭圆 x²/4 + y²/2 = 1 的一条弦 AB 的中点为 M(1, 1)，求直线 AB 的斜率。",
            contentLatex: #"\frac{x^2}{4}+\frac{y^2}{2}=1,\ \text{弦}\ AB\ \text{中点}\ M(1,1),\ k_{AB}=?"#,
            answer: "斜率 k = -1/2",
            difficulty: 0.56, tier: 4,
            formulaIds: [],
            stdSteps: [
                skStep(1, "设 AB: y=k(x-1)+1 代入椭圆", #"\frac{x^2}{4}+\frac{(k(x-1)+1)^2}{2}=1"#),
                skStep(2, "整理成二次用韦达", #"x_1+x_2=\dots,\ \text{令}\ \frac{x_1+x_2}{2}=1"#),
                skStep(3, "解出 k", #"\text{解方程得}\ k=-\tfrac12"#)
            ],
            killSteps: [
                skStep(1, "A,B 代入椭圆方程相减", #"\frac{x_1^2-x_2^2}{4}+\frac{y_1^2-y_2^2}{2}=0"#),
                skStep(2, "提取中点与斜率", #"\frac{(x_1+x_2)}{4}+\frac{(y_1+y_2)}{2}\cdot k=0"#),
                skStep(3, "代中点 (1,1)", #"\frac{2}{4}+\frac{2}{2}k=0\Rightarrow k=-\tfrac12"#)
            ],
            stdKey: "联立直线椭圆再用韦达，要解含 k 的方程。",
            killKey: "两点代入作差，平方差自动拆出 (x₁+x₂)、(y₁+y₂) 和斜率；中点给 x₁+x₂=2、y₁+y₂=2，一步得 k=−1/2。",
            mistakes: ["相减后除以 (x₁−x₂) 得到斜率 k", "中点坐标提供 x₁+x₂=2、y₁+y₂=2", "公式 k=−b²x₀/(a²y₀)=−2·1/(4·1)"],
            type: .fillInBlank
        ),

        // 72 ── 点差法：抛物线中点弦斜率
        skCase(
            id: "sk_072", weapon: .pointDifference,
            title: "抛物线中点弦，纵坐标和 = 斜率的分母",
            source: "解析几何 · 中点弦（高考高频）",
            standardMinutes: 6, killSeconds: 28,
            signal: "抛物线 y²=4x 给弦中点求斜率——两点代入相减，k=4/(y₁+y₂)。",
            content: "抛物线 y² = 4x 的一条弦 AB 的中点为 (2, 1)，求直线 AB 的斜率。",
            contentLatex: #"y^2=4x,\ \text{弦}\ AB\ \text{中点}\ (2,1),\ k_{AB}=?"#,
            answer: "斜率 k = 2",
            difficulty: 0.52, tier: 4,
            formulaIds: [],
            stdSteps: [
                skStep(1, "设 AB: x=m(y-1)+2 代入", #"y^2=4(m(y-1)+2)"#),
                skStep(2, "二次用韦达定中点", #"y_1+y_2=4m,\ \text{令}=2"#),
                skStep(3, "解出斜率", #"m=\tfrac12\Rightarrow k=\tfrac1m=2"#)
            ],
            killSteps: [
                skStep(1, "A,B 代入 y²=4x 相减", #"y_1^2-y_2^2=4(x_1-x_2)"#),
                skStep(2, "因式分解出斜率", #"(y_1+y_2)(y_1-y_2)=4(x_1-x_2)\Rightarrow k=\frac{4}{y_1+y_2}"#),
                skStep(3, "代中点纵坐标和", #"y_1+y_2=2\Rightarrow k=\frac42=2"#)
            ],
            stdKey: "联立设 x=my+c 再用韦达，绕一圈。",
            killKey: "两点代入 y²=4x 相减，立得 k=4/(y₁+y₂)；中点纵坐标 1 给出 y₁+y₂=2，故 k=2。",
            mistakes: ["抛物线点差得 k=2p/(y₁+y₂)，此处 2p=4", "中点纵坐标 1 对应 y₁+y₂=2", "别把中点横坐标拿来算斜率"],
            type: .fillInBlank
        ),

        // 73 ── 构造函数比大小：e^π 与 π^e
        skCase(
            id: "sk_073", weapon: .constructCompare,
            title: "e^π 与 π^e 谁大？构造 lnx/x 单调一锤定",
            source: "函数 · 构造比大小（高考选填高频）",
            standardMinutes: 6, killSeconds: 25,
            signal: "底与指数互换的幂比大小——取对数化成 lnx/x，比单调。",
            content: "比较 e^π 与 π^e 的大小（e 为自然对数底，π≈3.14）。",
            contentLatex: #"e^{\pi}\ \text{与}\ \pi^{e}\ \text{的大小}=?"#,
            answer: "e^π > π^e",
            difficulty: 0.54, tier: 4,
            formulaIds: [],
            stdSteps: [
                skStep(1, "两边取对数", #"\ln(e^{\pi})=\pi,\ \ln(\pi^{e})=e\ln\pi"#),
                skStep(2, "比较 π 与 e·lnπ", #"\text{即比}\ \frac{\ln e}{e}\ \text{与}\ \frac{\ln\pi}{\pi}"#),
                skStep(3, "数值估算验证", #"\frac1e\approx0.368>\frac{\ln\pi}{\pi}\approx0.364"#)
            ],
            killSteps: [
                skStep(1, "化成同构造 lnx/x", #"\text{比}\ e^{\pi},\pi^{e}\iff\text{比}\ \frac{\ln e}{e},\frac{\ln\pi}{\pi}"#),
                skStep(2, "f(x)=lnx/x 在 x>e 递减", #"f'(x)=\frac{1-\ln x}{x^{2}}<0\ (x>e)"#),
                skStep(3, "e<π 代入定序", #"f(e)>f(\pi)\Rightarrow\frac1e>\frac{\ln\pi}{\pi}\Rightarrow e^{\pi}>\pi^{e}"#)
            ],
            stdKey: "靠数值估算不严谨，考场也怕算错。",
            killKey: "取对数把两者化成 lne/e 与 lnπ/π，构造 f(x)=lnx/x 在 x>e 递减，e<π 故 f(e)>f(π)，反推 e^π>π^e。",
            mistakes: ["f(x)=lnx/x 在 (e,+∞) 递减", "e<π 都在递减区间，自变量大者函数小", "对数保序：lnA>lnB ⟺ A>B"],
            type: .multipleChoice,
            options: ["e^π > π^e", "e^π < π^e", "e^π = π^e", "无法确定"]
        ),

        // 74 ── 构造函数比大小：三数 lnx/x
        skCase(
            id: "sk_074", weapon: .constructCompare,
            title: "ln3/3、ln4/4、ln5/5 排序，全在递减区间",
            source: "函数 · 构造比大小（高考选填）",
            standardMinutes: 5, killSeconds: 22,
            signal: "三个数都形如 lnx/x，且自变量都大于 e——同一函数比单调。",
            content: "设 a = ln3/3，b = ln4/4，c = ln5/5，比较 a、b、c 的大小。",
            contentLatex: #"a=\frac{\ln3}{3},\ b=\frac{\ln4}{4},\ c=\frac{\ln5}{5},\ \text{大小关系}=?"#,
            answer: "a > b > c",
            difficulty: 0.50, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "通分/估值逐个算", #"a\approx0.366,\ b\approx0.347,\ c\approx0.322"#),
                skStep(2, "比较得序", #"a>b>c"#)
            ],
            killSteps: [
                skStep(1, "三数同形，构造 f(x)=lnx/x", #"a=f(3),\ b=f(4),\ c=f(5)"#),
                skStep(2, "x>e 时 f 递减", #"f'(x)=\frac{1-\ln x}{x^{2}}<0\ (x>e\approx2.72)"#),
                skStep(3, "3<4<5 全在递减段", #"f(3)>f(4)>f(5)\Rightarrow a>b>c"#)
            ],
            stdKey: "逐个取近似值比较，慢且易错。",
            killKey: "三数都是 f(x)=lnx/x 的函数值，3、4、5 全大于 e 落在递减区间，自变量越大值越小，直接 a>b>c。",
            mistakes: ["3、4、5 都大于 e≈2.72，同在递减区间", "递减区间自变量大则函数值小", "构造同一函数是关键"],
            type: .multipleChoice,
            options: ["a > b > c", "c > b > a", "b > a > c", "a > c > b"]
        ),

        // 75 ── 极化恒等式：三角形中线型
        skCase(
            id: "sk_075", weapon: .polarization,
            title: "只给底边和中线，AB·AC 用极化一步出",
            source: "平面向量 · 极化恒等式（高考选填）",
            standardMinutes: 6, killSeconds: 20,
            signal: "三角形给中线长与底边长求 AB·AC——极化中线型 AM²−(BC/2)²。",
            content: "在△ABC 中，BC = 4，BC 边上的中线 AM = 3（M 为 BC 中点），求 AB · AC。",
            contentLatex: #"\triangle ABC,\ BC=4,\ \text{中线}\ AM=3,\ \ \vec{AB}\cdot\vec{AC}=?"#,
            answer: "AB·AC = 5",
            difficulty: 0.52, tier: 4,
            formulaIds: [],
            stdSteps: [
                skStep(1, "用基底 AM、MB 表示", #"\vec{AB}=\vec{AM}+\vec{MB},\ \vec{AC}=\vec{AM}-\vec{MB}"#),
                skStep(2, "点乘展开", #"\vec{AB}\cdot\vec{AC}=|\vec{AM}|^2-|\vec{MB}|^2"#),
                skStep(3, "代入", #"=3^2-2^2=9-4=5"#)
            ],
            killSteps: [
                skStep(1, "极化中线型直接套", #"\vec{AB}\cdot\vec{AC}=AM^{2}-\left(\tfrac{BC}{2}\right)^{2}"#),
                skStep(2, "代入 AM=3、BC=4", #"=9-2^{2}=5"#)
            ],
            stdKey: "基底展开虽不难，但要现推 (AM+MB)(AM−MB)。",
            killKey: "极化中线型 AB·AC=AM²−(BC/2)²，记住公式直接代 9−4=5，秒杀。",
            mistakes: ["BC/2=2，要平方成 4", "M 必须是 BC 的中点才成立", "公式是中线²减半底²"],
            type: .multipleChoice,
            options: ["5", "13", "−5", "7"]
        ),

        // 76 ── 极化恒等式：和差模长型
        skCase(
            id: "sk_076", weapon: .polarization,
            title: "只给 |a+b| 与 |a−b|，点乘=平方差的四分之一",
            source: "平面向量 · 极化恒等式（高考选填）",
            standardMinutes: 5, killSeconds: 18,
            signal: "给 |a+b| 与 |a−b| 求 a·b——极化恒等式 ¼(|a+b|²−|a−b|²)。",
            content: "已知平面向量 a、b 满足 |a + b| = 4，|a − b| = 2，求 a · b。",
            contentLatex: #"|\vec a+\vec b|=4,\ |\vec a-\vec b|=2,\ \ \vec a\cdot\vec b=?"#,
            answer: "a·b = 3",
            difficulty: 0.46, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "两式平方展开", #"|\vec a+\vec b|^2=|\vec a|^2+2\vec a\!\cdot\!\vec b+|\vec b|^2=16"#),
                skStep(2, "另一式", #"|\vec a-\vec b|^2=|\vec a|^2-2\vec a\!\cdot\!\vec b+|\vec b|^2=4"#),
                skStep(3, "相减", #"4\vec a\!\cdot\!\vec b=12\Rightarrow\vec a\!\cdot\!\vec b=3"#)
            ],
            killSteps: [
                skStep(1, "极化恒等式直接套", #"\vec a\cdot\vec b=\tfrac14\!\left(|\vec a+\vec b|^2-|\vec a-\vec b|^2\right)"#),
                skStep(2, "代入", #"=\tfrac14(16-4)=3"#)
            ],
            stdKey: "两次平方再相减也快，但要写两行展开。",
            killKey: "极化恒等式 a·b=¼(|a+b|²−|a−b|²)，直接 ¼(16−4)=3，一行出。",
            mistakes: ["公式系数是 1/4", "先各自平方再相减", "|a+b|²=16、|a−b|²=4"],
            type: .multipleChoice,
            options: ["3", "5", "6", "12"]
        ),

        // 77 ── 必要性探路：相切点定参数
        skCase(
            id: "sk_077", weapon: .necessityProbe,
            title: "eˣ≥ax+1 恒成立，取等点 x=0 处导数相等定 a",
            source: "函数与导数 · 端点效应（高考选填）",
            standardMinutes: 7, killSeconds: 30,
            signal: "x=0 两边都等于 1（取等点）——它是差函数最小值点，导数为 0。",
            content: "若对任意 x∈ℝ，不等式 eˣ ≥ a x + 1 恒成立，求实数 a 的值。",
            contentLatex: #"\forall x\in\mathbb R:\ e^{x}\ge ax+1,\ \ a=?"#,
            answer: "a = 1",
            difficulty: 0.58, tier: 4,
            formulaIds: [],
            stdSteps: [
                skStep(1, "构造 g(x)=eˣ-ax-1", #"g(x)\ge0\ \forall x,\ g(0)=0"#),
                skStep(2, "分类讨论 g 的最小值", #"g'(x)=e^{x}-a,\ \text{按}\ a\le0\ \text{与}\ a>0\ \text{讨论}"#),
                skStep(3, "综合得唯一 a", #"\text{仅}\ a=1\ \text{时恒成立}"#)
            ],
            killSteps: [
                skStep(1, "x=0 取等，是最小值点", #"g(x)=e^{x}-ax-1,\ g(0)=0\ \text{为最小}"#),
                skStep(2, "必要条件 g'(0)=0", #"g'(0)=1-a=0\Rightarrow a=1"#),
                skStep(3, "充分性验证", #"a=1:\ e^{x}\ge x+1\ \text{恒成立}\ \checkmark"#)
            ],
            stdKey: "正面讨论要对 a 的正负分类，绕。",
            killKey: "x=0 处两边都为 1，是差函数 g 的最小值点，必有 g'(0)=0 解出 a=1，再验 eˣ≥x+1 即可。",
            mistakes: ["取等点 x=0 处 g 取最小，故 g'(0)=0", "g'(0)=1−a", "必要性求出后仍要验充分性"],
            type: .fillInBlank
        ),

        // 78 ── 必要性探路：二阶导端点定参数范围
        skCase(
            id: "sk_078", weapon: .necessityProbe,
            title: "ln(1+x)≥x−ax² 恒成立，端点二阶导卡出 a 范围",
            source: "函数与导数 · 端点效应（高考压轴）",
            standardMinutes: 9, killSeconds: 40,
            signal: "x=0 处 g=g'=0（取等点），用 g''(0)≥0 抢出参数必要条件。",
            content: "若当 x≥0 时，不等式 ln(1+x) ≥ x − a x² 恒成立，求实数 a 的最小值。",
            contentLatex: #"x\ge0\ \text{时}\ \ln(1+x)\ge x-ax^{2}\ \text{恒成立},\ \ a_{\min}=?"#,
            answer: "a 的最小值为 1/2",
            difficulty: 0.74, tier: 5,
            formulaIds: [],
            stdSteps: [
                skStep(1, "构造 g(x)=ln(1+x)-x+ax²", #"g(0)=0,\ g(x)\ge0\ \text{在}\ x\ge0"#),
                skStep(2, "逐阶求导分析", #"g'(x)=\tfrac1{1+x}-1+2ax,\ g'(0)=0"#),
                skStep(3, "讨论 a 保证 g≥0", #"\text{综合得}\ a\ge\tfrac12"#)
            ],
            killSteps: [
                skStep(1, "x=0 取等，g(0)=g'(0)=0", #"g(x)=\ln(1+x)-x+ax^{2}"#),
                skStep(2, "必要 g''(0)≥0", #"g''(x)=-\tfrac1{(1+x)^2}+2a,\ g''(0)=-1+2a\ge0\Rightarrow a\ge\tfrac12"#),
                skStep(3, "充分性", #"a=\tfrac12:\ \ln(1+x)\ge x-\tfrac{x^2}2\ \text{成立}\Rightarrow a_{\min}=\tfrac12"#)
            ],
            stdKey: "直接讨论 g≥0 要反复求导分类，路长。",
            killKey: "x=0 是取等点故 g(0)=g'(0)=0，要 g 在 0 附近不下穿就得 g''(0)≥0，即 −1+2a≥0 抢出 a≥1/2。",
            mistakes: ["g''(x)=−1/(1+x)²+2a，g''(0)=−1+2a", "取等点处 g(0)=g'(0)=0 是前提", "必要条件后要补充分性"],
            type: .fillInBlank
        ),

        // 79 ── 数列周期：分式递推求 a_2024
        skCase(
            id: "sk_079", weapon: .sequencePeriod,
            title: "aₙ₊₁=1−1/aₙ，算三项就回头，周期 3",
            source: "数列 · 周期性（高考选填高频）",
            standardMinutes: 5, killSeconds: 22,
            signal: "分式递推 aₙ₊₁=1−1/aₙ——算几项发现循环，对下标取余。",
            content: "数列 {aₙ} 满足 a₁ = 2，aₙ₊₁ = 1 − 1/aₙ，求 a₂₀₂₄。",
            contentLatex: #"a_1=2,\ a_{n+1}=1-\tfrac1{a_n},\ \ a_{2024}=?"#,
            answer: "a₂₀₂₄ = 1/2",
            difficulty: 0.48, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "尝试求通项", #"\text{分式递推通项不易直接求}"#),
                skStep(2, "逐项递推到很后面", #"\text{需要算到第 2024 项, 不现实}"#)
            ],
            killSteps: [
                skStep(1, "算前几项找周期", #"a_1=2,\ a_2=\tfrac12,\ a_3=-1,\ a_4=2=a_1"#),
                skStep(2, "周期为 3", #"a_{n+3}=a_n"#),
                skStep(3, "下标取余", #"2024=3\times674+2\Rightarrow a_{2024}=a_2=\tfrac12"#)
            ],
            stdKey: "想求通项公式做不出，硬递推 2024 项更不可能。",
            killKey: "算 a₁=2、a₂=1/2、a₃=−1、a₄=2 发现周期 3；2024 除以 3 余 2，故 a₂₀₂₄=a₂=1/2。",
            mistakes: ["周期是 3（a₄ 回到 a₁）", "2024=3×674+2，余 2 对应 a₂", "项号从 a₁ 起算"],
            type: .multipleChoice,
            options: ["1/2", "2", "−1", "1"]
        ),

        // 80 ── 数列周期：二阶递推求前2024项和
        skCase(
            id: "sk_080", weapon: .sequencePeriod,
            title: "aₙ₊₂=aₙ₊₁−aₙ，周期 6 且一圈和为 0",
            source: "数列 · 周期求和（高考选填）",
            standardMinutes: 6, killSeconds: 28,
            signal: "二阶递推 aₙ₊₂=aₙ₊₁−aₙ——周期 6，一个周期内的和为 0。",
            content: "数列 {aₙ} 满足 a₁ = 1，a₂ = 2，aₙ₊₂ = aₙ₊₁ − aₙ，求前 2024 项之和 S₂₀₂₄。",
            contentLatex: #"a_1=1,\ a_2=2,\ a_{n+2}=a_{n+1}-a_n,\ \ S_{2024}=?"#,
            answer: "S₂₀₂₄ = 3",
            difficulty: 0.54, tier: 4,
            formulaIds: [],
            stdSteps: [
                skStep(1, "特征根法求通项", #"x^2=x-1\ \text{复根, 通项含三角, 繁琐}"#),
                skStep(2, "再求和", #"\text{对复数通项求和极易出错}"#)
            ],
            killSteps: [
                skStep(1, "算一个周期的项", #"1,2,1,-1,-2,-1,\ \underbrace{1,2}_{=a_1,a_2}\Rightarrow T=6"#),
                skStep(2, "一周期和为 0", #"1+2+1-1-2-1=0"#),
                skStep(3, "2024=6×337+2", #"S_{2024}=337\times0+(a_1+a_2)=0+3=3"#)
            ],
            stdKey: "特征方程是复根，通项带三角函数，求和极麻烦。",
            killKey: "递推算出周期 6，一个周期六项之和为 0；2024=6×337+2，余下 a₁+a₂=3，故 S₂₀₂₄=3。",
            mistakes: ["周期为 6（a₇=a₁,a₈=a₂）", "一周期六项和=0", "余数 2 补加 a₁+a₂=1+2=3"],
            type: .fillInBlank
        ),

        // 81 ── 裂项相消：1/[k(k+1)]
        skCase(
            id: "sk_081", weapon: .telescoping,
            title: "1/[k(k+1)] 求和，拆成 1/k−1/(k+1) 首尾对消",
            source: "数列 · 裂项求和（高考高频）",
            standardMinutes: 6, killSeconds: 25,
            signal: "通项是相邻整数之积的倒数 1/[k(k+1)]——拆成两项差，望远镜相消。",
            content: "求和 Sₙ = 1/(1·2) + 1/(2·3) + … + 1/[n(n+1)]。",
            contentLatex: #"S_n=\sum_{k=1}^{n}\frac1{k(k+1)}=?"#,
            answer: "Sₙ = n/(n+1)",
            difficulty: 0.46, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "算前几项找规律", #"S_1=\tfrac12,\ S_2=\tfrac23,\ S_3=\tfrac34"#),
                skStep(2, "猜想并归纳证明", #"\text{猜}\ S_n=\tfrac{n}{n+1},\ \text{再用数学归纳法证}"#)
            ],
            killSteps: [
                skStep(1, "裂项", #"\frac1{k(k+1)}=\frac1k-\frac1{k+1}"#),
                skStep(2, "求和相消", #"S_n=\left(1-\tfrac12\right)+\left(\tfrac12-\tfrac13\right)+\dots+\left(\tfrac1n-\tfrac1{n+1}\right)"#),
                skStep(3, "剩首尾", #"=1-\frac1{n+1}=\frac{n}{n+1}"#)
            ],
            stdKey: "猜规律还要归纳法补证，绕一大圈。",
            killKey: "1/[k(k+1)]=1/k−1/(k+1)，相邻项首尾相消，只剩 1−1/(n+1)。",
            mistakes: ["裂项 1/[k(k+1)]=1/k−1/(k+1)", "相消后剩首项 1 与末项 −1/(n+1)", "通分 1−1/(n+1)=n/(n+1)"],
            type: .fillInBlank
        ),

        // 82 ── 裂项相消：1/[(2k−1)(2k+1)]
        skCase(
            id: "sk_082", weapon: .telescoping,
            title: "奇数积倒数求和，裂项要带 1/2 系数",
            source: "数列 · 裂项求和（高考高频）",
            standardMinutes: 6, killSeconds: 28,
            signal: "分母是相邻奇数之积 (2k−1)(2k+1)——裂项系数为 1/2。",
            content: "求和 Sₙ = 1/(1·3) + 1/(3·5) + … + 1/[(2n−1)(2n+1)]。",
            contentLatex: #"S_n=\sum_{k=1}^{n}\frac1{(2k-1)(2k+1)}=?"#,
            answer: "Sₙ = n/(2n+1)",
            difficulty: 0.50, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "算前几项", #"S_1=\tfrac13,\ S_2=\tfrac25,\ S_3=\tfrac37"#),
                skStep(2, "猜想归纳", #"\text{猜}\ S_n=\tfrac{n}{2n+1}\ \text{再证}"#)
            ],
            killSteps: [
                skStep(1, "裂项（系数 1/2）", #"\frac1{(2k-1)(2k+1)}=\frac12\!\left(\frac1{2k-1}-\frac1{2k+1}\right)"#),
                skStep(2, "求和相消", #"S_n=\frac12\!\left(1-\frac13+\frac13-\dots-\frac1{2n+1}\right)"#),
                skStep(3, "剩首尾", #"=\frac12\!\left(1-\frac1{2n+1}\right)=\frac{n}{2n+1}"#)
            ],
            stdKey: "猜规律 + 归纳，且分母规律不如偶数明显。",
            killKey: "裂成 ½(1/(2k−1)−1/(2k+1))，相消后 ½(1−1/(2n+1))=n/(2n+1)；关键别漏 1/2 系数。",
            mistakes: ["裂项系数是 1/2（分母差为 2）", "相消后剩 ½(1−1/(2n+1))", "化简 ½·2n/(2n+1)=n/(2n+1)"],
            type: .fillInBlank
        ),

        // 83 ── 放缩法：Σ1/k² < 2
        skCase(
            id: "sk_083", weapon: .scaling,
            title: "Σ1/k² 求不出？放缩成 1/(k−1)−1/k 再相消",
            source: "数列 · 放缩证不等式（高考压轴高频）",
            standardMinutes: 9, killSeconds: 45,
            signal: "证 Σ1/k² 的上界，但平方和无法精确求——放缩成可裂项的形式。",
            content: "求证：对任意正整数 n，有 1/1² + 1/2² + … + 1/n² < 2。",
            contentLatex: #"\sum_{k=1}^{n}\frac1{k^{2}}<2"#,
            answer: "得证（和 < 2 − 1/n < 2）",
            difficulty: 0.76, tier: 5,
            formulaIds: [],
            stdSteps: [
                skStep(1, "平方和无封闭初等表达", #"\sum\frac1{k^2}\ \text{无法精确求和}"#),
                skStep(2, "尝试归纳但右边是常数难推", #"\text{直接归纳}\ <2\ \text{递推步不易接}"#)
            ],
            killSteps: [
                skStep(1, "首项留下，k≥2 放缩", #"\frac1{k^{2}}<\frac1{k(k-1)}=\frac1{k-1}-\frac1k\ (k\ge2)"#),
                skStep(2, "求和裂项相消", #"\sum_{k=2}^{n}\frac1{k^2}<\sum_{k=2}^{n}\!\left(\frac1{k-1}-\frac1k\right)=1-\frac1n"#),
                skStep(3, "加回首项", #"\sum_{k=1}^{n}\frac1{k^2}<1+\left(1-\frac1n\right)=2-\frac1n<2"#)
            ],
            stdKey: "平方和没有初等求和公式，硬归纳也难接上。",
            killKey: "把 1/k²（k≥2）放大成 1/[k(k−1)] 再裂项相消，得 <2−1/n；首项 1 单独留。",
            mistakes: ["放缩 1/k²<1/[k(k−1)] 仅对 k≥2", "首项 1/1² 要单独保留", "相消后是 1−1/n，总和 2−1/n<2"],
            type: .proof
        ),

        // 84 ── 放缩法：Σ1/√k 的下界
        skCase(
            id: "sk_084", weapon: .scaling,
            title: "Σ1/√k 下界，分母有理化放成 √ 的差",
            source: "数列 · 放缩证不等式（高考压轴）",
            standardMinutes: 9, killSeconds: 45,
            signal: "证 Σ1/√k 的下界——把 1/√k 缩小成 2(√(k+1)−√k) 再相消。",
            content: "求证：对任意正整数 n，有 1/√1 + 1/√2 + … + 1/√n > 2(√(n+1) − 1)。",
            contentLatex: #"\sum_{k=1}^{n}\frac1{\sqrt k}>2\left(\sqrt{n+1}-1\right)"#,
            answer: "得证",
            difficulty: 0.78, tier: 5,
            formulaIds: [],
            stdSteps: [
                skStep(1, "根式和无封闭式", #"\sum\frac1{\sqrt k}\ \text{无法精确求}"#),
                skStep(2, "归纳右边带根号难处理", #"\text{递推步要比较}\ \sqrt{n+2}\ \text{等, 繁琐}"#)
            ],
            killSteps: [
                skStep(1, "缩小并有理化", #"\frac1{\sqrt k}>\frac2{\sqrt k+\sqrt{k+1}}=2\left(\sqrt{k+1}-\sqrt k\right)"#),
                skStep(2, "求和相消", #"\sum_{k=1}^{n}\frac1{\sqrt k}>2\sum_{k=1}^{n}\!\left(\sqrt{k+1}-\sqrt k\right)"#),
                skStep(3, "望远镜相消", #"=2\left(\sqrt{n+1}-1\right)"#)
            ],
            stdKey: "根式和无公式，归纳法处理 √ 既繁又易错。",
            killKey: "1/√k 缩成 2(√(k+1)−√k)（分母有理化），相消只剩 2(√(n+1)−√1)。",
            mistakes: ["1/√k>2/(√k+√(k+1)) 因 √(k+1)>√k", "有理化得 2(√(k+1)−√k)", "相消后首项 √1=1"],
            type: .proof
        ),

        // 85 ── 设而不求：椭圆弦长
        skCase(
            id: "sk_085", weapon: .conicVieta,
            title: "直线截椭圆求弦长，交点不解，韦达整体代",
            source: "解析几何 · 弦长（高考高频）",
            standardMinutes: 8, killSeconds: 40,
            signal: "直线交椭圆求 |AB|——联立得二次，用 x₁+x₂、x₁x₂ 整体代入。",
            content: "直线 y = x + 1 与椭圆 x²/4 + y²/2 = 1 交于 A、B 两点，求弦长 |AB|。",
            contentLatex: #"y=x+1\ \text{交}\ \frac{x^2}{4}+\frac{y^2}{2}=1\ \text{于}\ A,B,\ |AB|=?"#,
            answer: "|AB| = 4√5/3",
            difficulty: 0.62, tier: 4,
            formulaIds: [],
            stdSteps: [
                skStep(1, "联立解出交点坐标", #"\text{解}\ 3x^2+4x-2=0\ \text{得}\ x=\frac{-2\pm\sqrt{10}}3"#),
                skStep(2, "求两点坐标再算距离", #"\text{代回}\ y,\ \text{两点距离公式, 含根号繁琐}"#)
            ],
            killSteps: [
                skStep(1, "联立得二次（设而不求）", #"\frac{x^2}{4}+\frac{(x+1)^2}{2}=1\Rightarrow 3x^2+4x-2=0,\ \Delta>0"#),
                skStep(2, "韦达整体写出", #"x_1+x_2=-\tfrac43,\ x_1x_2=-\tfrac23"#),
                skStep(3, "弦长公式代入", #"|AB|=\sqrt{1+k^2}\sqrt{(x_1+x_2)^2-4x_1x_2}=\sqrt2\cdot\sqrt{\tfrac{40}9}=\frac{4\sqrt5}3"#)
            ],
            stdKey: "真去解带根号的交点坐标再求距离，又长又易错。",
            killKey: "联立得 3x²+4x−2=0，不解根，用韦达 x₁+x₂、x₁x₂ 直接代弦长公式 |AB|=√(1+k²)·√((x₁+x₂)²−4x₁x₂)。",
            mistakes: ["弦长 |AB|=√(1+k²)|x₁−x₂|", "|x₁−x₂|²=(x₁+x₂)²−4x₁x₂=16/9+8/3=40/9", "先验 Δ>0 保证相交"],
            type: .fillInBlank
        ),

        // 86 ── 设而不求：抛物线焦点弦
        skCase(
            id: "sk_086", weapon: .conicVieta,
            title: "抛物线焦点弦长，|AB|=x₁+x₂+p 一步到",
            source: "解析几何 · 焦点弦（高考高频）",
            standardMinutes: 7, killSeconds: 32,
            signal: "过焦点的弦求长——韦达求 x₁+x₂，焦点弦长 = x₁+x₂+p。",
            content: "过抛物线 y² = 4x 的焦点 F(1, 0) 作斜率为 1 的直线，交抛物线于 A、B，求 |AB|。",
            contentLatex: #"y^2=4x,\ \text{过}\ F(1,0)\ \text{斜率}1\ \text{的弦}\ |AB|=?"#,
            answer: "|AB| = 8",
            difficulty: 0.58, tier: 4,
            formulaIds: [],
            stdSteps: [
                skStep(1, "联立解交点", #"\text{解}\ x^2-6x+1=0\ \text{得}\ x=3\pm2\sqrt2"#),
                skStep(2, "两点距离公式", #"\text{代回求}\ y,\ \text{两点距离, 含根号}"#)
            ],
            killSteps: [
                skStep(1, "联立得二次（设而不求）", #"y=x-1,\ (x-1)^2=4x\Rightarrow x^2-6x+1=0,\ \Delta>0"#),
                skStep(2, "韦达", #"x_1+x_2=6"#),
                skStep(3, "焦点弦长公式", #"|AB|=x_1+x_2+p=6+2=8"#)
            ],
            stdKey: "解出 3±2√2 再两点距离，绕远。",
            killKey: "y²=4x 准线 x=−1，焦半径=x+1，焦点弦 |AB|=(x₁+1)+(x₂+1)=x₁+x₂+2；韦达给 x₁+x₂=6，故 8。",
            mistakes: ["焦点弦 |AB|=x₁+x₂+p，此处 p=2", "联立得 x²−6x+1=0 故 x₁+x₂=6", "用焦半径公式比两点距离快"],
            type: .fillInBlank
        ),

        // 87 ── 数学归纳法：整除
        skCase(
            id: "sk_087", weapon: .induction,
            title: "n³+5n 被 6 整除，奠基+递推两步搞定",
            source: "数列/整除 · 数学归纳法（高考选修）",
            standardMinutes: 8, killSeconds: 45,
            signal: "证对一切正整数 n 的整除命题——归纳法，递推步凑出归纳假设。",
            content: "求证：对任意正整数 n，n³ + 5n 能被 6 整除。",
            contentLatex: #"6\mid (n^{3}+5n),\ \forall n\in\mathbb N^{*}"#,
            answer: "得证",
            difficulty: 0.66, tier: 4,
            formulaIds: [],
            stdSteps: [
                skStep(1, "尝试因式分解", #"n^3+5n=n(n^2+5)=n(n^2-1)+6n=(n-1)n(n+1)+6n"#),
                skStep(2, "说明两部分均被 6 整除", #"\text{连续三整数积被 6 整除}+6n\ \text{被 6 整除}"#)
            ],
            killSteps: [
                skStep(1, "奠基 n=1", #"1+5=6\ \text{能被 6 整除}"#),
                skStep(2, "假设 n=k 成立", #"k^{3}+5k=6m\ (m\in\mathbb Z)"#),
                skStep(3, "递推 n=k+1", #"(k+1)^3+5(k+1)=(k^3+5k)+3k(k+1)+6=6m+3k(k+1)+6"#),
                skStep(4, "凑整除", #"k(k+1)\text{为偶数}\Rightarrow 3k(k+1)\ \text{被 6 整除}\Rightarrow\text{整体被 6 整除}"#)
            ],
            stdKey: "因式分解法也行，但要看出 (n−1)n(n+1)+6n 这一步不直观。",
            killKey: "归纳：n=1 得 6；设 k³+5k=6m，则 (k+1)³+5(k+1) 多出 3k(k+1)+6，而 k(k+1) 偶故被 6 整除。",
            mistakes: ["递推步必须用上归纳假设 k³+5k=6m", "3k(k+1) 中 k(k+1) 为偶，故被 6 整除", "奠基、递推两步缺一不可"],
            type: .proof
        ),

        // 88 ── 数学归纳法：不等式
        skCase(
            id: "sk_088", weapon: .induction,
            title: "2ⁿ>n²（n≥5），递推步用 2k²≥(k+1)²",
            source: "不等式 · 数学归纳法（高考选修）",
            standardMinutes: 8, killSeconds: 45,
            signal: "证 2ⁿ 与 n² 的大小对 n≥5 成立——归纳，递推用假设翻倍。",
            content: "求证：当 n ≥ 5（n 为正整数）时，2ⁿ > n²。",
            contentLatex: #"n\ge5\ \text{时},\ 2^{n}>n^{2}"#,
            answer: "得证",
            difficulty: 0.70, tier: 4,
            formulaIds: [],
            stdSteps: [
                skStep(1, "作差构造函数估计", #"\text{令}\ f(x)=2^{x}-x^{2},\ \text{讨论导数与单调, 较繁}"#),
                skStep(2, "需说明 x≥5 后恒正", #"\text{连续化处理对整数命题略绕}"#)
            ],
            killSteps: [
                skStep(1, "奠基 n=5", #"2^{5}=32>25=5^{2}"#),
                skStep(2, "假设 n=k(k≥5)", #"2^{k}>k^{2}"#),
                skStep(3, "递推 n=k+1", #"2^{k+1}=2\cdot2^{k}>2k^{2}"#),
                skStep(4, "再证 2k²≥(k+1)²", #"2k^2-(k+1)^2=k^2-2k-1>0\ (k\ge5)\Rightarrow 2^{k+1}>(k+1)^2"#)
            ],
            stdKey: "用函数+导数处理整数不等式，要把离散转连续，反而绕。",
            killKey: "归纳：n=5 得 32>25；设 2ᵏ>k²，则 2^{k+1}=2·2ᵏ>2k²，再用 k≥5 时 2k²≥(k+1)² 收口。",
            mistakes: ["奠基从 n=5 起（n<5 不成立）", "递推用假设得 2·2ᵏ>2k²", "补证 k²−2k−1>0 当 k≥5"],
            type: .proof
        ),

        // 89 ── 奇偶构造：ln(√(x²+1)+x) 型
        skCase(
            id: "sk_089", weapon: .oddConstruct,
            title: "f(x)=ln(√(x²+1)+x)+2，剥奇函数 f(5)+f(−5)=4",
            source: "函数 · 奇偶构造（高考选填）",
            standardMinutes: 6, killSeconds: 22,
            signal: "求 f(a)+f(−a)，f 是『奇函数 + 常数』——剥常数答案即 2b。",
            content: "已知 f(x) = ln(√(x²+1) + x) + 2，求 f(5) + f(−5)。",
            contentLatex: #"f(x)=\ln\!\left(\sqrt{x^2+1}+x\right)+2,\ \ f(5)+f(-5)=?"#,
            answer: "f(5) + f(−5) = 4",
            difficulty: 0.50, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "直接代入两点", #"f(5)=\ln(\sqrt{26}+5)+2,\ f(-5)=\ln(\sqrt{26}-5)+2"#),
                skStep(2, "相加并化简对数", #"\ln[(\sqrt{26}+5)(\sqrt{26}-5)]+4=\ln1+4=4"#)
            ],
            killSteps: [
                skStep(1, "剥出常数", #"f(x)=g(x)+2,\ g(x)=\ln\!\left(\sqrt{x^2+1}+x\right)"#),
                skStep(2, "g 为奇函数", #"g(-x)=\ln\!\left(\sqrt{x^2+1}-x\right)=-g(x)\ (\text{两括号积}=1)"#),
                skStep(3, "对称和", #"f(5)+f(-5)=g(5)+g(-5)+4=0+4=4"#)
            ],
            stdKey: "硬代要算 ln 的乘积 (√26+5)(√26−5)=1，多一步。",
            killKey: "f=g+2，g(x)=ln(√(x²+1)+x) 是奇函数（因两共轭括号积为 1），故 f(5)+f(−5)=2×2=4。",
            mistakes: ["(√(x²+1)+x)(√(x²+1)−x)=1 故 g 奇", "f(a)+f(−a)=2b（b 为常数项）", "常数项是 2，答案 2×2=4"],
            type: .fillInBlank
        ),

        // 90 ── 奇偶构造：对称区间最大+最小
        skCase(
            id: "sk_090", weapon: .oddConstruct,
            title: "x³+sinx+1 在[−2,2]，最大+最小=2",
            source: "函数 · 奇偶构造（高考选填）",
            standardMinutes: 6, killSeconds: 22,
            signal: "对称区间求『最大值+最小值』，f 是奇函数加常数——M+m=2b。",
            content: "设 f(x) = x³ + sin x + 1 在区间 [−2, 2] 上的最大值为 M、最小值为 m，求 M + m。",
            contentLatex: #"f(x)=x^3+\sin x+1,\ x\in[-2,2],\ M+m=?"#,
            answer: "M + m = 2",
            difficulty: 0.52, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "求导找极值", #"f'(x)=3x^2+\cos x>0\Rightarrow f\ \text{在}[-2,2]\nearrow"#),
                skStep(2, "端点取最值相加", #"M=f(2),\ m=f(-2),\ M+m=f(2)+f(-2)=2"#)
            ],
            killSteps: [
                skStep(1, "剥常数", #"f(x)=g(x)+1,\ g(x)=x^3+\sin x\ \text{为奇函数}"#),
                skStep(2, "对称区间奇函数最值互为相反", #"g_{\max}+g_{\min}=0"#),
                skStep(3, "加回常数", #"M+m=(g_{\max}+1)+(g_{\min}+1)=2"#)
            ],
            stdKey: "求导判单调再代端点也行，但要确认单调性。",
            killKey: "f=g+1，g=x³+sinx 奇；对称区间上奇函数 g_max+g_min=0，故 M+m=0+2×1=2，与具体区间无关。",
            mistakes: ["g(x)=x³+sinx 是奇函数（常数剥到外面）", "对称区间奇函数 g_max=−g_min", "M+m=2b，b=1"],
            type: .fillInBlank
        ),

        // 91 ── 线性规划：求最大值
        skCase(
            id: "sk_091", weapon: .linearProgramming,
            title: "z=2x+y 最大值，只看三个顶点比一比",
            source: "不等式 · 线性规划（高考选填高频）",
            standardMinutes: 5, killSeconds: 22,
            signal: "线性约束求线性目标最大——最优必在可行域顶点，代入比较。",
            content: "设变量 x、y 满足约束 x + y ≤ 4，x ≥ 1，y ≥ 1，求 z = 2x + y 的最大值。",
            contentLatex: #"\begin{cases}x+y\le4\\x\ge1\\y\ge1\end{cases}\ z=2x+y\ \text{的最大值}=?"#,
            answer: "z 的最大值为 7",
            difficulty: 0.46, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "画可行域", #"\text{三条直线围成三角形}"#),
                skStep(2, "平移目标直线找最优", #"z=2x+y\Rightarrow y=-2x+z,\ \text{截距最大处}"#)
            ],
            killSteps: [
                skStep(1, "求三个顶点", #"(1,1),\ (1,3),\ (3,1)"#),
                skStep(2, "代入目标比较", #"z=2x+y:\ 3,\ 5,\ 7"#),
                skStep(3, "取最大", #"z_{\max}=7\ \text{在}\ (3,1)"#)
            ],
            stdKey: "平移目标直线找最优截距，要画图判断方向。",
            killKey: "线性目标最优必在顶点，三顶点 (1,1),(1,3),(3,1) 代入得 3,5,7，最大 7。",
            mistakes: ["顶点由约束边界两两相交求得", "最优一定在顶点，代入比较即可", "目标值最大对应 (3,1)"],
            type: .multipleChoice,
            options: ["7", "5", "6", "8"]
        ),

        // 92 ── 线性规划：求最小值
        skCase(
            id: "sk_092", weapon: .linearProgramming,
            title: "z=x+2y 最小值，顶点 (1,1) 处取 3",
            source: "不等式 · 线性规划（高考选填）",
            standardMinutes: 5, killSeconds: 22,
            signal: "线性约束求线性目标最小——同样落在可行域顶点。",
            content: "设变量 x、y 满足约束 x ≥ 1，y ≥ x，x + y ≤ 6，求 z = x + 2y 的最小值。",
            contentLatex: #"\begin{cases}x\ge1\\y\ge x\\x+y\le6\end{cases}\ z=x+2y\ \text{的最小值}=?"#,
            answer: "z 的最小值为 3",
            difficulty: 0.50, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "画可行域定形状", #"\text{三直线}\ x=1,\ y=x,\ x+y=6\ \text{围成三角形}"#),
                skStep(2, "平移目标找最小截距", #"y=-\tfrac12x+\tfrac z2"#)
            ],
            killSteps: [
                skStep(1, "求三顶点", #"(1,1),\ (1,5),\ (3,3)"#),
                skStep(2, "代入目标", #"z=x+2y:\ 3,\ 11,\ 9"#),
                skStep(3, "取最小", #"z_{\min}=3\ \text{在}\ (1,1)"#)
            ],
            stdKey: "平移目标直线判最小截距，需小心方向与斜率。",
            killKey: "顶点 (1,1),(1,5),(3,3) 代入 z=x+2y 得 3,11,9，最小 3。",
            mistakes: ["顶点：x=1∩y=x→(1,1)，x=1∩x+y=6→(1,5)，y=x∩x+y=6→(3,3)", "验证顶点满足全部约束", "最小值在 (1,1)"],
            type: .multipleChoice,
            options: ["3", "9", "11", "5"]
        ),

        // 93 ── 基本量法：等差
        skCase(
            id: "sk_093", weapon: .basicQuantity,
            title: "等差只设 a₁、d，两条件两方程一解到底",
            source: "数列 · 基本量法（高考选填高频）",
            standardMinutes: 5, killSeconds: 22,
            signal: "等差数列给两项求另一项——设 a₁、d 列方程组。",
            content: "等差数列 {aₙ} 中，a₃ = 7，a₇ = 15，求 a₁₀。",
            contentLatex: #"\text{等差}\{a_n\},\ a_3=7,\ a_7=15,\ a_{10}=?"#,
            answer: "a₁₀ = 21",
            difficulty: 0.42, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "用等差中项/性质凑", #"a_7-a_3=4d=8\Rightarrow d=2,\ \text{再逐项推}"#),
                skStep(2, "从 a₇ 往后推 3 项", #"a_{10}=a_7+3d=15+6=21"#)
            ],
            killSteps: [
                skStep(1, "设基本量列方程", #"a_1+2d=7,\ a_1+6d=15"#),
                skStep(2, "解出 a₁、d", #"4d=8\Rightarrow d=2,\ a_1=3"#),
                skStep(3, "求目标项", #"a_{10}=a_1+9d=3+18=21"#)
            ],
            stdKey: "用性质凑也快，但换个问法（如求 Sₙ）就需要 a₁、d。",
            killKey: "等差完全由 a₁、d 定，两条件列两方程解出 a₁=3、d=2，任何项任何和都能算。",
            mistakes: ["aₙ=a₁+(n−1)d", "两式相减消 a₁ 求 d", "a₁₀=a₁+9d（不是 10d）"],
            type: .fillInBlank
        ),

        // 94 ── 基本量法：等比
        skCase(
            id: "sk_094", weapon: .basicQuantity,
            title: "等比设 a₁、q，相除先得公比再回代",
            source: "数列 · 基本量法（高考选填高频）",
            standardMinutes: 5, killSeconds: 24,
            signal: "等比数列给两项求另一项——设 a₁、q，两式相除得 q。",
            content: "等比数列 {aₙ} 中，a₂ = 6，a₅ = 48，求 a₄。",
            contentLatex: #"\text{等比}\{a_n\},\ a_2=6,\ a_5=48,\ a_4=?"#,
            answer: "a₄ = 24",
            difficulty: 0.46, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "用等比性质", #"a_5=a_2\cdot q^{3}\Rightarrow q^3=8\Rightarrow q=2"#),
                skStep(2, "逐项推", #"a_4=a_5/q=48/2=24"#)
            ],
            killSteps: [
                skStep(1, "设基本量列方程", #"a_1q=6,\ a_1q^{4}=48"#),
                skStep(2, "相除得公比", #"q^{3}=8\Rightarrow q=2,\ a_1=3"#),
                skStep(3, "求目标项", #"a_4=a_1q^{3}=3\cdot8=24"#)
            ],
            stdKey: "用性质 a₅=a₂q³ 也行，但基本量法对求 a₁、Sₙ 更通用。",
            killKey: "等比由 a₁、q 定，两式相除消 a₁ 得 q³=8→q=2、a₁=3，目标项 a₄=a₁q³=24。",
            mistakes: ["aₙ=a₁qⁿ⁻¹", "两式相除消 a₁ 得 q³（下标差 3）", "留意 q 的取值（本题 q=2 实根）"],
            type: .fillInBlank
        ),

        // 95 ── 复数运算：分式的模
        skCase(
            id: "sk_095", weapon: .complexNumber,
            title: "分式复数的模，分子分母各取模相除",
            source: "复数 · 模的运算（高考选填高频）",
            standardMinutes: 4, killSeconds: 18,
            signal: "求分式复数的模——别先化简，用 |z|=|分子|/|分母|。",
            content: "求复数 z = (3 + 4i)/(1 + i) 的模 |z|。",
            contentLatex: #"z=\frac{3+4i}{1+i},\ \ |z|=?"#,
            answer: "|z| = 5√2/2",
            difficulty: 0.42, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "分母实数化", #"z=\frac{(3+4i)(1-i)}{(1+i)(1-i)}=\frac{7+i}{2}"#),
                skStep(2, "再求模", #"|z|=\frac{\sqrt{49+1}}{2}=\frac{\sqrt{50}}2=\frac{5\sqrt2}2"#)
            ],
            killSteps: [
                skStep(1, "模的商性质", #"|z|=\frac{|3+4i|}{|1+i|}"#),
                skStep(2, "分别求模", #"|3+4i|=5,\ |1+i|=\sqrt2"#),
                skStep(3, "相除", #"|z|=\frac5{\sqrt2}=\frac{5\sqrt2}2"#)
            ],
            stdKey: "先分母实数化再求模，要做复数乘法，绕。",
            killKey: "|z₁/z₂|=|z₁|/|z₂|，直接 |3+4i|=5、|1+i|=√2，相除 5/√2=5√2/2，不必化简。",
            mistakes: ["|z₁/z₂|=|z₁|/|z₂| 模可分配到分式", "|3+4i|=√(9+16)=5", "5/√2 有理化为 5√2/2"],
            type: .multipleChoice,
            options: ["5√2/2", "5", "5/2", "√2"]
        ),

        // 96 ── 复数运算：i 的幂求和
        skCase(
            id: "sk_096", weapon: .complexNumber,
            title: "i+i²+…+i²⁰²⁴，四个一组和为 0",
            source: "复数 · i 的周期（高考选填）",
            standardMinutes: 4, killSeconds: 18,
            signal: "求 i 的连续幂之和——四次一周期，每组和为 0。",
            content: "计算 i + i² + i³ + … + i²⁰²⁴（i 为虚数单位）。",
            contentLatex: #"i+i^2+i^3+\cdots+i^{2024}=?"#,
            answer: "和为 0",
            difficulty: 0.40, tier: 2,
            formulaIds: [],
            stdSteps: [
                skStep(1, "等比数列求和", #"S=\frac{i(1-i^{2024})}{1-i}"#),
                skStep(2, "代 i²⁰²⁴=1 化简", #"i^{2024}=(i^4)^{506}=1\Rightarrow S=\frac{i\cdot0}{1-i}=0"#)
            ],
            killSteps: [
                skStep(1, "i 四次一周期，每组和 0", #"i+i^2+i^3+i^4=i-1-i+1=0"#),
                skStep(2, "数项数分组", #"2024=4\times506\ \text{个完整周期}"#),
                skStep(3, "总和", #"506\times0=0"#)
            ],
            stdKey: "套等比求和公式也行，但要算 i^2024 并处理复数分母。",
            killKey: "i 的幂周期为 4，相邻四项 i+i²+i³+i⁴=0；2024 恰好 506 组，总和 0。",
            mistakes: ["i 周期 4：i,−1,−i,1", "一个周期四项之和为 0", "2024=4×506 整除，无余项"],
            type: .multipleChoice,
            options: ["0", "i", "1", "−1"]
        ),

        // ════════ 立体几何 · 概率统计 · 排列组合（第 4 批扩充）════════

        // 97 ── 法向量法：二面角
        skCase(
            id: "sk_097", weapon: .normalVector,
            title: "二面角不用找垂线，两个法向量点乘一除",
            source: "立体几何 · 二面角（高考解答高频）",
            standardMinutes: 8, killSeconds: 60,
            signal: "正方体里求二面角 A₁-BD-C₁——建系给法向量最稳。",
            content: "正方体 ABCD-A₁B₁C₁D₁ 棱长为 1，求二面角 A₁-BD-C₁ 的余弦值。",
            contentLatex: #"\text{正方体棱长 }1,\ \text{二面角 }A_1\text{-}BD\text{-}C_1\ \text{的余弦}=?"#,
            answer: "1/3",
            difficulty: 0.55, tier: 4,
            formulaIds: [],
            stdSteps: [
                skStep(1, "取 BD 中点 M，作平面角", #"M=\text{BD 中点},\ MA_1\perp BD,\ MC_1\perp BD"#),
                skStep(2, "∠A₁MC₁ 即为二面角", #"MA_1=MC_1=\sqrt{\tfrac12+1}=\tfrac{\sqrt6}{2},\ A_1C_1=\sqrt2"#),
                skStep(3, "余弦定理", #"\cos\angle A_1MC_1=\frac{MA_1^2+MC_1^2-A_1C_1^2}{2\,MA_1\,MC_1}=\frac{\tfrac32+\tfrac32-2}{2\cdot\tfrac32}=\frac13"#)
            ],
            killSteps: [
                skStep(1, "建系赋坐标", #"B(1,0,0),D(0,1,0),A_1(0,0,1),C_1(1,1,1)"#),
                skStep(2, "求两面法向量", #"\vec n_1=(1,1,1)\ (\perp A_1BD),\quad \vec n_2=(1,1,-1)\ (\perp C_1BD)"#),
                skStep(3, "法向量夹角即得", #"\cos\langle\vec n_1,\vec n_2\rangle=\frac{1+1-1}{\sqrt3\cdot\sqrt3}=\frac13"#)
            ],
            stdKey: "定义法：取棱中点 M 作两条垂线得平面角，再用余弦定理——找对垂线是难点。",
            killKey: "建系后两面法向量 (1,1,1) 与 (1,1,−1) 点乘除以模长积，直接得 1/3。",
            mistakes: ["法向量夹角的余弦正负需对照图形判断二面角是锐是钝", "本题二面角为锐角，取正值 1/3"],
            type: .fillInBlank
        ),

        // 98 ── 法向量法：点到平面距离
        skCase(
            id: "sk_098", weapon: .normalVector,
            title: "点到面距离不找垂足，d=|AP·n|/|n| 一步",
            source: "立体几何 · 点面距（高考解答高频）",
            standardMinutes: 9, killSeconds: 50,
            signal: "求 C₁ 到平面 A₁BD 的距离——法向量投影公式秒杀找垂足。",
            content: "正方体 ABCD-A₁B₁C₁D₁ 棱长为 1，求点 C₁ 到平面 A₁BD 的距离。",
            contentLatex: #"\text{正方体棱长 }1,\ C_1\ \text{到平面 }A_1BD\ \text{的距离}=?"#,
            answer: "2√3/3",
            difficulty: 0.58, tier: 4,
            formulaIds: [],
            stdSteps: [
                skStep(1, "等体积法转移", #"V_{C_1\text{-}A_1BD}=V_{A_1\text{-}BDC_1}=\tfrac13"#),
                skStep(2, "求底面积", #"\triangle A_1BD\ \text{为边长}\sqrt2\text{的正三角形},\ S=\tfrac{\sqrt3}{4}(\sqrt2)^2=\tfrac{\sqrt3}{2}"#),
                skStep(3, "由 V=⅓S·d 反解", #"d=\frac{3V}{S}=\frac{3\cdot\tfrac13}{\tfrac{\sqrt3}{2}}=\frac{2}{\sqrt3}=\frac{2\sqrt3}{3}"#)
            ],
            killSteps: [
                skStep(1, "建系，取面法向量", #"\vec n=(1,1,1)\perp\text{平面 }A_1BD,\ \text{过 }B(1,0,0)"#),
                skStep(2, "面内一点指向 C₁", #"\overrightarrow{BC_1}=(0,1,1)"#),
                skStep(3, "投影公式直接得", #"d=\frac{|\overrightarrow{BC_1}\cdot\vec n|}{|\vec n|}=\frac{|0+1+1|}{\sqrt3}=\frac{2\sqrt3}{3}"#)
            ],
            stdKey: "等体积法要算两个体积与三角形面积，再反解 d——步骤多。",
            killKey: "法向量 n=(1,1,1)，面内点到 C₁ 的向量在 n 上的投影长 |BC₁·n|/|n| 即距离。",
            mistakes: ["BP 取面内任一点到目标点的向量即可", "分母是 |n| 不是 |n|²"],
            type: .fillInBlank
        ),

        // 99 ── 外接球：补形成长方体
        skCase(
            id: "sk_099", weapon: .circumSphere,
            title: "三棱锥三棱两两垂直，补成长方体对角线即直径",
            source: "立体几何 · 外接球（高考选填高频）",
            standardMinutes: 7, killSeconds: 35,
            signal: "PA、PB、PC 两两垂直——直接补成长方体，体对角线 = 2R。",
            content: "三棱锥 P-ABC 中，PA、PB、PC 两两垂直，PA=1，PB=2，PC=3，求其外接球的表面积。",
            contentLatex: #"PA,PB,PC\ \text{两两垂直},\ PA=1,PB=2,PC=3,\ S_{球}=?"#,
            answer: "14π",
            difficulty: 0.48, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "设球心坐标列方程", #"P\text{ 为原点},\ A(1,0,0),B(0,2,0),C(0,0,3),\ O(x,y,z)"#),
                skStep(2, "到四顶点距离相等", #"x=\tfrac12,y=1,z=\tfrac32"#),
                skStep(3, "求半径与表面积", #"R^2=\tfrac14+1+\tfrac94=\tfrac{14}{4},\ S=4\pi R^2=14\pi"#)
            ],
            killSteps: [
                skStep(1, "补形：三棱即长方体三棱", #"\text{以 }PA,PB,PC\text{ 为长宽高补成长方体}"#),
                skStep(2, "外接球 = 长方体外接球", #"2R=\sqrt{1^2+2^2+3^2}=\sqrt{14}"#),
                skStep(3, "表面积", #"R^2=\tfrac{14}{4},\ S=4\pi R^2=14\pi"#)
            ],
            stdKey: "设球心坐标、列到四顶点等距方程组求解，再算表面积。",
            killKey: "两两垂直的三棱补成长方体，外接球直径就是体对角线 √14，S=4πR²=14π。",
            mistakes: ["补形条件是三棱两两垂直", "直径=体对角线，半径要再除以 2"],
            type: .multipleChoice,
            options: ["14π", "√14·π", "56π", "28π"]
        ),

        // 100 ── 外接球：侧棱垂直底面，球心定位
        skCase(
            id: "sk_100", weapon: .circumSphere,
            title: "侧棱垂直底面，球心在外心正上方 h=PA/2",
            source: "立体几何 · 外接球（高考选填高频）",
            standardMinutes: 9, killSeconds: 50,
            signal: "PA⊥底面——球心在底面外心正上方，R²=r²+(PA/2)²。",
            content: "三棱锥 P-ABC 中，PA⊥平面 ABC，PA=2，AB=AC，BC=2√3，∠BAC=120°，求其外接球半径。",
            contentLatex: #"PA\perp\text{底},\ PA=2,\ BC=2\sqrt3,\ \angle BAC=120^\circ,\ R=?"#,
            answer: "√5",
            difficulty: 0.60, tier: 4,
            formulaIds: [],
            stdSteps: [
                skStep(1, "底面外接圆半径（正弦定理）", #"2r=\frac{BC}{\sin\angle BAC}=\frac{2\sqrt3}{\sin120^\circ}=4\Rightarrow r=2"#),
                skStep(2, "设球心高 h，列距离相等", #"r^2+h^2=r^2+(PA-h)^2\Rightarrow h=\tfrac{PA}{2}=1"#),
                skStep(3, "求半径", #"R=\sqrt{r^2+h^2}=\sqrt{4+1}=\sqrt5"#)
            ],
            killSteps: [
                skStep(1, "底面外接圆半径", #"2r=\frac{BC}{\sin\angle BAC}=4\Rightarrow r=2"#),
                skStep(2, "球心模型一步套", #"PA\perp\text{底}\Rightarrow R^2=r^2+\Big(\tfrac{PA}{2}\Big)^2"#),
                skStep(3, "代入", #"R^2=4+1=5\Rightarrow R=\sqrt5"#)
            ],
            stdKey: "先用正弦定理求底面外接圆半径 r，再设球心高列方程解出 R。",
            killKey: "侧棱垂直底面时球心在外心正上方且高为 PA/2，R²=r²+(PA/2)²=4+1=5。",
            mistakes: ["BC 对的是 120° 角，正弦定理用 BC/sin∠BAC", "球心高是 PA 的一半，不是 PA"],
            type: .fillInBlank
        ),

        // 101 ── 射影面积法：二面角余弦
        skCase(
            id: "sk_101", weapon: .projectionArea,
            title: "斜面与底面夹角，cosθ=投影面积/原面积",
            source: "立体几何 · 二面角（选填速判）",
            standardMinutes: 7, killSeconds: 40,
            signal: "求截面 AB₁C 与底面的二面角——投影恰为 △ABC，面积比即余弦。",
            content: "正方体 ABCD-A₁B₁C₁D₁ 棱长为 1，求平面 AB₁C 与底面 ABCD 所成二面角的余弦值。",
            contentLatex: #"\text{正方体棱长 }1,\ \text{平面 }AB_1C\ \text{与底面夹角余弦}=?"#,
            answer: "√3/3",
            difficulty: 0.52, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "建系求两面法向量", #"\vec n_1=(1,-1,-1)\ (\perp AB_1C),\ \vec n_2=(0,0,1)\ (\text{底面})"#),
                skStep(2, "法向量夹角", #"\cos=\frac{|\vec n_1\cdot\vec n_2|}{|\vec n_1||\vec n_2|}=\frac{1}{\sqrt3}"#),
                skStep(3, "化简", #"=\frac{\sqrt3}{3}"#)
            ],
            killSteps: [
                skStep(1, "△AB₁C 在底面的投影", #"\text{投影为 }\triangle ABC,\ S'=\tfrac12"#),
                skStep(2, "原三角形面积", #"\triangle AB_1C\ \text{三边 }\sqrt2,\ S=\tfrac{\sqrt3}{4}(\sqrt2)^2=\tfrac{\sqrt3}{2}"#),
                skStep(3, "射影面积公式", #"\cos\theta=\frac{S'}{S}=\frac{\tfrac12}{\tfrac{\sqrt3}{2}}=\frac{\sqrt3}{3}"#)
            ],
            stdKey: "建系求两面法向量再算夹角余弦，需要算法向量。",
            killKey: "斜截面 AB₁C 在底面的投影是 △ABC，cosθ=S投影/S原=(1/2)/(√3/2)=√3/3。",
            mistakes: ["投影面是哪个三角形要看清", "射影面积公式 cosθ=S射影/S原，别倒过来"],
            type: .fillInBlank
        ),

        // 102 ── 射影面积法：正四面体相邻面
        skCase(
            id: "sk_102", weapon: .projectionArea,
            title: "正四面体两面夹角，顶点投影到重心给 1/3",
            source: "立体几何 · 二面角（经典结论）",
            standardMinutes: 8, killSeconds: 45,
            signal: "正四面体侧面与底面夹角——侧面投影到底面是 1/3 的小三角。",
            content: "棱长为 1 的正四面体 ABCD，求侧面 ABD 与底面 ABC 所成二面角的余弦值。",
            contentLatex: #"\text{正四面体棱长 }1,\ \text{面 }ABD\ \text{与面 }ABC\ \text{夹角余弦}=?"#,
            answer: "1/3",
            difficulty: 0.56, tier: 4,
            formulaIds: [],
            stdSteps: [
                skStep(1, "取 AB 中点 M 作平面角", #"DM\perp AB,\ CM\perp AB\Rightarrow \angle DMC\ \text{为二面角}"#),
                skStep(2, "求三边", #"DM=CM=\tfrac{\sqrt3}{2},\ CD=1"#),
                skStep(3, "余弦定理", #"\cos\angle DMC=\frac{\tfrac34+\tfrac34-1}{2\cdot\tfrac34}=\frac13"#)
            ],
            killSteps: [
                skStep(1, "顶点 D 投影到底面重心 O", #"\triangle ABD\ \text{投影为}\triangle ABO,\ O\ \text{为}\triangle ABC\text{重心}"#),
                skStep(2, "重心使投影面积 = 1/3", #"S_{\triangle ABO}=\tfrac13 S_{\triangle ABC}=\tfrac13 S_{\triangle ABD}"#),
                skStep(3, "射影面积公式", #"\cos\theta=\frac{S_{\triangle ABO}}{S_{\triangle ABD}}=\frac13"#)
            ],
            stdKey: "取棱中点作两条中线得平面角 ∠DMC，再余弦定理——要算三条长度。",
            killKey: "顶点 D 投影到底面重心 O，△ABD 的投影 △ABO 面积恰是其 1/3，cosθ=1/3。",
            mistakes: ["正四面体顶点投影落在底面重心", "重心到边距离是顶点到边距离的 1/3"],
            type: .fillInBlank
        ),

    ]

    private static let secondKillCasesD: [SecondKillCase] = [

        // 103 ── 二项分布：期望方差 + 线性变换
        skCase(
            id: "sk_103", weapon: .binomialMoment,
            title: "射击 10 次命中数，E=np、D=np(1−p) 直出",
            source: "概率统计 · 二项分布（高考必考）",
            standardMinutes: 7, killSeconds: 30,
            signal: "独立重复 n 次、每次概率 p——直接套 E=np、D=np(1−p)。",
            content: "射手每次命中概率 0.8，独立射击 10 次，命中次数为 X。求 E(X)、D(X)，及 E(2X+1)、D(2X+1)。",
            contentLatex: #"X\sim B(10,0.8),\ E(X),D(X),E(2X+1),D(2X+1)=?"#,
            answer: "E(X)=8，D(X)=1.6，E(2X+1)=17，D(2X+1)=6.4",
            difficulty: 0.45, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "写出分布列", #"P(X=k)=C_{10}^k0.8^k0.2^{10-k},\ k=0,\dots,10"#),
                skStep(2, "定义求期望（繁）", #"E(X)=\sum_{k=0}^{10}k\,C_{10}^k0.8^k0.2^{10-k}=8"#),
                skStep(3, "再求方差", #"D(X)=E(X^2)-[E(X)]^2=1.6"#)
            ],
            killSteps: [
                skStep(1, "二项分布公式直出", #"E(X)=np=10\times0.8=8,\ D(X)=np(1-p)=10\times0.8\times0.2=1.6"#),
                skStep(2, "线性变换性质", #"E(2X+1)=2E(X)+1=17"#),
                skStep(3, "方差的平方系数", #"D(2X+1)=2^2D(X)=4\times1.6=6.4"#)
            ],
            stdKey: "写整张分布列再按定义 Σk·P 求期望、Σ(k−E)²P 求方差，计算量大。",
            killKey: "X~B(n,p) 直接 E=np=8、D=np(1−p)=1.6；线性变换用 E(aX+b)=aE+b、D(aX+b)=a²D。",
            mistakes: ["方差的系数要平方：D(2X+1)=4D(X)", "常数项 +1 不影响方差"],
            type: .fillInBlank
        ),

        // 104 ── 二项分布：识别有放回模型
        skCase(
            id: "sk_104", weapon: .binomialMoment,
            title: "有放回摸球认出 B(3, 3/5)，期望方差秒得",
            source: "概率统计 · 二项分布识别（高考高频）",
            standardMinutes: 8, killSeconds: 35,
            signal: "有放回、每次概率不变——是二项分布，别去列分布列。",
            content: "袋中有 3 个红球、2 个白球，有放回地摸 3 次，记 X 为摸到红球的次数。求 E(X) 与 D(X)。",
            contentLatex: #"\text{有放回摸 }3\text{ 次},\ p_{红}=\tfrac35,\ E(X),D(X)=?"#,
            answer: "E(X)=9/5，D(X)=18/25",
            difficulty: 0.46, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "逐值算分布列", #"P(X=0)=(\tfrac25)^3,\dots,P(X=3)=(\tfrac35)^3"#),
                skStep(2, "定义求期望", #"E(X)=\sum k\,P(X=k)=\tfrac95"#),
                skStep(3, "定义求方差", #"D(X)=\sum (k-E)^2P(X=k)=\tfrac{18}{25}"#)
            ],
            killSteps: [
                skStep(1, "识别为二项分布", #"\text{有放回}\Rightarrow\text{每次 }p=\tfrac35\text{ 不变},\ X\sim B(3,\tfrac35)"#),
                skStep(2, "期望", #"E(X)=np=3\times\tfrac35=\tfrac95"#),
                skStep(3, "方差", #"D(X)=np(1-p)=3\times\tfrac35\times\tfrac25=\tfrac{18}{25}"#)
            ],
            stdKey: "把 X=0,1,2,3 的概率逐个算出列成分布列，再按定义求期望方差。",
            killKey: "有放回摸球每次红球概率恒为 3/5，X~B(3,3/5)，E=np=9/5、D=np(1−p)=18/25。",
            mistakes: ["有放回才是二项分布；不放回则是超几何分布", "超几何的期望仍 np，但方差公式不同"],
            type: .fillInBlank
        ),

        // 105 ── 全概率公式
        skCase(
            id: "sk_105", weapon: .totalProbability,
            title: "两台机器混产，次品率用全概率一行加完",
            source: "概率统计 · 全概率（新课标）",
            standardMinutes: 6, killSeconds: 35,
            signal: "产品分两种来源、各有次品率——全概率公式拆路径。",
            content: "某车间甲机器生产 60%、次品率 2%，乙机器生产 40%、次品率 3%。从全部产品中随机取一件，求它是次品的概率。",
            contentLatex: #"P(甲)=0.6,P(次|甲)=0.02;\ P(乙)=0.4,P(次|乙)=0.03;\ P(次)=?"#,
            answer: "0.024",
            difficulty: 0.42, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "枚举两条互斥路径", #"\text{甲且次}\ \cup\ \text{乙且次}"#),
                skStep(2, "分别算路径概率", #"P(甲\cap次)=0.6\times0.02=0.012,\ P(乙\cap次)=0.4\times0.03=0.012"#),
                skStep(3, "相加", #"P(次)=0.012+0.012=0.024"#)
            ],
            killSteps: [
                skStep(1, "完备事件组 = 甲、乙", #"\text{甲、乙两两互斥且穷尽全部产品}"#),
                skStep(2, "全概率公式", #"P(次)=P(甲)P(次|甲)+P(乙)P(次|乙)"#),
                skStep(3, "代入", #"=0.6\times0.02+0.4\times0.03=0.024"#)
            ],
            stdKey: "把『次品』按来源拆成两条互斥路径，分别算概率再相加。",
            killKey: "全概率公式 P(次)=ΣP(机器)P(次|机器)=0.6·0.02+0.4·0.03=0.024，一行算完。",
            mistakes: ["前提（甲、乙）必须互斥且穷尽", "条件概率 P(次|甲) 与联合概率 P(甲∩次) 别混"],
            type: .fillInBlank
        ),

        // 106 ── 贝叶斯逆概率
        skCase(
            id: "sk_106", weapon: .totalProbability,
            title: "已知取到次品，反推它来自甲的概率",
            source: "概率统计 · 贝叶斯（新课标）",
            standardMinutes: 7, killSeconds: 40,
            signal: "已知结果反求原因——贝叶斯公式 P(甲|次)=P(甲∩次)/P(次)。",
            content: "条件同上（甲产 60% 次品率 2%，乙产 40% 次品率 3%）。已知取到的一件是次品，求它来自甲机器的概率。",
            contentLatex: #"\text{已知是次品},\ P(甲|次)=?"#,
            answer: "1/2",
            difficulty: 0.50, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "缩小样本空间到『次品』", #"\text{只在次品里看甲的比例}"#),
                skStep(2, "数出两类次品『份额』", #"\text{甲次}=0.012,\ \text{乙次}=0.012,\ \text{合计}=0.024"#),
                skStep(3, "求比例", #"P(甲|次)=\frac{0.012}{0.024}=\frac12"#)
            ],
            killSteps: [
                skStep(1, "贝叶斯公式", #"P(甲|次)=\frac{P(甲)P(次|甲)}{P(次)}"#),
                skStep(2, "分母用全概率", #"P(次)=0.024\ (\text{上题})"#),
                skStep(3, "代入", #"=\frac{0.6\times0.02}{0.024}=\frac{0.012}{0.024}=\frac12"#)
            ],
            stdKey: "在『次品』这个缩小的样本空间里，甲贡献的次品占总次品的比例即为所求。",
            killKey: "贝叶斯 P(甲|次)=P(甲)P(次|甲)/P(次)，分母用全概率得 0.024，结果 1/2。",
            mistakes: ["分母是全概率 P(次)，不是 P(甲)", "P(甲|次) 与 P(次|甲) 方向相反，别用错"],
            type: .fillInBlank
        ),

        // 107 ── 示性变量：匹配期望
        skCase(
            id: "sk_107", weapon: .indicatorExpectation,
            title: "n 人随机抽自己贺卡，期望恰好是 1（与 n 无关）",
            source: "概率统计 · 期望线性性（竞赛/压轴改编）",
            standardMinutes: 10, killSeconds: 45,
            signal: "求『拿到自己东西的人数』期望——示性变量拆开，每人 1/n。",
            content: "n 个人各写一张贺卡放在一起随机重新分发（每人恰得一张），记 X 为拿到自己那张贺卡的人数。求 E(X)。",
            contentLatex: #"n\ \text{人随机分发贺卡},\ X=\text{拿到自己的人数},\ E(X)=?"#,
            answer: "1",
            difficulty: 0.62, tier: 4,
            formulaIds: [],
            stdSteps: [
                skStep(1, "X 的分布与错位排列有关", #"P(X=k)\ \text{含错位数 }D_{n-k},\ \text{推导繁}"#),
                skStep(2, "按定义求和", #"E(X)=\sum_k k\,P(X=k)\ (\text{需错位排列计数})"#),
                skStep(3, "化简才得", #"E(X)=1"#)
            ],
            killSteps: [
                skStep(1, "设示性变量", #"X_i=1\ \text{表示第 }i\text{ 人拿到自己},\ X=\sum_{i=1}^nX_i"#),
                skStep(2, "单个概率", #"E(X_i)=P(X_i=1)=\tfrac1n"#),
                skStep(3, "期望线性性求和", #"E(X)=\sum_{i=1}^nE(X_i)=n\cdot\tfrac1n=1"#)
            ],
            stdKey: "X 的分布列牵涉错位排列计数，按定义求 E(X) 要先求出整张分布列，相当繁。",
            killKey: "拆成示性变量 X=ΣXᵢ，每人拿到自己的概率 1/n，由期望线性性 E(X)=n·(1/n)=1。",
            mistakes: ["示性变量不需独立，期望线性性照样成立", "答案与 n 无关，恒为 1"],
            type: .multipleChoice,
            options: ["1", "1/n", "n", "0"]
        ),

        // 108 ── 示性变量：空盒期望
        skCase(
            id: "sk_108", weapon: .indicatorExpectation,
            title: "4 球随机入 4 盒，空盒数期望 81/64",
            source: "概率统计 · 期望线性性（占用问题）",
            standardMinutes: 9, killSeconds: 45,
            signal: "求空盒个数期望——对每个盒子设示性变量，空概率 (3/4)⁴。",
            content: "将 4 个不同的球随机放入 4 个不同的盒子（每球等可能放入任一盒），记 X 为空盒的个数。求 E(X)。",
            contentLatex: #"4\ \text{球随机入 }4\text{ 盒},\ X=\text{空盒数},\ E(X)=?"#,
            answer: "81/64",
            difficulty: 0.60, tier: 4,
            formulaIds: [],
            stdSteps: [
                skStep(1, "X 取值 0,1,2,3", #"\text{需数各情形的放法（含容斥）}"#),
                skStep(2, "逐一算概率", #"P(X=k)=\frac{C_4^k\cdot(\text{恰 }k\text{ 空的放法})}{4^4}"#),
                skStep(3, "按定义求和", #"E(X)=\sum k\,P(X=k)=\tfrac{81}{64}"#)
            ],
            killSteps: [
                skStep(1, "对每个盒设示性变量", #"X_j=1\ \text{表示第 }j\text{ 盒为空},\ X=\sum_{j=1}^4X_j"#),
                skStep(2, "单盒为空概率", #"E(X_j)=P(X_j=1)=\Big(\tfrac34\Big)^4=\tfrac{81}{256}"#),
                skStep(3, "求和", #"E(X)=4\cdot\tfrac{81}{256}=\tfrac{81}{64}"#)
            ],
            stdKey: "直接求空盒数分布列需要容斥数各情形放法，再按定义求期望，很繁。",
            killKey: "每个盒子为空的概率是 (3/4)⁴=81/256，4 个盒子用示性变量求和 E(X)=4·81/256=81/64。",
            mistakes: ["每球独立等可能落入 4 盒，单盒被避开概率 3/4", "示性变量法不必管盒子之间是否独立"],
            type: .fillInBlank
        ),

        // 109 ── 插空法：女生不相邻
        skCase(
            id: "sk_109", weapon: .insertionGap,
            title: "女生两两不相邻，先排男生再插空",
            source: "排列组合 · 不相邻排列（高考高频）",
            standardMinutes: 6, killSeconds: 30,
            signal: "出现『两两不相邻』——先排其余，再插空。",
            content: "5 个男生和 3 个女生排成一排，要求任何两个女生都不相邻，共有多少种不同的排法？",
            contentLatex: #"5\text{ 男 }3\text{ 女排一排},\ \text{女生两两不相邻},\ \text{排法数}=?"#,
            answer: "14400",
            difficulty: 0.50, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "正面分类极繁", #"\text{按女生具体位置分类，情形众多}"#),
                skStep(2, "或用容斥", #"\text{总}-\text{至少两女相邻}\ (\text{需多次容斥})"#),
                skStep(3, "得", #"=14400"#)
            ],
            killSteps: [
                skStep(1, "先排 5 个男生", #"A_5^5=120,\ \text{形成 }6\text{ 个空位（含两端）}"#),
                skStep(2, "3 女插入不同空位", #"A_6^3=6\times5\times4=120"#),
                skStep(3, "乘法原理", #"120\times120=14400"#)
            ],
            stdKey: "正面按女生位置分类或反面容斥都要处理大量情形，易漏易重。",
            killKey: "先排 5 男（A₅⁵=120）产生 6 个空，3 女插入不同空（A₆³=120），相乘得 14400。",
            mistakes: ["空位包含队伍两端，5 人产生 6 个空", "插空用排列数 A（女生有序）"],
            type: .fillInBlank
        ),

        // 110 ── 插空法：节目插入
        skCase(
            id: "sk_110", weapon: .insertionGap,
            title: "原序固定插 3 个新节目，互不相邻 A₇³=210",
            source: "排列组合 · 不相邻排列（高考改编）",
            standardMinutes: 5, killSeconds: 25,
            signal: "原节目顺序不变、新节目互不相邻——7 个空里插 3 个。",
            content: "一台晚会原有 6 个节目，顺序已定且保持不变。现要插入 3 个新节目，要求任意两个新节目都不相邻，共有多少种插法？",
            contentLatex: #"6\ \text{节目定序},\ \text{插 }3\ \text{新且互不相邻},\ \text{方法数}=?"#,
            answer: "210",
            difficulty: 0.46, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "逐个插入并保持不相邻", #"\text{第一个新节目 7 个位置，之后位置随之变化，易算错}"#),
                skStep(2, "分步累乘", #"\text{需小心每步可用空位数}"#),
                skStep(3, "得", #"=210"#)
            ],
            killSteps: [
                skStep(1, "6 个原节目形成 7 个空", #"\text{含首尾共 }6+1=7\text{ 个空位}"#),
                skStep(2, "3 个新节目插入不同空", #"A_7^3=7\times6\times5=210"#),
                skStep(3, "结论", #"=210"#)
            ],
            stdKey: "逐个插入时每步可用空位数在变，直接累乘容易数错。",
            killKey: "6 个定序节目形成 7 个空位，3 个新节目插入不同空位 A₇³=7·6·5=210。",
            mistakes: ["原节目顺序固定，不再乘 6! ", "n 个元素形成 n+1 个空位（含两端）"],
            type: .fillInBlank
        ),

        // 111 ── 捆绑法：女生相邻
        skCase(
            id: "sk_111", weapon: .bundling,
            title: "3 个女生必须相邻，捆成整体再排",
            source: "排列组合 · 相邻排列（高考高频）",
            standardMinutes: 6, killSeconds: 28,
            signal: "出现『必须相邻 / 排在一起』——捆绑成整体。",
            content: "4 个男生和 3 个女生排成一排，要求 3 个女生必须相邻，共有多少种不同的排法？",
            contentLatex: #"4\text{ 男 }3\text{ 女排一排},\ 3\text{ 女相邻},\ \text{排法数}=?"#,
            answer: "720",
            difficulty: 0.46, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "按女生整体所在位置分类", #"\text{女生块可在第 1\sim5 个起始位，逐类讨论}"#),
                skStep(2, "每类再排内部", #"\text{情形多、易遗漏}"#),
                skStep(3, "汇总", #"=720"#)
            ],
            killSteps: [
                skStep(1, "3 女捆成一个整体", #"\text{内部排列 }A_3^3=6"#),
                skStep(2, "整体与 4 男共 5 个元素排", #"A_5^5=120"#),
                skStep(3, "乘法原理", #"6\times120=720"#)
            ],
            stdKey: "按女生整体的起始位置分类讨论，情形多、容易漏算。",
            killKey: "3 女捆成 1 个整体（内部 3!=6）后与 4 男共 5 个元素全排（5!=120），共 720。",
            mistakes: ["别忘乘整体内部排列 3!", "捆绑后元素总数变为 4+1=5"],
            type: .fillInBlank
        ),

        // 112 ── 捆绑法：三人站一起
        skCase(
            id: "sk_112", weapon: .bundling,
            title: "5 人中指定 3 人站一起，3!·3!=36",
            source: "排列组合 · 相邻排列（高考改编）",
            standardMinutes: 5, killSeconds: 25,
            signal: "指定几人『站在一起』——捆成整体，内部再排。",
            content: "甲、乙、丙、丁、戊 5 人排成一排，其中甲、乙、丙 3 人必须站在一起，共有多少种排法？",
            contentLatex: #"5\ \text{人排队},\ \text{甲乙丙相邻},\ \text{排法数}=?"#,
            answer: "36",
            difficulty: 0.42, tier: 2,
            formulaIds: [],
            stdSteps: [
                skStep(1, "枚举三人块位置", #"\text{块起始位 }1\sim3,\ \text{逐类排其余}"#),
                skStep(2, "每类乘内部顺序", #"\text{易漏}"#),
                skStep(3, "汇总", #"=36"#)
            ],
            killSteps: [
                skStep(1, "甲乙丙捆成整体", #"\text{内部 }A_3^3=6"#),
                skStep(2, "整体与丁戊共 3 个元素排", #"A_3^3=6"#),
                skStep(3, "相乘", #"6\times6=36"#)
            ],
            stdKey: "按三人块的位置枚举再排其余，情形虽少但仍需小心内部顺序。",
            killKey: "甲乙丙捆成 1 个整体（内部 3!=6），与丁、戊共 3 个元素全排（3!=6），共 36。",
            mistakes: ["捆绑后是 3 个元素全排，不是 5", "内部 3 人仍要全排序"],
            type: .fillInBlank
        ),

        // 113 ── 隔板法：每盒至少 1
        skCase(
            id: "sk_113", weapon: .partition,
            title: "10 个相同球放 3 盒每盒至少 1，C(9,2)=36",
            source: "排列组合 · 隔板法（高考高频）",
            standardMinutes: 6, killSeconds: 25,
            signal: "相同物品分给不同对象、每份至少 1——隔板法。",
            content: "把 10 个完全相同的小球放入 3 个不同的盒子，要求每个盒子至少放 1 个，共有多少种不同的放法？",
            contentLatex: #"10\ \text{个相同球放 }3\ \text{盒，每盒}\ge1,\ \text{放法数}=?"#,
            answer: "36",
            difficulty: 0.44, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "等价于正整数解组数", #"x+y+z=10,\ x,y,z\ge1"#),
                skStep(2, "枚举或分类", #"\text{逐一数 (x,y,z) 组合，繁}"#),
                skStep(3, "得", #"=36"#)
            ],
            killSteps: [
                skStep(1, "10 球排成一排，9 个间隙", #"\circ\,\circ\,\circ\dots\circ\ \Rightarrow\ 9\ \text{个空隙}"#),
                skStep(2, "插 2 块隔板分成 3 份", #"C_9^2"#),
                skStep(3, "求值", #"C_9^2=36"#)
            ],
            stdKey: "等价于方程 x+y+z=10 的正整数解组数，直接枚举费时。",
            killKey: "10 个球的 9 个间隙里插 2 块隔板分成 3 段，C(9,2)=36。",
            mistakes: ["n 个球有 n−1 个间隙", "分成 m 份用 m−1 块隔板"],
            type: .fillInBlank
        ),

        // 114 ── 隔板法：非负整数解（先 +1）
        skCase(
            id: "sk_114", weapon: .partition,
            title: "非负整数解先各加 1，转成隔板 C(10,2)=45",
            source: "排列组合 · 隔板法变形（高考改编）",
            standardMinutes: 6, killSeconds: 30,
            signal: "允许为 0 的整数解——先给每个变量 +1 转成正整数再隔板。",
            content: "求方程 x + y + z = 8 的非负整数解的组数。",
            contentLatex: #"x+y+z=8,\ x,y,z\ge0,\ \text{解的组数}=?"#,
            answer: "45",
            difficulty: 0.48, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "按 x 取值分层", #"x=0,1,\dots,8,\ \text{每层数 }y+z\text{ 的解}"#),
                skStep(2, "逐层求和", #"\sum_{x=0}^8(9-x)=9+8+\dots+1"#),
                skStep(3, "求和", #"=45"#)
            ],
            killSteps: [
                skStep(1, "变量代换去掉『可为 0』", #"x'=x+1,y'=y+1,z'=z+1\Rightarrow x'+y'+z'=11,\ \ge1"#),
                skStep(2, "正整数解用隔板", #"C_{11-1}^{3-1}=C_{10}^2"#),
                skStep(3, "求值", #"C_{10}^2=45"#)
            ],
            stdKey: "按某个变量取值分层、逐层数解再求和，是等差求和但步骤多。",
            killKey: "每个变量 +1 化为 x'+y'+z'=11 的正整数解，隔板 C(10,2)=45。",
            mistakes: ["允许为 0 不能直接隔板，需先 +1 转正整数", "代换后总和变为 8+3=11"],
            type: .fillInBlank
        ),

        // 115 ── 错位重排：4 封信
        skCase(
            id: "sk_115", weapon: .derangement,
            title: "4 封信全放错信封，错位数 D₄=9",
            source: "排列组合 · 错位排列（高考/竞赛高频）",
            standardMinutes: 7, killSeconds: 25,
            signal: "『每封信都不放进对应信封』——全错位，D₄=9。",
            content: "编号 1~4 的 4 封信放入编号 1~4 的 4 个信封，每封信都不放入与其编号相同的信封，共有多少种放法？",
            contentLatex: #"4\ \text{封信全错位},\ D_4=?"#,
            answer: "9",
            difficulty: 0.50, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "容斥原理", #"D_4=4!\Big(1-\tfrac1{1!}+\tfrac1{2!}-\tfrac1{3!}+\tfrac1{4!}\Big)"#),
                skStep(2, "代入计算", #"=24\Big(1-1+\tfrac12-\tfrac16+\tfrac1{24}\Big)"#),
                skStep(3, "化简", #"=24\times\tfrac9{24}=9"#)
            ],
            killSteps: [
                skStep(1, "认出是 4 元错位排列", #"\text{全部不在原位}\Rightarrow D_4"#),
                skStep(2, "套常用值", #"D_1=0,D_2=1,D_3=2,D_4=9"#),
                skStep(3, "结论", #"D_4=9"#)
            ],
            stdKey: "用容斥公式 Dₙ=n!Σ(−1)ᵏ/k! 现算，需仔细处理交错求和。",
            killKey: "4 封信全部放错就是 4 元错位排列，记住常用值 D₄=9，直接报数。",
            mistakes: ["错位排列要求『无一在原位』", "D₄=9，别和 4!=24 混"],
            type: .multipleChoice,
            options: ["9", "6", "12", "44"]
        ),

        // 116 ── 错位重排：5 顶帽子
        skCase(
            id: "sk_116", weapon: .derangement,
            title: "5 人帽子全拿错，递推 D₅=4(D₄+D₃)=44",
            source: "排列组合 · 错位排列（高考/竞赛高频）",
            standardMinutes: 8, killSeconds: 30,
            signal: "『没有人拿到自己的帽子』——5 元全错位 D₅=44。",
            content: "5 个人各有一顶帽子，打乱后重新分配，恰好没有任何人拿到自己原来那顶帽子的分配方法有多少种？",
            contentLatex: #"5\ \text{人帽子全错位},\ D_5=?"#,
            answer: "44",
            difficulty: 0.54, tier: 4,
            formulaIds: [],
            stdSteps: [
                skStep(1, "容斥原理", #"D_5=5!\sum_{k=0}^5\frac{(-1)^k}{k!}"#),
                skStep(2, "代入", #"=120\Big(\tfrac12-\tfrac16+\tfrac1{24}-\tfrac1{120}\Big)"#),
                skStep(3, "化简", #"=120\times\tfrac{44}{120}=44"#)
            ],
            killSteps: [
                skStep(1, "认出 5 元错位排列", #"\text{全拿错}\Rightarrow D_5"#),
                skStep(2, "用递推 Dₙ=(n−1)(Dₙ₋₁+Dₙ₋₂)", #"D_5=4\,(D_4+D_3)=4(9+2)"#),
                skStep(3, "求值", #"=4\times11=44"#)
            ],
            stdKey: "容斥公式现算交错求和，项数多、易算错。",
            killKey: "5 人全拿错即 5 元错位排列，递推 D₅=(5−1)(D₄+D₃)=4·(9+2)=44。",
            mistakes: ["递推系数是 (n−1)：D₅=4(D₄+D₃)", "D₃=2、D₄=9 要记牢"],
            type: .fillInBlank
        ),

        // 117 ── 错位相减法：nqⁿ 型
        skCase(
            id: "sk_117", weapon: .staggeredSum,
            title: "Σ k·(1/2)^(k-1) 错位相减一步出",
            source: "数列 · 等差×等比求和（高考压轴高频）",
            standardMinutes: 8, killSeconds: 50,
            signal: "通项含 k·(1/2)^(k−1)——等差×等比，错位相减。",
            content: "数列 {aₙ} 中 aₙ = n·(1/2)^(n−1)，求前 n 项和 Sₙ。",
            contentLatex: #"a_n=n\cdot\!\left(\tfrac12\right)^{n-1},\quad S_n=?"#,
            answer: "Sₙ = 4 − (n+2)·(1/2)^(n−1)",
            difficulty: 0.62, tier: 4,
            formulaIds: [],
            stdSteps: [
                skStep(1, "展开 Sₙ", #"S_n=1+2\cdot\tfrac12+3\cdot\tfrac14+\cdots+n\cdot\!\left(\tfrac12\right)^{n-1}"#),
                skStep(2, "乘公比 (1/2) 得 (1/2)Sₙ", #"\tfrac12 S_n=1\cdot\tfrac12+2\cdot\tfrac14+\cdots+(n-1)\!\left(\tfrac12\right)^{n-1}+n\!\left(\tfrac12\right)^n"#),
                skStep(3, "相减消项", #"S_n-\tfrac12 S_n=1+\tfrac12+\tfrac14+\cdots+\!\left(\tfrac12\right)^{n-1}-n\!\left(\tfrac12\right)^n"#),
                skStep(4, "等比求和", #"\tfrac12 S_n=\frac{1-(1/2)^n}{1-1/2}-n\!\left(\tfrac12\right)^n=2\!\left(1-\!\left(\tfrac12\right)^n\right)-n\!\left(\tfrac12\right)^n"#),
                skStep(5, "整理", #"S_n=4-(n+2)\!\left(\tfrac12\right)^{n-1}"#)
            ],
            killSteps: [
                skStep(1, "令 T=(1/2)·Sₙ 错位", #"\text{Sₙ 各项乘 (1/2) 后指数+1，与 Sₙ 相差一位}"#),
                skStep(2, "做差 Sₙ−T", #"\tfrac12 S_n=\text{首项}+(1/2+1/4+\cdots)-n\!\left(\tfrac12\right)^n"#),
                skStep(3, "等比求和后×2", #"S_n=4-(n+2)\!\left(\tfrac12\right)^{n-1}"#)
            ],
            stdKey: "错位相减标准步骤，关键在乘公比对齐下标后相减。",
            killKey: "认出等差×等比结构即套错位相减，所有步骤机械化，不依赖凑配。",
            mistakes: ["末项系数对齐：T 多一项 n·(1/2)^n", "最后乘 2 还原 Sₙ 不能忘"]
        ),

        // 118 ── 错位相减法：(2n-1)·3ⁿ
        skCase(
            id: "sk_118", weapon: .staggeredSum,
            title: "(2n−1)·3ⁿ 求和，错位相减秒定",
            source: "数列 · 等差×等比（高考/模拟高频）",
            standardMinutes: 9, killSeconds: 55,
            signal: "通项 (2n−1)·3ⁿ——等差×等比，公比 q=3。",
            content: "数列 {aₙ} 的通项 aₙ=(2n−1)·3ⁿ，求前 n 项和 Sₙ。",
            contentLatex: #"a_n=(2n-1)\cdot 3^n,\quad S_n=?"#,
            answer: "Sₙ = (n−1)·3^(n+1) + 3",
            difficulty: 0.65, tier: 4,
            formulaIds: [],
            stdSteps: [
                skStep(1, "写出 Sₙ", #"S_n=1\cdot3+3\cdot9+5\cdot27+\cdots+(2n-1)\cdot3^n"#),
                skStep(2, "乘公比 3", #"3S_n=1\cdot9+3\cdot27+\cdots+(2n-3)\cdot3^n+(2n-1)\cdot3^{n+1}"#),
                skStep(3, "相减 Sₙ−3Sₙ=−2Sₙ", #"-2S_n=3+2\cdot9+2\cdot27+\cdots+2\cdot3^n-(2n-1)\cdot3^{n+1}"#),
                skStep(4, "等比求和", #"-2S_n=3+2\cdot\frac{9(3^{n-1}-1)}{2}-(2n-1)3^{n+1}"#),
                skStep(5, "整理", #"S_n=(n-1)\cdot3^{n+1}+3"#)
            ],
            killSteps: [
                skStep(1, "认出结构，令 T=3·Sₙ 错位", #"T\text{ 各项为等差序列偏移一项}"#),
                skStep(2, "做差 Sₙ−T=−2Sₙ，中间变为等比", #"\text{首项 3，中间 Σ 2·3ᵏ，末项 −(2n−1)·3ⁿ⁺¹}"#),
                skStep(3, "等比求和整理", #"S_n=(n-1)\cdot3^{n+1}+3"#)
            ],
            stdKey: "乘公比对齐后做差，中间化为等比数列之和。",
            killKey: "公比 q=3，令 T=3Sₙ，错位做差后中部为等比，套公式即出。",
            mistakes: ["做差符号：Sₙ−3Sₙ=−2Sₙ，最后除以−2", "末项保留 −(2n−1)·3^(n+1)"]
        ),

        // 119 ── 正余弦定理：SSA 解三角形
        skCase(
            id: "sk_119", weapon: .triLaw,
            title: "已知两边一角，正弦定理秒判钝锐",
            source: "三角形 · 正弦定理（高考选填高频）",
            standardMinutes: 6, killSeconds: 35,
            signal: "已知 a、b、A，求 B——正弦定理 sinB=b·sinA/a，再判唯一性。",
            content: "△ABC 中，a=√2，b=1，A=45°，求角 B。",
            contentLatex: #"\triangle ABC:\ a=\sqrt{2},\ b=1,\ A=45°,\ B=?"#,
            answer: "B = 30°",
            difficulty: 0.55, tier: 3,
            formulaIds: ["sine_rule"],
            stdSteps: [
                skStep(1, "正弦定理", #"\frac{a}{\sin A}=\frac{b}{\sin B}"#),
                skStep(2, "解出 sinB", #"\sin B=\frac{b\sin A}{a}=\frac{1\cdot\frac{\sqrt2}{2}}{\sqrt2}=\frac12"#),
                skStep(3, "B=30° 或 150°", #"B=30°\ \text{或}\ 150°"#),
                skStep(4, "排除 150°", #"A+B=45°+150°=195°>180°\ \text{矛盾，故} B=30°"#)
            ],
            killSteps: [
                skStep(1, "正弦定理代入", #"\sin B=\frac{b}{a}\sin A=\frac{1}{\sqrt2}\cdot\frac{\sqrt2}{2}=\frac12"#),
                skStep(2, "B=30° 或 150°，检查 A+B<180°", #"150°+45°>180°\text{，排除}\ B=30°"#)
            ],
            stdKey: "正弦定理出 sinB，须验证大角可能有两解。",
            killKey: "sinB=½→B=30°或150°；45°+150°>180° 立即排除，1步定论。",
            mistakes: ["忘检查钝角情形是否超过 180°", "a、b 与对应角 A、B 对应关系写错"]
        ),

        // 120 ── 正余弦定理：面积公式反求角
        skCase(
            id: "sk_120", weapon: .triLaw,
            title: "面积公式 S=½ab sinC 反求夹角",
            source: "三角形 · 面积公式（高考选填常见）",
            standardMinutes: 5, killSeconds: 25,
            signal: "已知两边与面积，求夹角——S=½ab sinC 直接反解。",
            content: "△ABC 中，b=4，c=3，面积 S=3√3，求角 A（A 为 b、c 的夹角）。",
            contentLatex: #"\triangle ABC:\ b=4,\ c=3,\ S=3\sqrt{3},\ A=?"#,
            answer: "A = 60° 或 120°",
            difficulty: 0.50, tier: 3,
            formulaIds: ["triangle_area"],
            stdSteps: [
                skStep(1, "面积公式", #"S=\tfrac12 bc\sin A"#),
                skStep(2, "代入", #"3\sqrt3=\tfrac12\cdot4\cdot3\cdot\sin A\Rightarrow\sin A=\tfrac{\sqrt3}{2}"#),
                skStep(3, "结论", #"A=60°\ \text{或}\ 120°"#)
            ],
            killSteps: [
                skStep(1, "直接套公式", #"\sin A=\frac{2S}{bc}=\frac{6\sqrt3}{12}=\frac{\sqrt3}{2}"#),
                skStep(2, "两解均合法", #"A=60°\text{ 或 }120°"#)
            ],
            stdKey: "面积公式一步得 sinA，两个角均可能合法时须两个答案。",
            killKey: "S=½bc sinA → sinA=√3/2 → 60°或120°（题目未给其他边长，不能排除）。",
            mistakes: ["A 是 b、c 的夹角，不能随意写成 B 或 C", "两解须都写出"]
        ),

        // 121 ── 待定系数：函数方程
        skCase(
            id: "sk_121", weapon: .undetermined,
            title: "f(x)+f(x−1)=x² 待定系数秒出 f",
            source: "函数 · 函数方程与待定系数（高考/竞赛）",
            standardMinutes: 7, killSeconds: 40,
            signal: "f(x)+f(x−1)=x²——设 f 为二次，比较系数。",
            content: "已知函数 f(x) 满足 f(x) + f(x−1) = x²，且 f 为二次函数，求 f(x)。",
            contentLatex: #"f(x)+f(x-1)=x^2,\ f\text{ 为二次，求 }f(x)"#,
            answer: "f(x) = x(x+1)/2 = (x²+x)/2",
            difficulty: 0.60, tier: 4,
            formulaIds: [],
            stdSteps: [
                skStep(1, "设 f(x)=ax²+bx+c", #"f(x-1)=a(x-1)^2+b(x-1)+c=ax^2-(2a-b)x+(a-b+c)"#),
                skStep(2, "相加", #"(2a)x^2+(-2a+2b+b)x\cdots = x^2\Rightarrow 2a=1"#),
                skStep(3, "比较系数", #"2a=1,\ b+b-2a+b=0\Rightarrow b=\tfrac12,\ c=0"#),
                skStep(4, "结论", #"f(x)=\tfrac{x^2+x}{2}"#)
            ],
            killSteps: [
                skStep(1, "设 f=ax²+bx+c，代入方程", #"(2a)x^2+\cdots=x^2+0x+0"#),
                skStep(2, "比较 x²、x¹、x⁰ 系数", #"a=\tfrac12,\ b=\tfrac12,\ c=0"#),
                skStep(3, "得 f(x)=(x²+x)/2", #"f(x)=\tfrac{x(x+1)}{2}"#)
            ],
            stdKey: "设二次函数代入展开，逐次比较系数列方程组，解出 a、b、c。",
            killKey: "待定系数直接列系数方程：2a=1、(b−2a)+b=0、(a−b+c)+c=0，机械解出。",
            mistakes: ["f(x−1) 展开时 (x−1)² 不要漏 −2x", "c 项要单独比较"]
        ),

        // 122 ── 待定系数：多项式恒等
        skCase(
            id: "sk_122", weapon: .undetermined,
            title: "多项式恒等：比较系数定 A、B、C",
            source: "代数 · 恒等式比较系数（高考选填常见）",
            standardMinutes: 5, killSeconds: 20,
            signal: "x³+px+q 能被 (x−r)² 整除——比较系数。",
            content: "若 x³ + px + q 能被 (x−2)² 整除，求实数 p、q 的值。",
            contentLatex: #"x^3+px+q=(x-2)^2\cdot(x+a),\ \text{求}\ p,q"#,
            answer: "p = −12，q = 16",
            difficulty: 0.52, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "设商式", #"x^3+px+q=(x-2)^2(x+a)"#),
                skStep(2, "展开右边", #"=(x^2-4x+4)(x+a)=x^3+(a-4)x^2+(4-4a)x+4a"#),
                skStep(3, "比较 x² 系数", #"a-4=0\Rightarrow a=4"#),
                skStep(4, "比较 x¹ 系数", #"p=4-4\times4=-12"#),
                skStep(5, "比较常数项", #"q=4\times4=16"#)
            ],
            killSteps: [
                skStep(1, "设 (x−2)²(x+a) 展开比系数", #"x^2\text{ 系数}: a=4"#),
                skStep(2, "直接代入", #"p=4-16=-12,\ q=16"#)
            ],
            stdKey: "展开后逐次比较各次系数，联立方程解出参数。",
            killKey: "比较系数法：x² 项定 a，再逐次代入得 p、q，三步完成。",
            mistakes: ["展开 (x−2)²(x+a) 时 x 项系数为 (4−4a) 而非 −4a", "q=4a 而非 a·(−2)²"]
        ),

        // 123 ── 切点弦：椭圆切线
        skCase(
            id: "sk_123", weapon: .contactChord,
            title: "椭圆切线 T=0 直接写，不必联立",
            source: "解析几何 · 椭圆切线（高考压轴高频）",
            standardMinutes: 7, killSeconds: 30,
            signal: "椭圆上一点的切线——直接写 xx₀/a²+yy₀/b²=1，T=0。",
            content: "椭圆 x²/4+y²/3=1 上点 P(1,3/2) 处的切线方程。",
            contentLatex: #"\text{椭圆}\ \tfrac{x^2}{4}+\tfrac{y^2}{3}=1\ \text{上点}\ P\!\left(1,\tfrac32\right)\text{的切线方程}"#,
            answer: "x/4 + y/2 = 1，即 x + 2y − 4 = 0",
            difficulty: 0.58, tier: 4,
            formulaIds: ["ellipse_tangent"],
            stdSteps: [
                skStep(1, "隐函数求导", #"\tfrac{2x}{4}+\tfrac{2y}{3}\cdot y'=0\Rightarrow y'=-\tfrac{3x}{4y}"#),
                skStep(2, "代入点 P(1,3/2)", #"y'|_P=-\tfrac{3\cdot1}{4\cdot\frac32}=-\tfrac12"#),
                skStep(3, "点斜式", #"y-\tfrac32=-\tfrac12(x-1)\Rightarrow x+2y-4=0"#)
            ],
            killSteps: [
                skStep(1, "T=0 公式直接写", #"\frac{x\cdot1}{4}+\frac{y\cdot\frac32}{3}=1\Rightarrow\frac x4+\frac y2=1"#),
                skStep(2, "整理", #"x+2y-4=0"#)
            ],
            stdKey: "隐函数求导得斜率，再写点斜式——两步求导、一步写方程。",
            killKey: "T=0：把曲线方程 x²/4+y²/3=1 里 x²→xx₀、y²→yy₀，直接得切线，无需求导。",
            mistakes: ["T=0 中 x₀=1、y₀=3/2 须代正确坐标", "验证 P 在椭圆上：1/4+9/4/3=1 ✓"]
        ),

        // 124 ── 切点弦：中点弦方程
        skCase(
            id: "sk_124", weapon: .contactChord,
            title: "中点给定，点差法秒出弦方程",
            source: "解析几何 · 椭圆中点弦（高考压轴经典）",
            standardMinutes: 8, killSeconds: 40,
            signal: "弦的中点已知，点差法求弦所在直线——等价于 T=S 形式。",
            content: "椭圆 3x²+4y²=12 的弦中点为 M(1,1)，求弦所在直线方程。",
            contentLatex: #"3x^2+4y^2=12,\ \text{弦中点}\ M(1,1),\ \text{弦方程}=?"#,
            answer: "3x + 4y − 7 = 0",
            difficulty: 0.62, tier: 4,
            formulaIds: ["point_difference"],
            stdSteps: [
                skStep(1, "设两端点", #"(x_1,y_1),(x_2,y_2)\text{ 在椭圆上}"#),
                skStep(2, "两方程相减", #"3(x_1^2-x_2^2)+4(y_1^2-y_2^2)=0"#),
                skStep(3, "因式分解提斜率", #"\frac{y_1-y_2}{x_1-x_2}=-\frac{3(x_1+x_2)}{4(y_1+y_2)}"#),
                skStep(4, "代中点 (1,1)", #"k=-\frac{3\cdot2}{4\cdot2}=-\frac34"#),
                skStep(5, "点斜式", #"y-1=-\frac34(x-1)\Rightarrow3x+4y-7=0"#)
            ],
            killSteps: [
                skStep(1, "点差法直接写斜率", #"k=-\frac{3x_0}{4y_0}=-\frac34\quad(x_0=1,y_0=1)"#),
                skStep(2, "过中点写方程", #"3(x-1)+4(y-1)=0\Rightarrow3x+4y-7=0"#)
            ],
            stdKey: "联立两端点方程相减，提公因式得斜率，点斜式写方程。",
            killKey: "椭圆 Ax²+By²=C，中点 (x₀,y₀)，弦斜率 k=−Ax₀/(By₀)，代入点斜式一步完成。",
            mistakes: ["分母是 4y₀ 不是 4（已代入 y₀=1）", "最后方程须通分检验"]
        ),

        // 125 ── 鸽巢原理：整除存在性
        skCase(
            id: "sk_125", weapon: .pigeonhole,
            title: "5 个整数中必有 2 个差能被 4 整除",
            source: "组合 · 鸽巢原理（高考/竞赛常见）",
            standardMinutes: 6, killSeconds: 25,
            signal: "5 个整数，4 个余数类——鸽巢原理必有两数同余。",
            content: "任意 5 个整数中，必有两个整数之差能被 4 整除。请证明。",
            contentLatex: #"\text{任意}5\text{个整数，必有两个之差能被}4\text{整除}"#,
            answer: "由鸽巢原理，5 个整数除以 4 的余数只有 0、1、2、3 四类，5>4，必有两数同余，其差被 4 整除。",
            difficulty: 0.58, tier: 4,
            formulaIds: [],
            stdSteps: [
                skStep(1, "分类余数", #"\text{整数除以 4 余数为 }0,1,2,3\text{（共 4 类）}"#),
                skStep(2, "正面枚举", #"\text{5 个数，4 种余数，若每种至多一个则只有 4 个数，矛盾}"#),
                skStep(3, "结论", #"\text{必有两数余数相同，其差}=4k,\ k\in\mathbb{Z}"#)
            ],
            killSteps: [
                skStep(1, "构造 4 个巢（余数类）", #"\{0\},\{1\},\{2\},\{3\}\text{（模 4 的余数）}"#),
                skStep(2, "5 鸽 4 巢，鸽巢原理", #"\text{必有两数在同一巢中，即同余 mod 4}"#),
                skStep(3, "同余差整除", #"a\equiv b\pmod4\Rightarrow 4\mid(a-b)"#)
            ],
            stdKey: "枚举所有余数类，反证或正面推理必有两数同类。",
            killKey: "4 余数类为 4 个巢，5 个整数为 5 只鸽，一句鸽巢原理即证。",
            mistakes: ["大题须写明巢的构造", "『必有』二字来自鸽巢原理，不能只说『可能』"]
        ),

        // 126 ── 鸽巢原理：平面距离
        skCase(
            id: "sk_126", weapon: .pigeonhole,
            title: "单位正方形 5 点必有 2 点距离 ≤ √2/2",
            source: "组合 · 几何鸽巢（竞赛常见）",
            standardMinutes: 8, killSeconds: 30,
            signal: "5 个点在单位正方形内——四等分成 4 个小正方形，鸽巢。",
            content: "单位正方形内（含边界）有 5 个点，证明其中至少有 2 个点之间的距离不超过 √2/2。",
            contentLatex: #"\text{5 点在单位正方形，至少 2 点距离}\le\tfrac{\sqrt2}{2}"#,
            answer: "将正方形四等分为 4 个边长 1/2 的小正方形，5 点放入 4 个小正方形，必有一个小正方形含 2 点，其距离 ≤ 小正方形对角线 = √2/2。",
            difficulty: 0.65, tier: 4,
            formulaIds: [],
            stdSteps: [
                skStep(1, "构造四等分", #"\text{将单位正方形分成 4 个边长 }\tfrac12\text{ 的小正方形}"#),
                skStep(2, "鸽巢", #"5\text{ 点放入 4 个小正方形，由鸽巢原理必有 1 个含}\ge2\text{ 点}"#),
                skStep(3, "最大距离", #"\text{小正方形对角线}=\sqrt{(1/2)^2+(1/2)^2}=\tfrac{\sqrt2}{2}"#),
                skStep(4, "结论", #"\text{该 2 点距离}\le\tfrac{\sqrt2}{2}"#)
            ],
            killSteps: [
                skStep(1, "4 个小正方形=4 巢，5 点=5 鸽", #"\text{必有 1 巢含 2 点}"#),
                skStep(2, "小正方形对角线即最大距离", #"\tfrac{\sqrt2}{2}"#)
            ],
            stdKey: "划分四个小正方形，正式计算对角线长度，给出严格上界。",
            killKey: "『5 点 4 巢』一句定存在，再算对角线 √2/2 即证。",
            mistakes: ["须说明巢的构造（四等分），不能跳过", "含边界：端点在两个小正方形上，归任一均可"]
        ),

        // 127 ── 分组求和：奇偶配对
        skCase(
            id: "sk_127", weapon: .groupedSum,
            title: "aₙ=(−1)ⁿ·n，奇偶配对求 S₂₀",
            source: "数列 · 奇偶配对求和（高考选填高频）",
            standardMinutes: 5, killSeconds: 20,
            signal: "通项含 (−1)ⁿ·n——奇偶项配对，每对之和为常数。",
            content: "数列 aₙ=(−1)ⁿ·n，求 S₂₀。",
            contentLatex: #"a_n=(-1)^n\cdot n,\quad S_{20}=?"#,
            answer: "S₂₀ = 10",
            difficulty: 0.48, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "奇偶项分写", #"\text{奇数项}：a_1=-1,a_3=-3,\ldots\quad\text{偶数项}：a_2=2,a_4=4,\ldots"#),
                skStep(2, "配对", #"a_{2k-1}+a_{2k}=-(2k-1)+2k=1"#),
                skStep(3, "20 项共 10 对", #"S_{20}=10\times1=10"#)
            ],
            killSteps: [
                skStep(1, "配对：a_{2k−1}+a_{2k}=1", #"\text{直接认出}：-( 2k-1)+2k=1"#),
                skStep(2, "S₂₀=10×1=10", #"\text{20 项=10 对，每对和为 1}"#)
            ],
            stdKey: "分奇偶两列分别求等差和后相加。",
            killKey: "相邻两项配对，每对之和为 1，20 项=10 对，直接报 10。",
            mistakes: ["配对下标：(a₁+a₂)+(a₃+a₄)+…而非 a_{2k}+a_{2k+1}", "n 为奇数时须单独加末项"]
        ),

        // 128 ── 分组求和：aₙ=2ⁿ+3n
        skCase(
            id: "sk_128", weapon: .groupedSum,
            title: "aₙ=2ⁿ+3n，拆项分别求和",
            source: "数列 · 分项求和（高考常见）",
            standardMinutes: 5, killSeconds: 18,
            signal: "通项可拆成等比+等差两部分——分别求和后相加。",
            content: "数列 {aₙ} 的通项 aₙ=2ⁿ+3n，求前 n 项和 Sₙ。",
            contentLatex: #"a_n=2^n+3n,\quad S_n=?"#,
            answer: "Sₙ = 2^(n+1) − 2 + 3n(n+1)/2",
            difficulty: 0.44, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "拆分", #"S_n=\sum_{k=1}^n 2^k+\sum_{k=1}^n 3k"#),
                skStep(2, "等比部分", #"\sum_{k=1}^n 2^k=2^{n+1}-2"#),
                skStep(3, "等差部分", #"\sum_{k=1}^n 3k=3\cdot\frac{n(n+1)}{2}"#),
                skStep(4, "合并", #"S_n=2^{n+1}-2+\frac{3n(n+1)}{2}"#)
            ],
            killSteps: [
                skStep(1, "等比和", #"2+4+\cdots+2^n=2(2^n-1)=2^{n+1}-2"#),
                skStep(2, "等差和", #"3(1+2+\cdots+n)=\frac{3n(n+1)}{2}"#),
                skStep(3, "直接合并", #"S_n=2^{n+1}-2+\frac{3n(n+1)}{2}"#)
            ],
            stdKey: "拆分后两部分独立求和，等比公式+等差公式各用一次。",
            killKey: "认出拆项结构即套公式，无需其他技巧，两行完成。",
            mistakes: ["等比首项是 2¹=2，求和结果是 2^(n+1)−2 而非 2^n−1", "3n 系数别漏"]
        ),

        // 129 ── 换底公式：混合底对数化简
        skCase(
            id: "sk_129", weapon: .logChange,
            title: "log₄8 + log₈4，换底公式统一底数",
            source: "对数 · 换底化简（高考选填高频）",
            standardMinutes: 4, killSeconds: 15,
            signal: "不同底对数相加——换底到公共底（2 或 10），再合并。",
            content: "计算 log₄8 + log₈4。",
            contentLatex: #"\log_4 8+\log_8 4=?"#,
            answer: "13/6",
            difficulty: 0.46, tier: 3,
            formulaIds: ["log_change_base"],
            stdSteps: [
                skStep(1, "换底到 2", #"\log_4 8=\frac{\log_2 8}{\log_2 4}=\frac{3}{2}"#),
                skStep(2, "换底", #"\log_8 4=\frac{\log_2 4}{\log_2 8}=\frac{2}{3}"#),
                skStep(3, "相加", #"\frac32+\frac23=\frac{9+4}{6}=\frac{13}{6}"#)
            ],
            killSteps: [
                skStep(1, "认出 4=2²、8=2³", #"\log_4 8=\frac32,\quad\log_8 4=\frac23"#),
                skStep(2, "直接加", #"\frac32+\frac23=\frac{13}{6}"#)
            ],
            stdKey: "两次换底（都换到底 2），分别化简后相加。",
            killKey: "4=2²、8=2³，心算：log₄8=3/2，log₈4=2/3，加起来 13/6。",
            mistakes: ["log₄8=log₂8/log₂4=3/2（分子分母对应正确）", "分数加法通分"]
        ),

        // 130 ── 换底公式：对数不等式
        skCase(
            id: "sk_130", weapon: .logChange,
            title: "log₂x > log₃x，换底比斜率",
            source: "对数 · 不等式（高考选填常见）",
            standardMinutes: 5, killSeconds: 22,
            signal: "两个不同底对数不等式——换底到同一底后比较系数符号。",
            content: "解不等式 log₂x > log₃x（x > 0）。",
            contentLatex: #"\log_2 x>\log_3 x,\quad x>0"#,
            answer: "x > 1（即 x ∈ (1, +∞)）",
            difficulty: 0.54, tier: 3,
            formulaIds: ["log_change_base"],
            stdSteps: [
                skStep(1, "换底到 ln", #"\frac{\ln x}{\ln 2}>\frac{\ln x}{\ln 3}"#),
                skStep(2, "移项", #"\ln x\!\left(\frac{1}{\ln2}-\frac{1}{\ln3}\right)>0"#),
                skStep(3, "符号分析", #"\frac{1}{\ln2}>\frac{1}{\ln3}>0\ (\ln2<\ln3)\Rightarrow\text{括号}>0"#),
                skStep(4, "结论", #"\ln x>0\Rightarrow x>1"#)
            ],
            killSteps: [
                skStep(1, "换底后提取 lnx", #"\ln x\left(\tfrac{1}{\ln2}-\tfrac{1}{\ln3}\right)>0"#),
                skStep(2, "括号正（ln2<ln3），故 lnx>0", #"x>1"#)
            ],
            stdKey: "换底后移项，分析括号的正负决定 lnx 的符号。",
            killKey: "换底提 lnx，括号=1/ln2−1/ln3>0（因 ln2<ln3），故 lnx>0 即 x>1。",
            mistakes: ["换底后是 lnx 乘以括号，不是 lnx 与括号分开讨论", "x>0 定义域不要漏"]
        ),

        // 131 ── 图形数零点：指数=线性
        skCase(
            id: "sk_131", weapon: .zeroCount,
            title: "2ˣ=3−x 几个根？画图一眼看出",
            source: "函数 · 零点个数（高考选填高频）",
            standardMinutes: 4, killSeconds: 15,
            signal: "方程含指数与线性——画 y=2ˣ 和 y=3−x，数交点。",
            content: "方程 2ˣ = 3 − x 有几个实数解？",
            contentLatex: #"2^x=3-x\ \text{有几个实数解}"#,
            answer: "1 个实数解",
            difficulty: 0.46, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "构造 f(x)=2ˣ−3+x", #"f'(x)=2^x\ln2+1>0\text{（严格递增）}"#),
                skStep(2, "确认一零", #"f(0)=-2<0,\ f(2)=3>0\Rightarrow\text{有唯一零点}"#)
            ],
            killSteps: [
                skStep(1, "y=2ˣ（递增凸）与 y=3−x（递减线）", #"\text{一凸一线必有唯一交点}"#),
                skStep(2, "1 个实数解", #"x\approx1\text{（图示显然）}"#)
            ],
            stdKey: "构造差函数证严格单调，再由中间值定理得唯一零点。",
            killKey: "画图：递增凸曲线与递减直线只能有 1 个交点，结论秒出。",
            mistakes: ["填空不需严格证明，但解答题须说明导数正（严格单调）", "确认两侧函数值异号保证存在性"]
        ),

        // 132 ── 图形数零点：对数=kx 根数随 k 变化
        skCase(
            id: "sk_132", weapon: .zeroCount,
            title: "lnx=kx 根的个数，切点为临界 k",
            source: "函数 · 含参零点个数（高考压轴经典）",
            standardMinutes: 8, killSeconds: 45,
            signal: "lnx=kx（k>0），直线 y=kx 与 lnx 的交点数随 k 变化——切点为临界。",
            content: "讨论方程 ln x = kx（k > 0）实数解的个数。",
            contentLatex: #"\ln x=kx,\ k>0,\ \text{讨论实数解个数}"#,
            answer: "0<k<1/e：2个解；k=1/e：1个解；k>1/e：0个解",
            difficulty: 0.72, tier: 5,
            formulaIds: [],
            stdSteps: [
                skStep(1, "设 f(x)=lnx−kx，x>0", #"f'(x)=\tfrac1x-k=0\Rightarrow x=\tfrac1k"#),
                skStep(2, "最大值", #"f\!\left(\tfrac1k\right)=\ln\tfrac1k-1=-\ln k-1"#),
                skStep(3, "讨论最大值符号", #"-\ln k-1>0\Leftrightarrow k<\tfrac1e"#),
                skStep(4, "结论", #"0<k<\tfrac1e:2\text{解};\ k=\tfrac1e:1\text{解};\ k>\tfrac1e:0\text{解}"#)
            ],
            killSteps: [
                skStep(1, "y=kx 与 y=lnx，切点处斜率 k=1/x", #"k=\tfrac1{x_0}\Rightarrow x_0=\tfrac1k,\ y_0=\ln\tfrac1k"#),
                skStep(2, "切线斜率为 k 时 y=kx₀=1", #"切点处 \ln\tfrac1k=1\Rightarrow k=\tfrac1e\text{ 为临界}"#),
                skStep(3, "k<1/e：直线与曲线 2 交点；k>1/e：不相交", #"0"#)
            ],
            stdKey: "f 单峰，最大值符号决定根数，分三段讨论。",
            killKey: "y=kx 切 lnx 时 k=1/e，几何上直接判断：k 小于临界时 2 根，等于 1 根，大于 0 根。",
            mistakes: ["x₀=1/k（导数为 0 解出），不是 x₀=k", "k=1/e 是等号（1个根），须单独列出"]
        ),

        // 133 ── 向量基底：平行四边形
        skCase(
            id: "sk_133", weapon: .vectorBasis,
            title: "平行四边形中 AM 向量用 a⃗、b⃗ 表示",
            source: "向量 · 基底分解（高考选填高频）",
            standardMinutes: 4, killSeconds: 18,
            signal: "平行四边形、以两邻边向量 a、b 为基底，求内部点向量。",
            content: "平行四边形 ABCD 中，AB⃗=a⃗，AD⃗=b⃗，M 为 CD 中点，用 a⃗、b⃗ 表示 AM⃗。",
            contentLatex: #"\text{平行四边形}ABCD:\ \vec{AB}=\vec{a},\ \vec{AD}=\vec{b},\ M\text{ 为 }CD\text{ 中点},\ \vec{AM}=?"#,
            answer: "AM⃗ = a⃗ + b⃗/2",
            difficulty: 0.48, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "路径分解", #"\vec{AM}=\vec{AB}+\vec{BM}"#),
                skStep(2, "BM 路径", #"\vec{BM}=\vec{BC}+\vec{CM}=\vec{AD}+\tfrac12\vec{DC}"#),
                skStep(3, "DC⃗ = −a⃗，整理", #"\vec{BM}=\vec{b}+\tfrac12(-\vec{a})\text{……}"#),
                skStep(4, "合并", #"\vec{AM}=\vec{a}+\vec{b}+\tfrac12(-\vec{a})=\vec{a}+\tfrac{\vec{b}}{2}+\cdots"#)
            ],
            killSteps: [
                skStep(1, "直接路径 A→D→M", #"\vec{AM}=\vec{AD}+\vec{DM}=\vec{b}+\tfrac12\vec{DC}"#),
                skStep(2, "DC⃗=AB⃗=a⃗", #"\vec{AM}=\vec{b}+\tfrac12\vec{a}=\vec{a}+\tfrac{\vec{b}}{2}"#)
            ],
            stdKey: "逐步分解路径，每段用已知基底 a、b 表示。",
            killKey: "路径 A→D→M：AD⃗=b⃗，DM⃗=½DC⃗=½a⃗，直接合并得 a⃗+b⃗/2。",
            mistakes: ["DC⃗=AB⃗=a⃗（平行四边形对边），不是 −a⃗", "M 为 CD 中点：DM⃗=½DC⃗"]
        ),

        // 134 ── 向量基底：三点共线条件
        skCase(
            id: "sk_134", weapon: .vectorBasis,
            title: "三点共线 ↔ OP⃗=λOA⃗+μOB⃗ 且 λ+μ=1",
            source: "向量 · 共线条件（高考选填常见）",
            standardMinutes: 5, killSeconds: 22,
            signal: "P 在直线 AB 上——OP=OA+t·AB，或 λ+μ=1 条件。",
            content: "已知点 O、A、B，P 在直线 AB 上且 OP⃗=λOA⃗+μOB⃗，求 λ+μ 的值。",
            contentLatex: #"P\text{ 在直线}AB\text{上},\ \vec{OP}=\lambda\vec{OA}+\mu\vec{OB},\ \lambda+\mu=?"#,
            answer: "λ + μ = 1",
            difficulty: 0.50, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "三点共线", #"P\text{ 在 }AB\text{ 上}\Rightarrow\vec{AP}=t\vec{AB}"#),
                skStep(2, "展开", #"\vec{OP}-\vec{OA}=t(\vec{OB}-\vec{OA})"#),
                skStep(3, "整理", #"\vec{OP}=(1-t)\vec{OA}+t\vec{OB}\Rightarrow\lambda=1-t,\ \mu=t"#),
                skStep(4, "结论", #"\lambda+\mu=1"#)
            ],
            killSteps: [
                skStep(1, "共线 ↔ AP=t·AB 展开", #"\vec{OP}=(1-t)\vec{OA}+t\vec{OB}"#),
                skStep(2, "直接读出 λ+μ=1", #"\text{系数之和恒为 1}"#)
            ],
            stdKey: "由三点共线写参数方程，对应系数得 λ+μ=1。",
            killKey: "P 在 AB 上等价于 OP⃗ 用 OA⃗、OB⃗ 表示时系数和为 1，直接写结论。",
            mistakes: ["OA、OB 不共线时系数唯一，共线条件才能限制 λ+μ", "t 可取任意实数，不限于 [0,1]"]
        ),

        // 135 ── 绝对值不等式：两点距离和
        skCase(
            id: "sk_135", weapon: .absValue,
            title: "|x−1|+|x+2|≥5，数轴几何秒解",
            source: "不等式 · 绝对值（高考选填高频）",
            standardMinutes: 5, killSeconds: 20,
            signal: "|x−a|+|x−b| 形——数轴几何：两点距离和 ≥ 5，解集就是两端点外侧。",
            content: "解不等式 |x−1| + |x+2| ≥ 5。",
            contentLatex: #"|x-1|+|x+2|\ge5"#,
            answer: "x ≥ 2 或 x ≤ −3",
            difficulty: 0.50, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "分三段讨论", #"x<-2,\ -2\le x\le1,\ x>1"#),
                skStep(2, "x<−2 段", #"(-x+1)+(-x-2)=-2x-1\ge5\Rightarrow x\le-3"#),
                skStep(3, "中间段", #"(-x+1)+(x+2)=3<5\text{，无解}"#),
                skStep(4, "x>1 段", #"(x-1)+(x+2)=2x+1\ge5\Rightarrow x\ge2"#)
            ],
            killSteps: [
                skStep(1, "几何：x 到 1 和到 −2 的距离之和 ≥ 5", #"\text{两点相距 3，需额外延伸 1}，\text{即}x\le-3\text{ 或 }x\ge2"#),
                skStep(2, "直接写解集", #"x\le-3\ \text{或}\ x\ge2"#)
            ],
            stdKey: "三段分区间去绝对值，各段列一次不等式，合并解集。",
            killKey: "|x−1|+|x+2| 几何意义：x 到 1、到 −2 距离和。两点距离=3，要和≥5，还需各向外延伸 1，故 x≤−3 或 x≥2。",
            mistakes: ["中间段 [−2,1] 绝对值恒等于 3，无满足 ≥5 的解", "端点 x=2 和 x=−3 取等号需验证（均满足）"]
        ),

        // 136 ── 绝对值不等式：最小值
        skCase(
            id: "sk_136", weapon: .absValue,
            title: "|x−3|+|x+1| 最小值=两点距离=4",
            source: "不等式 · 绝对值最小值（高考选填常见）",
            standardMinutes: 4, killSeconds: 12,
            signal: "|x−a|+|x−b| 最小值——两点之距，x∈[min(a,b), max(a,b)] 时取等。",
            content: "求 |x−3|+|x+1| 的最小值及取等条件。",
            contentLatex: #"|x-3|+|x+1|\ \text{的最小值}"#,
            answer: "最小值为 4，当 −1 ≤ x ≤ 3 时取等",
            difficulty: 0.44, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "三角不等式", #"|x-3|+|x+1|\ge|(x-3)-(x+1)|=|-4|=4"#),
                skStep(2, "取等条件", #"(x-3)(x+1)\le0\Rightarrow-1\le x\le3"#)
            ],
            killSteps: [
                skStep(1, "几何：x 到 3 和到 −1 的距离和", #"\text{最小值=两点距离}=3-(-1)=4"#),
                skStep(2, "取等：x 在 [−1,3] 之间", #"-1\le x\le3"#)
            ],
            stdKey: "三角不等式放缩到两数差的绝对值，验证取等条件。",
            killKey: "几何：−1 到 3 距离=4，x 夹在中间时恰好取到最小，一句话完成。",
            mistakes: ["|a|+|b|≥|a−b|（注意是差），而非 a+b 的绝对值", "取等须验证 x∈[−1,3]，不能只写等号"]
        )
    ]

    /// 4 段拼回（见上方拆段说明）。对外仍是同一个 secondKillCases，引用处无需改动。
    static let secondKillCases: [SecondKillCase] =
        secondKillCasesA + secondKillCasesB + secondKillCasesC + secondKillCasesD

    // 战例对应题目也并入题库（可在练习/复习中再遇到）
    static let secondKillProblems: [Problem] = secondKillCases.map(\.problem)

    // MARK: - 工厂

    private static func skStep(_ order: Int, _ description: String, _ latex: String) -> SolutionStep {
        SolutionStep(order: order, description: description, latex: latex, annotation: "")
    }

    private static func skCase(
        id: String,
        weapon: KillWeapon,
        title: String,
        source: String,
        standardMinutes: Int,
        killSeconds: Int,
        signal: String,
        content: String,
        contentLatex: String,
        answer: String,
        difficulty: Double,
        tier: Int,
        formulaIds: [String],
        stdSteps: [SolutionStep],
        killSteps: [SolutionStep],
        stdKey: String,
        killKey: String,
        mistakes: [String],
        type: ProblemType = .proof,
        options: [String]? = nil
    ) -> SecondKillCase {
        let problem = Problem(
            id: id,
            type: type,
            tier: tier,
            formulaIds: formulaIds,
            content: content,
            contentLatex: contentLatex,
            options: options,
            answer: answer,
            difficulty: difficulty,
            averageTime: TimeInterval(standardMinutes * 60),
            hints: [signal],
            solution: SolutionPath(steps: stdSteps, keyInsight: stdKey, commonMistakes: mistakes),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(steps: stdSteps, keyInsight: stdKey, commonMistakes: mistakes),
                descentMethod: SolutionPath(steps: killSteps, keyInsight: killKey, commonMistakes: []),
                weaponUsed: weapon.displayName,
                timeRatio: Double(standardMinutes * 60) / Double(max(killSeconds, 1)),
                detailedExplanation: "降维秒杀（\(weapon.displayName)）：\(killKey)"
            ),
            gaokaoYear: nil,
            tags: ["降维秒杀", "压轴", weapon.displayName] + (weapon.inSyllabus ? ["纲内深用"] : ["超纲秒杀"])
        )
        return SecondKillCase(
            id: id, weapon: weapon, title: title, source: source,
            standardMinutes: standardMinutes, killSeconds: killSeconds,
            signal: signal, problem: problem
        )
    }
}
