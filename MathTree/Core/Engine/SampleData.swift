import Foundation

enum SampleData {

    // MARK: - Formulas

    static let formulas: [Formula] = [
        // =========================================================================
        // ELEMENTARY (小学)
        // =========================================================================
        Formula(id: "add_commute", name: "加法交换律", latex: "a + b = b + a", level: .elementary, category: .algebra, prerequisites: [], derivations: ["add_assoc"], advancedForm: "group_theory", gaokaoRelevance: 1.0, tags: ["算术", "基础"], intuition: "两个数相加，谁先谁后不重要。", leapfrogKey: false, unlockedBy: nil),
        Formula(id: "rect_area", name: "矩形面积", latex: "S = a \\times b", level: .elementary, category: .geometry, prerequisites: [], derivations: ["tri_area"], advancedForm: "integral_def", gaokaoRelevance: 1.0, tags: ["几何", "面积"], intuition: "长乘以宽，铺满地面的地砖数。", leapfrogKey: false, unlockedBy: nil),
        Formula(id: "circle_circum", name: "圆周长公式", latex: "C = 2\\pi r", level: .elementary, category: .geometry, prerequisites: [], derivations: ["circle_area"], advancedForm: "differential_geom", gaokaoRelevance: 1.0, tags: ["几何", "圆"], intuition: "圆的腰带长度，是直径的3.14倍多。", leapfrogKey: false, unlockedBy: nil),

        // =========================================================================
        // MIDDLE SCHOOL (初中) - EXHAUSTIVE
        // =========================================================================
        
        // 1. Algebra & Identities
        Formula(id: "sq_diff_identity", name: "平方差公式", latex: "(a+b)(a-b) = a^2 - b^2", level: .middle, category: .algebra, prerequisites: ["rect_area"], derivations: [], advancedForm: "ring_theory", gaokaoRelevance: 1.0, tags: ["代数", "恒等式"], intuition: "两个数的和乘以它们的差，等于它们的平方差。", leapfrogKey: false, unlockedBy: nil),
        Formula(id: "sq_sum_identity", name: "完全平方公式", latex: "(a \\pm b)^2 = a^2 \\pm 2ab + b^2", level: .middle, category: .algebra, prerequisites: ["rect_area"], derivations: [], advancedForm: "binomial_theorem", gaokaoRelevance: 1.0, tags: ["代数", "核心公式"], intuition: "正方形边长增加b后，面积增加了一个小正方形和两个长方形。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "abs_val_def", name: "绝对值定义", latex: "|a| = \\begin{cases} a & (a \\ge 0) \\\\ -a & (a < 0) \\end{cases}", level: .middle, category: .algebra, prerequisites: [], derivations: [], advancedForm: "norm_space", gaokaoRelevance: 1.0, tags: ["数系", "基础"], intuition: "数轴上点到原点的距离，永远是正的。", leapfrogKey: false, unlockedBy: nil),

        // 2. Equations & Inequalities
        Formula(id: "quad_root_formula", name: "求根公式", latex: "x = \\frac{-b \\pm \\sqrt{b^2-4ac}}{2a}", level: .middle, category: .algebra, prerequisites: ["sq_sum_identity"], derivations: ["vieta_formulas"], advancedForm: "galois_theory", gaokaoRelevance: 1.0, tags: ["方程", "必考"], intuition: "一招制胜！给任何二次方程都能暴力解出根。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "vieta_formulas_mid", name: "韦达定理", latex: "x_1+x_2 = -\\frac{b}{a}, x_1x_2 = \\frac{c}{a}", level: .middle, category: .algebra, prerequisites: ["quad_root_formula"], derivations: [], advancedForm: "symmetric_polynomial", gaokaoRelevance: 1.0, tags: ["方程", "核心技巧"], intuition: "不需要解出根，就能知道根的和与积。", leapfrogKey: true, unlockedBy: nil),

        // 3. Functions
        Formula(id: "linear_func_std", name: "一次函数标准式", latex: "y = kx + b \\quad (k \\neq 0)", level: .middle, category: .algebra, prerequisites: ["linear_eq"], derivations: ["point_slope"], advancedForm: "linear_map", gaokaoRelevance: 1.0, tags: ["函数", "直线"], intuition: "斜率k决定陡峭程度，截距b决定起点高度。", leapfrogKey: false, unlockedBy: nil),
        Formula(id: "inverse_func_std", name: "反比例函数", latex: "y = \\frac{k}{x} \\quad (k \\neq 0)", level: .middle, category: .algebra, prerequisites: [], derivations: ["hyperbola"], advancedForm: "reciprocal_map", gaokaoRelevance: 0.95, tags: ["函数", "双曲线"], intuition: "你增我减，乘积恒定。", leapfrogKey: false, unlockedBy: nil),
        Formula(id: "quad_func_vertex", name: "二次函数顶点式", latex: "y = a(x-h)^2 + k", level: .middle, category: .algebra, prerequisites: ["sq_sum_identity"], derivations: [], advancedForm: "transformation", gaokaoRelevance: 1.0, tags: ["函数", "抛物线"], intuition: "直接锁定抛物线的‘最尖端’（顶点）位置。", leapfrogKey: true, unlockedBy: nil),

        // 4. Geometry
        Formula(id: "pythagorean", name: "勾股定理", latex: "a^2 + b^2 = c^2", level: .middle, category: .geometry, prerequisites: ["rect_area"], derivations: ["dist_formula"], advancedForm: "inner_product", gaokaoRelevance: 1.0, tags: ["几何", "核心"], intuition: "直角三角形中，两直边的‘力量’之和等于斜边的‘力量’。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "tri_angle_sum_mid", name: "三角形内角和", latex: "\\angle A + \\angle B + \\angle C = 180^\\circ", level: .middle, category: .geometry, prerequisites: [], derivations: [], advancedForm: "topology", gaokaoRelevance: 1.0, tags: ["几何", "基础"], intuition: "无论怎么拉扯三角形，它的三个角拼在一起总是平角。", leapfrogKey: false, unlockedBy: nil),
        Formula(id: "sim_tri_ratio", name: "相似三角形性质", latex: "\\frac{S_1}{S_2} = (\\frac{a_1}{a_2})^2 = k^2", level: .middle, category: .geometry, prerequisites: [], derivations: [], advancedForm: "homothety", gaokaoRelevance: 1.0, tags: ["几何", "相似"], intuition: "照片放大一倍，面积可是翻了四倍哦。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "circle_area_mid", name: "圆面积公式", latex: "S = \\pi r^2", level: .middle, category: .geometry, prerequisites: ["circle_circum"], derivations: ["sphere_vol"], advancedForm: "integration", gaokaoRelevance: 1.0, tags: ["几何", "圆"], intuition: "切成无数个微小扇形拼成的‘矩形’。", leapfrogKey: false, unlockedBy: nil),
        Formula(id: "arc_len_formula", name: "弧长公式", latex: "l = \\frac{n\\pi r}{180}", level: .middle, category: .geometry, prerequisites: ["circle_circum"], derivations: ["sector_area"], advancedForm: "radian_measure", gaokaoRelevance: 0.9, tags: ["几何", "圆"], intuition: "圆周长按比例‘切’出来的一段。", leapfrogKey: false, unlockedBy: nil),

        // 5. Statistics & Probability
        Formula(id: "mean_formula", name: "平均数", latex: "\\bar{x} = \\frac{x_1 + x_2 + \\dots + x_n}{n}", level: .middle, category: .probability, prerequisites: [], derivations: ["variance"], advancedForm: "expectation", gaokaoRelevance: 1.0, tags: ["统计", "基础"], intuition: "削峰填谷，找出一组数的‘平衡点’。", leapfrogKey: false, unlockedBy: nil),

        // =========================================================================
        // HIGH SCHOOL (高中) - EXHAUSTIVE
        // =========================================================================
        Formula(id: "sin_sq_cos_sq", name: "同角三角恒等式", latex: "\\sin^2\\alpha + \\cos^2\\alpha = 1", level: .high, category: .trigonometry, prerequisites: ["pythagorean"], derivations: [], advancedForm: "unit_circle", gaokaoRelevance: 1.0, tags: ["三角函数", "必考"], intuition: "单位圆上的点，坐标平方和永远是1。", leapfrogKey: false, unlockedBy: nil),
        Formula(id: "sin_add", name: "正弦和角公式", latex: "\\sin(\\alpha + \\beta) = \\sin\\alpha\\cos\\beta + \\cos\\alpha\\sin\\beta", level: .high, category: .trigonometry, prerequisites: ["sin_sq_cos_sq"], derivations: ["sin_double"], advancedForm: "euler_formula", gaokaoRelevance: 0.98, tags: ["三角函数", "核心变换"], intuition: "旋转的叠加。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "sine_rule", name: "正弦定理", latex: "\\frac{a}{\\sin A} = \\frac{b}{\\sin B} = \\frac{c}{\\sin C} = 2R", level: .high, category: .trigonometry, prerequisites: [], derivations: [], advancedForm: "diff_form", gaokaoRelevance: 0.95, tags: ["解三角形", "必考"], intuition: "边长与对角的张开程度成正比。", leapfrogKey: false, unlockedBy: nil),
        Formula(id: "cosine_rule", name: "余弦定理", latex: "a^2 = b^2 + c^2 - 2bc\\cos A", level: .high, category: .trigonometry, prerequisites: ["pythagorean"], derivations: [], advancedForm: "inner_product", gaokaoRelevance: 0.98, tags: ["解三角形", "核心"], intuition: "勾股定理的万能版。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "arith_sn", name: "等差数列求和", latex: "S_n = \\frac{n(a_1 + a_n)}{2}", level: .high, category: .sequences, prerequisites: [], derivations: [], advancedForm: "integration", gaokaoRelevance: 1.0, tags: ["数列", "必考"], intuition: "首尾配对求和。", leapfrogKey: false, unlockedBy: nil),
        Formula(id: "geom_sn", name: "等比数列求和", latex: "S_n = \\frac{a_1(1-q^n)}{1-q}", level: .high, category: .sequences, prerequisites: [], derivations: [], advancedForm: "geometric_series", gaokaoRelevance: 1.0, tags: ["数列", "必考"], intuition: "长期累积的爆发力。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "ellipse_std", name: "椭圆标准方程", latex: "\\frac{x^2}{a^2} + \\frac{y^2}{b^2} = 1", level: .high, category: .conicSections, prerequisites: ["pythagorean"], derivations: [], advancedForm: "projection", gaokaoRelevance: 1.0, tags: ["圆锥曲线", "必考"], intuition: "拉扁了的圆。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "deriv_power", name: "幂函数导数", latex: "(x^n)' = nx^{n-1}", level: .high, category: .calculus, prerequisites: [], derivations: [], advancedForm: "operator", gaokaoRelevance: 1.0, tags: ["导数", "核心"], intuition: "降幂打击！", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "combination", name: "组合数公式", latex: "C_n^k = \\frac{n!}{k!(n-k)!}", level: .high, category: .probability, prerequisites: [], derivations: [], advancedForm: "gamma", gaokaoRelevance: 1.0, tags: ["概率", "计数"], intuition: "不看顺序选人。", leapfrogKey: false, unlockedBy: nil),

        // =========================================================================
        // UNIVERSITY (大学 - 降维武器库)
        // =========================================================================
        Formula(id: "euler_formula", name: "欧拉公式", latex: "e^{i\\theta} = \\cos\\theta + i\\sin\\theta", level: .university, category: .complexNumbers, prerequisites: ["sin_add"], derivations: [], advancedForm: "complex_analysis", gaokaoRelevance: 0.2, tags: ["复变函数", "降维利器"], intuition: "数学中最美的公式，统一了代数与三角。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "lopital_rule", name: "洛必达法则", latex: "\\lim_{x \\to a} \\frac{f(x)}{g(x)} = \\lim_{x \\to a} \\frac{f'(x)}{g'(x)}", level: .university, category: .calculus, prerequisites: [], derivations: [], advancedForm: "mean_value", gaokaoRelevance: 0.8, tags: ["极限", "秒杀"], intuition: "暴力拆解极限陷阱。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "taylor_series", name: "泰勒展开", latex: "f(x) = \\sum_{n=0}^{\\infty} \\frac{f^{(n)}(a)}{n!}(x-a)^n", level: .university, category: .calculus, prerequisites: [], derivations: [], advancedForm: "analytic", gaokaoRelevance: 0.3, tags: ["微积分", "逼近"], intuition: "多项式‘克隆’任何曲线。", leapfrogKey: false, unlockedBy: nil)
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
            hints: ["0/0型极限"],
            solution: SolutionPath(
                steps: [SolutionStep(order: 1, description: "求导", latex: "\\lim \\frac{-\\sin x}{6x}", annotation: "洛必达")],
                keyInsight: "洛必达秒杀",
                commonMistakes: []
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(steps: [], keyInsight: "泰勒展开", commonMistakes: []),
                descentMethod: SolutionPath(steps: [], keyInsight: "三次洛必达", commonMistakes: []),
                weaponUsed: "洛必达之锤",
                timeRatio: 5.0
            ),
            gaokaoYear: 2022,
            tags: ["极限", "压轴"]
        )
    ]

    // MARK: - Heroes

    static let heroes: [MathHero] = [
        MathHero(id: "euler", name: "欧拉", nameEN: "Leonhard Euler", era: "1707 - 1783", attributes: HeroAttributes(insight: 10, creativity: 10, perseverance: 9, influence: 10), weaponSkills: ["欧拉恒等式"], legendStory: "失明后依然统治数学界。", famousQuote: "数学是上帝书写宇宙的语言。", relatedMysteries: [], portraitEmoji: "👴"),
        MathHero(id: "gauss", name: "高斯", nameEN: "Carl Friedrich Gauss", era: "1777 - 1855", attributes: HeroAttributes(insight: 10, creativity: 9, perseverance: 10, influence: 10), weaponSkills: ["等差求和"], legendStory: "数学王子。", famousQuote: "数学是科学的女王。", relatedMysteries: [], portraitEmoji: "👑")
    ]

    // MARK: - Mysteries

    static let mysteries: [MathMystery] = [
        MathMystery(
            id: "cat_on_earth",
            title: "地球加长一米",
            category: .intuitiveRebel,
            shockRating: 8,
            summary: "缝隙能钻过一只猫吗？",
            premise: "直觉与代数的博弈。",
            arguments: [Argument(title: "直觉", content: "不行", isCorrect: false)],
            proofSteps: [ProofStep(order: 1, latex: "h = 1/(2\\pi)", explanation: "结果与R无关")],
            verdict: "约16厘米，可以。",
            historicalContext: "代数的纯粹性。",
            relatedWeaponId: nil,
            relatedHeroId: nil,
            votes: MysteryVotes(agreeCount: 1540, disagreeCount: 89, userVote: nil),
            openQuestion: "足球上呢？"
        )
    ]

    // MARK: - Weapons

    static let weapons: [DescendWeapon] = [
        DescendWeapon(id: "derivative_blade", name: "Derivative Blade", codename: "求导刃", tier: .blade, principle: "变化率", tagline: "极值秒杀", unlockConditions: [], slayableGaokaoTypes: ["极值"], demonstrations: [], masteryLevel: .beginner)
    ]

    // MARK: - Daily Strikes

    static let dailyStrikes: [DailyStrike] = [
        DailyStrike(type: "逻辑", question: "对折42次纸？", answer: "到月球", detail: "指数增长")
    ]
}
