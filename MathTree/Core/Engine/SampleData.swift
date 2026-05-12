import Foundation

enum SampleData {

    // MARK: - Formulas (Exhaustive Spectrum: Elem -> Univ)

    static let formulas: [Formula] = [
        // -------------------------------------------------------------------------
        // ELEMENTARY & MIDDLE (Essentials)
        // -------------------------------------------------------------------------
        Formula(id: "add_commute", name: "加法交换律", latex: "a + b = b + a", level: .elementary, category: .algebra, prerequisites: [], derivations: ["add_assoc"], advancedForm: "group_theory", gaokaoRelevance: 1.0, tags: ["算术", "基础"], intuition: "顺序不换，结果不变。", leapfrogKey: false, unlockedBy: nil),
        Formula(id: "rect_area", name: "矩形面积", latex: "S = a \\times b", level: .elementary, category: .geometry, prerequisites: [], derivations: ["tri_area"], advancedForm: "integration", gaokaoRelevance: 1.0, tags: ["几何", "面积"], intuition: "铺地砖的总数。", leapfrogKey: false, unlockedBy: nil),
        Formula(id: "pythagorean", name: "勾股定理", latex: "a^2 + b^2 = c^2", level: .middle, category: .geometry, prerequisites: ["rect_area"], derivations: ["dist_formula"], advancedForm: "inner_product", gaokaoRelevance: 1.0, tags: ["几何", "核心"], intuition: "直角三角形的三边‘力量’守恒。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "quad_root", name: "二次方程求根公式", latex: "x = \\frac{-b \\pm \\sqrt{b^2-4ac}}{2a}", level: .middle, category: .algebra, prerequisites: [], derivations: ["vieta"], advancedForm: "galois", gaokaoRelevance: 1.0, tags: ["方程", "必考"], intuition: "暴力破解任何二次方程的终极钥匙。", leapfrogKey: true, unlockedBy: nil),

        // -------------------------------------------------------------------------
        // HIGH SCHOOL (Gaokao Core)
        // -------------------------------------------------------------------------
        Formula(id: "sin_add", name: "和角公式", latex: "\\sin(\\alpha + \\beta) = \\sin\\alpha\\cos\\beta + \\cos\\alpha\\sin\\beta", level: .high, category: .trigonometry, prerequisites: ["pythagorean"], derivations: ["double_angle"], advancedForm: "euler_formula", gaokaoRelevance: 1.0, tags: ["三角函数", "核心"], intuition: "旋转的分解与合成。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "cosine_rule", name: "余弦定理", latex: "a^2 = b^2 + c^2 - 2bc\\cos A", level: .high, category: .trigonometry, prerequisites: ["pythagorean"], derivations: [], advancedForm: "vector_dot", gaokaoRelevance: 1.0, tags: ["解三角形", "必考"], intuition: "勾股定理的非直角修正版。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "arith_sn", name: "等差数列求和", latex: "S_n = \\frac{n(a_1+a_n)}{2}", level: .high, category: .sequences, prerequisites: [], derivations: [], advancedForm: "arithmetic_series", gaokaoRelevance: 1.0, tags: ["数列", "必考"], intuition: "首尾配对，整体平衡。", leapfrogKey: false, unlockedBy: nil),
        Formula(id: "geom_sn", name: "等比数列求和", latex: "S_n = \\frac{a_1(1-q^n)}{1-q}", level: .high, category: .sequences, prerequisites: [], derivations: [], advancedForm: "geometric_series", gaokaoRelevance: 1.0, tags: ["数列", "必考"], intuition: "指数级的累积爆发力。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "ellipse_eq", name: "椭圆标准方程", latex: "\\frac{x^2}{a^2} + \\frac{y^2}{b^2} = 1", level: .high, category: .conicSections, prerequisites: ["pythagorean"], derivations: [], advancedForm: "conic_projection", gaokaoRelevance: 1.0, tags: ["圆锥曲线", "核心"], intuition: "被均匀拉伸的圆。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "deriv_power", name: "幂函数导数", latex: "(x^n)' = nx^{n-1}", level: .high, category: .calculus, prerequisites: [], derivations: [], advancedForm: "operator", gaokaoRelevance: 1.0, tags: ["导数", "核心"], intuition: "降幂打击，瞬时变化。", leapfrogKey: true, unlockedBy: nil),

        // -------------------------------------------------------------------------
        // UNIVERSITY (The Ultimate Weaponry)
        // -------------------------------------------------------------------------
        
        // 1. CALCULUS & ANALYSIS
        Formula(id: "lopital_rule", name: "洛必达法则", latex: "\\lim_{x \\to a} \\frac{f(x)}{g(x)} = \\lim_{x \\to a} \\frac{f'(x)}{g'(x)}", level: .university, category: .calculus, prerequisites: ["derivative_def"], derivations: [], advancedForm: "cauchy_mean_value", gaokaoRelevance: 0.8, tags: ["极限", "秒杀"], intuition: "看谁跑得快，谁就决定极限。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "taylor_series", name: "泰勒级数", latex: "f(x) = \\sum_{n=0}^{\\infty} \\frac{f^{(n)}(a)}{n!}(x-a)^n", level: .university, category: .calculus, prerequisites: ["derivative_def"], derivations: ["euler_proof"], advancedForm: "analytic_continuation", gaokaoRelevance: 0.3, tags: ["逼近", "多项式"], intuition: "把复杂曲线切碎成无限个简单多项式。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "nl_formula", name: "牛顿-莱布尼茨公式", latex: "\\int_a^b f(x)dx = F(b) - F(a)", level: .university, category: .calculus, prerequisites: ["derivative_def"], derivations: ["stokes"], advancedForm: "exterior_diff", gaokaoRelevance: 0.9, tags: ["积分", "核心"], intuition: "微分是‘破坏’，积分是‘重建’。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "stokes_theorem", name: "斯托克斯公式", latex: "\\oint_{\\partial\\Sigma} \\mathbf{F} \\cdot d\\mathbf{r} = \\iint_{\\Sigma} (\\nabla \\times \\mathbf{F}) \\cdot d\\mathbf{S}", level: .university, category: .calculus, prerequisites: ["nl_formula"], derivations: [], advancedForm: "generalized_stokes", gaokaoRelevance: 0.05, tags: ["多维分析", "边界"], intuition: "边界的环流等于内部的骚动总和。", leapfrogKey: false, unlockedBy: nil),
        Formula(id: "gaussian_int", name: "高斯积分", latex: "\\int_{-\\infty}^{\\infty} e^{-x^2} dx = \\sqrt{\\pi}", level: .university, category: .calculus, prerequisites: [], derivations: [], advancedForm: "normal_dist", gaokaoRelevance: 0.1, tags: ["积分技巧", "统计基础"], intuition: "钟形曲线下的面积竟然是圆周率的开方。", leapfrogKey: true, unlockedBy: nil),

        // 2. LINEAR ALGEBRA
        Formula(id: "det_def", name: "行列式", latex: "\\det(A) = \\sum \\text{sgn}(\\sigma) a_{1,\\sigma(1)} \\dots a_{n,\\sigma(n)}", level: .university, category: .linearAlgebra, prerequisites: [], derivations: ["matrix_inv"], advancedForm: "wedge_product", gaokaoRelevance: 0.15, tags: ["矩阵", "体积"], intuition: "线性变换后空间的‘体积膨胀率’。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "eigen_eq", name: "特征值方程", latex: "A\\mathbf{v} = \\lambda\\mathbf{v}", level: .university, category: .linearAlgebra, prerequisites: ["det_def"], derivations: [], advancedForm: "spectral_theory", gaokaoRelevance: 0.1, tags: ["矩阵", "核心"], intuition: "变换中那些只长个子、不转弯的神奇方向。", leapfrogKey: true, unlockedBy: nil),
        
        // 3. COMPLEX & TRANSFORMS
        Formula(id: "euler_formula", name: "欧拉公式", latex: "e^{i\\theta} = \\cos\\theta + i\\sin\\theta", level: .university, category: .complexNumbers, prerequisites: ["taylor_series"], derivations: ["euler_identity"], advancedForm: "harmonic_analysis", gaokaoRelevance: 0.2, tags: ["复数", "上帝公式"], intuition: "将指数、三角、虚数完美合一的终极美学。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "fourier_trans", name: "傅里叶变换", latex: "\\hat{f}(\\xi) = \\int_{-\\infty}^{\\infty} f(x)e^{-2\\pi i x \\xi} dx", level: .university, category: .calculus, prerequisites: ["euler_formula"], derivations: [], advancedForm: "quantum_mechanics", gaokaoRelevance: 0.0, tags: ["信号处理", "频谱"], intuition: "把混乱的信号拆解成纯净的频率彩虹。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "laplace_trans", name: "拉普拉斯变换", latex: "F(s) = \\int_{0}^{\\infty} f(t)e^{-st} dt", level: .university, category: .calculus, prerequisites: [], derivations: [], advancedForm: "control_theory", gaokaoRelevance: 0.1, tags: ["微分方程", "系统论"], intuition: "将难搞的微分运算变成简单的初中代数。", leapfrogKey: false, unlockedBy: nil),

        // 4. PROBABILITY & OTHERS
        Formula(id: "bayes_theorem", name: "贝叶斯定理", latex: "P(A|B) = \\frac{P(B|A)P(A)}{P(B)}", level: .university, category: .probability, prerequisites: [], derivations: [], advancedForm: "ai_inference", gaokaoRelevance: 0.8, tags: ["概率", "决策"], intuition: "有了新证据，该如何科学地更新你的偏见。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "central_limit", name: "中心极限定理", latex: "\\bar{X}_n \\xrightarrow{d} N(\\mu, \\sigma^2/n)", level: .university, category: .probability, prerequisites: [], derivations: [], advancedForm: "asymptotics", gaokaoRelevance: 0.5, tags: ["统计基础", "自然规律"], intuition: "无论起点多么奇葩，终点都是正态分布。", leapfrogKey: false, unlockedBy: nil)
    ]

    // MARK: - Problems (The High-Level Strike Pack)

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
                    SolutionStep(order: 1, description: "识别 0/0 型", latex: "\\sin 0 - 0 = 0", annotation: "符合洛必达"),
                    SolutionStep(order: 2, description: "三次求导秒杀", latex: "\\lim \\frac{-\\cos x}{6}", annotation: "代入 x=0 得 -1/6")
                ],
                keyInsight: "洛必达法则是处理复杂极限的暴力美学工具。",
                commonMistakes: ["求导系数算错"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(steps: [], keyInsight: "泰勒展开 (超纲)", commonMistakes: []),
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
        MathHero(id: "euler", name: "欧拉", nameEN: "Leonhard Euler", era: "1707 - 1783", attributes: HeroAttributes(insight: 10, creativity: 10, perseverance: 9, influence: 10), weaponSkills: ["欧拉恒等式", "变分法"], legendStory: "失明后统治数学界半个世纪。", famousQuote: "数学是上帝书写宇宙的语言。", relatedMysteries: ["099_equals_1"], portraitEmoji: "👴"),
        MathHero(id: "gauss", name: "高斯", nameEN: "Carl Friedrich Gauss", era: "1777 - 1855", attributes: HeroAttributes(insight: 10, creativity: 9, perseverance: 10, influence: 10), weaponSkills: ["正态分布", "曲率"], legendStory: "3岁纠错，10岁秒算，完美的数学王子。", famousQuote: "数学是科学的女王。", relatedMysteries: ["monty_hall"], portraitEmoji: "👑")
    ]

    // MARK: - Mysteries (Expanded)

    static let mysteries: [MathMystery] = [
        MathMystery(
            id: "monty_hall",
            title: "三门问题",
            category: .intuitiveRebel,
            shockRating: 10,
            summary: "概率直觉的终结者",
            premise: "换门胜率真的会翻倍吗？",
            arguments: [Argument(title: "统计派", content: "换门赢面 2/3", isCorrect: true)],
            proofSteps: [ProofStep(order: 1, latex: "P=2/3", explanation: "直觉挑战")],
            verdict: "科学证明，换门更明智。",
            historicalContext: "曾引发全美数学大讨论。",
            relatedWeaponId: "bayes_theorem",
            relatedHeroId: nil,
            votes: MysteryVotes(agreeCount: 21000, disagreeCount: 8400, userVote: nil),
            openQuestion: "100扇门又如何？"
        )
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
