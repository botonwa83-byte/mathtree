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
        // CASE 1: 0.999... vs 1 (RESTORED)
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

        // CASE 2: MONTY HALL PROBLEM (RESTORED)
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

        // CASE 3: BANACH-TARSKI PARADOX (RESTORED)
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

        // CASE 4: RUSSELL'S PARADOX (RESTORED)
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

        // CASE 5: GABRIEL'S HORN (RESTORED)
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
            hints: ["洛必达法则"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "求导三次", latex: "\\lim \\frac{-\\cos x}{6}", annotation: "结果 -1/6")
                ],
                keyInsight: "高阶思维降维打击。",
                commonMistakes: []
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(steps: [], keyInsight: "等价无穷小", commonMistakes: []),
                descentMethod: SolutionPath(steps: [], keyInsight: "洛必达三次求导", commonMistakes: []),
                weaponUsed: "洛必达之锤",
                timeRatio: 5.0
            ),
            gaokaoYear: 2022,
            tags: ["极限", "压轴"]
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
