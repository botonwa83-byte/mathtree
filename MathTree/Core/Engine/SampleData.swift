import Foundation

enum SampleData {

    // MARK: - Formulas (Preserved & Full Spectrum)

    static let formulas: [Formula] = [
        // ELEMENTARY
        Formula(id: "add_commute", name: "加法交换律", latex: "a + b = b + a", level: .elementary, category: .algebra, prerequisites: [], derivations: ["add_assoc"], advancedForm: "group_theory", gaokaoRelevance: 1.0, tags: ["算术", "基础"], intuition: "两个数相加，谁先谁后不重要。", leapfrogKey: false, unlockedBy: nil),
        Formula(id: "circle_circum", name: "圆周长公式", latex: "C = 2\\pi r", level: .elementary, category: .geometry, prerequisites: [], derivations: ["circle_area"], advancedForm: "differential_geom", gaokaoRelevance: 1.0, tags: ["几何", "圆"], intuition: "圆的腰带长度。", leapfrogKey: false, unlockedBy: nil),
        
        // MIDDLE
        Formula(id: "pythagorean", name: "勾股定理", latex: "a^2 + b^2 = c^2", level: .middle, category: .geometry, prerequisites: [], derivations: ["dist_formula"], advancedForm: "inner_product", gaokaoRelevance: 0.95, tags: ["几何", "核心"], intuition: "直角三角形中，两直边的平方和等于斜边的平方。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "quad_root_formula", name: "求根公式", latex: "x = \\frac{-b \\pm \\sqrt{b^2-4ac}}{2a}", level: .middle, category: .algebra, prerequisites: [], derivations: ["vieta_formulas"], advancedForm: "galois_theory", gaokaoRelevance: 1.0, tags: ["方程", "必考"], intuition: "万能钥匙，解开所有二次方程。", leapfrogKey: true, unlockedBy: nil),

        // HIGH SCHOOL
        Formula(id: "sin_sq_cos_sq", name: "同角三角恒等式", latex: "\\sin^2\\alpha + \\cos^2\\alpha = 1", level: .high, category: .trigonometry, prerequisites: ["pythagorean"], derivations: [], advancedForm: "unit_circle", gaokaoRelevance: 1.0, tags: ["三角函数", "必考"], intuition: "圆上的点坐标平方和永远是1。", leapfrogKey: false, unlockedBy: nil),
        Formula(id: "sin_add", name: "正弦和角公式", latex: "\\sin(\\alpha + \\beta) = \\sin\\alpha\\cos\\beta + \\cos\\alpha\\sin\\beta", level: .high, category: .trigonometry, prerequisites: ["sin_sq_cos_sq"], derivations: ["sin_double"], advancedForm: "euler_formula", gaokaoRelevance: 0.98, tags: ["三角函数", "核心变换"], intuition: "旋转的叠加。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "arith_sn", name: "等差数列求和", latex: "S_n = \\frac{n(a_1 + a_n)}{2}", level: .high, category: .sequences, prerequisites: [], derivations: [], advancedForm: "integration", gaokaoRelevance: 1.0, tags: ["数列", "必考"], intuition: "首尾配对求和。", leapfrogKey: false, unlockedBy: nil),
        Formula(id: "ellipse_std", name: "椭圆标准方程", latex: "\\frac{x^2}{a^2} + \\frac{y^2}{b^2} = 1", level: .high, category: .conicSections, prerequisites: ["pythagorean"], derivations: [], advancedForm: "projection", gaokaoRelevance: 1.0, tags: ["圆锥曲线", "必考"], intuition: "拉扁了的圆。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "deriv_power", name: "幂函数导数", latex: "(x^n)' = nx^{n-1}", level: .high, category: .calculus, prerequisites: [], derivations: [], advancedForm: "operator", gaokaoRelevance: 1.0, tags: ["导数", "核心"], intuition: "降幂打击！", leapfrogKey: true, unlockedBy: nil),

        // UNIVERSITY
        Formula(id: "euler_formula", name: "欧拉公式", latex: "e^{i\\theta} = \\cos\\theta + i\\sin\\theta", level: .university, category: .complexNumbers, prerequisites: ["sin_add"], derivations: [], advancedForm: "complex_analysis", gaokaoRelevance: 0.2, tags: ["复变函数", "降维利器"], intuition: "数学中最美的公式，统一了代数与三角。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "lopital_rule", name: "洛必达法则", latex: "\\lim_{x \\to a} \\frac{f(x)}{g(x)} = \\lim_{x \\to a} \\frac{f'(x)}{g'(x)}", level: .university, category: .calculus, prerequisites: ["derivative_def"], derivations: [], advancedForm: "mean_value", gaokaoRelevance: 0.8, tags: ["极限", "秒杀"], intuition: "暴力拆解极限陷阱。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "fundamental_calc", name: "微积分基本定理", latex: "\\int_a^b f(x)dx = F(b) - F(a)", level: .university, category: .calculus, prerequisites: ["derivative_def"], derivations: [], advancedForm: "stokes", gaokaoRelevance: 0.9, tags: ["积分", "核心"], intuition: "微分与积分互为逆运算。", leapfrogKey: true, unlockedBy: nil)
    ]

    // MARK: - Mysteries (Expanded Exhaustive Edition)

    static let mysteries: [MathMystery] = [
        // CASE 1: 0.999... vs 1 (INFINITY WAR)
        MathMystery(
            id: "099_equals_1",
            title: "0.999... 到底等不等于 1？",
            category: .infinityWar,
            shockRating: 7,
            summary: "一个让互联网每年都爆发争论的数学问题",
            premise: "大多数人凭直觉认为 0.999... 永远比 1 少一点点。但在实数系中，它们完全相等。",
            arguments: [
                Argument(title: "直觉派", content: "既然它叫0.999...，那就说明还没到1啊！", isCorrect: false),
                Argument(title: "分数派", content: "1/3 = 0.333...，两边乘以3即得 1 = 0.999...。", isCorrect: true)
            ],
            proofSteps: [
                ProofStep(order: 1, latex: "x = 0.\\overline{9}", explanation: "设 x 等于 0.999..."),
                ProofStep(order: 2, latex: "10x = 9.\\overline{9}", explanation: "两边乘以10"),
                ProofStep(order: 3, latex: "9x = 9 \\implies x = 1", explanation: "相减并解得 x = 1")
            ],
            verdict: "0.999... 和 1 是同一个实数的不同表示方式。",
            historicalContext: "它揭示了人类在处理‘无限’这一概念时直觉的脆弱。",
            relatedWeaponId: "lopital_rule",
            relatedHeroId: "cauchy",
            votes: MysteryVotes(agreeCount: 15400, disagreeCount: 3200, userVote: nil),
            openQuestion: "如果我们将系统改为非标准分析，会发生什么？"
        ),

        // CASE 2: MONTY HALL PROBLEM (INTUITIVE REBEL)
        MathMystery(
            id: "monty_hall",
            title: "三门问题：换还是不换？",
            category: .intuitiveRebel,
            shockRating: 10,
            summary: "概率论中最臭名昭著的‘直觉杀手’",
            premise: "三扇门，一扇后是汽车，两扇后是山羊。你选了一扇，主持人打开另一扇有羊的门。此时，换门中奖率会翻倍吗？",
            arguments: [
                Argument(title: "平衡派", content: "剩两扇门，概率各50%，换不换都一样。", isCorrect: false),
                Argument(title: "统计派", content: "换门的中奖率是 2/3，不换只有 1/3。", isCorrect: true)
            ],
            proofSteps: [
                ProofStep(order: 1, latex: "P(Win | \\text{No Change}) = 1/3", explanation: "最初选中的概率是1/3"),
                ProofStep(order: 2, latex: "P(Lose | \\text{No Change}) = 2/3", explanation: "最初选错的概率是2/3"),
                ProofStep(order: 3, latex: "P(Win | \\text{Change}) = 2/3", explanation: "只要最初选错，换了就一定赢。")
            ],
            verdict: "你应该换门。换门会让你的胜率从 33.3% 提升到 66.7%。",
            historicalContext: "当这个问题首次在杂志发表时，甚至有很多数学博士写信抗议，声称结论是错误的。",
            relatedWeaponId: "bayes_theorem",
            relatedHeroId: "bayes",
            votes: MysteryVotes(agreeCount: 21000, disagreeCount: 8400, userVote: nil),
            openQuestion: "如果有100扇门，主持人打开了98扇有羊的门，你的直觉会变吗？"
        ),

        // CASE 3: BANACH-TARSKI PARADOX (INTUITIVE REBEL)
        MathMystery(
            id: "banach_tarski",
            title: "分球怪论：点石成金？",
            category: .intuitiveRebel,
            shockRating: 10,
            summary: "将一个球切碎，竟然能拼出两个一模一样的球！",
            premise: "根据选择公理，我们可以将一个实心球体分成有限块，然后仅通过旋转和平移，拼成两个体积完全相同的球。",
            arguments: [
                Argument(title: "物质守恒派", content: "体积怎么可能凭空翻倍？这违反了物理定律。", isCorrect: true),
                Argument(title: "不可测集派", content: "数学上的‘块’可以是非常诡异的不可测集，没有体积概念。", isCorrect: true)
            ],
            proofSteps: [
                ProofStep(order: 1, latex: "S^2 = A \\cup B \\cup C \\dots", explanation: "将球体分解为特定结构的块"),
                ProofStep(order: 2, latex: "\\text{Rotations } \\rho, \\tau", explanation: "利用非对易旋转群的特性"),
                ProofStep(order: 3, latex: "V_{new} = 2 \\times V_{old}", explanation: "重新组合得到双倍体积")
            ],
            verdict: "在纯数学定义下，这是成立的。但在现实物理世界中无法实现。",
            historicalContext: "它挑战了我们对‘体积’和‘选择公理’的根本认知。",
            relatedWeaponId: "det_def",
            relatedHeroId: "banach",
            votes: MysteryVotes(agreeCount: 4500, disagreeCount: 1200, userVote: nil),
            openQuestion: "如果这被证明是物理可行的，我们的世界会变成什么样？"
        ),

        // CASE 4: RUSSELL'S PARADOX (FOUNDATION)
        MathMystery(
            id: "russell_paradox",
            title: "理发师悖论：数学的大地震",
            category: .foundation,
            shockRating: 9,
            summary: "一个简单的逻辑圈套，差点毁掉了整个数学地基",
            premise: "城里唯一的理发师立下规矩：‘我只给城里所有不给自己刮脸的人刮脸。’那么，他该给自己刮脸吗？",
            arguments: [
                Argument(title: "刮脸派", content: "如果他给自己刮，他就违反了‘只给不给自己刮脸的人刮’的规矩。", isCorrect: false),
                Argument(title: "不刮派", content: "如果他不给自己刮，根据规矩，他必须给自己刮脸。", isCorrect: false)
            ],
            proofSteps: [
                ProofStep(order: 1, latex: "R = \\{x | x \\notin x\\}", explanation: "定义包含所有不包含自身的集合的集合"),
                ProofStep(order: 2, latex: "R \\in R \\iff R \\notin R", explanation: "导出逻辑矛盾"),
                ProofStep(order: 3, latex: "\\text{Logic Error}", explanation: "基础集合论宣告崩溃")
            ],
            verdict: "朴素集合论存在漏洞。后来通过ZFC公理化体系修复了这一问题。",
            historicalContext: "罗素在1901年提出此悖论，当时数学家弗雷格正准备出版他的终身著作，得知此消息后几近崩溃。",
            relatedWeaponId: "set_intersect",
            relatedHeroId: "russell",
            votes: MysteryVotes(agreeCount: 12000, disagreeCount: 500, userVote: nil),
            openQuestion: "我们现在的数学地基，真的彻底安全了吗？"
        ),

        // CASE 5: GABRIEL'S HORN (INFINITY WAR)
        MathMystery(
            id: "gabriel_horn",
            title: "加百列号角：有限与无限",
            category: .infinityWar,
            shockRating: 8,
            summary: "这个喇叭可以装满油漆，却涂不满自己的表面？",
            premise: "考虑函数 y = 1/x 在 [1, ∞) 上的旋转体。数学计算显示，它的体积是有限的，但表面积却是无限的。",
            arguments: [
                Argument(title: "矛盾派", content: "既然能装满漆，那油漆一定覆盖了所有表面，表面积必须有限。", isCorrect: false),
                Argument(title: "数学派", content: "体积和面积是不同维度的积分，它们在无限远处的发散速度不同。", isCorrect: true)
            ],
            proofSteps: [
                ProofStep(order: 1, latex: "V = \\int_1^{\\infty} \\pi (\\frac{1}{x})^2 dx = \\pi", explanation: "体积积分收敛于 π"),
                ProofStep(order: 2, latex: "S = \\int_1^{\\infty} 2\\pi \\frac{1}{x} \\sqrt{1 + y'^2} dx > \\int \\frac{dx}{x}", explanation: "面积积分像调和级数一样发散")
            ],
            verdict: "这是真实的数学性质。它提醒我们，低维的直觉无法完全理解高维的无限。",
            historicalContext: "17世纪数学家托里拆利发现此现象时，被这种‘超越自然’的性质深深震撼。",
            relatedWeaponId: "fundamental_calc",
            relatedHeroId: "torricelli",
            votes: MysteryVotes(agreeCount: 6700, disagreeCount: 1100, userVote: nil),
            openQuestion: "如果油漆分子也有体积，这个悖论在现实中还成立吗？"
        )
    ]

    // MARK: - Problems (Strike Pack)

    static let problems: [Problem] = [
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
            hints: ["这是 0/0 型极限", "利用洛必达法则连续求导"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "第一次求导", latex: "\\lim \\frac{\\cos x - 1}{3x^2}", annotation: "0/0"),
                    SolutionStep(order: 2, description: "第二次求导", latex: "\\lim \\frac{-\\sin x}{6x}", annotation: "利用 sinx/x -> 1"),
                    SolutionStep(order: 3, description: "得出结论", latex: "-1/6", annotation: "秒杀")
                ],
                keyInsight: "洛必达法则是处理复杂极限的通用重型武器。",
                commonMistakes: ["符号出错", "忘记系数"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(steps: [], keyInsight: "等价无穷小替换", commonMistakes: []),
                descentMethod: SolutionPath(steps: [], keyInsight: "洛必达法则三次求导", commonMistakes: []),
                weaponUsed: "洛必达之锤",
                timeRatio: 5.0
            ),
            gaokaoYear: 2022,
            tags: ["极限", "压轴"]
        )
    ]

    // MARK: - Heroes (Preserved)

    static let heroes: [MathHero] = [
        MathHero(id: "euler", name: "欧拉", nameEN: "Leonhard Euler", era: "1707 - 1783", attributes: HeroAttributes(insight: 10, creativity: 10, perseverance: 9, influence: 10), weaponSkills: ["欧拉恒等式", "变分法"], legendStory: "失明后依然统治数学界。", famousQuote: "数学是上帝书写宇宙的语言。", relatedMysteries: ["099_equals_1", "gabriel_horn"], portraitEmoji: "👴"),
        MathHero(id: "gauss", name: "高斯", nameEN: "Carl Friedrich Gauss", era: "1777 - 1855", attributes: HeroAttributes(insight: 10, creativity: 9, perseverance: 10, influence: 10), weaponSkills: ["曲率", "正态分布"], legendStory: "3岁纠错，10岁秒算求和，终生追求完美的数学王子。", famousQuote: "数学是科学的女王。", relatedMysteries: [], portraitEmoji: "👑"),
        MathHero(id: "russell", name: "罗素", nameEN: "Bertrand Russell", era: "1872 - 1970", attributes: HeroAttributes(insight: 10, creativity: 8, perseverance: 9, influence: 10), weaponSkills: ["逻辑主义", "数学原理"], legendStory: "他不只是数学家，还是诺贝尔文学奖得主，他用逻辑挑战了整个数学界。", famousQuote: "数学是唯一一种我们不知道自己在说什么，也不知道所说的是否正确的科学。", relatedMysteries: ["russell_paradox"], portraitEmoji: "🎩")
    ]

    // MARK: - Weapons

    static let weapons: [DescendWeapon] = [
        DescendWeapon(id: "derivative_blade", name: "Derivative Blade", codename: "求导刃", tier: .blade, principle: "导数", tagline: "变化率秒杀", unlockConditions: [], slayableGaokaoTypes: ["单调性"], demonstrations: [], masteryLevel: .beginner),
        DescendWeapon(id: "lopital_hammer", name: "L'Hôpital's Hammer", codename: "洛必达之锤", tier: .heavyWeapon, principle: "导数比极限", tagline: "极限陷阱粉碎机", unlockConditions: [], slayableGaokaoTypes: ["极限"], demonstrations: [], masteryLevel: .locked)
    ]

    // MARK: - Daily Strikes

    static let dailyStrikes: [DailyStrike] = [
        DailyStrike(type: "思维", question: "为什么球的表面积是体积的导数？", answer: "因为微小的半径增加带来的体积增加量，正好铺满了球的表面。", detail: "微分几何的直观体现。")
    ]
}
