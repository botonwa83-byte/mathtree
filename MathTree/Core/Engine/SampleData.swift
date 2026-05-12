import Foundation

enum SampleData {

    // MARK: - Formulas

    static let formulas: [Formula] = [
        Formula(
            id: "pythagorean",
            name: "勾股定理",
            latex: "a^2 + b^2 = c^2",
            level: .middle,
            category: .geometry,
            prerequisites: ["rectangle_area"],
            derivations: ["distance_formula", "circle_equation"],
            advancedForm: "inner_product",
            gaokaoRelevance: 0.85,
            tags: ["几何", "基础", "必考"],
            intuition: "直角三角形两条直角边的平方和等于斜边的平方",
            leapfrogKey: false,
            unlockedBy: nil
        ),
        Formula(
            id: "distance_formula",
            name: "距离公式",
            latex: "d = \\sqrt{(x_2-x_1)^2 + (y_2-y_1)^2}",
            level: .middle,
            category: .geometry,
            prerequisites: ["pythagorean"],
            derivations: ["circle_equation"],
            advancedForm: "n_dim_distance",
            gaokaoRelevance: 0.8,
            tags: ["几何", "坐标"],
            intuition: "平面上两点之间的距离，本质是勾股定理的坐标版本",
            leapfrogKey: false,
            unlockedBy: nil
        ),
        Formula(
            id: "quadratic_formula",
            name: "求根公式",
            latex: "x = \\frac{-b \\pm \\sqrt{b^2-4ac}}{2a}",
            level: .middle,
            category: .algebra,
            prerequisites: ["completing_square"],
            derivations: ["discriminant", "vieta_formulas"],
            advancedForm: nil,
            gaokaoRelevance: 0.9,
            tags: ["代数", "方程", "必考"],
            intuition: "一元二次方程的万能解法，判别式决定根的个数",
            leapfrogKey: false,
            unlockedBy: nil
        ),
        Formula(
            id: "sin_addition",
            name: "正弦和角公式",
            latex: "\\sin(A+B) = \\sin A \\cos B + \\cos A \\sin B",
            level: .high,
            category: .trigonometry,
            prerequisites: ["sin_basic", "cos_basic"],
            derivations: ["double_angle_sin", "product_to_sum"],
            advancedForm: "trig_euler",
            gaokaoRelevance: 0.95,
            tags: ["三角", "恒等式", "必考"],
            intuition: "两个角度相加时正弦值的展开，是欧拉公式的直接推论",
            leapfrogKey: false,
            unlockedBy: nil
        ),
        Formula(
            id: "trig_euler",
            name: "欧拉公式",
            latex: "e^{i\\theta} = \\cos\\theta + i\\sin\\theta",
            level: .university,
            category: .complexNumbers,
            prerequisites: ["complex_basic", "exp_function"],
            derivations: ["sin_addition", "cos_addition", "double_angle", "euler_identity"],
            advancedForm: nil,
            gaokaoRelevance: 0.95,
            tags: ["三角", "复数", "欧拉", "超前"],
            intuition: "在单位圆上转 theta 角，x 坐标是 cos, y 坐标是 sin",
            leapfrogKey: true,
            unlockedBy: "leapfrog_path_B"
        ),
        Formula(
            id: "derivative_def",
            name: "导数定义",
            latex: "f'(x) = \\lim_{h \\to 0} \\frac{f(x+h) - f(x)}{h}",
            level: .high,
            category: .calculus,
            prerequisites: ["limit_concept"],
            derivations: ["power_rule", "chain_rule", "product_rule"],
            advancedForm: "partial_derivative",
            gaokaoRelevance: 0.95,
            tags: ["微积分", "导数", "必考"],
            intuition: "函数在某一点的瞬时变化速率，就是曲线在那一点的切线斜率",
            leapfrogKey: true,
            unlockedBy: "leapfrog_path_A"
        ),
        Formula(
            id: "power_rule",
            name: "幂函数求导",
            latex: "(x^n)' = n \\cdot x^{n-1}",
            level: .high,
            category: .calculus,
            prerequisites: ["derivative_def"],
            derivations: ["polynomial_derivative"],
            advancedForm: nil,
            gaokaoRelevance: 0.9,
            tags: ["微积分", "导数"],
            intuition: "指数降下来乘以系数，指数减一",
            leapfrogKey: false,
            unlockedBy: nil
        ),
        Formula(
            id: "arithmetic_sum",
            name: "等差数列求和",
            latex: "S_n = \\frac{n(a_1 + a_n)}{2}",
            level: .high,
            category: .sequences,
            prerequisites: ["arithmetic_general"],
            derivations: ["integral_intuition"],
            advancedForm: nil,
            gaokaoRelevance: 0.9,
            tags: ["数列", "求和", "必考"],
            intuition: "首尾配对，n项求和等于首尾之和乘以项数的一半",
            leapfrogKey: false,
            unlockedBy: nil
        ),
        Formula(
            id: "binomial_theorem",
            name: "二项式定理",
            latex: "(a+b)^n = \\sum_{k=0}^{n} C_n^k a^{n-k} b^k",
            level: .high,
            category: .algebra,
            prerequisites: ["combination"],
            derivations: ["generating_function"],
            advancedForm: "generating_function",
            gaokaoRelevance: 0.85,
            tags: ["代数", "组合", "展开"],
            intuition: "两个数之和的n次方的展开，系数是组合数",
            leapfrogKey: false,
            unlockedBy: nil
        ),
        Formula(
            id: "circle_equation",
            name: "圆的标准方程",
            latex: "(x-a)^2 + (y-b)^2 = r^2",
            level: .high,
            category: .conicSections,
            prerequisites: ["distance_formula"],
            derivations: ["ellipse_equation"],
            advancedForm: "conic_matrix",
            gaokaoRelevance: 0.85,
            tags: ["解析几何", "圆锥曲线"],
            intuition: "到圆心距离等于半径的所有点的集合",
            leapfrogKey: false,
            unlockedBy: nil
        ),
    ]

    // MARK: - Problems

    static let problems: [Problem] = [
        Problem(
            id: "prob_001",
            type: .multipleChoice,
            tier: 1,
            formulaIds: ["pythagorean"],
            content: "直角三角形两条直角边分别为3和4，求斜边长度",
            contentLatex: "a=3, b=4, c=?",
            options: ["5", "6", "7", "8"],
            answer: "5",
            difficulty: 0.2,
            averageTime: 30,
            hints: ["使用勾股定理", "a^2 + b^2 = c^2", "3^2 + 4^2 = ?"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "代入勾股定理", latex: "c^2 = 3^2 + 4^2 = 25", annotation: "直接代入"),
                    SolutionStep(order: 2, description: "开方", latex: "c = 5", annotation: "取正值")
                ],
                keyInsight: "识别直角三角形，直接应用勾股定理",
                commonMistakes: ["忘记开方"]
            ),
            dualSolution: nil,
            gaokaoYear: nil,
            tags: ["几何", "基础"]
        ),
        Problem(
            id: "prob_002",
            type: .multipleChoice,
            tier: 2,
            formulaIds: ["derivative_def", "power_rule"],
            content: "求函数 f(x) = x^3 - 3x + 2 的极值点",
            contentLatex: "f(x) = x^3 - 3x + 2",
            options: ["x = 1 和 x = -1", "x = 0", "x = 3", "x = -3"],
            answer: "x = 1 和 x = -1",
            difficulty: 0.5,
            averageTime: 120,
            hints: ["求导数", "令导数等于零", "f'(x) = 3x^2 - 3"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "分析单调性", latex: "f(x) = x^3 - 3x + 2", annotation: "讨论函数增减性"),
                    SolutionStep(order: 2, description: "因式分解", latex: "x^3 - 3x = x(x^2-3)", annotation: "复杂的因式分解"),
                    SolutionStep(order: 3, description: "分析得极值点", latex: "x = \\pm 1", annotation: "分类讨论")
                ],
                keyInsight: "通过分析函数性质找极值",
                commonMistakes: ["因式分解出错", "忘记讨论正负"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "分析单调性", latex: "f(x) = x^3 - 3x + 2", annotation: "需要讨论多种情况"),
                        SolutionStep(order: 2, description: "构造辅助函数", latex: "...", annotation: "复杂的构造"),
                        SolutionStep(order: 3, description: "分类讨论", latex: "...", annotation: "容易遗漏情况")
                    ],
                    keyInsight: "传统方法需要5步",
                    commonMistakes: ["分类讨论遗漏"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "求导", latex: "f'(x) = 3x^2 - 3 = 0", annotation: "令导数为零"),
                        SolutionStep(order: 2, description: "解方程", latex: "x = \\pm 1", annotation: "直接得到极值点")
                    ],
                    keyInsight: "导数为零的点就是极值点",
                    commonMistakes: ["几乎不会出错"]
                ),
                weaponUsed: "derivative_blade",
                timeRatio: 3.0
            ),
            gaokaoYear: 2023,
            tags: ["函数", "极值", "导数"]
        ),
        Problem(
            id: "prob_003",
            type: .multipleChoice,
            tier: 2,
            formulaIds: ["sin_addition"],
            content: "求 sin75 的值",
            contentLatex: "\\sin 75^\\circ = ?",
            options: [
                "(\\sqrt{6}+\\sqrt{2})/4",
                "(\\sqrt{6}-\\sqrt{2})/4",
                "(\\sqrt{3}+1)/4",
                "\\sqrt{3}/2"
            ],
            answer: "(\\sqrt{6}+\\sqrt{2})/4",
            difficulty: 0.4,
            averageTime: 90,
            hints: ["75 = 45 + 30", "使用正弦和角公式"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "拆分角度", latex: "\\sin 75^\\circ = \\sin(45^\\circ + 30^\\circ)", annotation: "将75拆为常见角之和"),
                    SolutionStep(order: 2, description: "应用和角公式", latex: "= \\sin 45^\\circ \\cos 30^\\circ + \\cos 45^\\circ \\sin 30^\\circ", annotation: "代入公式"),
                    SolutionStep(order: 3, description: "代入特殊值", latex: "= \\frac{\\sqrt{2}}{2} \\cdot \\frac{\\sqrt{3}}{2} + \\frac{\\sqrt{2}}{2} \\cdot \\frac{1}{2} = \\frac{\\sqrt{6}+\\sqrt{2}}{4}", annotation: "计算得结果")
                ],
                keyInsight: "将非特殊角拆为特殊角之和",
                commonMistakes: ["角度拆分错误", "特殊值记错"]
            ),
            dualSolution: nil,
            gaokaoYear: nil,
            tags: ["三角", "和角公式"]
        ),
    ]

    // MARK: - Mysteries

    static let mysteries: [MathMystery] = [
        MathMystery(
            id: "099_equals_1",
            title: "0.999... 到底等不等于 1？",
            category: .intuitiveRebel,
            shockRating: 8,
            summary: "一个让互联网每年都爆发争论的数学问题",
            premise: "大多数人凭直觉认为 0.999... 永远比 1 少一点点。但三种不同的数学证明都表明它们严格相等。这不是近似，不是约定，是实数体系的必然结果。",
            arguments: [
                Argument(title: "代数证明", content: "令 x = 0.999...\n10x = 9.999...\n两式相减：9x = 9\n故 x = 1", isCorrect: true),
                Argument(title: "极限证明", content: "0.999... = 9/10 + 9/100 + 9/1000 + ...\n= 9 * (1/10) / (1 - 1/10) = 1", isCorrect: true),
                Argument(title: "实数稠密性", content: "若 0.999... 不等于 1，则两者之间必存在一个实数。\n但0.999...和1之间不存在任何实数，故它们相等。", isCorrect: true),
                Argument(title: "常见反驳（错误）", content: "「无穷小的差值存在！」\n在标准实数系中，没有无穷小的数（超实数另论）。", isCorrect: false)
            ],
            proofSteps: [
                ProofStep(order: 1, latex: "x = 0.\\overline{9}", explanation: "设 x 等于 0.999..."),
                ProofStep(order: 2, latex: "10x = 9.\\overline{9}", explanation: "两边乘以10"),
                ProofStep(order: 3, latex: "10x - x = 9", explanation: "两式相减，无穷小数部分抵消"),
                ProofStep(order: 4, latex: "x = 1", explanation: "故 0.999... = 1")
            ],
            verdict: "在实数体系中，0.999... 严格等于 1。这不是近似，不是约定，是严格的数学事实。实数的十进制表示不唯一，这正是实数体系的特性。",
            historicalContext: "这个问题在数学论坛上引发了数以万计的争论。2007年一项调查显示，约1/3的大学生在学过极限后仍然不相信这个结论。甚至有人认为这是「数学系的阴谋」。",
            relatedWeaponId: nil,
            relatedHeroId: nil,
            votes: MysteryVotes(agreeCount: 1247, disagreeCount: 583, userVote: nil),
            openQuestion: nil
        ),
        MathMystery(
            id: "monty_hall",
            title: "蒙提霍尔问题——连数学家都算错的概率题",
            category: .intuitiveRebel,
            shockRating: 9,
            summary: "换还是不换？超过80%的人（包括数学博士）的第一反应是错的",
            premise: "你参加游戏节目，面对三扇门：一扇后面是汽车，两扇后面是山羊。你选了1号门。主持人（知道答案）打开了3号门，露出一只山羊。现在问你：要不要换选2号门？",
            arguments: [
                Argument(title: "直觉答案（错误）", content: "无所谓，剩两扇门，概率各1/2。\n超过80%的人的第一反应。", isCorrect: false),
                Argument(title: "正确答案", content: "换！换门后获奖概率是 2/3，不换是 1/3。\n不换获奖 = 一开始就选中 = 1/3\n换门获奖 = 1 - 1/3 = 2/3", isCorrect: true),
                Argument(title: "放大直觉", content: "想象1000扇门，你选1号，主持人打开998扇没车的门。剩下的那扇有车概率是999/1000。你换不换？", isCorrect: true)
            ],
            proofSteps: [
                ProofStep(order: 1, latex: "P(\\text{car behind 1}) = \\frac{1}{3}", explanation: "一开始选中的概率是1/3"),
                ProofStep(order: 2, latex: "P(\\text{car not behind 1}) = \\frac{2}{3}", explanation: "没选中的概率是2/3"),
                ProofStep(order: 3, latex: "P(\\text{win by switch}) = \\frac{2}{3}", explanation: "换门 = 赌一开始没选中 = 2/3")
            ],
            verdict: "换门获奖概率是2/3。关键在于主持人的行为提供了额外信息——他永远打开没车的门，这改变了剩余门的概率分布。",
            historicalContext: "1990年，世界最高智商纪录保持者玛丽莲·沃斯·莎凡特给出正确答案后，收到约10000封愤怒信件，其中约1000封来自数学博士。数学家保罗·厄多斯亲眼看了Monte Carlo模拟后才接受答案。",
            relatedWeaponId: nil,
            relatedHeroId: nil,
            votes: MysteryVotes(agreeCount: 892, disagreeCount: 1156, userVote: nil),
            openQuestion: nil
        ),
        MathMystery(
            id: "birthday_paradox",
            title: "生日悖论——23人就有50%概率撞生日",
            category: .intuitiveRebel,
            shockRating: 7,
            summary: "一年365天，23个人的班上就有一半可能两人同天生日？",
            premise: "一年有365天，一个班上只有23个人，难道真的有一半的可能两人同一天生日？听起来不可能，但数学计算告诉我们这是真的。",
            arguments: [
                Argument(title: "反向计算", content: "P(无人同生日) = 365/365 * 364/365 * ... * 343/365 ≈ 0.4927\nP(至少两人同生日) = 1 - 0.4927 = 50.73%", isCorrect: true),
                Argument(title: "更惊人的数字", content: "57人时概率超过99%！\n366人时概率为100%（鸽巢原理）", isCorrect: true)
            ],
            proofSteps: [
                ProofStep(order: 1, latex: "P = 1 - \\frac{365!}{(365-23)! \\cdot 365^{23}}", explanation: "用补集方法计算"),
                ProofStep(order: 2, latex: "P \\approx 1 - 0.4927 = 0.5073", explanation: "约50.73%的概率")
            ],
            verdict: "23人中有50.73%的概率至少两人同天生日。这个问题的关键是人们低估了「配对数量」——23人中有 C(23,2)=253 种配对！",
            historicalContext: "密码学中的「生日攻击」(Birthday Attack)正是利用这个原理，以远快于暴力穷举的速度碰撞哈希值。这个看似纯数学的结论，在信息安全领域有直接应用。",
            relatedWeaponId: nil,
            relatedHeroId: nil,
            votes: MysteryVotes(agreeCount: 654, disagreeCount: 231, userVote: nil),
            openQuestion: nil
        ),
        MathMystery(
            id: "sum_all_integers",
            title: "1+2+3+4+... = -1/12 ?!",
            category: .infinityWar,
            shockRating: 10,
            summary: "正整数之和怎么可能等于一个负分数？但物理学家在用它。",
            premise: "这看起来像胡说八道。正整数相加怎么可能得到一个负数？但物理学家在计算弦理论的宇宙维度数时，就用了这个「等式」。",
            arguments: [
                Argument(title: "黎曼zeta函数", content: "zeta(s) = 1 + 1/2^s + 1/3^s + ...\n当 s = -1 时，zeta(-1) = 1+2+3+... = -1/12", isCorrect: true),
                Argument(title: "解析延拓", content: "这不是普通意义的求和（柯西极限意义），而是解析延拓——把收敛区域的函数延伸到整个复平面。", isCorrect: true),
                Argument(title: "物理应用", content: "弦理论中玻色弦必须在26维时空传播：\nD = 24 * (1/(-1/12)) + 2 = 26", isCorrect: true)
            ],
            proofSteps: [
                ProofStep(order: 1, latex: "\\zeta(s) = \\sum_{n=1}^{\\infty} n^{-s}", explanation: "黎曼zeta函数定义（Re(s)>1时收敛）"),
                ProofStep(order: 2, latex: "\\zeta(-1) = -\\frac{1}{12}", explanation: "通过解析延拓计算")
            ],
            verdict: "这是合法的数学，但含义特殊。-1/12 是通过解析延拓赋予的值，不是常规意义下的求和。重要的是：它有明确的适用条件。",
            historicalContext: "拉马努金（Ramanujan）曾在信中写道 1+2+3+...=-1/12，震惊了英国数学家哈代。弦理论中宇宙必须是26维的推导依赖于这个结论。",
            relatedWeaponId: nil,
            relatedHeroId: "euler",
            votes: MysteryVotes(agreeCount: 456, disagreeCount: 1823, userVote: nil),
            openQuestion: "这是「数学事实」还是「符号游戏」？"
        ),
        MathMystery(
            id: "cantor_diagonal",
            title: "康托尔的对角线——有些无穷比另一些更大",
            category: .infinityWar,
            shockRating: 10,
            summary: "自然数无穷多，实数也无穷多，但实数的无穷「更大」",
            premise: "自然数有无穷多个，实数也有无穷多个。这两种无穷是一样大的吗？康托尔用一个天才的对角线论证，证明了实数的无穷严格大于自然数的无穷。",
            arguments: [
                Argument(title: "对角线论证", content: "假设所有0到1的实数可列成表。\n构造新数d：第n位与第n个数的第n位不同。\nd不在表中 → 矛盾！\n所以实数不可数。", isCorrect: true)
            ],
            proofSteps: [
                ProofStep(order: 1, latex: "r_n = 0.a_{n1}a_{n2}a_{n3}\\ldots", explanation: "假设所有实数可以被列成无穷表"),
                ProofStep(order: 2, latex: "d = 0.d_1d_2d_3\\ldots,\\; d_n \\neq a_{nn}", explanation: "构造对角线数，每位与原数不同"),
                ProofStep(order: 3, latex: "d \\notin \\{r_1, r_2, r_3, \\ldots\\}", explanation: "d与每个r_n至少有一位不同，故不在表中"),
                ProofStep(order: 4, latex: "|\\mathbb{R}| > |\\mathbb{N}|", explanation: "矛盾！实数不可数，存在更大的无穷")
            ],
            verdict: "实数的无穷严格大于自然数的无穷。存在无穷层次的无穷——这是集合论最深刻的发现。",
            historicalContext: "1874年康托尔发表论文时，导师克罗内克称他为「腐蚀年轻人的败类」，终身阻止他晋升。庞加莱称集合论是「一种疾病」。康托尔在打压中患严重抑郁症。但希尔伯特称他的工作是「纯粹人类智力活动的最高成就之一」。",
            relatedWeaponId: nil,
            relatedHeroId: nil,
            votes: MysteryVotes(agreeCount: 1089, disagreeCount: 167, userVote: nil),
            openQuestion: nil
        ),
        MathMystery(
            id: "godel_incompleteness",
            title: "哥德尔不完备定理——数学永远无法证明自己",
            category: .foundation,
            shockRating: 10,
            summary: "25岁的哥德尔终结了数学家几十年的梦想",
            premise: "1931年，年仅25岁的哥德尔证明：任何足够强大的数学体系里，总有真实的命题是不可证明的。数学真理比任何形式系统都要大。",
            arguments: [
                Argument(title: "自我指涉", content: "构造命题G：「G不可证明」\n若G为假 → G可被证明 → 矛盾\n若G为真 → 存在不可证的真命题 → 不完备", isCorrect: true)
            ],
            proofSteps: [
                ProofStep(order: 1, latex: "G: \\text{\"G is not provable\"}", explanation: "构造自我指涉的命题G"),
                ProofStep(order: 2, latex: "\\neg G \\Rightarrow G \\text{ provable} \\Rightarrow \\bot", explanation: "若G为假则矛盾"),
                ProofStep(order: 3, latex: "G \\text{ is true but unprovable}", explanation: "G必须为真，但不可证明")
            ],
            verdict: "任何包含自然数算术的一致形式系统都是不完备的，且无法在自身内证明自身的一致性。希尔伯特的完备性梦想被终结。",
            historicalContext: "1900年希尔伯特说「我们必须知道，我们将会知道」。31年后哥德尔证明这不可能。哥德尔晚年极度偏执，只吃妻子做的食物。1978年妻子住院后，他拒绝进食，最终饿死。",
            relatedWeaponId: nil,
            relatedHeroId: nil,
            votes: MysteryVotes(agreeCount: 987, disagreeCount: 45, userVote: nil),
            openQuestion: nil
        ),
    ]

    // MARK: - Heroes

    static let heroes: [MathHero] = [
        MathHero(
            id: "euler",
            name: "欧拉",
            nameEN: "Leonhard Euler",
            era: "1707-1783",
            attributes: HeroAttributes(insight: 10, creativity: 10, perseverance: 9, influence: 10),
            weaponSkills: ["欧拉棱镜", "欧拉方程", "图论"],
            legendStory: "双眼相继失明后，仍然靠心算完成了大量工作。一生发表论文800+篇，直到去世前都在计算。他是数学史上最高产的数学家，没有之一。",
            famousQuote: "数学是研究所有可能世界的科学。",
            relatedMysteries: ["sum_all_integers"],
            portraitEmoji: "🧮"
        ),
        MathHero(
            id: "gauss",
            name: "高斯",
            nameEN: "Carl Friedrich Gauss",
            era: "1777-1855",
            attributes: HeroAttributes(insight: 10, creativity: 10, perseverance: 8, influence: 10),
            weaponSkills: ["矩阵炮台", "高斯消元", "正态分布"],
            legendStory: "3岁时发现老师算术题的错误。10岁时用等差数列首尾配对秒算1到100之和，震惊了老师。终生不轻易发表，因为他要求每篇文章都「如大理石雕塑般完美」。",
            famousQuote: "数学是科学的女王，数论是数学的女王。",
            relatedMysteries: [],
            portraitEmoji: "👑"
        ),
        MathHero(
            id: "euler_galois",
            name: "伽罗瓦",
            nameEN: "Evariste Galois",
            era: "1811-1832",
            attributes: HeroAttributes(insight: 10, creativity: 10, perseverance: 6, influence: 9),
            weaponSkills: ["群论", "伽罗瓦理论"],
            legendStory: "决斗前夜彻夜写下全部数学思想。第二天在决斗中死亡，年仅20岁。他留下的那几页纸，后来开创了群论——现代代数学的基石。",
            famousQuote: "我没有时间了。",
            relatedMysteries: [],
            portraitEmoji: "⚔️"
        ),
        MathHero(
            id: "ramanujan",
            name: "拉马努金",
            nameEN: "Srinivasa Ramanujan",
            era: "1887-1920",
            attributes: HeroAttributes(insight: 10, creativity: 10, perseverance: 9, influence: 8),
            weaponSkills: ["无穷级数", "连分数", "模形式"],
            legendStory: "印度自学成才的天才，几乎没有受过正规数学训练，却独立发现了数千个公式。他说他的公式来自女神纳玛吉里的梦境。32岁英年早逝。",
            famousQuote: "每一个正整数都是拉马努金的朋友。",
            relatedMysteries: ["sum_all_integers"],
            portraitEmoji: "🌟"
        ),
        MathHero(
            id: "godel",
            name: "哥德尔",
            nameEN: "Kurt Godel",
            era: "1906-1978",
            attributes: HeroAttributes(insight: 10, creativity: 10, perseverance: 7, influence: 10),
            weaponSkills: ["不完备定理", "数理逻辑"],
            legendStory: "25岁证明了不完备定理，终结了希尔伯特的梦想。晚年极度偏执，只吃妻子做的食物。1978年妻子住院后拒绝进食，最终饿死。天才与疯狂仅一线之隔。",
            famousQuote: "要么数学是人类创造的，要么数学是人类发现的。无论哪种，都令人不安。",
            relatedMysteries: ["godel_incompleteness"],
            portraitEmoji: "🔮"
        ),
    ]

    // MARK: - Weapons

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
                    problemTitle: "求 f(x)=xe^x 的极值",
                    standardMethod: "分析函数性质，讨论单调性，构造辅助函数...",
                    standardSteps: 5,
                    descentMethod: "f'(x)=e^x(x+1)=0, x=-1",
                    descentSteps: 2,
                    timeRatio: "3x"
                ),
                WeaponDemo(
                    problemTitle: "证明 x > sinx (x>0)",
                    standardMethod: "构造辅助函数，讨论多种情况...",
                    standardSteps: 6,
                    descentMethod: "g(x)=x-sinx, g'(x)=1-cosx>=0, g(0)=0, 故g(x)>0",
                    descentSteps: 3,
                    timeRatio: "2x"
                )
            ],
            masteryLevel: .locked
        ),
        DescendWeapon(
            id: "euler_prism",
            name: "Euler Prism",
            codename: "欧拉棱镜",
            tier: .blade,
            principle: "欧拉公式 e^(itheta) = costheta + isintheta",
            tagline: "复数平面上的旋转，将三角函数统一为指数函数",
            unlockConditions: ["complex_basic"],
            slayableGaokaoTypes: ["三角恒等式", "三角方程", "三角变换", "倍角公式", "和差化积"],
            demonstrations: [
                WeaponDemo(
                    problemTitle: "证明 cos(A+B) = cosAcosB - sinAsinB",
                    standardMethod: "几何法或向量法，需要多步推导...",
                    standardSteps: 6,
                    descentMethod: "e^(i(A+B)) = e^(iA)*e^(iB)，取实部即得",
                    descentSteps: 2,
                    timeRatio: "3x"
                )
            ],
            masteryLevel: .locked
        ),
        DescendWeapon(
            id: "matrix_cannon",
            name: "Matrix Cannon",
            codename: "矩阵炮台",
            tier: .blade,
            principle: "线性代数 - 矩阵与线性变换",
            tagline: "一切线性问题都是矩阵乘法，几何变换是矩阵作用",
            unlockConditions: ["vector_basic", "dot_product"],
            slayableGaokaoTypes: ["圆锥曲线分类", "空间几何", "向量证明"],
            demonstrations: [
                WeaponDemo(
                    problemTitle: "判断 x^2+4xy+y^2=1 是什么曲线",
                    standardMethod: "配方、转轴、判断...",
                    standardSteps: 8,
                    descentMethod: "矩阵A=[[1,2],[2,1]]，特征值3和-1，一正一负=双曲线",
                    descentSteps: 1,
                    timeRatio: "8x"
                )
            ],
            masteryLevel: .locked
        ),
        DescendWeapon(
            id: "generating_gun",
            name: "Generating Function Gun",
            codename: "母函数枪",
            tier: .blade,
            principle: "用多项式/级数编码数列信息",
            tagline: "把一列数装进一个函数，用函数运算解决计数问题",
            unlockConditions: ["binomial_theorem"],
            slayableGaokaoTypes: ["排列组合恒等式", "数列递推求解"],
            demonstrations: [
                WeaponDemo(
                    problemTitle: "证明 C(n,0)+C(n,1)+...+C(n,n)=2^n",
                    standardMethod: "数学归纳法，需要3步...",
                    standardSteps: 3,
                    descentMethod: "(1+x)^n 令 x=1 即得 2^n",
                    descentSteps: 1,
                    timeRatio: "3x"
                )
            ],
            masteryLevel: .locked
        ),
    ]

    // MARK: - Daily Strikes

    static let dailyStrikes: [DailyStrike] = [
        DailyStrike(
            type: "直觉挑战",
            question: "如果将一张纸对折42次，它的厚度是否能到达月球？",
            answer: "能！而且还有多余。",
            detail: "一张纸厚约0.1mm。对折42次后厚度 = 0.1mm * 2^42 ≈ 439,805 km。地月距离约384,400 km。纸的厚度超过了地月距离！这就是指数增长的力量。"
        ),
        DailyStrike(
            type: "数字震惊",
            question: "52张扑克牌的排列方式有多少种？这个数字有多大？",
            answer: "52! ≈ 8 * 10^67 种。",
            detail: "宇宙中的原子数量约为 10^80，但仅52张牌的排列方式就有 8*10^67 种。这意味着你每次洗牌得到的顺序，几乎可以肯定在宇宙历史中从未出现过。"
        ),
        DailyStrike(
            type: "快速降维",
            question: "高考题：求 f(x)=x^3-3x+2 的极值。常规方法需要5步分析，降维武器只需2步。",
            answer: "f'(x)=3x^2-3=0, x=+/-1。完毕。",
            detail: "求导刃（导数）是第二阶快刀级武器。令导数为零直接找到极值点，不需要复杂的分类讨论。这就是降维打击。"
        ),
        DailyStrike(
            type: "历史今日",
            question: "1831年5月，年仅20岁的伽罗瓦在决斗前夜做了什么？",
            answer: "他彻夜写下了全部数学思想。",
            detail: "第二天他在决斗中身亡。他留下的那几页纸，后来开创了群论——整个现代代数学的基石。20岁，一个晚上，改变了数学的走向。"
        ),
        DailyStrike(
            type: "直觉挑战",
            question: "一根绳子绕地球赤道一圈（约40,000km），现在加长1米。绳子能抬高多少？",
            answer: "约16厘米——足够一只猫钻过去！",
            detail: "设原来半径R，新半径R+h。2pi(R+h) - 2piR = 1m，所以 h = 1/(2pi) ≈ 0.159m ≈ 16cm。令人惊讶的是，这个结果与地球大小无关！"
        ),
    ]
}
