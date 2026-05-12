import Foundation

enum SampleData {

    // MARK: - Formulas

    static let formulas: [Formula] = [
        // =========================================================================
        // ELEMENTARY & MIDDLE (Preserved)
        // =========================================================================
        Formula(id: "add_commute", name: "加法交换律", latex: "a + b = b + a", level: .elementary, category: .algebra, prerequisites: [], derivations: ["add_assoc"], advancedForm: "group_theory", gaokaoRelevance: 1.0, tags: ["算术", "基础"], intuition: "两个数相加，谁先谁后不重要。", leapfrogKey: false, unlockedBy: nil),
        Formula(id: "rect_area", name: "矩形面积", latex: "S = a \\times b", level: .elementary, category: .geometry, prerequisites: [], derivations: ["tri_area"], advancedForm: "integral_def", gaokaoRelevance: 1.0, tags: ["几何", "面积"], intuition: "长乘以宽，铺地砖。", leapfrogKey: false, unlockedBy: nil),
        Formula(id: "pythagorean", name: "勾股定理", latex: "a^2 + b^2 = c^2", level: .middle, category: .geometry, prerequisites: ["rect_area"], derivations: ["dist_formula", "circle_eq"], advancedForm: "inner_product", gaokaoRelevance: 0.95, tags: ["几何", "核心"], intuition: "直角三角形中，两直边的平方和等于斜边的平方。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "quad_root_formula", name: "求根公式", latex: "x = \\frac{-b \\pm \\sqrt{b^2-4ac}}{2a}", level: .middle, category: .algebra, prerequisites: [], derivations: ["vieta_formulas"], advancedForm: "galois_theory", gaokaoRelevance: 1.0, tags: ["方程", "必考"], intuition: "万能钥匙，解开所有二次方程。", leapfrogKey: true, unlockedBy: nil),

        // =========================================================================
        // HIGH SCHOOL (Preserved)
        // =========================================================================
        Formula(id: "sin_add", name: "正弦和角公式", latex: "\\sin(\\alpha + \\beta) = \\sin\\alpha\\cos\\beta + \\cos\\alpha\\sin\\beta", level: .high, category: .trigonometry, prerequisites: ["sin_sq_cos_sq"], derivations: ["sin_double"], advancedForm: "euler_formula", gaokaoRelevance: 0.98, tags: ["三角函数", "核心变换"], intuition: "旋转的叠加。", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "deriv_power", name: "幂函数导数", latex: "(x^n)' = nx^{n-1}", level: .high, category: .calculus, prerequisites: [], derivations: [], advancedForm: "operator_theory", gaokaoRelevance: 1.0, tags: ["导数", "核心"], intuition: "降幂打击！", leapfrogKey: true, unlockedBy: nil),
        Formula(id: "ellipse_std", name: "椭圆标准方程", latex: "\\frac{x^2}{a^2} + \\frac{y^2}{b^2} = 1", level: .high, category: .conicSections, prerequisites: ["pythagorean"], derivations: [], advancedForm: "projection", gaokaoRelevance: 1.0, tags: ["圆锥曲线", "必考"], intuition: "拉扁了的圆。", leapfrogKey: true, unlockedBy: nil),

        // =========================================================================
        // UNIVERSITY (大学) - EXHAUSTIVE WEAPONRY
        // =========================================================================
        
        // 1. Calculus & Analysis (微积分与分析)
        Formula(
            id: "lopital_rule",
            name: "洛必达法则",
            latex: "\\lim_{x \\to a} \\frac{f(x)}{g(x)} = \\lim_{x \\to a} \\frac{f'(x)}{g'(x)}",
            level: .university,
            category: .calculus,
            prerequisites: ["derivative_def"],
            derivations: [],
            advancedForm: "cauchy_mean_value",
            gaokaoRelevance: 0.8,
            tags: ["极限", "暴力美学"],
            intuition: "分子分母赛跑，看谁的变化速度决定了极限。",
            leapfrogKey: true,
            unlockedBy: nil
        ),
        Formula(
            id: "taylor_series",
            name: "泰勒展开式",
            latex: "f(x) = \\sum_{n=0}^{\\infty} \\frac{f^{(n)}(a)}{n!}(x-a)^n",
            level: .university,
            category: .calculus,
            prerequisites: ["derivative_def"],
            derivations: ["euler_identity_proof"],
            advancedForm: "analytic_continuation",
            gaokaoRelevance: 0.3,
            tags: ["逼近", "多项式化"],
            intuition: "任何光滑曲线都可以被切碎成无数个简单的多项式之和。",
            leapfrogKey: true,
            unlockedBy: nil
        ),
        Formula(
            id: "fundamental_theorem_calc",
            name: "微积分基本定理 (N-L公式)",
            latex: "\\int_a^b f(x)dx = F(b) - F(a)",
            level: .university,
            category: .calculus,
            prerequisites: ["derivative_def"],
            derivations: ["stokes_theorem"],
            advancedForm: "exterior_calculus",
            gaokaoRelevance: 0.9,
            tags: ["积分", "核心"],
            intuition: "微分是‘切碎’，积分是‘累加’，两者互为逆运算。",
            leapfrogKey: true,
            unlockedBy: nil
        ),
        Formula(
            id: "stokes_theorem",
            name: "斯托克斯公式",
            latex: "\\oint_{\\partial\\Sigma} \\mathbf{F} \\cdot d\\mathbf{r} = \\iint_{\\Sigma} (\\nabla \\times \\mathbf{F}) \\cdot d\\mathbf{S}",
            level: .university,
            category: .calculus,
            prerequisites: ["fundamental_theorem_calc"],
            derivations: [],
            advancedForm: "generalized_stokes",
            gaokaoRelevance: 0.05,
            tags: ["多维分析", "边界"],
            intuition: "边缘的‘流动’等于内部‘旋度’的累积。",
            leapfrogKey: false,
            unlockedBy: nil
        ),

        // 2. Linear Algebra (线性代数)
        Formula(
            id: "det_def",
            name: "行列式定义",
            latex: "\\det(A) = \\sum_{\\sigma \\in S_n} \\text{sgn}(\\sigma) \\prod_{i=1}^n a_{i,\\sigma(i)}",
            level: .university,
            category: .linearAlgebra,
            prerequisites: [],
            derivations: ["matrix_inverse"],
            advancedForm: "tensor_algebra",
            gaokaoRelevance: 0.15,
            tags: ["矩阵", "体积"],
            intuition: "反映了线性变换后空间‘体积’的缩放比例。",
            leapfrogKey: true,
            unlockedBy: nil
        ),
        Formula(
            id: "eigen_eq",
            name: "特征值方程",
            latex: "A\\mathbf{v} = \\lambda\\mathbf{v}",
            level: .university,
            category: .linearAlgebra,
            prerequisites: ["det_def"],
            derivations: ["diag_matrix"],
            advancedForm: "spectral_theory",
            gaokaoRelevance: 0.1,
            tags: ["矩阵", "稳定性"],
            intuition: "在线性变换下，有些方向只缩放而不改变方向。",
            leapfrogKey: true,
            unlockedBy: nil
        ),
        Formula(
            id: "matrix_inv",
            name: "矩阵求逆公式",
            latex: "A^{-1} = \\frac{1}{\\det(A)} A^*",
            level: .university,
            category: .linearAlgebra,
            prerequisites: ["det_def"],
            derivations: [],
            advancedForm: "pseudoinverse",
            gaokaoRelevance: 0.1,
            tags: ["矩阵", "逆运算"],
            intuition: "线性变换的‘撤销’操作。",
            leapfrogKey: false,
            unlockedBy: nil
        ),

        // 3. Complex Analysis (复变函数)
        Formula(
            id: "euler_formula",
            name: "欧拉公式",
            latex: "e^{i\\theta} = \\cos\\theta + i\\sin\\theta",
            level: .university,
            category: .complexNumbers,
            prerequisites: ["taylor_series"],
            derivations: ["euler_identity"],
            advancedForm: "harmonic_analysis",
            gaokaoRelevance: 0.2,
            tags: ["复数", "上帝公式"],
            intuition: "圆周运动与震荡的完美统一，代数与几何的桥梁。",
            leapfrogKey: true,
            unlockedBy: nil
        ),
        Formula(
            id: "cauchy_riemann",
            name: "柯西-黎曼方程",
            latex: "\\frac{\\partial u}{\\partial x} = \\frac{\\partial v}{\\partial y}, \\frac{\\partial u}{\\partial y} = -\\frac{\\partial v}{\\partial x}",
            level: .university,
            category: .complexNumbers,
            prerequisites: ["derivative_def"],
            derivations: ["cauchy_integral"],
            advancedForm: "conformal_map",
            gaokaoRelevance: 0.0,
            tags: ["解析函数", "核心"],
            intuition: "复平面上可导的要求极其苛刻，必须满足这种‘旋转对称’性。",
            leapfrogKey: false,
            unlockedBy: nil
        ),

        // 4. Probability & Statistics (概率统计)
        Formula(
            id: "bayes_theorem",
            name: "贝叶斯定理",
            latex: "P(A|B) = \\frac{P(B|A)P(A)}{P(B)}",
            level: .university,
            category: .probability,
            prerequisites: [],
            derivations: [],
            advancedForm: "bayesian_inference",
            gaokaoRelevance: 0.8,
            tags: ["概率", "认知更新"],
            intuition: "当我们获得新证据时，如何更新我们对客观世界的认知。",
            leapfrogKey: true,
            unlockedBy: nil
        ),
        Formula(
            id: "central_limit_theorem",
            name: "中心极限定理",
            latex: "\\bar{X}_n \\xrightarrow{d} N(\\mu, \\frac{\\sigma^2}{n})",
            level: .university,
            category: .probability,
            prerequisites: [],
            derivations: [],
            advancedForm: "law_of_large_numbers",
            gaokaoRelevance: 0.5,
            tags: ["正态分布", "普适规律"],
            intuition: "无论初始分布如何，大量独立随机变量的和最终都会趋向正态分布。",
            leapfrogKey: false,
            unlockedBy: nil
        ),

        // 5. Differential Equations (微分方程)
        Formula(
            id: "linear_ode_first",
            name: "一阶线性微分方程通解",
            latex: "y' + P(x)y = Q(x) \\implies y = e^{-\\int Pdx} [ \\int Q e^{\\int Pdx} dx + C ]",
            level: .university,
            category: .calculus,
            prerequisites: ["fundamental_theorem_calc"],
            derivations: [],
            advancedForm: "dynamical_systems",
            gaokaoRelevance: 0.2,
            tags: ["方程", "变化"],
            intuition: "描述一个随时间演化且受外界‘输入’影响的系统。",
            leapfrogKey: true,
            unlockedBy: nil
        )
    ]

    // MARK: - Problems (Example Strike)

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
        MathHero(id: "euler", name: "欧拉", nameEN: "Leonhard Euler", era: "1707 - 1783", attributes: HeroAttributes(insight: 10, creativity: 10, perseverance: 9, influence: 10), weaponSkills: ["欧拉恒等式", "变分法"], legendStory: "失明后依然统治数学界。", famousQuote: "数学是上帝书写宇宙的语言。", relatedMysteries: [], portraitEmoji: "👴"),
        MathHero(id: "gauss", name: "高斯", nameEN: "Carl Friedrich Gauss", era: "1777 - 1855", attributes: HeroAttributes(insight: 10, creativity: 9, perseverance: 10, influence: 10), weaponSkills: ["曲率", "正态分布"], legendStory: "3岁纠错，10岁秒算求和，终生追求完美的数学王子。", famousQuote: "数学是科学的女王。", relatedMysteries: [], portraitEmoji: "👑"),
        MathHero(id: "cauchy", name: "柯西", nameEN: "Augustin-Louis Cauchy", era: "1789 - 1857", attributes: HeroAttributes(insight: 9, creativity: 8, perseverance: 10, influence: 9), weaponSkills: ["极限严谨化", "复积分"], legendStory: "他给数学大厦打下了最坚实的严谨地基，一生发表了近800篇论文。", famousQuote: "人们可以因为天才而崇拜拉格朗日，但只有柯西才能让数学变得严谨。", relatedMysteries: [], portraitEmoji: "📐")
    ]

    // MARK: - Mysteries

    static let mysteries: [MathMystery] = [
        MathMystery(
            id: "point_nine_equal_one",
            title: "0.999... 是否等于 1",
            category: .infinityWar,
            shockRating: 10,
            summary: "这个等式引发了无数数学‘战争’。",
            premise: "直觉挑战。",
            arguments: [Argument(title: "代数证明", content: "10x-x=9x=9", isCorrect: true)],
            proofSteps: [ProofStep(order: 1, latex: "x=1", explanation: "严谨结论")],
            verdict: "严格相等。",
            historicalContext: "无穷概念的局限。",
            relatedWeaponId: nil,
            relatedHeroId: "euler",
            votes: MysteryVotes(agreeCount: 8900, disagreeCount: 1240, userVote: nil),
            openQuestion: "如果是在非标准分析中？"
        )
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
