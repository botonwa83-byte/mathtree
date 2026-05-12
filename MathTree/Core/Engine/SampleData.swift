import Foundation

enum SampleData {

    // MARK: - Formulas

    static let formulas: [Formula] = [
        // ELEMENTARY
        Formula(
            id: "add_commute",
            name: "加法交换律",
            latex: "a + b = b + a",
            level: .elementary,
            category: .algebra,
            prerequisites: [],
            derivations: ["add_assoc"],
            advancedForm: "group_theory",
            gaokaoRelevance: 1.0,
            tags: ["算术", "基础"],
            intuition: "把两个苹果加三个苹果，和三个苹果加两个苹果是一样的。",
            leapfrogKey: false,
            unlockedBy: nil
        ),
        Formula(
            id: "rect_area",
            name: "矩形面积",
            latex: "S = a \\times b",
            level: .elementary,
            category: .geometry,
            prerequisites: [],
            derivations: ["tri_area", "trap_area"],
            advancedForm: "integral_def",
            gaokaoRelevance: 1.0,
            tags: ["几何", "面积"],
            intuition: "铺地砖时，长有多少排，宽有多少排，乘起来就是总数。",
            leapfrogKey: false,
            unlockedBy: nil
        ),

        // MIDDLE
        Formula(
            id: "pythagorean",
            name: "勾股定理",
            latex: "a^2 + b^2 = c^2",
            level: .middle,
            category: .geometry,
            prerequisites: ["rect_area"],
            derivations: ["dist_formula", "circle_eq"],
            advancedForm: "inner_product",
            gaokaoRelevance: 0.95,
            tags: ["几何", "直角三角形"],
            intuition: "直角三角形中，两条短边的‘正方形面积’之和等于长边的‘正方形面积’。",
            leapfrogKey: true,
            unlockedBy: nil
        ),
        Formula(
            id: "linear_eq",
            name: "一元一次方程",
            latex: "ax + b = 0 \\implies x = -\\frac{b}{a}",
            level: .middle,
            category: .algebra,
            prerequisites: ["add_commute"],
            derivations: ["quad_formula"],
            advancedForm: "matrix_axb",
            gaokaoRelevance: 0.9,
            tags: ["代数", "方程"],
            intuition: "像天平一样，左右两边同时加减乘除同一个数，天平依然平衡。",
            leapfrogKey: false,
            unlockedBy: nil
        ),

        // HIGH SCHOOL - COMPREHENSIVE
        
        // 1. Sets & Logic
        Formula(
            id: "set_intersect",
            name: "集合交集",
            latex: "A \\cap B = \\{x | x \\in A \\text{ 且 } x \\in B\\}",
            level: .high,
            category: .algebra,
            prerequisites: [],
            derivations: [],
            advancedForm: "boolean_algebra",
            gaokaoRelevance: 1.0,
            tags: ["集合", "基础"],
            intuition: "两个圈重叠的那一部分。",
            leapfrogKey: false,
            unlockedBy: nil
        ),
        Formula(
            id: "set_union",
            name: "集合并集",
            latex: "A \\cup B = \\{x | x \\in A \\text{ 或 } x \\in B\\}",
            level: .high,
            category: .algebra,
            prerequisites: [],
            derivations: [],
            advancedForm: "boolean_algebra",
            gaokaoRelevance: 1.0,
            tags: ["集合", "基础"],
            intuition: "两个圈合并在一起的所有地盘。",
            leapfrogKey: false,
            unlockedBy: nil
        ),

        // 2. Functions & Logarithms
        Formula(
            id: "log_product",
            name: "对数积化和",
            latex: "\\log_a(MN) = \\log_a M + \\log_a N",
            level: .high,
            category: .algebra,
            prerequisites: [],
            derivations: ["log_change_base"],
            advancedForm: "functional_eq",
            gaokaoRelevance: 0.95,
            tags: ["对数", "函数性质"],
            intuition: "对数让乘法降级成加法，是计算时代的加速器。",
            leapfrogKey: false,
            unlockedBy: nil
        ),
        Formula(
            id: "log_change_base",
            name: "换底公式",
            latex: "\\log_a b = \\frac{\\log_c b}{\\log_c a}",
            level: .high,
            category: .algebra,
            prerequisites: ["log_product"],
            derivations: [],
            advancedForm: "linear_transform",
            gaokaoRelevance: 0.9,
            tags: ["对数", "核心技巧"],
            intuition: "不同底数的对数可以通过这个‘汇率’进行转换。",
            leapfrogKey: true,
            unlockedBy: nil
        ),

        // 3. Trigonometry
        Formula(
            id: "sin_sq_cos_sq",
            name: "同角三角恒等式",
            latex: "\\sin^2\\alpha + \\cos^2\\alpha = 1",
            level: .high,
            category: .trigonometry,
            prerequisites: ["pythagorean"],
            derivations: ["double_angle_cos"],
            advancedForm: "unit_circle",
            gaokaoRelevance: 1.0,
            tags: ["三角函数", "必考"],
            intuition: "无论角度怎么变，点在单位圆上跑，距离圆心的距离平方永远是1。",
            leapfrogKey: false,
            unlockedBy: nil
        ),
        Formula(
            id: "sin_add",
            name: "正弦和角公式",
            latex: "\\sin(\\alpha + \\beta) = \\sin\\alpha\\cos\\beta + \\cos\\alpha\\sin\\beta",
            level: .high,
            category: .trigonometry,
            prerequisites: ["sin_sq_cos_sq"],
            derivations: ["sin_double"],
            advancedForm: "euler_formula",
            gaokaoRelevance: 0.98,
            tags: ["三角函数", "核心变换"],
            intuition: "两个旋转的叠加，像是一场舞蹈的配合。",
            leapfrogKey: true,
            unlockedBy: nil
        ),
        Formula(
            id: "sine_rule",
            name: "正弦定理",
            latex: "\\frac{a}{\\sin A} = \\frac{b}{\\sin B} = \\frac{c}{\\sin C} = 2R",
            level: .high,
            category: .trigonometry,
            prerequisites: ["sin_sq_cos_sq"],
            derivations: [],
            advancedForm: "exterior_diff_form",
            gaokaoRelevance: 0.95,
            tags: ["解三角形", "必考"],
            intuition: "三角形的边长与其对角的‘张开程度’成正比。",
            leapfrogKey: false,
            unlockedBy: nil
        ),
        Formula(
            id: "cosine_rule",
            name: "余弦定理",
            latex: "a^2 = b^2 + c^2 - 2bc\\cos A",
            level: .high,
            category: .trigonometry,
            prerequisites: ["pythagorean"],
            derivations: [],
            advancedForm: "inner_product_def",
            gaokaoRelevance: 0.98,
            tags: ["解三角形", "核心"],
            intuition: "它是勾股定理的‘通用版’，修正了非直角时的偏差。",
            leapfrogKey: true,
            unlockedBy: nil
        ),

        // 4. Sequences
        Formula(
            id: "arith_seq_sn",
            name: "等差数列求和",
            latex: "S_n = \\frac{n(a_1 + a_n)}{2}",
            level: .high,
            category: .algebra,
            prerequisites: [],
            derivations: [],
            advancedForm: "gauss_sum",
            gaokaoRelevance: 1.0,
            tags: ["数列", "必考"],
            intuition: "首尾配对，每一对的和都相等。",
            leapfrogKey: false,
            unlockedBy: nil
        ),
        Formula(
            id: "geom_seq_sn",
            name: "等比数列求和",
            latex: "S_n = \\frac{a_1(1-q^n)}{1-q}",
            level: .high,
            category: .algebra,
            prerequisites: [],
            derivations: [],
            advancedForm: "geometric_series",
            gaokaoRelevance: 1.0,
            tags: ["数列", "必考"],
            intuition: "复利的力量，时间越长，总和爆发越猛。",
            leapfrogKey: true,
            unlockedBy: nil
        ),

        // 5. Vectors
        Formula(
            id: "vector_dot",
            name: "向量数量积",
            latex: "\\vec{a} \\cdot \\vec{b} = |\\vec{a}| |\\vec{b}| \\cos\\theta",
            level: .high,
            category: .algebra,
            prerequisites: ["cosine_rule"],
            derivations: [],
            advancedForm: "inner_product_space",
            gaokaoRelevance: 0.95,
            tags: ["向量", "几何意义"],
            intuition: "衡量两个向量在同一个方向上的‘共鸣’程度。",
            leapfrogKey: true,
            unlockedBy: nil
        ),

        // 6. Analytic Geometry
        Formula(
            id: "point_to_line",
            name: "点到直线距离",
            latex: "d = \\frac{|Ax_0 + By_0 + C|}{\\sqrt{A^2 + B^2}}",
            level: .high,
            category: .geometry,
            prerequisites: ["vector_dot"],
            derivations: [],
            advancedForm: "linear_subspace_dist",
            gaokaoRelevance: 0.98,
            tags: ["解析几何", "核心"],
            intuition: "从点垂直砸向直线的最近距离。",
            leapfrogKey: false,
            unlockedBy: nil
        ),
        Formula(
            id: "ellipse_std",
            name: "椭圆标准方程",
            latex: "\\frac{x^2}{a^2} + \\frac{y^2}{b^2} = 1",
            level: .high,
            category: .geometry,
            prerequisites: ["pythagorean"],
            derivations: [],
            advancedForm: "conic_section",
            gaokaoRelevance: 1.0,
            tags: ["圆锥曲线", "必考"],
            intuition: "被‘拉扁’了的圆，到两个焦点的距离之和恒定。",
            leapfrogKey: true,
            unlockedBy: nil
        ),
        Formula(
            id: "hyperbola_std",
            name: "双曲线标准方程",
            latex: "\\frac{x^2}{a^2} - \\frac{y^2}{b^2} = 1",
            level: .high,
            category: .geometry,
            prerequisites: ["pythagorean"],
            derivations: [],
            advancedForm: "conic_section",
            gaokaoRelevance: 1.0,
            tags: ["圆锥曲线", "必考"],
            intuition: "两条相向而行的无限曲线，到两个焦点的距离之差恒定。",
            leapfrogKey: true,
            unlockedBy: nil
        ),

        // 7. Calculus (High School)
        Formula(
            id: "deriv_power",
            name: "幂函数导数",
            latex: "(x^n)' = nx^{n-1}",
            level: .high,
            category: .calculus,
            prerequisites: [],
            derivations: [],
            advancedForm: "operator_theory",
            gaokaoRelevance: 1.0,
            tags: ["导数", "核心"],
            intuition: "降幂打击！高次幂的变化率由低次幂决定。",
            leapfrogKey: true,
            unlockedBy: nil
        ),
        Formula(
            id: "deriv_product",
            name: "导数乘法法则",
            latex: "(uv)' = u'v + uv'",
            level: .high,
            category: .calculus,
            prerequisites: ["deriv_power"],
            derivations: [],
            advancedForm: "leibniz_rule",
            gaokaoRelevance: 0.95,
            tags: ["导数", "法则"],
            intuition: "两个函数轮流对变化率做出贡献。",
            leapfrogKey: false,
            unlockedBy: nil
        ),

        // 8. Solid Geometry
        Formula(
            id: "sphere_vol",
            name: "球体体积",
            latex: "V = \\frac{4}{3}\\pi R^3",
            level: .high,
            category: .geometry,
            prerequisites: [],
            derivations: [],
            advancedForm: "cavalieri_principle",
            gaokaoRelevance: 0.9,
            tags: ["立体几何", "体积"],
            intuition: "半径翻倍，体积翻八倍！",
            leapfrogKey: false,
            unlockedBy: nil
        ),

        // 9. Probability
        Formula(
            id: "combination",
            name: "组合数公式",
            latex: "C_n^k = \\frac{n!}{k!(n-k)!}",
            level: .high,
            category: .probability,
            prerequisites: [],
            derivations: [],
            advancedForm: "gamma_function",
            gaokaoRelevance: 0.95,
            tags: ["概率", "计数"],
            intuition: "不管顺序，只选人。",
            leapfrogKey: false,
            unlockedBy: nil
        ),

        // UNIVERSITY
        Formula(
            id: "euler_formula",
            name: "欧拉公式",
            latex: "e^{i\\theta} = \\cos\\theta + i\\sin\\theta",
            level: .university,
            category: .complexNumbers,
            prerequisites: ["sin_add"],
            derivations: ["fourier_transform"],
            advancedForm: "riemann_surface",
            gaokaoRelevance: 0.4,
            tags: ["复变函数", "上帝公式"],
            intuition: "连接代数与几何的神奇桥梁。",
            leapfrogKey: true,
            unlockedBy: nil
        ),
        Formula(
            id: "derivative_def",
            name: "导数定义",
            latex: "f'(x) = \\lim_{h \\to 0} \\frac{f(x+h) - f(x)}{h}",
            level: .university,
            category: .calculus,
            prerequisites: [],
            derivations: ["deriv_power"],
            advancedForm: "differential_geometry",
            gaokaoRelevance: 0.85,
            tags: ["微积分", "变化率"],
            intuition: "瞬间的极限速度。",
            leapfrogKey: true,
            unlockedBy: nil
        ),
        Formula(
            id: "taylor_series",
            name: "泰勒展开",
            latex: "f(x) = \\sum_{n=0}^{\\infty} \\frac{f^{(n)}(a)}{n!}(x-a)^n",
            level: .university,
            category: .calculus,
            prerequisites: ["derivative_def"],
            derivations: [],
            advancedForm: "analytic_continuation",
            gaokaoRelevance: 0.3,
            tags: ["微积分", "逼近"],
            intuition: "用无限个简单的多项式‘克隆’复杂曲线。",
            leapfrogKey: false,
            unlockedBy: nil
        )
    ]

    // MARK: - Problems, Heroes, Mysteries, Weapons, DailyStrikes (Preserved from previous versions)

    static let problems: [Problem] = [
        Problem(
            id: "prob_gaokao_001",
            type: .multipleChoice,
            tier: 3,
            formulaIds: ["deriv_power", "derivative_def"],
            content: "已知函数 f(x) = x³ - 3x + 2，求其在 [0, 2] 上的最小值。",
            contentLatex: "f(x) = x^3 - 3x + 2, x \\in [0, 2]",
            options: ["0", "2", "-2", "4"],
            answer: "0",
            difficulty: 0.65,
            averageTime: 120,
            hints: ["求导找极值点", "检查区间端点", "比较 f(0), f(1), f(2)"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "求导", latex: "f'(x) = 3x^2 - 3", annotation: "幂函数求导"),
                    SolutionStep(order: 2, description: "求极值点", latex: "3x^2 - 3 = 0 \\implies x = 1, -1", annotation: "x=1在区间内"),
                    SolutionStep(order: 3, description: "计算关键点", latex: "f(0)=2, f(1)=0, f(2)=4", annotation: "比较大小")
                ],
                keyInsight: "利用导数快速定位极值点，避免盲目尝试",
                commonMistakes: ["忘记检查端点", "求导错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "因式分解", latex: "(x-1)^2(x+2)", annotation: "观察根"),
                        SolutionStep(order: 2, description: "分析单调性", latex: "x<1时f(x)>0...", annotation: "初等方法较慢")
                    ],
                    keyInsight: "通过因式分解和性质分析",
                    commonMistakes: ["因式分解困难"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "直接求导", latex: "f'(x) = 3x^2 - 3", annotation: "秒杀"),
                        SolutionStep(order: 2, description: "判定极小值", latex: "f''(1) = 6 > 0", annotation: "确定极小点")
                    ],
                    keyInsight: "导数作为通用武器，无视具体函数技巧",
                    commonMistakes: []
                ),
                weaponUsed: "求导刃",
                timeRatio: 3.5
            ),
            gaokaoYear: 2023,
            tags: ["函数", "极值", "高考真题"]
        )
    ]

    static let heroes: [MathHero] = [
        MathHero(
            id: "euler",
            name: "欧拉",
            nameEN: "Leonhard Euler",
            era: "1707 - 1783",
            attributes: HeroAttributes(insight: 10, creativity: 10, perseverance: 9, influence: 10),
            weaponSkills: ["多面体公式", "欧拉恒等式", "图论之父"],
            legendStory: "即便双目失明，他依然在脑中进行极其复杂的计算。他一生发表的论文数量如此之多，以至于在他去世后，圣彼得堡科学院还花了47年才出齐他的全部作品。",
            famousQuote: "数学是上帝书写宇宙的语言。",
            relatedMysteries: ["seven_bridges", "basel_problem"],
            portraitEmoji: "👴"
        ),
        MathHero(
            id: "gauss",
            name: "高斯",
            nameEN: "Carl Friedrich Gauss",
            era: "1777 - 1855",
            attributes: HeroAttributes(insight: 10, creativity: 9, perseverance: 10, influence: 10),
            weaponSkills: ["等差数列求和", "正十七边形作图", "曲率"],
            legendStory: "3岁发现父亲账本错误。10岁用配对法秒算1到100之和。终生追求完美，格言是‘少些，但要成熟’。",
            famousQuote: "数学是科学的女王，数论是数学的女王。",
            relatedMysteries: ["complex_reality", "non_euclidean"],
            portraitEmoji: "👑"
        )
    ]

    static let mysteries: [MathMystery] = [
        MathMystery(
            id: "cat_on_earth",
            title: "地球加长一米",
            category: .intuitiveRebel,
            shockRating: 8,
            summary: "如果给地球赤道的绳子加长一米，缝隙能钻过一只猫吗？",
            premise: "大多数人凭直觉认为，在地球这样巨大的球体上加一米绳子，几乎没有任何变化。但数学计算会告诉你真相。",
            arguments: [
                Argument(title: "直觉派", content: "地球直径几万公里，一米绳子分摊到半径上几乎是零。", isCorrect: false),
                Argument(title: "代数派", content: "利用周长公式 C = 2πR，半径的增量仅取决于周长的增量。", isCorrect: true)
            ],
            proofSteps: [
                ProofStep(order: 1, latex: "C_{old} = 2\\pi R", explanation: "设原来半径为R"),
                ProofStep(order: 2, latex: "C_{new} = 2\\pi (R+h) = 2\\pi R + 1", explanation: "加长一米后的方程"),
                ProofStep(order: 3, latex: "2\\pi h = 1 \\implies h = 1/(2\\pi)", explanation: "相减消去R"),
                ProofStep(order: 4, latex: "h \\approx 0.159m = 15.9cm", explanation: "得出具体高度")
            ],
            verdict: "无论圆球有多大，只要周长增加1米，半径就会增加约16厘米。这个结果与地球大小完全无关！",
            historicalContext: "这个悖论经常被用来展示代数的力量——它能剥离无关因素（如地球半径），直达问题核心。",
            relatedWeaponId: nil,
            relatedHeroId: nil,
            votes: MysteryVotes(agreeCount: 1540, disagreeCount: 89, userVote: nil),
            openQuestion: "如果是在一个足球上加长一米，结果会变吗？"
        ),
        MathMystery(
            id: "point_nine_equal_one",
            title: "0.999... 是否等于 1",
            category: .infinityWar,
            shockRating: 10,
            summary: "这个简单的等式曾引发无数数学论坛的‘战争’。",
            premise: "大多数人凭直觉认为 0.999... 永远比 1 少一点点，所以不等于 1。但数学证明它们严格相等。",
            arguments: [
                Argument(title: "代数证明", content: "令 x = 0.999...\n10x = 9.999...\n9x = 9\nx = 1", isCorrect: true),
                Argument(title: "分数派", content: "1/3 = 0.333...，两边乘以3即得 1 = 0.999...。", isCorrect: true)
            ],
            proofSteps: [
                ProofStep(order: 1, latex: "x = 0.\\overline{9}", explanation: "设 x 等于 0.999..."),
                ProofStep(order: 2, latex: "10x = 9.\\overline{9}", explanation: "两边乘以10"),
                ProofStep(order: 3, latex: "10x - x = 9", explanation: "两式相减"),
                ProofStep(order: 4, latex: "x = 1", explanation: "解方程得 x = 1")
            ],
            verdict: "在实数体系中，0.999... 严格等于 1。这不是近似，不是约定，是严格的数学事实。",
            historicalContext: "这个问题曾引发数以万计的争论，暴露了人们对‘无穷’这一概念理解的困难。",
            relatedWeaponId: "derivative_blade",
            relatedHeroId: "euler",
            votes: MysteryVotes(agreeCount: 5670, disagreeCount: 1204, userVote: nil),
            openQuestion: "为什么我们的直觉总觉得它‘差那么一点点’？"
        )
    ]

    static let weapons: [DescendWeapon] = [
        DescendWeapon(
            id: "derivative_blade",
            name: "Derivative Blade",
            codename: "求导刃",
            tier: .blade,
            principle: "单变量微积分导数",
            tagline: "函数在某点的瞬时变化速度，是切线的斜率",
            unlockConditions: ["power_function", "exp_function", "trig_basic"],
            slayableGaokaoTypes: ["函数极值", "单调区间", "切线方程", "不等式证明"],
            demonstrations: [
                WeaponDemo(
                    problemTitle: "求 f(x) = xe^x 的极值",
                    standardMethod: "分析函数性质，讨论单调性...",
                    standardSteps: 5,
                    descentMethod: "f'(x) = e^x(x+1) = 0, x = -1",
                    descentSteps: 2,
                    timeRatio: "3x"
                )
            ],
            masteryLevel: .beginner
        ),
        DescendWeapon(
            id: "euler_prism",
            name: "Euler Prism",
            codename: "欧拉棱镜",
            tier: .blade,
            principle: "欧拉公式 e^(iθ) = cosθ + isinθ",
            tagline: "复数平面上的旋转，将三角函数统一为指数函数",
            unlockConditions: ["complex_basic"],
            slayableGaokaoTypes: ["三角恒等式", "三角方程", "三角变换"],
            demonstrations: [
                WeaponDemo(
                    problemTitle: "证明 cos(A+B) = cosAcosB - sinAsinB",
                    standardMethod: "几何方法或向量法证明...",
                    standardSteps: 6,
                    descentMethod: "e^(i(A+B)) = e^(iA)·e^(iB)，取实部",
                    descentSteps: 2,
                    timeRatio: "3x"
                )
            ],
            masteryLevel: .locked
        )
    ]

    static let dailyStrikes: [DailyStrike] = [
        DailyStrike(
            type: "逻辑陷阱",
            question: "如果将一张纸对折42次，它的厚度是否能到达月球？",
            answer: "是的，厚度约为 439,804 公里，超过了地月平均距离（38.4万公里）。",
            detail: "假设纸厚0.1mm，对折42次后厚度为 0.1mm × 2^42 ≈ 439,804km。指数增长的速度远超直觉。"
        ),
        DailyStrike(
            type: "概率悖论",
            question: "三门问题：参赛者在三扇门中选一扇，其中一扇后有汽车。主持人打开剩下的两扇门中一扇有山羊的。你应该换门吗？",
            answer: "应该换。换门后中奖概率从 1/3 提升到 2/3。",
            detail: "当你最初选择时，选中的概率是1/3，不中的概率是2/3。主持人排除一个错误选项后，那2/3的‘不中概率’全部集中到了剩下的一扇门上。"
        )
    ]
}
