import Foundation

enum SampleData {

    // MARK: - Formulas (Preserved & Optimized)

    static let formulas: [Formula] = [
        // ELEMENTARY
        Formula(id: "add_commute", name: "加法交换律", latex: "a + b = b + a", level: .elementary, category: .algebra, prerequisites: [], derivations: ["add_assoc"], advancedForm: "group_theory", gaokaoRelevance: 1.0, tags: ["算术", "基础"], intuition: "两个数相加，谁先谁后不重要。", leapfrogKey: false, unlockedBy: nil),
        
        // MIDDLE
        Formula(id: "pythagorean", name: "勾股定理", latex: "a^2 + b^2 = c^2", level: .middle, category: .geometry, prerequisites: [], derivations: ["dist_formula"], advancedForm: "inner_product", gaokaoRelevance: 0.95, tags: ["几何", "核心"], intuition: "直角三角形中，两直边的平方和等于斜边的平方。", leapfrogKey: true, unlockedBy: nil),

        // HIGH SCHOOL
        Formula(id: "sin_add", name: "正弦和角公式", latex: "\\sin(\\alpha + \\beta) = \\sin\\alpha\\cos\\beta + \\cos\\alpha\\sin\\beta", level: .high, category: .trigonometry, prerequisites: ["sin_sq_cos_sq"], derivations: ["sin_double"], advancedForm: "euler_formula", gaokaoRelevance: 0.98, tags: ["三角函数", "核心变换"], intuition: "旋转的叠加，通过分量映射得出。", leapfrogKey: true, unlockedBy: nil),
        
        Formula(id: "deriv_power", name: "幂函数导数", latex: "(x^n)' = nx^{n-1}", level: .high, category: .calculus, prerequisites: [], derivations: [], advancedForm: "operator_theory", gaokaoRelevance: 1.0, tags: ["导数", "大题必备"], intuition: "函数的变化率，高维降一维。", leapfrogKey: true, unlockedBy: nil),
        
        Formula(id: "ellipse_std", name: "椭圆标准方程", latex: "\\frac{x^2}{a^2} + \\frac{y^2}{b^2} = 1", level: .high, category: .conicSections, prerequisites: ["pythagorean"], derivations: [], advancedForm: "conic_projection", gaokaoRelevance: 1.0, tags: ["圆锥曲线", "大题必考"], intuition: "被均匀拉伸的圆，保持两个焦点距离之和不变。", leapfrogKey: true, unlockedBy: nil),

        // UNIVERSITY
        Formula(id: "euler_formula", name: "欧拉公式", latex: "e^{i\\theta} = \\cos\\theta + i\\sin\\theta", level: .university, category: .complexNumbers, prerequisites: ["sin_add"], derivations: [], advancedForm: "complex_analysis", gaokaoRelevance: 0.2, tags: ["复变函数", "降维利器"], intuition: "三角函数其实就是虚指数函数在复平面的投影。", leapfrogKey: true, unlockedBy: nil),
        
        Formula(id: "lopital_rule", name: "洛必达法则", latex: "\\lim_{x \\to a} \\frac{f(x)}{g(x)} = \\lim_{x \\to a} \\frac{f'(x)}{g'(x)}", level: .university, category: .calculus, prerequisites: ["derivative_def"], derivations: [], advancedForm: "cauchy_mean_value", gaokaoRelevance: 0.8, tags: ["导数", "极限利器"], intuition: "当分子分母都趋于零时，看谁‘跑得快’决定了极限。", leapfrogKey: true, unlockedBy: nil)
    ]

    // MARK: - Problems (The High-Level Strike Pack)

    static let problems: [Problem] = [
        // STRIKE 1: Limits & L'Hopital
        Problem(
            id: "strike_limit_001",
            type: .multipleChoice,
            tier: 4,
            formulaIds: ["lopital_rule"],
            content: "求极限：当 x 趋于 0 时，(sin x - x) / x³ 的值是多少？",
            contentLatex: "\\lim_{x \\to 0} \\frac{\\sin x - x}{x^3}",
            options: ["0", "1/6", "-1/6", "1/3"],
            answer: "-1/6",
            difficulty: 0.85,
            averageTime: 300,
            hints: ["这是 0/0 型极限", "标准做法需要无穷小替换或泰勒展开"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "识别 0/0 型", latex: "\\sin 0 - 0 = 0, 0^3 = 0", annotation: "符合洛必达条件"),
                    SolutionStep(order: 2, description: "第一次求导", latex: "\\lim \\frac{\\cos x - 1}{3x^2}", annotation: "依然是 0/0"),
                    SolutionStep(order: 3, description: "第二次求导", latex: "\\lim \\frac{-\\sin x}{6x}", annotation: "利用 sin x / x -> 1"),
                    SolutionStep(order: 4, description: "得出结果", latex: "-\\frac{1}{6}", annotation: "极速秒杀")
                ],
                keyInsight: "洛必达法则将复杂的极限转化为了简单的导数比值。",
                commonMistakes: ["求导漏掉系数", "没意识到需要多次求导"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "无穷小展开", latex: "\\sin x = x - \\frac{x^3}{6} + o(x^3)", annotation: "高中一般不教"),
                        SolutionStep(order: 2, description: "代入消元", latex: "\\frac{(x - x^3/6) - x}{x^3}", annotation: "繁琐系数")
                    ],
                    keyInsight: "利用级数展开，对高中生极难记忆",
                    commonMistakes: ["展开项数不足"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "连续导击", latex: "\\text{三次导数：}\\frac{\\cos x - 1}{3x^2} \\to \\frac{-\\sin x}{6x} \\to \\frac{-\\cos x}{6}", annotation: "无脑运算")
                    ],
                    keyInsight: "洛必达法则——暴力美学，无视技巧",
                    commonMistakes: []
                ),
                weaponUsed: "洛必达之锤",
                timeRatio: 5.0
            ),
            gaokaoYear: 2022,
            tags: ["极限", "压轴", "洛必达"]
        ),

        // STRIKE 2: Trigonometry & Euler
        Problem(
            id: "strike_trig_001",
            type: .multipleChoice,
            tier: 4,
            formulaIds: ["euler_formula"],
            content: "已知 sin A cos B + cos A sin B = 1，且 A, B 为锐角，求 A + B 的值。",
            contentLatex: "\\sin A \\cos B + \\cos A \\sin B = 1",
            options: ["30°", "45°", "60°", "90°"],
            answer: "90°",
            difficulty: 0.4,
            averageTime: 60,
            hints: ["这是和角公式的逆用", "你可以试着用复数旋转来看待它"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "逆用和角公式", latex: "\\sin(A+B) = 1", annotation: "标准高一做法"),
                    SolutionStep(order: 2, description: "求角度", latex: "A+B = 90^\\circ", annotation: "直接得出")
                ],
                keyInsight: "识别公式结构是关键。",
                commonMistakes: ["不熟悉公式逆用"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "记忆检查", latex: "\\sin(A+B)", annotation: "需要背诵20+公式")
                    ],
                    keyInsight: "依赖死记硬背公式表",
                    commonMistakes: ["符号记反"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "复数投影", latex: "\\text{Im}(e^{iA}e^{iB}) = \\text{Im}(e^{i(A+B)})", annotation: "复数旋转视角"),
                        SolutionStep(order: 2, description: "结论", latex: "\\sin(A+B)=1", annotation: "万能公式来源")
                    ],
                    keyInsight: "欧拉公式——所有三角公式的终极源头，记住一个等于记住全部",
                    commonMistakes: []
                ),
                weaponUsed: "欧拉棱镜",
                timeRatio: 2.0
            ),
            gaokaoYear: 2019,
            tags: ["三角函数", "和差角"]
        ),

        // STRIKE 3: Analytic Geometry & Implicit Diff
        Problem(
            id: "strike_conic_001",
            type: .calculation,
            tier: 5,
            formulaIds: ["ellipse_std"],
            content: "已知椭圆 C: x²/4 + y² = 1，求其在点 P(1, √3/2) 处的切线方程。",
            contentLatex: "\\frac{x^2}{4} + y^2 = 1, P(1, \\frac{\\sqrt{3}}{2})",
            options: nil,
            answer: "x + 2√3y - 4 = 0",
            difficulty: 0.92,
            averageTime: 450,
            hints: ["高中方法：设 y-y0 = k(x-x0)，联立方程使 Δ=0", "降维方法：隐函数求导直接得斜率"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "隐函数求导", latex: "\\frac{2x}{4} + 2yy' = 0", annotation: "两边对x求导"),
                    SolutionStep(order: 2, description: "求斜率", latex: "y' = -\\frac{x}{4y}", annotation: "代入P点坐标"),
                    SolutionStep(order: 3, description: "代入数值", latex: "k = -\\frac{1}{4(\\sqrt{3}/2)} = -\\frac{1}{2\\sqrt{3}}", annotation: "得出斜率"),
                    SolutionStep(order: 4, description: "写出方程", latex: "y - \\frac{\\sqrt{3}}{2} = -\\frac{1}{2\\sqrt{3}}(x - 1)", annotation: "整理得最终式")
                ],
                keyInsight: "隐函数求导避开了繁琐的‘韦达定理+判别式’过程。",
                commonMistakes: ["复合函数求导漏掉2y", "计算斜率出错"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "联立方程", latex: "\\frac{x^2}{4} + (k(x-1)+\\frac{\\sqrt{3}}{2})^2 = 1", annotation: "地狱级运算量"),
                        SolutionStep(order: 2, description: "判别式为零", latex: "\\Delta = 0 \\implies k=...", annotation: "极易出错")
                    ],
                    keyInsight: "通过代数重合性判断切线",
                    commonMistakes: ["运算超时", "计算量巨大导致放弃"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "隐函数求导", latex: "\\frac{x}{2} + 2yy' = 0", annotation: "10秒得出斜率关系")
                    ],
                    keyInsight: "微积分工具——将几何切线问题降维成纯代数求导",
                    commonMistakes: []
                ),
                weaponUsed: "求导刃",
                timeRatio: 8.0
            ),
            gaokaoYear: 2021,
            tags: ["圆锥曲线", "切线", "隐函数"]
        )
    ]

    // MARK: - Heroes (Preserved)

    static let heroes: [MathHero] = [
        MathHero(
            id: "euler",
            name: "欧拉",
            nameEN: "Leonhard Euler",
            era: "1707 - 1783",
            attributes: HeroAttributes(insight: 10, creativity: 10, perseverance: 9, influence: 10),
            weaponSkills: ["欧拉恒等式", "变分法", "图论之父"],
            legendStory: "失明后依然凭借惊人的记忆力和心算能力，统治了数学界半个世纪。",
            famousQuote: "数学是上帝书写宇宙的语言。",
            relatedMysteries: ["seven_bridges", "point_nine_equal_one"],
            portraitEmoji: "👴"
        ),
        MathHero(
            id: "lagrange",
            name: "拉格朗日",
            nameEN: "Joseph-Louis Lagrange",
            era: "1736 - 1813",
            attributes: HeroAttributes(insight: 9, creativity: 10, perseverance: 8, influence: 9),
            weaponSkills: ["中值定理", "乘数法", "分析力学"],
            legendStory: "拿破仑称他为‘数学界的高大金字塔’，他将数学从几何的束缚中解放出来，进入了纯分析的时代。",
            famousQuote: "我把数学看作是一门艺术。",
            relatedMysteries: ["optimization_mystery"],
            portraitEmoji: "🏛️"
        )
    ]

    // MARK: - Mysteries (Preserved)

    static let mysteries: [MathMystery] = [
        MathMystery(
            id: "point_nine_equal_one",
            title: "0.999... 是否等于 1",
            category: .infinityWar,
            shockRating: 10,
            summary: "这个等式引发了无数数学‘战争’。",
            premise: "直觉告诉我们它比1小，但数学证明它们完全相等。",
            arguments: [
                Argument(title: "代数派", content: "令 x = 0.999...，则 10x = 9.999...，相减得 9x = 9，故 x = 1。", isCorrect: true),
                Argument(title: "分数派", content: "1/3 = 0.333...，两边乘3得 1 = 0.999...。", isCorrect: true)
            ],
            proofSteps: [
                ProofStep(order: 1, latex: "x = 0.\\overline{9}", explanation: "定义无限循环小数"),
                ProofStep(order: 2, latex: "x = \\sum_{n=1}^{\\infty} 9 \\cdot 10^{-n}", explanation: "转换为级数"),
                ProofStep(order: 3, latex: "x = \\frac{0.9}{1 - 0.1} = 1", explanation: "级数求和")
            ],
            verdict: "在标准实数系中，0.999... 与 1 是同一个实数的不同名称。",
            historicalContext: "它揭示了人类直觉在面对‘无穷’概念时的局限性。",
            relatedWeaponId: "geom_seq_sn",
            relatedHeroId: "euler",
            votes: MysteryVotes(agreeCount: 8900, disagreeCount: 1240, userVote: nil),
            openQuestion: "如果是在非标准分析中，结果会一样吗？"
        )
    ]

    // MARK: - Weapons (Enriched)

    static let weapons: [DescendWeapon] = [
        DescendWeapon(
            id: "derivative_blade",
            name: "Derivative Blade",
            codename: "求导刃",
            tier: .blade,
            principle: "微积分基础导数",
            tagline: "函数的变化率，瞬间秒杀单调性与极值。",
            unlockConditions: ["linear_eq"],
            slayableGaokaoTypes: ["单调性区间", "切线方程", "不等式恒成立"],
            demonstrations: [
                WeaponDemo(
                    problemTitle: "求 f(x) = x³ - 3x 的单调增区间",
                    standardMethod: "利用 f(x1) - f(x2) 符号判断...",
                    standardSteps: 6,
                    descentMethod: "f'(x) = 3x² - 3 > 0, x² > 1",
                    descentSteps: 2,
                    timeRatio: "3x"
                )
            ],
            masteryLevel: .beginner
        ),
        DescendWeapon(
            id: "lopital_hammer",
            name: "L'Hôpital's Hammer",
            codename: "洛必达之锤",
            tier: .heavyWeapon,
            principle: "当极限呈 0/0 或 ∞/∞ 时，分子分母求导求极限。",
            tagline: "粉碎所有复杂的极限陷阱。",
            unlockConditions: ["derivative_blade"],
            slayableGaokaoTypes: ["极限判定", "渐近线分析", "复杂函数趋势"],
            demonstrations: [
                WeaponDemo(
                    problemTitle: "求 (sin x - x) / x³ 的极限",
                    standardMethod: "无穷小替换或泰勒展开",
                    standardSteps: 8,
                    descentMethod: "连续求导三次：-cos x / 6",
                    descentSteps: 3,
                    timeRatio: "5x"
                )
            ],
            masteryLevel: .locked
        )
    ]

    // MARK: - Daily Strikes (Preserved)

    static let dailyStrikes: [DailyStrike] = [
        DailyStrike(
            type: "思维跃迁",
            question: "为什么所有的封闭凸多面体，顶点数 - 棱数 + 面数 永远等于 2？",
            answer: "这就是著名的欧拉示性数 V - E + F = 2。",
            detail: "它揭示了空间的拓扑性质，与物体的大小和形状无关。即便把多面体拉伸成圆球，这个规律依然成立。"
        )
    ]
}
