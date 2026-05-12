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
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "按顺序计算", latex: "3+5=8", annotation: ""),
                        SolutionStep(order: 2, description: "继续加法", latex: "8+7=15", annotation: "")
                    ],
                    keyInsight: "按顺序计算",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】凑整法！", latex: "(3+7)+5 = 10+5 = 15", annotation: "先凑10再算！")
                    ],
                    keyInsight: "凑整让复杂计算变简单！",
                    commonMistakes: []
                ),
                weaponUsed: "凑整法 (加法交换律)",
                timeRatio: 2.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了如何用"凑整法"（加法交换律和结合律）来秒杀计算题：
                    
                    1️⃣ 观察：3和7可以凑成10
                    2️⃣ 分组：(3+7)+5，利用交换律和结合律重新排列
                    3️⃣ 计算：每组都是10，直接得出15
                    
                    💡 关键：遇到加法题，先看能不能凑整！这比按顺序计算快得多，也不容易出错！
                    
                    🧠 高阶思维：这是"代数运算律"的体现——虽然是小学题，但体现了"重新排列使计算简化"的思想，这种思想在高中、大学数学中也广泛使用！
                    """
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
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "应用勾股定理", latex: "c²=3²+4²=25", annotation: ""),
                        SolutionStep(order: 2, description: "开方", latex: "c=5", annotation: "")
                    ],
                    keyInsight: "直接应用勾股定理",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】记住3-4-5勾股数！", latex: "c=5", annotation: "直接秒答！")
                    ],
                    keyInsight: "记住常见勾股数，秒答直角三角形！",
                    commonMistakes: []
                ),
                weaponUsed: "勾股数记忆法",
                timeRatio: 5.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了如何用"勾股数记忆法"来秒杀几何题：
                    
                    1️⃣ 观察：3和4，马上想到勾股数3-4-5
                    2️⃣ 秒答：斜边就是5！
                    
                    💡 关键：记住常见勾股数（3-4-5，5-12-13，7-24-25，8-15-17等），它们的倍数也是勾股数！
                    
                    🧠 高阶思维：这是"数感"的体现——对数的敏感度和记忆，这种能力在解三角形、解析几何等高中内容中也至关重要！
                    """
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
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "求根公式", latex: "x = [5 ± √(25-24)]/2", annotation: ""),
                        SolutionStep(order: 2, description: "求出两根", latex: "x₁=2, x₂=3", annotation: ""),
                        SolutionStep(order: 3, description: "相加", latex: "2+3=5", annotation: "")
                    ],
                    keyInsight: "求根公式",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】韦达定理直接用！", latex: "x₁+x₂ = -b/a = -(-5)/1 = 5", annotation: "不求根，秒杀！")
                    ],
                    keyInsight: "韦达定理是二次方程的神器！",
                    commonMistakes: []
                ),
                weaponUsed: "韦达定理",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了如何用"韦达定理"来秒杀二次方程问题：
                    
                    1️⃣ 识别：对于 ax²+bx+c=0，根的和是 -b/a
                    2️⃣ 代入：这里a=1, b=-5，所以和就是 -(-5)/1 = 5
                    3️⃣ 完成：不需要求根，直接得出答案！
                    
                    💡 关键：韦达定理告诉我们"根与系数的关系"，在不需要知道具体根的时候特别有用！
                    
                    🧠 高阶思维：这是"对称多项式"思想的体现——虽然是初中题，但这种"研究整体性质而不求解个体"的思想，在高中不等式、数列，大学抽象代数中都有应用！
                    """
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
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "求cosα和sinβ", latex: "cosα=4/5, sinβ=3/5", annotation: ""),
                        SolutionStep(order: 2, description: "和角公式展开", latex: "sinαcosβ+cosαsinβ", annotation: ""),
                        SolutionStep(order: 3, description: "代入计算", latex: "(3/5)(4/5)+(4/5)(3/5)=24/25", annotation: "")
                    ],
                    keyInsight: "和角公式展开",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】欧拉公式！", latex: "e^(i(α+β)) = e^(iα)·e^(iβ)", annotation: "欧拉公式"),
                        SolutionStep(order: 2, description: "取虚部", latex: "sin(α+β) = Im[(cosα+isinα)(cosβ+isinβ)]", annotation: ""),
                        SolutionStep(order: 3, description: "计算", latex: "Im[(4/5+3i/5)(4/5+3i/5)] = 24/25", annotation: "秒杀！")
                    ],
                    keyInsight: "欧拉公式让三角函数变成复数乘法！",
                    commonMistakes: []
                ),
                weaponUsed: "欧拉棱镜 (欧拉公式)",
                timeRatio: 4.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了如何用"欧拉公式"（大学内容）来秒杀三角函数题：
                    
                    1️⃣ 回忆：欧拉公式 e^(iθ) = cosθ + i sinθ
                    2️⃣ 观察：sin(α+β) 是 e^(i(α+β)) 的虚部
                    3️⃣ 计算：e^(i(α+β)) = e^(iα)·e^(iβ) = (4/5+3i/5)(4/5+3i/5) = (16/25-9/25)+(24/25)i
                    4️⃣ 取虚部：就是 24/25！
                    
                    💡 关键：欧拉公式把三角函数的复杂运算变成了简单的复数乘法！
                    
                    🧠 高阶思维：这是"用更高观点统一低等概念"的典范——三角函数和指数函数在复数域统一了！这种思想在整个数学中都很重要！
                    """
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
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "找a", latex: "a=5", annotation: ""),
                        SolutionStep(order: 2, description: "找c", latex: "c=4", annotation: ""),
                        SolutionStep(order: 3, description: "计算e", latex: "e=4/5", annotation: "")
                    ],
                    keyInsight: "按定义计算",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】这是经典椭圆！", latex: "a=5, b=3 \\implies c=4 \\implies e=4/5", annotation: "记住常见椭圆参数"),
                        SolutionStep(order: 2, description: "直接写出", latex: "e=4/5", annotation: "秒杀！")
                    ],
                    keyInsight: "记住常见椭圆，离心率秒出！",
                    commonMistakes: []
                ),
                weaponUsed: "圆锥曲线直觉法",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了如何用"圆锥曲线直觉"来秒杀：
                    
                    1️⃣ 识别：x²/25 + y²/9 = 1 是经典椭圆
                    2️⃣ 记住：a=5, b=3，所以 c=4（勾股数3-4-5）
                    3️⃣ 秒答：e=c/a=4/5
                    
                    💡 关键：对常见圆锥曲线参数要有敏感度！
                    
                    🧠 高阶思维：这是"模式识别"能力的体现——快速识别已知模式，这种能力在解复杂题时能节省大量时间！
                    """
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
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "求导", latex: "f'(x)=3x²-3", annotation: ""),
                        SolutionStep(order: 2, description: "代入", latex: "f'(1)=0", annotation: "")
                    ],
                    keyInsight: "按部就班求导",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】观察 f(x)=x(x²-3)", latex: "x=1是临界点", annotation: "直接观察"),
                        SolutionStep(order: 2, description: "或者更高级：", latex: "f(x)在x=1处是极值点 \\implies f'(1)=0", annotation: "秒杀！")
                    ],
                    keyInsight: "极值点导数为0，直接秒答！",
                    commonMistakes: []
                ),
                weaponUsed: "求导刃 (极值点性质)",
                timeRatio: 6.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了如何用"极值点性质"来秒杀导数题：
                    
                    1️⃣ 观察：f(x)=x³-3x=x(x²-3)，x=1是一个临界点
                    2️⃣ 直觉：这是一个三次函数，在x=1处应该是极值点
                    3️⃣ 秒答：极值点导数为0，所以f'(1)=0！
                    
                    💡 关键：理解导数的几何意义——极值点处切线水平，斜率为0！
                    
                    🧠 高阶思维：这是"数形结合"和"性质预判"的体现——先分析函数性质，再精确计算，这种思想在解复杂题时事半功倍！
                    """
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
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "等价无穷小替换", latex: "sinx ≈ x - x³/6", annotation: "需要记住泰勒展开"),
                        SolutionStep(order: 2, description: "代入", latex: "(x - x³/6 - x)/x³ = -1/6", annotation: "")
                    ],
                    keyInsight: "用泰勒展开或等价无穷小",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】泰勒展开直接上！", latex: "sinx = x - x³/6 + o(x³)", annotation: "泰勒展开"),
                        SolutionStep(order: 2, description: "代入", latex: "(x - x³/6 - x)/x³ = -x³/6 / x³ = -1/6", annotation: "秒杀！")
                    ],
                    keyInsight: "泰勒级数是极限的终极武器！",
                    commonMistakes: []
                ),
                weaponUsed: "洛必达之锤 / 泰勒级数",
                timeRatio: 5.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了如何用"泰勒级数"（大学内容）来秒杀极限题：
                    
                    1️⃣ 回忆：sinx 的泰勒展开是 sinx = x - x³/6 + x⁵/120 - ...
                    2️⃣ 代入：sinx - x = -x³/6 + 高次项
                    3️⃣ 相除：(sinx - x)/x³ = -1/6 + 高次项 → 极限就是 -1/6
                    
                    💡 关键：泰勒展开能把复杂函数变成多项式，极限计算一目了然！
                    
                    🧠 高阶思维：这是"用多项式逼近复杂函数"的思想——虽然是大学内容，但用在高考极限题上简直是降维打击！
                    """
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
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "余弦定理", latex: "c²=3²+4²-2·3·4·cos60°", annotation: ""),
                        SolutionStep(order: 2, description: "计算", latex: "c²=9+16-12=13", annotation: ""),
                        SolutionStep(order: 3, description: "开方", latex: "c=√13", annotation: "")
                    ],
                    keyInsight: "按余弦定理计算",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】向量法！", latex: "\\vec{AB} = \\vec{CB} - \\vec{CA}", annotation: "向量减法"),
                        SolutionStep(order: 2, description: "平方", latex: "|\\vec{AB}|² = |\\vec{CB}|² + |\\vec{CA}|² - 2\\vec{CB}\\cdot\\vec{CA}", annotation: "点积性质"),
                        SolutionStep(order: 3, description: "计算", latex: "c²=9+16-2·3·4·cos60°=13 \\implies c=√13", annotation: "秒杀！")
                    ],
                    keyInsight: "向量让几何问题代数化！",
                    commonMistakes: []
                ),
                weaponUsed: "向量武器 (点积)",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了如何用"向量点积"来秒杀几何题：
                    
                    1️⃣ 构造向量：→AB = →CB - →CA
                    2️⃣ 平方：|→AB|² = |→CB|² + |→CA|² - 2→CB·→CA
                    3️⃣ 计算：就是 c² = a² + b² - 2ab cosC
                    
                    💡 关键：余弦定理其实就是向量点积的几何解释！
                    
                    🧠 高阶思维：这是"几何问题代数化"思想的体现——用向量工具可以统一处理很多几何问题！
                    """
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
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "求导", latex: "f'(x)=3x²-6x", annotation: ""),
                        SolutionStep(order: 2, description: "解不等式", latex: "f'(x)<0 \\implies 0<x<2", annotation: "")
                    ],
                    keyInsight: "导数判断单调性",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】观察三次函数形状！", latex: "f(x)=x³-3x²+1", annotation: "三次项系数为正"),
                        SolutionStep(order: 2, description: "图像趋势", latex: "先增后减再增，递减区间在中间", annotation: ""),
                        SolutionStep(order: 3, description: "看选项", latex: "只有(0,2)是中间区间", annotation: "秒杀！")
                    ],
                    keyInsight: "熟悉函数图像，区间秒出！",
                    commonMistakes: []
                ),
                weaponUsed: "求导刃 (函数图像直觉)",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了如何用"函数图像直觉"来秒杀：
                    
                    1️⃣ 识别：这是三次函数 f(x)=x³-3x²+1，首项系数为正
                    2️⃣ 趋势：三次函数"先增后减再增"，递减区间在中间
                    3️⃣ 看选项：只有(0,2)是中间区间，秒答！
                    
                    💡 关键：熟悉基本函数的图像形状，能大大提高解题速度！
                    
                    🧠 高阶思维：这是"数形结合"和"定性分析"思想的体现——先从宏观把握函数性质，再进行精确计算！
                    """
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
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "用另一个公式", latex: "Sₙ=na₁+n(n-1)d/2", annotation: ""),
                        SolutionStep(order: 2, description: "计算", latex: "10×2+10×9×3/2=20+135=155", annotation: "")
                    ],
                    keyInsight: "按公式计算",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】高斯配对法！", latex: "S₁₀ = (a₁+a₁₀)+(a₂+a₉)+...+(a₅+a₆)", annotation: "配对"),
                        SolutionStep(order: 2, description: "计算", latex: "a₁+a₁₀=2+29=31", annotation: "每对都是31"),
                        SolutionStep(order: 3, description: "相乘", latex: "5×31=155", annotation: "秒杀！")
                    ],
                    keyInsight: "高斯配对法，数列求和神器！",
                    commonMistakes: []
                ),
                weaponUsed: "高斯求和法",
                timeRatio: 4.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了如何用"高斯配对法"来秒杀数列题：
                    
                    1️⃣ 回忆：高斯小时候计算1+2+...+100的方法——首尾配对
                    2️⃣ 配对：(a₁+a₁₀) = (a₂+a₉) = ... = (a₅+a₆) = 31
                    3️⃣ 计算：5对 × 31 = 155
                    
                    💡 关键：等差数列中，"距离相等的两项之和相等"！
                    
                    🧠 高阶思维：这是"对称性"思想的体现——利用数列的对称性简化计算，这种思想在高中数学乃至大学数学中都非常重要！
                    """
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
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "数偶数个数", latex: "2,4,6,8,10 → 5个", annotation: ""),
                        SolutionStep(order: 2, description: "计算概率", latex: "5/10=1/2", annotation: "")
                    ],
                    keyInsight: "直接计数",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】对称性！", latex: "1-10中奇偶各一半", annotation: "对称性"),
                        SolutionStep(order: 2, description: "秒答", latex: "P=1/2", annotation: "秒杀！")
                    ],
                    keyInsight: "利用对称性，概率秒出！",
                    commonMistakes: []
                ),
                weaponUsed: "对称性思维",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了如何用"对称性思维"来秒杀概率题：
                    
                    1️⃣ 观察：1到10是连续整数，奇偶对称
                    2️⃣ 推理：取到奇数和偶数的概率应该相等
                    3️⃣ 秒答：概率就是 1/2
                    
                    💡 关键：对称性是概率论中的强大工具！
                    
                    🧠 高阶思维：这是"对称性与不变性"思想的体现——寻找问题中的对称关系，能大大简化计算！
                    """
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
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "计算", latex: "1×3+2×4=3+8=11", annotation: "")
                    ],
                    keyInsight: "定义计算",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】点积就是投影！", latex: "\\vec{a}\\cdot\\vec{b} = |\\vec{a}||\\vec{b}|\\cos\\theta", annotation: "但用坐标更快"),
                        SolutionStep(order: 2, description: "计算", latex: "1×3+2×4=11", annotation: "秒杀！")
                    ],
                    keyInsight: "点积计算要熟练！",
                    commonMistakes: []
                ),
                weaponUsed: "向量武器 (点积)",
                timeRatio: 1.5,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了向量点积的计算：
                    
                    1️⃣ 公式：→a·→b = x₁x₂ + y₁y₂
                    2️⃣ 计算：1×3 + 2×4 = 3 + 8 = 11
                    
                    💡 关键：点积是代数和几何的桥梁！
                    
                    🧠 高阶思维：这是"几何概念代数化"的体现——向量让几何问题可以用代数方法计算！
                    """
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
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "基本不等式", latex: "x + 4/x ≥ 2√(x·4/x) = 4", annotation: ""),
                        SolutionStep(order: 2, description: "等号成立条件", latex: "x = 4/x \\implies x=2", annotation: "")
                    ],
                    keyInsight: "用基本不等式求最值",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】求导法！", latex: "f(x) = x + 4/x", annotation: "设函数"),
                        SolutionStep(order: 2, description: "求导", latex: "f'(x) = 1 - 4/x²", annotation: "求导"),
                        SolutionStep(order: 3, description: "找临界点", latex: "f'(x)=0 \\implies x²=4 \\implies x=2", annotation: "x>0"),
                        SolutionStep(order: 4, description: "秒答", latex: "f(2)=2+4/2=4", annotation: "秒杀！")
                    ],
                    keyInsight: "求导是求函数最值的通用方法！",
                    commonMistakes: []
                ),
                weaponUsed: "求导刃",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了如何用"求导法"（通用方法）来秒杀最值问题：
                    
                    1️⃣ 设函数：f(x) = x + 4/x
                    2️⃣ 求导数：f'(x) = 1 - 4/x²
                    3️⃣ 找临界点：f'(x)=0 → x²=4 → x=2（因为x>0）
                    4️⃣ 秒答：f(2)=2+4/2=4
                    
                    💡 关键：求导是求函数极值的通用方法，不需要记住各种不等式技巧！
                    
                    🧠 高阶思维：这是"微积分工具简化初等问题"的典范——虽然基本不等式也能做，但求导是更通用、更系统的方法，这种思想在解决复杂问题时尤为重要！
                    """
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
