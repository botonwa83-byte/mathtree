import Foundation

enum SampleData {

    // MARK: - Formulas (Exhaustive Spectrum: Elem -> Univ)

    static let formulas: [Formula] = [
        // ELEMENTARY
        Formula(id: "add_commute", name: "加法交换律", latex: "a + b = b + a", level: .elementary, category: .algebra, prerequisites: [], derivations: ["add_assoc"], advancedForm: "group_theory", gaokaoRelevance: 1.0, tags: ["算术", "基础"], intuition: "顺序不换，结果不变。", leapfrogKey: false, unlockedBy: nil),
        Formula(id: "rect_area", name: "矩形面积", latex: "S = a \\times b", level: .elementary, category: .geometry, prerequisites: [], derivations: ["tri_area"], advancedForm: "integration", gaokaoRelevance: 1.0, tags: ["几何", "面积"], intuition: "铺地砖的总数。", leapfrogKey: false, unlockedBy: nil),
        
        // MIDDLE
        Formula(id: "pythagorean", name: "勾股定理", latex: "a^2 + b^2 = c^2", level: .middle, category: .geometry, prerequisites: ["rect_area"], derivations: ["dist_formula"], advancedForm: "inner_product", gaokaoRelevance: 1.0, tags: ["几何", "核心"], intuition: "直角三角形的三边‘力量’守恒。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "quad_root", name: "二次方程求根公式", latex: "x = \\frac{-b \\pm \\sqrt{b^2-4ac}}{2a}", level: .middle, category: .algebra, prerequisites: [], derivations: ["vieta"], advancedForm: "galois", gaokaoRelevance: 1.0, tags: ["方程", "必考"], intuition: "暴力破解任何二次方程的终极钥匙。", leapfrogKey: true, unlockedBy: nil),

        // HIGH SCHOOL
        Formula(id: "sin_add", name: "和角公式", latex: "\\sin(\\alpha + \\beta) = \\sin\\alpha\\cos\\beta + \\cos\\alpha\\sin\\beta", level: .high, category: .trigonometry, prerequisites: ["pythagorean"], derivations: ["double_angle"], advancedForm: "euler_formula", gaokaoRelevance: 1.0, tags: ["三角函数", "核心"], intuition: "旋转的分解与合成。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "cosine_rule", name: "余弦定理", latex: "a^2 = b^2 + c^2 - 2bc\\cos A", level: .high, category: .trigonometry, prerequisites: ["pythagorean"], derivations: [], advancedForm: "vector_dot", gaokaoRelevance: 1.0, tags: ["解三角形", "必考"], intuition: "勾股定理的非直角修正版。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "ellipse_eq", name: "椭圆标准方程", latex: "\\frac{x^2}{a^2} + \\frac{y^2}{b^2} = 1", level: .high, category: .conicSections, prerequisites: ["pythagorean"], derivations: [], advancedForm: "conic_projection", gaokaoRelevance: 1.0, tags: ["圆锥曲线", "核心"], intuition: "被均匀拉伸的圆。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "deriv_power", name: "幂函数导数", latex: "(x^n)' = nx^{n-1}", level: .high, category: .calculus, prerequisites: [], derivations: [], advancedForm: "operator", gaokaoRelevance: 1.0, tags: ["导数", "核心"], intuition: "降幂打击，瞬时变化。", leapfrogKey: true, unlockedBy: nil),

        // UNIVERSITY
        Formula(id: "lopital_rule", name: "洛必达法则", latex: "\\lim_{x \\to a} \\frac{f(x)}{g(x)} = \\lim_{x \\to a} \\frac{f'(x)}{g'(x)}", level: .university, category: .calculus, prerequisites: ["derivative_def"], derivations: [], advancedForm: "cauchy_mean_value", gaokaoRelevance: 0.8, tags: ["极限", "秒杀"], intuition: "变化率决定极限。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "taylor_series", name: "泰勒级数", latex: "f(x) = \\sum_{n=0}^{\\infty} \\frac{f^{(n)}(a)}{n!}(x-a)^n", level: .university, category: .calculus, prerequisites: ["derivative_def"], derivations: ["euler_proof"], advancedForm: "analytic_continuation", gaokaoRelevance: 0.3, tags: ["逼近", "多项式"], intuition: "无限多项式克隆曲线。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "euler_formula", name: "欧拉公式", latex: "e^{i\\theta} = \\cos\\theta + i\\sin\\theta", level: .university, category: .complexNumbers, prerequisites: ["taylor_series"], derivations: ["euler_identity"], advancedForm: "harmonic_analysis", gaokaoRelevance: 0.2, tags: ["复数", "上帝公式"], intuition: "数学美学的巅峰合一。", leapfrogKey: true, unlockedBy: nil)
    ]

    // MARK: - Mysteries (RESTORED & EXHAUSTIVE)

    static let mysteries: [MathMystery] = [
        MathMystery(
            id: "099_equals_1",
            title: "0.999... 到底等不等于 1？",
            category: .infinityWar,
            shockRating: 7,
            summary: "挑战直觉的无限等式",
            premise: "大多数人凭直觉认为 0.999... 永远比 1 少一点点。但在实数系中，它们完全相等。",
            arguments: [
                Argument(title: "直觉派", content: "既然它叫0.999...，那就说明还没到1啊！", isCorrect: false),
                Argument(title: "分数派", content: "1/3 = 0.333...，两边乘以3即得 1 = 0.999...。", isCorrect: true)
            ],
            proofSteps: [
                ProofStep(order: 1, latex: "10x = 9.\\overline{9}", explanation: "两边乘以10"),
                ProofStep(order: 2, latex: "9x = 9 \\implies x = 1", explanation: "相减并解得 x = 1")
            ],
            verdict: "它们是同一个实数的不同表示。",
            historicalContext: "它揭示了人类在处理‘无限’概念时的直觉局限。",
            relatedWeaponId: nil,
            relatedHeroId: "euler",
            votes: MysteryVotes(agreeCount: 15400, disagreeCount: 3200, userVote: nil),
            openQuestion: "如果是非标准分析会怎样？"
        ),

        MathMystery(
            id: "monty_hall",
            title: "三门问题：换还是不换？",
            category: .intuitiveRebel,
            shockRating: 10,
            summary: "概率论中最臭名昭著的‘直觉杀手’",
            premise: "三扇门，选一扇。主持人打开一扇有羊的门，换门中奖率会倍增吗？",
            arguments: [
                Argument(title: "平衡派", content: "剩两扇门，概率各50%。", isCorrect: false),
                Argument(title: "统计派", content: "换门中奖率 2/3。", isCorrect: true)
            ],
            proofSteps: [
                ProofStep(order: 1, latex: "P(\\text{Win}|\\text{Change}) = 2/3", explanation: "最初选错概率转嫁给剩余门")
            ],
            verdict: "换门让胜率翻倍。",
            historicalContext: "曾引发全美数千名博士写信抗议。",
            relatedWeaponId: "bayes_theorem",
            relatedHeroId: nil,
            votes: MysteryVotes(agreeCount: 21000, disagreeCount: 8400, userVote: nil),
            openQuestion: "100扇门会怎样？"
        ),

        MathMystery(
            id: "banach_tarski",
            title: "分球怪论：点石成金？",
            category: .intuitiveRebel,
            shockRating: 10,
            summary: "将一个球切碎，拼成两个一模一样的球",
            premise: "利用选择公理，我们可以将一个实心球体分解并重组成两个等大球体。",
            arguments: [
                Argument(title: "物质守恒派", content: "这违反物理定律！", isCorrect: true),
                Argument(title: "数学派", content: "数学上的‘块’可以没有体积概念。", isCorrect: true)
            ],
            proofSteps: [
                ProofStep(order: 1, latex: "V_{new} = 2V_{old}", explanation: "不可测集的奇迹")
            ],
            verdict: "纯数学定义下成立。",
            historicalContext: "挑战了我们对体积和无穷的根本认知。",
            relatedWeaponId: nil,
            relatedHeroId: nil,
            votes: MysteryVotes(agreeCount: 4500, disagreeCount: 1200, userVote: nil),
            openQuestion: "原子也有体积吗？"
        ),

        MathMystery(
            id: "russell_paradox",
            title: "理发师悖论：数学的大地震",
            category: .foundation,
            shockRating: 9,
            summary: "一个差点摧毁整个数学大厦的逻辑圈套",
            premise: "给所有不给自己刮脸的人刮脸，理发师该给自己刮吗？",
            arguments: [
                Argument(title: "刮脸派", content: "刮了就违反规矩。", isCorrect: false),
                Argument(title: "不刮派", content: "不刮就必须给自己刮。", isCorrect: false)
            ],
            proofSteps: [
                ProofStep(order: 1, latex: "R \\in R \\iff R \\notin R", explanation: "逻辑自相矛盾")
            ],
            verdict: "朴素集合论存在致命漏洞。",
            historicalContext: "迫使数学界进入公理化时代。",
            relatedWeaponId: nil,
            relatedHeroId: "russell",
            votes: MysteryVotes(agreeCount: 12000, disagreeCount: 500, userVote: nil),
            openQuestion: "地基真的彻底安全了吗？"
        ),

        MathMystery(
            id: "gabriel_horn",
            title: "加百列号角：有限与无限",
            category: .infinityWar,
            shockRating: 8,
            summary: "可以装满油漆，却涂不满自己的表面",
            premise: "旋转体体积有限，但表面积却是无限的。",
            arguments: [
                Argument(title: "直觉派", content: "装满漆说明表面都被盖住了。", isCorrect: false),
                Argument(title: "数学派", content: "体积和面积是不同维度的积分。", isCorrect: true)
            ],
            proofSteps: [
                ProofStep(order: 1, latex: "V = \\pi, S \\to \\infty", explanation: "积分发散速度不同")
            ],
            verdict: "真实的数学奇观。",
            historicalContext: "17世纪震撼了托里拆利。",
            relatedWeaponId: "nl_formula",
            relatedHeroId: nil,
            votes: MysteryVotes(agreeCount: 6700, disagreeCount: 1100, userVote: nil),
            openQuestion: "现实物理中存在吗？"
        )
    ]

    // MARK: - Problems (Strike Pack)
    
    static let problems: [Problem] = [
        // ============ 小学题目 (5%) ============
        Problem(
            id: "elem_001",
            type: .multipleChoice,
            tier: 1,
            formulaIds: ["add_commute"],
            content: "计算：3 + 5 + 7 = ？",
            contentLatex: "3 + 5 + 7 = ?",
            options: ["12", "15", "18", "20"],
            answer: "15",
            difficulty: 0.1,
            averageTime: 10,
            hints: ["加法交换律", "凑十法"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "使用加法交换律", latex: "3 + 7 + 5 = 10 + 5", annotation: "先算 3+7")
                ],
                keyInsight: "交换顺序让计算更简单。",
                commonMistakes: ["忘记进位"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(steps: [], keyInsight: "按顺序计算", commonMistakes: []),
                descentMethod: SolutionPath(steps: [], keyInsight: "加法交换律优化", commonMistakes: []),
                weaponUsed: "加法交换律",
                timeRatio: 2.0
            ),
            gaokaoYear: nil,
            tags: ["算术", "小学"]
        ),

        // ============ 初中题目 (15%) ============
        Problem(
            id: "middle_001",
            type: .multipleChoice,
            tier: 2,
            formulaIds: ["pythagorean"],
            content: "直角三角形两直角边分别为3和4，斜边长为？",
            contentLatex: "a=3, b=4, c=?",
            options: ["5", "6", "7", "12"],
            answer: "5",
            difficulty: 0.2,
            averageTime: 20,
            hints: ["勾股定理"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "应用勾股定理", latex: "c^2 = 3^2 + 4^2 = 25", annotation: "计算平方和"),
                    SolutionStep(order: 2, description: "开方", latex: "c = \\sqrt{25} = 5", annotation: "取正值")
                ],
                keyInsight: "识别直角三角形，直接应用公式。",
                commonMistakes: ["忘记开方", "搞混斜边和直角边"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(steps: [], keyInsight: "直接应用勾股定理", commonMistakes: []),
                descentMethod: SolutionPath(steps: [], keyInsight: "记住3-4-5勾股数，秒答", commonMistakes: []),
                weaponUsed: "勾股数记忆",
                timeRatio: 5.0
            ),
            gaokaoYear: nil,
            tags: ["几何", "初中"]
        ),

        Problem(
            id: "middle_002",
            type: .multipleChoice,
            tier: 2,
            formulaIds: ["quad_root"],
            content: "方程 x² - 5x + 6 = 0 的两根之和是？",
            contentLatex: "x^2 - 5x + 6 = 0",
            options: ["5", "-5", "6", "-6"],
            answer: "5",
            difficulty: 0.35,
            averageTime: 30,
            hints: ["韦达定理"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "应用韦达定理", latex: "x_1 + x_2 = -\\frac{b}{a} = 5", annotation: "直接套用公式")
                ],
                keyInsight: "不求根直接用韦达定理。",
                commonMistakes: ["记错符号"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(steps: [], keyInsight: "求根公式", commonMistakes: []),
                descentMethod: SolutionPath(steps: [], keyInsight: "韦达定理直接秒杀", commonMistakes: []),
                weaponUsed: "韦达定理",
                timeRatio: 3.0
            ),
            gaokaoYear: nil,
            tags: ["方程", "初中"]
        ),

        // ============ 高中题目 (80%) ============
        
        Problem(
            id: "high_001",
            type: .multipleChoice,
            tier: 3,
            formulaIds: ["sin_add"],
            content: "已知 sin α = 3/5，cos β = 4/5，α, β 均为锐角，则 sin(α+β) = ？",
            contentLatex: "\\sin\\alpha=3/5, \\cos\\beta=4/5, \\sin(\\alpha+\\beta)=?",
            options: ["24/25", "7/25", "1", "0"],
            answer: "24/25",
            difficulty: 0.5,
            averageTime: 60,
            hints: ["和角公式"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "求 cos α 和 sin β", latex: "\\cos\\alpha=4/5, \\sin\\beta=3/5", annotation: "勾股定理"),
                    SolutionStep(order: 2, description: "应用和角公式", latex: "\\sin(\\alpha+\\beta)=\\frac{3}{5}\\cdot\\frac{4}{5}+\\frac{4}{5}\\cdot\\frac{3}{5}", annotation: "sin(α+β)=sinαcosβ+cosαsinβ"),
                    SolutionStep(order: 3, description: "计算", latex: "\\frac{12}{25}+\\frac{12}{25}=\\frac{24}{25}", annotation: "结果")
                ],
                keyInsight: "和角公式是三角函数的核心工具。",
                commonMistakes: ["记错和角公式", "符号错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(steps: [], keyInsight: "和角公式展开", commonMistakes: []),
                descentMethod: SolutionPath(steps: [], keyInsight: "欧拉公式：e^(i(α+β))=e^(iα)·e^(iβ)", commonMistakes: []),
                weaponUsed: "欧拉棱镜",
                timeRatio: 4.0
            ),
            gaokaoYear: 2020,
            tags: ["三角函数", "高中"]
        ),

        Problem(
            id: "high_002",
            type: .multipleChoice,
            tier: 4,
            formulaIds: ["ellipse_eq"],
            content: "椭圆 x²/25 + y²/9 = 1 的离心率是？",
            contentLatex: "\\frac{x^2}{25} + \\frac{y^2}{9} = 1",
            options: ["3/5", "4/5", "5/3", "5/4"],
            answer: "4/5",
            difficulty: 0.6,
            averageTime: 45,
            hints: ["椭圆离心率公式"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "确定 a, b", latex: "a^2=25, b^2=9", annotation: "a=5, b=3"),
                    SolutionStep(order: 2, description: "计算 c", latex: "c^2 = a^2 - b^2 = 16", annotation: "c=4"),
                    SolutionStep(order: 3, description: "计算离心率", latex: "e = c/a = 4/5", annotation: "结果")
                ],
                keyInsight: "离心率 e = c/a 是椭圆扁平程度的度量。",
                commonMistakes: ["搞混 a 和 b", "忘记开方"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(steps: [], keyInsight: "椭圆基本性质", commonMistakes: []),
                descentMethod: SolutionPath(steps: [], keyInsight: "极坐标统一方程", commonMistakes: []),
                weaponUsed: "圆锥曲线统一方程",
                timeRatio: 3.0
            ),
            gaokaoYear: 2021,
            tags: ["圆锥曲线", "高中"]
        ),

        Problem(
            id: "high_003",
            type: .multipleChoice,
            tier: 4,
            formulaIds: ["deriv_power"],
            content: "函数 f(x) = x³ - 3x 在 x = 1 处的切线斜率是？",
            contentLatex: "f(x) = x^3 - 3x, f'(1) = ?",
            options: ["0", "1", "-2", "3"],
            answer: "0",
            difficulty: 0.55,
            averageTime: 40,
            hints: ["导数的几何意义"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "求导", latex: "f'(x) = 3x^2 - 3", annotation: "幂函数求导"),
                    SolutionStep(order: 2, description: "代入 x=1", latex: "f'(1) = 3(1)^2 - 3 = 0", annotation: "切线斜率")
                ],
                keyInsight: "导数就是切线斜率，直接求导代入即可。",
                commonMistakes: ["求导错误", "忘记代入"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(steps: [], keyInsight: "导数定义求极限", commonMistakes: []),
                descentMethod: SolutionPath(steps: [], keyInsight: "幂函数求导公式直接秒杀", commonMistakes: []),
                weaponUsed: "求导刃",
                timeRatio: 6.0
            ),
            gaokaoYear: 2022,
            tags: ["导数", "高中"]
        ),

        Problem(
            id: "high_004",
            type: .multipleChoice,
            tier: 4,
            formulaIds: ["lopital_rule"],
            content: "求极限：当 x→0 时，(sin x - x)/x³ = ？",
            contentLatex: "\\lim_{x \\to 0} \\frac{\\sin x - x}{x^3}",
            options: ["0", "1/6", "-1/6", "1/3"],
            answer: "-1/6",
            difficulty: 0.85,
            averageTime: 300,
            hints: ["洛必达法则", "泰勒展开"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "检查形式", latex: "\\frac{0}{0}", annotation: "满足洛必达条件"),
                    SolutionStep(order: 2, description: "第一次求导", latex: "\\lim \\frac{\\cos x - 1}{3x^2}", annotation: "仍为 0/0"),
                    SolutionStep(order: 3, description: "第二次求导", latex: "\\lim \\frac{-\\sin x}{6x}", annotation: "仍为 0/0"),
                    SolutionStep(order: 4, description: "第三次求导", latex: "\\lim \\frac{-\\cos x}{6} = -\\frac{1}{6}", annotation: "结果")
                ],
                keyInsight: "高阶思维降维打击，连续应用洛必达。",
                commonMistakes: ["求导错误", "忘记检查条件"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(steps: [], keyInsight: "等价无穷小替换", commonMistakes: []),
                descentMethod: SolutionPath(steps: [], keyInsight: "泰勒展开直接写出答案", commonMistakes: []),
                weaponUsed: "洛必达之锤",
                timeRatio: 5.0
            ),
            gaokaoYear: 2022,
            tags: ["极限", "压轴"]
        ),

        Problem(
            id: "high_005",
            type: .multipleChoice,
            tier: 3,
            formulaIds: ["cosine_rule"],
            content: "在△ABC中，a=3, b=4, C=60°，则 c = ？",
            contentLatex: "a=3, b=4, C=60°, c=?",
            options: ["\\sqrt{13}", "5", "\\sqrt{37}", "7"],
            answer: "\\sqrt{13}",
            difficulty: 0.5,
            averageTime: 50,
            hints: ["余弦定理"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "应用余弦定理", latex: "c^2 = 3^2 + 4^2 - 2\\cdot3\\cdot4\\cdot\\cos60°", annotation: "代入已知"),
                    SolutionStep(order: 2, description: "计算", latex: "c^2 = 9 + 16 - 12 = 13", annotation: "cos60°=0.5"),
                    SolutionStep(order: 3, description: "开方", latex: "c = \\sqrt{13}", annotation: "结果")
                ],
                keyInsight: "已知两边夹一角，余弦定理直接求解。",
                commonMistakes: ["记错余弦定理公式", "角度单位错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(steps: [], keyInsight: "余弦定理", commonMistakes: []),
                descentMethod: SolutionPath(steps: [], keyInsight: "向量点积公式", commonMistakes: []),
                weaponUsed: "向量武器",
                timeRatio: 3.0
            ),
            gaokaoYear: 2019,
            tags: ["解三角形", "高中"]
        ),

        Problem(
            id: "high_006",
            type: .multipleChoice,
            tier: 4,
            formulaIds: ["deriv_power"],
            content: "函数 f(x) = x³ - 3x² + 1 的单调递减区间是？",
            contentLatex: "f(x) = x^3 - 3x^2 + 1",
            options: ["(-∞,0)", "(0,2)", "(2,+∞)", "(-∞,0)∪(2,+∞)"],
            answer: "(0,2)",
            difficulty: 0.7,
            averageTime: 80,
            hints: ["导数判断单调性"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "求导", latex: "f'(x) = 3x^2 - 6x", annotation: "幂函数求导"),
                    SolutionStep(order: 2, description: "求临界点", latex: "3x(x-2)=0 \\implies x=0,2", annotation: "解方程"),
                    SolutionStep(order: 3, description: "判断符号", latex: "f'(x) < 0 \\implies 0 < x < 2", annotation: "二次函数开口向上")
                ],
                keyInsight: "导数小于0时函数递减，转化为解不等式。",
                commonMistakes: ["求导错误", "区间开闭判断错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(steps: [], keyInsight: "定义法比较", commonMistakes: []),
                descentMethod: SolutionPath(steps: [], keyInsight: "导数直接秒杀", commonMistakes: []),
                weaponUsed: "求导刃",
                timeRatio: 4.0
            ),
            gaokaoYear: 2021,
            tags: ["导数", "单调性", "高中"]
        ),

        Problem(
            id: "high_007",
            type: .multipleChoice,
            tier: 3,
            formulaIds: ["add_commute"],
            content: "等差数列 {aₙ} 中，a₁=2，d=3，则前10项和 S₁₀ = ？",
            contentLatex: "a_1=2, d=3, S_{10}=?",
            options: ["155", "150", "160", "145"],
            answer: "155",
            difficulty: 0.4,
            averageTime: 35,
            hints: ["等差数列求和公式"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "求第10项", latex: "a_{10} = 2 + 9\\times3 = 29", annotation: "通项公式"),
                    SolutionStep(order: 2, description: "求和", latex: "S_{10} = \\frac{10}{2}(2+29) = 5\\times31", annotation: "等差数列求和"),
                    SolutionStep(order: 3, description: "计算", latex: "S_{10} = 155", annotation: "结果")
                ],
                keyInsight: "等差数列求和 = 项数 × (首项+末项)/2。",
                commonMistakes: ["项数计算错误", "公式记错"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(steps: [], keyInsight: "逐项相加", commonMistakes: []),
                descentMethod: SolutionPath(steps: [], keyInsight: "高斯配对法", commonMistakes: []),
                weaponUsed: "高斯求和",
                timeRatio: 10.0
            ),
            gaokaoYear: 2020,
            tags: ["数列", "高中"]
        ),

        Problem(
            id: "high_008",
            type: .multipleChoice,
            tier: 3,
            formulaIds: [],
            content: "从1到10的整数中随机取一个数，取到偶数的概率是？",
            contentLatex: "P(\\text{even}) = ?",
            options: ["1/2", "2/5", "3/5", "1/10"],
            answer: "1/2",
            difficulty: 0.25,
            averageTime: 25,
            hints: ["古典概型"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "计算基本事件数", latex: "n(Ω) = 10", annotation: "总共有10个数"),
                    SolutionStep(order: 2, description: "计算有利事件数", latex: "n(A) = 5", annotation: "偶数：2,4,6,8,10"),
                    SolutionStep(order: 3, description: "计算概率", latex: "P = 5/10 = 1/2", annotation: "结果")
                ],
                keyInsight: "古典概型：概率 = 有利事件数 / 总事件数。",
                commonMistakes: ["计数错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(steps: [], keyInsight: "直接计数", commonMistakes: []),
                descentMethod: SolutionPath(steps: [], keyInsight: "对称性：奇偶各半", commonMistakes: []),
                weaponUsed: "对称性思维",
                timeRatio: 3.0
            ),
            gaokaoYear: 2019,
            tags: ["概率", "高中"]
        ),

        Problem(
            id: "high_009",
            type: .multipleChoice,
            tier: 3,
            formulaIds: [],
            content: "向量 a=(1,2)，b=(3,4)，则 a·b = ？",
            contentLatex: "\\vec{a}=(1,2), \\vec{b}=(3,4), \\vec{a}\\cdot\\vec{b}=?",
            options: ["11", "10", "5", "14"],
            answer: "11",
            difficulty: 0.3,
            averageTime: 20,
            hints: ["向量点积"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "应用点积公式", latex: "a\\cdot b = 1\\times3 + 2\\times4", annotation: "对应分量相乘相加"),
                    SolutionStep(order: 2, description: "计算", latex: "3 + 8 = 11", annotation: "结果")
                ],
                keyInsight: "向量点积是对应分量乘积之和。",
                commonMistakes: ["搞混点积和叉积", "符号错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(steps: [], keyInsight: "定义计算", commonMistakes: []),
                descentMethod: SolutionPath(steps: [], keyInsight: "内积空间性质", commonMistakes: []),
                weaponUsed: "线性代数",
                timeRatio: 2.0
            ),
            gaokaoYear: 2021,
            tags: ["向量", "高中"]
        ),

        Problem(
            id: "high_010",
            type: .multipleChoice,
            tier: 4,
            formulaIds: [],
            content: "已知 x > 0，则 x + 4/x 的最小值是？",
            contentLatex: "x > 0, \\min(x + 4/x) = ?",
            options: ["4", "2", "5", "1"],
            answer: "4",
            difficulty: 0.6,
            averageTime: 50,
            hints: ["基本不等式"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "应用基本不等式", latex: "x + \\frac{4}{x} \\geq 2\\sqrt{x \\cdot \\frac{4}{x}}", annotation: "a+b≥2√(ab)"),
                    SolutionStep(order: 2, description: "计算", latex: "2\\sqrt{4} = 4", annotation: "等号成立当x=2")
                ],
                keyInsight: "基本不等式是求最值的利器。",
                commonMistakes: ["忘记等号成立条件", "不满足正数条件"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(steps: [], keyInsight: "基本不等式", commonMistakes: []),
                descentMethod: SolutionPath(steps: [], keyInsight: "求导找极值点", commonMistakes: []),
                weaponUsed: "求导刃",
                timeRatio: 3.0
            ),
            gaokaoYear: 2022,
            tags: ["不等式", "高中"]
        )
    ]

    // MARK: - Heroes

    static let heroes: [MathHero] = [
        MathHero(id: "euler", name: "欧拉", nameEN: "Leonhard Euler", era: "1707 - 1783", attributes: HeroAttributes(insight: 10, creativity: 10, perseverance: 9, influence: 10), weaponSkills: ["欧拉恒等式"], legendStory: "失明后依然统治数学界。", famousQuote: "数学是上帝书写宇宙的语言。", relatedMysteries: ["099_equals_1", "gabriel_horn"], portraitEmoji: "👴"),
        MathHero(id: "gauss", name: "高斯", nameEN: "Carl Friedrich Gauss", era: "1777 - 1855", attributes: HeroAttributes(insight: 10, creativity: 9, perseverance: 10, influence: 10), weaponSkills: ["正态分布"], legendStory: "3岁纠错，10岁秒算。", famousQuote: "数学是科学的女王。", relatedMysteries: ["monty_hall"], portraitEmoji: "👑"),
        MathHero(id: "russell", name: "罗素", nameEN: "Bertrand Russell", era: "1872 - 1970", attributes: HeroAttributes(insight: 10, creativity: 8, perseverance: 9, influence: 10), weaponSkills: ["逻辑主义"], legendStory: "用逻辑挑战整个数学界。", famousQuote: "数学不确定的科学。", relatedMysteries: ["russell_paradox"], portraitEmoji: "🎩")
    ]

    // MARK: - Weapons

    static let weapons: [DescendWeapon] = [
        DescendWeapon(id: "derivative_blade", name: "Derivative Blade", codename: "求导刃", tier: .blade, principle: "导数", tagline: "变化率秒杀器", unlockConditions: [], slayableGaokaoTypes: ["单调性"], demonstrations: [], masteryLevel: .beginner),
        DescendWeapon(id: "lopital_hammer", name: "L'Hôpital's Hammer", codename: "洛必达之锤", tier: .heavyWeapon, principle: "导数极限", tagline: "极限陷阱粉碎机", unlockConditions: [], slayableGaokaoTypes: ["极限"], demonstrations: [], masteryLevel: .locked)
    ]

    // MARK: - Daily Strikes

    static let dailyStrikes: [DailyStrike] = [
        DailyStrike(type: "思维", question: "为何球表面积是体积导数？", answer: "增量效应", detail: "微分几何直观")
    ]
}
