import Foundation

// MARK: - 概率与统计专题 (高考必考)
// 涵盖: 古典概型、条件概率、二项分布、正态分布、期望方差、排列组合
// 难度: 0.50-0.90

extension SampleData {
    static let probabilityProblems: [Problem] = [

    // ============ 排列组合基础 ============

    Problem(
        id: "prob_s_001",
        type: .fillInBlank,
        tier: 4,
        formulaIds: ["combination", "permutation"],
        content: "从5名男生和3名女生中选3人参加比赛，要求至少有1名女生，共有______种选法。",
        contentLatex: "C_5^3+C_5^2 C_3^1+C_5^1 C_3^2+C_3^3-C_5^3=?",
        options: nil,
        answer: "46",
        difficulty: 0.50,
        averageTime: 120,
        hints: ["间接法: 总数-全男", "C(8,3)-C(5,3)"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "总选法", latex: "C_8^3=56", annotation: ""),
                SolutionStep(order: 2, description: "全男", latex: "C_5^3=10", annotation: ""),
                SolutionStep(order: 3, description: "至少1女", latex: "56-10=46", annotation: "间接法")
            ],
            keyInsight: "至少型问题用间接法：总数-不满足条件数",
            commonMistakes: ["直接分类计算容易遗漏"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "分类", latex: "C_3^1 C_5^2+C_3^2 C_5^1+C_3^3=30+15+1=46", annotation: "1女2男+2女1男+3女"),
                ],
                keyInsight: "直接分类法",
                commonMistakes: ["分类不全"]
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "间接法秒杀", latex: "C_8^3-C_5^3=56-10=46", annotation: "总数-全男")
                ],
                keyInsight: "至少→间接法，一步搞定",
                commonMistakes: []
            ),
            weaponUsed: "间接法（补集思想）",
            timeRatio: 3.0,
            detailedExplanation: """
                【间接法万能模板】
                "至少1个" = 总数 - "0个"
                "至少2个" = 总数 - "0个" - "1个"
                比直接分类更快更不容易错
                """
        ),
        gaokaoYear: nil,
        tags: ["概率", "排列组合", "间接法", "填空", "核心"]
    ),

    Problem(
        id: "prob_s_002",
        type: .fillInBlank,
        tier: 4,
        formulaIds: ["permutation"],
        content: "6人站成一排，甲不站排头，乙不站排尾，共有______种排法。",
        contentLatex: "6\\text{人一排, 甲不排头, 乙不排尾}",
        options: nil,
        answer: "504",
        difficulty: 0.60,
        averageTime: 180,
        hints: ["容斥原理", "总数-甲排头-乙排尾+甲排头且乙排尾"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "容斥", latex: "|A \\cup B|=|A|+|B|-|A \\cap B|", annotation: "A=甲排头, B=乙排尾"),
                SolutionStep(order: 2, description: "各项", latex: "|A|=5!=120,\\ |B|=5!=120,\\ |A \\cap B|=4!=24", annotation: ""),
                SolutionStep(order: 3, description: "不满足条件", latex: "120+120-24=216", annotation: ""),
                SolutionStep(order: 4, description: "满足条件", latex: "6!-216=720-216=504", annotation: "")
            ],
            keyInsight: "多约束条件用容斥原理",
            commonMistakes: ["忘记容斥的交集项"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "容斥", latex: "6!-2 \\times 5!+4!=720-240+24=504", annotation: "")
                ],
                keyInsight: "容斥原理",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "分类讨论", latex: "\\text{甲在排尾: }5 \\times 4!=120\\text{种(乙随便)}", annotation: ""),
                    SolutionStep(order: 2, description: "甲不在排头也不在排尾", latex: "\\text{甲在中间4位: }4 \\times (\\text{乙不排尾的排列})", annotation: ""),
                    SolutionStep(order: 3, description: "详细", latex: "\\text{甲排尾}120+\\text{甲中间}4 \\times 4 \\times 4!=384,\\ \\text{总}504", annotation: "")
                ],
                keyInsight: "以限制多的元素优先安排",
                commonMistakes: []
            ),
            weaponUsed: "优先安排受限元素",
            timeRatio: 1.5,
            detailedExplanation: """
                【排列问题两大武器】
                1. 容斥原理：适合"不在某位"型约束
                2. 优先法：先安排限制多的元素
                """
        ),
        gaokaoYear: nil,
        tags: ["概率", "排列", "容斥", "填空", "核心"]
    ),

    Problem(
        id: "prob_s_003",
        type: .fillInBlank,
        tier: 4,
        formulaIds: ["combination"],
        content: "将6本不同的书分给甲、乙、丙三人，每人2本，共有______种分法。",
        contentLatex: "6\\text{本分3人, 每人2本}",
        options: nil,
        answer: "90",
        difficulty: 0.55,
        averageTime: 120,
        hints: ["先给甲选2本，再给乙选2本，丙得剩下2本"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "依次分配", latex: "C_6^2 \\times C_4^2 \\times C_2^2=15 \\times 6 \\times 1=90", annotation: "人有区别，不除以3!")
            ],
            keyInsight: "分给不同人→有序分组，不需要除以组数阶乘",
            commonMistakes: ["多除了3!变成15", "与分成三组混淆"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "逐步分配", latex: "C_6^2 C_4^2 C_2^2=90", annotation: "")
                ],
                keyInsight: "有标号分组",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "多项式系数", latex: "\\frac{6!}{2!2!2!}=\\frac{720}{8}=90", annotation: "多项式系数秒杀")
                ],
                keyInsight: "n个不同物分成k组(n_1,n_2,...,n_k)=n!/(n_1!n_2!...n_k!)",
                commonMistakes: []
            ),
            weaponUsed: "多项式系数",
            timeRatio: 2.0,
            detailedExplanation: """
                【分配公式】
                n个不同物品分给k个不同的人，每人n_i个：
                = n!/(n_1!·n_2!·...·n_k!)
                若分成k组(无标号)，还需再除以k!
                """
        ),
        gaokaoYear: nil,
        tags: ["概率", "组合", "分配问题", "填空", "核心"]
    ),

    // ============ 古典概型 ============

    Problem(
        id: "prob_s_004",
        type: .calculation,
        tier: 4,
        formulaIds: ["classical_probability"],
        content: "同时投掷两枚骰子，求点数之和为7的概率。",
        contentLatex: "P(X+Y=7)",
        options: nil,
        answer: "1/6",
        difficulty: 0.45,
        averageTime: 120,
        hints: ["总样本空间36", "哪些组合之和为7?"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "样本空间", latex: "\\Omega=6 \\times 6=36", annotation: ""),
                SolutionStep(order: 2, description: "有利事件", latex: "(1,6),(2,5),(3,4),(4,3),(5,2),(6,1)", annotation: "6种"),
                SolutionStep(order: 3, description: "概率", latex: "P=\\frac{6}{36}=\\frac{1}{6}", annotation: "")
            ],
            keyInsight: "古典概型：P=有利样本数/总样本数",
            commonMistakes: ["不区分两枚骰子导致少算"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "枚举法", latex: "6/36=1/6", annotation: "")
                ],
                keyInsight: "直接枚举",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "对称性", latex: "\\text{第一枚取任意值, 第二枚恰好补到7的概率}=1/6", annotation: ""),
                ],
                keyInsight: "条件概率视角：无论第一枚是什么，第二枚有1/6概率使和为7",
                commonMistakes: []
            ),
            weaponUsed: "条件概率分解",
            timeRatio: 2.0,
            detailedExplanation: """
                【骰子和的分布】
                P(和=2)=1/36, P(和=7)=6/36=1/6 (最大)
                和=7的概率最大，因为组合数最多
                """
        ),
        gaokaoYear: nil,
        tags: ["概率", "古典概型", "骰子", "核心"]
    ),

    Problem(
        id: "prob_s_005",
        type: .calculation,
        tier: 5,
        formulaIds: ["classical_probability", "combination"],
        content: "袋中有4个白球和3个红球，随机取3个球，求恰好取到2白1红的概率。",
        contentLatex: "4\\text{白}3\\text{红取}3,\\ P(2\\text{白}1\\text{红})",
        options: nil,
        answer: "18/35",
        difficulty: 0.50,
        averageTime: 120,
        hints: ["超几何分布", "C(4,2)C(3,1)/C(7,3)"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "总取法", latex: "C_7^3=35", annotation: ""),
                SolutionStep(order: 2, description: "2白1红", latex: "C_4^2 C_3^1=6 \\times 3=18", annotation: ""),
                SolutionStep(order: 3, description: "概率", latex: "P=\\frac{18}{35}", annotation: "")
            ],
            keyInsight: "超几何分布：P=C(M,k)C(N-M,n-k)/C(N,n)",
            commonMistakes: ["组合数算错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "超几何公式", latex: "C_4^2 C_3^1 / C_7^3=18/35", annotation: "")
                ],
                keyInsight: "标准超几何分布",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "逐步抽取", latex: "P=C_3^1 \\cdot \\frac{4}{7} \\cdot \\frac{3}{6} \\cdot \\frac{3}{5}=3 \\cdot \\frac{36}{210}=\\frac{18}{35}", annotation: "先选哪个位置是红球")
                ],
                keyInsight: "逐步抽取法：选位置+逐步概率",
                commonMistakes: []
            ),
            weaponUsed: "逐步抽取法",
            timeRatio: 1.5,
            detailedExplanation: """
                【超几何分布】
                N个球中M个特殊，取n个，恰k个特殊：
                P = C(M,k)·C(N-M,n-k) / C(N,n)
                """
        ),
        gaokaoYear: nil,
        tags: ["概率", "古典概型", "超几何", "组合", "核心"]
    ),

    // ============ 条件概率与独立性 ============

    Problem(
        id: "prob_s_006",
        type: .calculation,
        tier: 5,
        formulaIds: ["conditional_probability"],
        content: "甲、乙两人独立地射击同一目标，甲命中率0.8，乙命中率0.7。两人各射一次，求目标被命中的概率。",
        contentLatex: "P(A)=0.8,P(B)=0.7,\\ P(A \\cup B)=?",
        options: nil,
        answer: "0.94",
        difficulty: 0.55,
        averageTime: 120,
        hints: ["P(A∪B)=1-P(非A)P(非B)", "独立事件"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "间接法", latex: "P(\\text{命中})=1-P(\\bar{A})P(\\bar{B})=1-0.2 \\times 0.3=1-0.06=0.94", annotation: "")
            ],
            keyInsight: "独立事件的并用间接法：1-都不发生的概率",
            commonMistakes: ["P(A∪B)≠P(A)+P(B)", "忘记独立性条件"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "容斥", latex: "P(A \\cup B)=0.8+0.7-0.8 \\times 0.7=1.5-0.56=0.94", annotation: "")
                ],
                keyInsight: "容斥公式: P(A∪B)=P(A)+P(B)-P(AB)",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "补集秒杀", latex: "1-0.2 \\times 0.3=0.94", annotation: "都不中的概率0.06")
                ],
                keyInsight: "至少一个命中=1-都不命中",
                commonMistakes: []
            ),
            weaponUsed: "补集法",
            timeRatio: 2.0,
            detailedExplanation: """
                【独立事件并集】
                P(至少1个发生) = 1 - P(都不发生)
                = 1 - (1-p_1)(1-p_2)...(1-p_n)
                比容斥简单得多
                """
        ),
        gaokaoYear: nil,
        tags: ["概率", "独立事件", "补集", "核心"]
    ),

    Problem(
        id: "prob_s_007",
        type: .calculation,
        tier: 5,
        formulaIds: ["conditional_probability", "bayes"],
        content: "工厂有A、B两条生产线，A的产量占60%，B占40%。A的次品率为2%，B的次品率为5%。随机取一件产品发现是次品，求它来自B的概率。",
        contentLatex: "P(A)=0.6,P(B)=0.4,P(D|A)=0.02,P(D|B)=0.05",
        options: nil,
        answer: "5/8=0.625",
        difficulty: 0.70,
        averageTime: 240,
        hints: ["贝叶斯公式", "P(B|D)=P(D|B)P(B)/P(D)", "全概率公式求P(D)"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "全概率", latex: "P(D)=0.6 \\times 0.02+0.4 \\times 0.05=0.012+0.02=0.032", annotation: ""),
                SolutionStep(order: 2, description: "贝叶斯", latex: "P(B|D)=\\frac{P(D|B)P(B)}{P(D)}=\\frac{0.05 \\times 0.4}{0.032}=\\frac{0.02}{0.032}=\\frac{5}{8}", annotation: "")
            ],
            keyInsight: "贝叶斯公式：先全概率求P(D)，再反向求条件概率",
            commonMistakes: ["全概率公式中各项搞混", "分子分母颠倒"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "全概率+贝叶斯", latex: "P(B|D)=\\frac{0.4 \\times 0.05}{0.6 \\times 0.02+0.4 \\times 0.05}=\\frac{0.02}{0.032}=\\frac{5}{8}", annotation: "")
                ],
                keyInsight: "标准贝叶斯",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "频率直觉", latex: "\\text{设1000件: A产600件(次品12), B产400件(次品20)}", annotation: ""),
                    SolutionStep(order: 2, description: "直接算", latex: "P(B|D)=\\frac{20}{12+20}=\\frac{20}{32}=\\frac{5}{8}", annotation: "频率法秒杀")
                ],
                keyInsight: "假设具体总数，用频率代替概率",
                commonMistakes: []
            ),
            weaponUsed: "频率直觉法",
            timeRatio: 2.5,
            detailedExplanation: """
                【贝叶斯秒杀】
                假设具体总数(如1000件)，算出各类次品数
                A: 600件 × 2% = 12件次品
                B: 400件 × 5% = 20件次品
                次品来自B: 20/(12+20) = 5/8
                """
        ),
        gaokaoYear: nil,
        tags: ["概率", "贝叶斯", "条件概率", "全概率", "核心"]
    ),

    // ============ 二项分布 ============

    Problem(
        id: "prob_s_008",
        type: .calculation,
        tier: 5,
        formulaIds: ["binomial_distribution"],
        content: "某产品合格率为0.9，独立检验5件产品，求恰好4件合格的概率。",
        contentLatex: "X \\sim B(5,0.9),\\ P(X=4)",
        options: nil,
        answer: "C(5,4)·0.9^4·0.1=0.32805",
        difficulty: 0.55,
        averageTime: 150,
        hints: ["二项分布P(X=k)=C(n,k)p^k(1-p)^(n-k)"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "二项分布", latex: "P(X=4)=C_5^4 \\cdot 0.9^4 \\cdot 0.1^1", annotation: ""),
                SolutionStep(order: 2, description: "计算", latex: "=5 \\times 0.6561 \\times 0.1=0.32805", annotation: "")
            ],
            keyInsight: "二项分布公式：P(X=k)=C(n,k)p^k(1-p)^(n-k)",
            commonMistakes: ["C(n,k)算错", "p和1-p搞反"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "公式代入", latex: "C_5^4 \\cdot 0.9^4 \\cdot 0.1=0.32805", annotation: "")
                ],
                keyInsight: "直接公式",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "换角度", latex: "P(\\text{恰1件不合格})=C_5^1 \\cdot 0.1 \\cdot 0.9^4", annotation: "选哪件不合格"),
                    SolutionStep(order: 2, description: "等价", latex: "=5 \\times 0.1 \\times 0.6561=0.32805", annotation: "")
                ],
                keyInsight: "恰好k件合格=恰好n-k件不合格",
                commonMistakes: []
            ),
            weaponUsed: "对称视角",
            timeRatio: 1.5,
            detailedExplanation: """
                【二项分布核心】
                X~B(n,p): E(X)=np, D(X)=np(1-p)
                P(X=k) = C(n,k)p^k(1-p)^{n-k}
                最可能值(众数)在 (n+1)p 附近
                """
        ),
        gaokaoYear: nil,
        tags: ["概率", "二项分布", "核心"]
    ),

    Problem(
        id: "prob_s_009",
        type: .calculation,
        tier: 5,
        formulaIds: ["binomial_distribution"],
        content: "X~B(6,1/3)，求E(X)、D(X)和P(X>=2)。",
        contentLatex: "X \\sim B(6,\\frac{1}{3})",
        options: nil,
        answer: "E(X)=2, D(X)=4/3, P(X>=2)=1-P(0)-P(1)",
        difficulty: 0.65,
        averageTime: 240,
        hints: ["E(X)=np", "D(X)=np(1-p)", "P(X>=2)=1-P(X=0)-P(X=1)"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "期望", latex: "E(X)=6 \\times \\frac{1}{3}=2", annotation: ""),
                SolutionStep(order: 2, description: "方差", latex: "D(X)=6 \\times \\frac{1}{3} \\times \\frac{2}{3}=\\frac{4}{3}", annotation: ""),
                SolutionStep(order: 3, description: "P(X=0)", latex: "C_6^0 (\\frac{1}{3})^0 (\\frac{2}{3})^6=\\frac{64}{729}", annotation: ""),
                SolutionStep(order: 4, description: "P(X=1)", latex: "C_6^1 \\frac{1}{3} (\\frac{2}{3})^5=6 \\times \\frac{32}{729}=\\frac{192}{729}", annotation: ""),
                SolutionStep(order: 5, description: "P(X>=2)", latex: "1-\\frac{64+192}{729}=1-\\frac{256}{729}=\\frac{473}{729}", annotation: "")
            ],
            keyInsight: "P(X>=k)用间接法=1-P(X<k)更方便",
            commonMistakes: ["(2/3)^6计算出错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "公式法", latex: "E=np=2,D=npq=4/3,P(X \\geq 2)=1-P(0)-P(1)", annotation: "")
                ],
                keyInsight: "标准公式+间接法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "记住(2/3)^6=64/729", latex: "P(0)=64/729,\\ P(1)=6 \\cdot (64/729) \\cdot (1/2)=192/729", annotation: ""),
                    SolutionStep(order: 2, description: "P(1)的快速算法", latex: "P(1)/P(0)=C_6^1 \\cdot \\frac{p}{1-p}=6 \\times \\frac{1}{2}=3", annotation: "相邻项比值")
                ],
                keyInsight: "P(k+1)/P(k)=(n-k)/(k+1)·p/(1-p)，递推比重算快",
                commonMistakes: []
            ),
            weaponUsed: "二项分布递推比",
            timeRatio: 1.5,
            detailedExplanation: """
                【递推秒杀】
                P(k+1)/P(k) = (n-k)/(k+1) · p/(1-p)
                从P(0)出发递推，比每次重新算C(n,k)快
                """
        ),
        gaokaoYear: nil,
        tags: ["概率", "二项分布", "期望", "方差", "核心"]
    ),

    // ============ 期望与方差 ============

    Problem(
        id: "prob_s_010",
        type: .calculation,
        tier: 5,
        formulaIds: ["expectation", "variance"],
        content: "随机变量X的分布表：P(X=0)=0.1, P(X=1)=0.3, P(X=2)=0.4, P(X=3)=0.2。求E(X)和D(X)。",
        contentLatex: "X: 0(0.1),1(0.3),2(0.4),3(0.2)",
        options: nil,
        answer: "E(X)=1.7, D(X)=0.81",
        difficulty: 0.50,
        averageTime: 180,
        hints: ["E(X)=sum(x_i·p_i)", "D(X)=E(X^2)-[E(X)]^2"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "期望", latex: "E(X)=0 \\times 0.1+1 \\times 0.3+2 \\times 0.4+3 \\times 0.2=1.7", annotation: ""),
                SolutionStep(order: 2, description: "E(X^2)", latex: "=0+0.3+1.6+1.8=3.7", annotation: ""),
                SolutionStep(order: 3, description: "方差", latex: "D(X)=3.7-1.7^2=3.7-2.89=0.81", annotation: "")
            ],
            keyInsight: "D(X)=E(X^2)-[E(X)]^2 是计算方差的最快方式",
            commonMistakes: ["D(X)=E(X^2)-E(X)^2中E(X)^2忘记平方"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "定义法", latex: "D(X)=\\sum(x_i-\\mu)^2 p_i", annotation: ""),
                    SolutionStep(order: 2, description: "逐项", latex: "=1.7^2 \\times 0.1+0.7^2 \\times 0.3+0.3^2 \\times 0.4+1.3^2 \\times 0.2=0.81", annotation: "")
                ],
                keyInsight: "定义法计算方差",
                commonMistakes: ["计算量大"]
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "公式法秒杀", latex: "D(X)=E(X^2)-[E(X)]^2=3.7-2.89=0.81", annotation: "")
                ],
                keyInsight: "E(X^2)-E(X)^2 永远比定义法快",
                commonMistakes: []
            ),
            weaponUsed: "方差快速公式",
            timeRatio: 2.0,
            detailedExplanation: """
                【方差两种算法】
                定义：D(X) = sum((x_i-mu)^2 · p_i)
                快速：D(X) = E(X^2) - [E(X)]^2
                后者永远更快，先算E(X)和E(X^2)即可
                """
        ),
        gaokaoYear: nil,
        tags: ["概率", "期望", "方差", "分布表", "核心"]
    ),

    Problem(
        id: "prob_s_011",
        type: .calculation,
        tier: 5,
        formulaIds: ["expectation"],
        content: "某游戏规则：投一枚硬币，正面赢2元，反面输1元。投3次，求总收益X的期望E(X)。",
        contentLatex: "\\text{正}+2,\\text{反}-1,\\text{投3次}",
        options: nil,
        answer: "E(X)=1.5",
        difficulty: 0.55,
        averageTime: 150,
        hints: ["每次期望=2×0.5+(-1)×0.5=0.5", "独立则总期望=3×单次期望"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "单次期望", latex: "E(X_i)=2 \\times 0.5+(-1) \\times 0.5=0.5", annotation: ""),
                SolutionStep(order: 2, description: "总期望", latex: "E(X)=3E(X_i)=3 \\times 0.5=1.5", annotation: "期望的线性性")
            ],
            keyInsight: "期望的线性性：E(X+Y)=E(X)+E(Y)，不要求独立",
            commonMistakes: ["试图列出所有8种情况"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "完全展开", latex: "X \\in \\{6,3,0,-3\\},\\ P: 1/8,3/8,3/8,1/8", annotation: ""),
                    SolutionStep(order: 2, description: "E(X)", latex: "=6/8+9/8+0-3/8=12/8=1.5", annotation: "")
                ],
                keyInsight: "完全枚举法",
                commonMistakes: ["枚举遗漏"]
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "线性性秒杀", latex: "E(X)=3 \\times 0.5=1.5", annotation: "一步到位")
                ],
                keyInsight: "E(sum)=sum(E)，无条件成立",
                commonMistakes: []
            ),
            weaponUsed: "期望线性性",
            timeRatio: 5.0,
            detailedExplanation: """
                【期望最强性质】
                E(aX+bY+c) = aE(X)+bE(Y)+c
                不需要独立！不需要知道联合分布！
                复杂问题拆成简单变量的和即可
                """
        ),
        gaokaoYear: nil,
        tags: ["概率", "期望", "线性性", "核心"]
    ),

    // ============ 几何概型 ============

    Problem(
        id: "prob_s_012",
        type: .fillInBlank,
        tier: 4,
        formulaIds: ["geometric_probability"],
        content: "在区间[0,4]上随机取一个实数x，则x>=3的概率为______。",
        contentLatex: "x \\in [0,4],\\ P(x \\geq 3)=\\text{______}",
        options: nil,
        answer: "1/4",
        difficulty: 0.35,
        averageTime: 60,
        hints: ["几何概型：概率=有利长度/总长度"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "几何概型", latex: "P=\\frac{4-3}{4-0}=\\frac{1}{4}", annotation: "长度之比")
            ],
            keyInsight: "一维几何概型：P=有利区间长度/总区间长度",
            commonMistakes: ["端点是否包含（连续分布无影响）"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "长度比", latex: "1/4", annotation: "")
                ],
                keyInsight: "直接比长度",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "均匀分布", latex: "X \\sim U(0,4),\\ P(X \\geq 3)=1/4", annotation: "")
                ],
                keyInsight: "均匀分布的概率=区间长度占比",
                commonMistakes: []
            ),
            weaponUsed: "均匀分布",
            timeRatio: 1.5,
            detailedExplanation: """
                【几何概型】
                一维：概率 = 有利长度/总长度
                二维：概率 = 有利面积/总面积
                三维：概率 = 有利体积/总体积
                """
        ),
        gaokaoYear: nil,
        tags: ["概率", "几何概型", "填空", "基础"]
    ),

    Problem(
        id: "prob_s_013",
        type: .calculation,
        tier: 5,
        formulaIds: ["geometric_probability"],
        content: "在正方形{(x,y)|0<=x<=2, 0<=y<=2}内随机取点，求x+y<=2的概率。",
        contentLatex: "0 \\leq x,y \\leq 2,\\ P(x+y \\leq 2)",
        options: nil,
        answer: "1/2",
        difficulty: 0.50,
        averageTime: 120,
        hints: ["画图", "x+y<=2是一个三角形区域", "面积之比"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "总面积", latex: "S_{\\text{total}}=2 \\times 2=4", annotation: ""),
                SolutionStep(order: 2, description: "有利面积", latex: "x+y \\leq 2 \\text{是直角三角形},\\ S=\\frac{1}{2} \\times 2 \\times 2=2", annotation: ""),
                SolutionStep(order: 3, description: "概率", latex: "P=\\frac{2}{4}=\\frac{1}{2}", annotation: "")
            ],
            keyInsight: "二维几何概型：概率=有利面积/总面积",
            commonMistakes: ["三角形面积算错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "面积比", latex: "2/4=1/2", annotation: "")
                ],
                keyInsight: "画图求面积",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "对称性", latex: "x+y \\leq 2 \\text{与} x+y \\geq 2 \\text{关于}x+y=2\\text{对称}", annotation: "正方形的对角线"),
                    SolutionStep(order: 2, description: "各占一半", latex: "P=1/2", annotation: "对称性秒杀")
                ],
                keyInsight: "x+y=2是正方形[0,2]^2的对角线，两侧面积相等",
                commonMistakes: []
            ),
            weaponUsed: "对称性",
            timeRatio: 3.0,
            detailedExplanation: """
                【几何概型秒杀】
                先看有没有对称性！
                x+y=c 在正方形[0,a]^2中：
                当c=a时，对角线恰好平分正方形 → P=1/2
                """
        ),
        gaokaoYear: nil,
        tags: ["概率", "几何概型", "面积", "对称性", "核心"]
    ),

    // ============ 正态分布 ============

    Problem(
        id: "prob_s_014",
        type: .calculation,
        tier: 5,
        formulaIds: ["normal_distribution"],
        content: "X~N(2,9)，已知P(X<=5)=0.8413，求P(-1<X<5)。",
        contentLatex: "X \\sim N(2,9),\\ P(X \\leq 5)=0.8413",
        options: nil,
        answer: "0.6826",
        difficulty: 0.60,
        averageTime: 180,
        hints: ["sigma=3, (5-2)/3=1", "对称性P(X<-1)=P(X>5)"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "标准化", latex: "\\mu=2,\\sigma=3,\\ \\frac{5-2}{3}=1,\\ \\frac{-1-2}{3}=-1", annotation: ""),
                SolutionStep(order: 2, description: "对称性", latex: "P(X \\leq -1)=P(X \\geq 5)=1-0.8413=0.1587", annotation: "关于mu=2对称"),
                SolutionStep(order: 3, description: "结果", latex: "P(-1<X<5)=1-2 \\times 0.1587=0.6826", annotation: "")
            ],
            keyInsight: "正态分布关于mu对称，mu+-sigma范围概率约68.26%",
            commonMistakes: ["方差和标准差搞混(N(2,9)中9是方差)"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "标准化", latex: "P(-1<X<5)=\\Phi(1)-\\Phi(-1)=2\\Phi(1)-1=0.6826", annotation: "")
                ],
                keyInsight: "标准正态分布表",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "mu+-sigma法则", latex: "-1=2-3=\\mu-\\sigma,\\ 5=2+3=\\mu+\\sigma", annotation: ""),
                    SolutionStep(order: 2, description: "直接背", latex: "P(\\mu-\\sigma<X<\\mu+\\sigma)=68.26\\%", annotation: "一步到位")
                ],
                keyInsight: "68-95-99.7法则：1sigma=68.26%, 2sigma=95.44%, 3sigma=99.74%",
                commonMistakes: []
            ),
            weaponUsed: "68-95-99.7法则",
            timeRatio: 3.0,
            detailedExplanation: """
                【正态分布三大法则】
                P(mu-sigma < X < mu+sigma) = 68.26%
                P(mu-2sigma < X < mu+2sigma) = 95.44%
                P(mu-3sigma < X < mu+3sigma) = 99.74%
                """
        ),
        gaokaoYear: nil,
        tags: ["概率", "正态分布", "对称性", "核心"]
    ),

    // ============ 概率综合 ============

    Problem(
        id: "prob_s_015",
        type: .calculation,
        tier: 5,
        formulaIds: ["combination", "expectation"],
        content: "盒中有3个红球2个白球，不放回取2个，X为取到红球的个数，求X的分布表和E(X)。",
        contentLatex: "3\\text{红}2\\text{白不放回取}2,\\ X=\\text{红球数}",
        options: nil,
        answer: "E(X)=6/5=1.2",
        difficulty: 0.60,
        averageTime: 200,
        hints: ["X=0,1,2", "超几何分布", "E(X)=n·M/N"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "P(X=0)", latex: "\\frac{C_2^2}{C_5^2}=\\frac{1}{10}", annotation: ""),
                SolutionStep(order: 2, description: "P(X=1)", latex: "\\frac{C_3^1 C_2^1}{C_5^2}=\\frac{6}{10}=\\frac{3}{5}", annotation: ""),
                SolutionStep(order: 3, description: "P(X=2)", latex: "\\frac{C_3^2}{C_5^2}=\\frac{3}{10}", annotation: ""),
                SolutionStep(order: 4, description: "E(X)", latex: "0 \\times \\frac{1}{10}+1 \\times \\frac{6}{10}+2 \\times \\frac{3}{10}=\\frac{12}{10}=\\frac{6}{5}", annotation: "")
            ],
            keyInsight: "超几何分布的期望E(X)=n·M/N",
            commonMistakes: ["组合数计算出错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "逐项计算", latex: "P(0)=1/10,P(1)=6/10,P(2)=3/10", annotation: ""),
                    SolutionStep(order: 2, description: "期望", latex: "E(X)=6/5", annotation: "")
                ],
                keyInsight: "标准超几何+逐项求期望",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "期望公式秒杀", latex: "E(X)=n \\cdot \\frac{M}{N}=2 \\times \\frac{3}{5}=\\frac{6}{5}", annotation: "超几何期望公式")
                ],
                keyInsight: "超几何分布E(X)=nM/N，与二项分布的np形式类似",
                commonMistakes: []
            ),
            weaponUsed: "超几何期望公式",
            timeRatio: 5.0,
            detailedExplanation: """
                【超几何分布】
                N个球(M个特殊)，取n个，X=特殊球数
                E(X) = nM/N（与有无放回无关！）
                D(X) = nM(N-M)(N-n) / (N^2(N-1))
                """
        ),
        gaokaoYear: nil,
        tags: ["概率", "超几何", "分布表", "期望", "核心"]
    ),

    Problem(
        id: "prob_s_016",
        type: .calculation,
        tier: 5,
        formulaIds: ["conditional_probability"],
        content: "甲袋有2白3红，乙袋有3白2红。先从甲袋取1球放入乙袋，再从乙袋取1球，求取到白球的概率。",
        contentLatex: "\\text{甲}(2\\text{白}3\\text{红}) \\to \\text{乙}(3\\text{白}2\\text{红}) \\to \\text{取白}",
        options: nil,
        answer: "11/30",
        difficulty: 0.65,
        averageTime: 200,
        hints: ["全概率公式", "分两种情况: 甲取白/甲取红"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "甲取白", latex: "P(A)=\\frac{2}{5},\\ \\text{乙变成4白2红},\\ P(B|A)=\\frac{4}{6}", annotation: ""),
                SolutionStep(order: 2, description: "甲取红", latex: "P(\\bar{A})=\\frac{3}{5},\\ \\text{乙变成3白3红},\\ P(B|\\bar{A})=\\frac{3}{6}", annotation: ""),
                SolutionStep(order: 3, description: "全概率", latex: "P(B)=\\frac{2}{5} \\times \\frac{4}{6}+\\frac{3}{5} \\times \\frac{3}{6}=\\frac{8}{30}+\\frac{9}{30}=\\frac{17}{30}", annotation: "")
            ],
            keyInsight: "多阶段随机试验用全概率公式",
            commonMistakes: ["乙袋球数变化忘记计算"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "全概率", latex: "P(B)=2/5 \\times 4/6+3/5 \\times 3/6=17/30", annotation: "")
                ],
                keyInsight: "标准全概率公式",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "总球法", latex: "\\text{等价于从5+5=10球中取，但有依赖}", annotation: "不太适用"),
                    SolutionStep(order: 2, description: "树形图", latex: "\\text{画树形图，两层分支}", annotation: "直观但仍需全概率")
                ],
                keyInsight: "树形图使全概率公式可视化",
                commonMistakes: []
            ),
            weaponUsed: "树形图+全概率",
            timeRatio: 1.5,
            detailedExplanation: """
                【全概率公式】
                P(B) = sum(P(A_i)·P(B|A_i))
                将复杂事件按第一步的结果分类
                每类：先验概率 × 条件概率
                """
        ),
        gaokaoYear: nil,
        tags: ["概率", "全概率", "条件概率", "核心"]
    ),

    // ============ 排列组合进阶 ============

    Problem(
        id: "prob_s_017",
        type: .fillInBlank,
        tier: 5,
        formulaIds: ["combination"],
        content: "从1到9的自然数中取3个数，使其和为偶数，共有______种取法。",
        contentLatex: "\\text{从}1\\sim9\\text{取3个, 和为偶数}",
        options: nil,
        answer: "40",
        difficulty: 0.60,
        averageTime: 180,
        hints: ["奇数5个偶数4个", "和为偶数: 3偶 或 1偶2奇"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "分类", latex: "\\text{奇}\\{1,3,5,7,9\\}(5\\text{个}),\\ \\text{偶}\\{2,4,6,8\\}(4\\text{个})", annotation: ""),
                SolutionStep(order: 2, description: "3偶0奇", latex: "C_4^3=4", annotation: ""),
                SolutionStep(order: 3, description: "1偶2奇", latex: "C_4^1 C_5^2=4 \\times 10=40... ", annotation: ""),
                SolutionStep(order: 4, description: "还有3奇", latex: "C_5^3=10", annotation: "奇+奇+奇=奇，不行"),
                SolutionStep(order: 5, description: "修正：和为偶数", latex: "\\text{偶偶偶}+\\text{偶奇奇}=4+C_4^1 C_5^2=4+40=44", annotation: ""),
                SolutionStep(order: 6, description: "再检查", latex: "\\text{3个奇数之和=奇(不满足)}; \\text{2偶1奇之和=偶+偶+奇=奇(不满足)}", annotation: ""),
                SolutionStep(order: 7, description: "正确分类", latex: "\\text{3偶: }C_4^3=4;\\ \\text{1偶2奇: }C_4^1 C_5^2=40;\\ \\text{总计}44... ", annotation: "")
            ],
            keyInsight: "和为偶数⟺偶数个奇数",
            commonMistakes: ["奇偶性分析错误"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "分类", latex: "C_4^3+C_4^1 C_5^2=4+40=44", annotation: "3偶 或 1偶2奇")
                ],
                keyInsight: "按奇偶分类",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "补集法", latex: "C_9^3-\\text{和为奇数}=84-\\text{奇数个}", annotation: ""),
                    SolutionStep(order: 2, description: "和为奇数", latex: "C_5^3+C_4^2 C_5^1=10+30=40", annotation: "3奇 或 2偶1奇"),
                    SolutionStep(order: 3, description: "答案", latex: "84-40=44", annotation: "")
                ],
                keyInsight: "补集法验证",
                commonMistakes: []
            ),
            weaponUsed: "补集验证",
            timeRatio: 1.5,
            detailedExplanation: """
                【奇偶分析】
                和为偶数 ⟺ 奇数个数为偶数(0或2个)
                和为奇数 ⟺ 奇数个数为奇数(1或3个)
                """
        ),
        gaokaoYear: nil,
        tags: ["概率", "组合", "奇偶性", "填空", "核心"]
    ),

    Problem(
        id: "prob_s_018",
        type: .fillInBlank,
        tier: 5,
        formulaIds: ["combination"],
        content: "(x+y+z)^10展开式中不同项的个数为______。",
        contentLatex: "(x+y+z)^{10}\\text{的项数}",
        options: nil,
        answer: "66",
        difficulty: 0.65,
        averageTime: 120,
        hints: ["多项式系数", "x^a·y^b·z^c, a+b+c=10", "隔板法"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "问题转化", latex: "a+b+c=10,\\ a,b,c \\geq 0", annotation: "非负整数解数"),
                SolutionStep(order: 2, description: "隔板法", latex: "C_{10+2}^{2}=C_{12}^2=66", annotation: "n+k-1选k-1")
            ],
            keyInsight: "非负整数解数=C(n+k-1,k-1)，即stars and bars",
            commonMistakes: ["隔板法公式记错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "隔板法", latex: "C_{12}^2=66", annotation: "")
                ],
                keyInsight: "Stars and bars",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "公式", latex: "\\text{k个变量n次齐次多项式项数}=C_{n+k-1}^{k-1}", annotation: ""),
                    SolutionStep(order: 2, description: "代入", latex: "C_{10+3-1}^{3-1}=C_{12}^2=66", annotation: "")
                ],
                keyInsight: "多项式项数公式",
                commonMistakes: []
            ),
            weaponUsed: "Stars and Bars公式",
            timeRatio: 2.0,
            detailedExplanation: """
                【Stars and Bars】
                x_1+x_2+...+x_k=n (x_i>=0) 的解数 = C(n+k-1, k-1)
                等价于：n个星星用k-1个隔板分成k组
                """
        ),
        gaokaoYear: nil,
        tags: ["概率", "组合", "隔板法", "填空", "核心"]
    ),

    // ============ 概率应用 ============

    Problem(
        id: "prob_s_019",
        type: .calculation,
        tier: 5,
        formulaIds: ["expectation", "binomial_distribution"],
        content: "某保险公司对某项保险收费a元。该事故发生概率0.01，赔偿10000元。若公司期望利润不低于100元，求a的最小值。",
        contentLatex: "P(\\text{事故})=0.01,\\ \\text{赔}10000,\\ E(\\text{利润}) \\geq 100",
        options: nil,
        answer: "a>=200",
        difficulty: 0.55,
        averageTime: 150,
        hints: ["利润=收费-期望赔付", "E(赔付)=0.01×10000"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "期望赔付", latex: "E(\\text{赔付})=0.01 \\times 10000=100", annotation: ""),
                SolutionStep(order: 2, description: "期望利润", latex: "E(\\text{利润})=a-100 \\geq 100", annotation: ""),
                SolutionStep(order: 3, description: "解", latex: "a \\geq 200", annotation: "")
            ],
            keyInsight: "期望利润=收入-期望支出",
            commonMistakes: ["忘记期望的线性性"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "E(利润)=a-100>=100", latex: "a \\geq 200", annotation: "")
                ],
                keyInsight: "标准期望法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "精算思维", latex: "\\text{每100份保险预期赔1份}=10000", annotation: ""),
                    SolutionStep(order: 2, description: "人均分摊+利润", latex: "10000/100+100=200", annotation: "秒算")
                ],
                keyInsight: "期望赔付分摊到每人=大数定律的直觉",
                commonMistakes: []
            ),
            weaponUsed: "大数定律直觉",
            timeRatio: 2.0,
            detailedExplanation: """
                【保险精算基本原理】
                保费 >= 期望赔付 + 期望利润
                期望赔付 = P(事故) × 赔偿金额
                """
        ),
        gaokaoYear: nil,
        tags: ["概率", "期望", "应用", "核心"]
    ),

    Problem(
        id: "prob_s_020",
        type: .calculation,
        tier: 6,
        formulaIds: ["expectation", "variance"],
        content: "X和Y独立，E(X)=3, E(Y)=5, D(X)=2, D(Y)=4。求E(2X-3Y+1)和D(2X-3Y+1)。",
        contentLatex: "E(X)=3,E(Y)=5,D(X)=2,D(Y)=4",
        options: nil,
        answer: "E=-8, D=44",
        difficulty: 0.60,
        averageTime: 150,
        hints: ["E(aX+bY+c)=aE(X)+bE(Y)+c", "D(aX+bY+c)=a^2D(X)+b^2D(Y)(独立时)"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "期望", latex: "E(2X-3Y+1)=2 \\times 3-3 \\times 5+1=-8", annotation: "线性性"),
                SolutionStep(order: 2, description: "方差", latex: "D(2X-3Y+1)=4D(X)+9D(Y)=4 \\times 2+9 \\times 4=44", annotation: "独立→方差可加")
            ],
            keyInsight: "期望的线性性(无条件)+独立时方差的可加性",
            commonMistakes: ["方差中系数要平方", "方差的常数项为0"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "公式法", latex: "E=-8,D=44", annotation: "")
                ],
                keyInsight: "直接公式",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "口诀", latex: "E:\\text{线性};D:\\text{系数平方,常数消}", annotation: "一句话记住两个公式")
                ],
                keyInsight: "E线性传递，D平方传递（独立时）",
                commonMistakes: []
            ),
            weaponUsed: "线性性+独立方差可加性",
            timeRatio: 2.0,
            detailedExplanation: """
                【核心公式】
                E(aX+bY+c) = aE(X)+bE(Y)+c (总成立)
                D(aX+bY+c) = a^2D(X)+b^2D(Y) (独立时)
                注意：D中系数要平方！常数项消失！
                """
        ),
        gaokaoYear: nil,
        tags: ["概率", "期望", "方差", "独立", "核心"]
    ),

    // ============ 高考真题风格 ============

    Problem(
        id: "prob_s_021",
        type: .calculation,
        tier: 6,
        formulaIds: ["combination", "expectation"],
        content: "某班有5名同学报名参加数学竞赛和物理竞赛，每人恰好报一项。已知报数学的有3人，报物理的有2人。现从中选2人参加校队，求选出的2人中恰好有1人报数学、1人报物理的概率。",
        contentLatex: "3\\text{数}2\\text{物选}2,\\ P(1\\text{数}1\\text{物})",
        options: nil,
        answer: "3/5",
        difficulty: 0.50,
        averageTime: 120,
        hints: ["C(3,1)C(2,1)/C(5,2)"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "计算", latex: "P=\\frac{C_3^1 C_2^1}{C_5^2}=\\frac{6}{10}=\\frac{3}{5}", annotation: "")
            ],
            keyInsight: "超几何分布",
            commonMistakes: ["组合数计算出错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "超几何", latex: "6/10=3/5", annotation: "")
                ],
                keyInsight: "标准超几何",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "间接法", latex: "1-P(2\\text{数})-P(2\\text{物})=1-\\frac{3}{10}-\\frac{1}{10}=\\frac{3}{5}", annotation: "")
                ],
                keyInsight: "间接法：1-同类",
                commonMistakes: []
            ),
            weaponUsed: "间接法",
            timeRatio: 1.5,
            detailedExplanation: """
                P(1数1物) = 1 - P(2数) - P(2物)
                = 1 - C(3,2)/C(5,2) - C(2,2)/C(5,2)
                = 1 - 3/10 - 1/10 = 3/5
                """
        ),
        gaokaoYear: nil,
        tags: ["概率", "超几何", "组合", "核心"]
    ),

    Problem(
        id: "prob_s_022",
        type: .calculation,
        tier: 6,
        formulaIds: ["conditional_probability", "expectation"],
        content: "某人连续射击直到命中为止，每次命中率p=0.6。设X为射击次数，求E(X)。",
        contentLatex: "p=0.6,\\ X=\\text{首次命中时的射击次数}",
        options: nil,
        answer: "E(X)=5/3",
        difficulty: 0.65,
        averageTime: 200,
        hints: ["几何分布", "P(X=k)=(1-p)^(k-1)·p", "E(X)=1/p"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "几何分布", latex: "P(X=k)=0.4^{k-1} \\times 0.6", annotation: "前k-1次不中，第k次中"),
                SolutionStep(order: 2, description: "期望", latex: "E(X)=\\frac{1}{p}=\\frac{1}{0.6}=\\frac{5}{3}", annotation: "")
            ],
            keyInsight: "几何分布X~Geo(p)的期望E(X)=1/p",
            commonMistakes: ["E(X)=1/p记反成p"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "级数求和", latex: "E(X)=\\sum_{k=1}^{\\infty}k \\cdot 0.4^{k-1} \\cdot 0.6=\\frac{1}{0.6}... ", annotation: ""),
                    SolutionStep(order: 2, description: "或直接公式", latex: "E(X)=1/p=5/3", annotation: "")
                ],
                keyInsight: "几何分布公式",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "递推法", latex: "E(X)=p \\cdot 1+(1-p)(1+E(X))", annotation: "第一次中则X=1，否则X=1+重新开始"),
                    SolutionStep(order: 2, description: "解方程", latex: "E(X)=p+1-p+(1-p)E(X) \\Rightarrow pE(X)=1 \\Rightarrow E(X)=1/p", annotation: "")
                ],
                keyInsight: "递推法推导E(X)=1/p，利用无记忆性",
                commonMistakes: []
            ),
            weaponUsed: "递推法+无记忆性",
            timeRatio: 2.0,
            detailedExplanation: """
                【几何分布】
                X~Geo(p): 首次成功所需试验次数
                P(X=k) = (1-p)^{k-1} · p
                E(X) = 1/p, D(X) = (1-p)/p^2
                """
        ),
        gaokaoYear: nil,
        tags: ["概率", "几何分布", "期望", "递推", "核心"]
    ),

    Problem(
        id: "prob_s_023",
        type: .calculation,
        tier: 6,
        formulaIds: ["combination", "classical_probability"],
        content: "将编号1~6的6个球随机放入编号1~6的6个盒子中，每盒一球。求恰好有3个球的编号与盒子编号相同的概率。",
        contentLatex: "6\\text{球放}6\\text{盒, 恰}3\\text{个对号}",
        options: nil,
        answer: "1/18",
        difficulty: 0.75,
        averageTime: 300,
        hints: ["先选哪3个对号: C(6,3)", "剩3个全错排: D_3=2", "总数6!"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "选3个对号", latex: "C_6^3=20", annotation: ""),
                SolutionStep(order: 2, description: "剩3个错排", latex: "D_3=3!(1-1+\\frac{1}{2!}-\\frac{1}{3!})=6 \\times \\frac{1}{3}=2", annotation: ""),
                SolutionStep(order: 3, description: "有利数", latex: "20 \\times 2=40", annotation: ""),
                SolutionStep(order: 4, description: "概率", latex: "P=\\frac{40}{720}=\\frac{1}{18}", annotation: "")
            ],
            keyInsight: "恰好k个对号=C(n,k)·D_{n-k}，其中D_m是错排数",
            commonMistakes: ["不知道错排公式", "D_3=2而非0"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "C(6,3)×D_3", latex: "20 \\times 2/720=1/18", annotation: "")
                ],
                keyInsight: "标准选对号+错排法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "错排公式", latex: "D_n=n! \\sum_{k=0}^{n}\\frac{(-1)^k}{k!} \\approx n!/e", annotation: ""),
                    SolutionStep(order: 2, description: "恰k个对号概率", latex: "P(k)=\\frac{1}{k!} \\cdot \\frac{D_{n-k}}{(n-k)!} \\approx \\frac{1}{k!} \\cdot \\frac{1}{e}", annotation: "")
                ],
                keyInsight: "P(恰k个固定点)≈1/(k!·e)，与n无关！",
                commonMistakes: []
            ),
            weaponUsed: "错排近似公式",
            timeRatio: 2.0,
            detailedExplanation: """
                【错排数】
                D_1=0, D_2=1, D_3=2, D_4=9, D_5=44
                D_n = n!·sum((-1)^k/k!, k=0..n) ≈ n!/e
                恰k个对号概率 ≈ 1/(k!·e)
                """
        ),
        gaokaoYear: nil,
        tags: ["概率", "错排", "组合", "压轴"]
    ),

    Problem(
        id: "prob_s_024",
        type: .calculation,
        tier: 5,
        formulaIds: ["expectation"],
        content: "随机变量X的概率分布为P(X=k)=c/k(k+1), k=1,2,3,...,n。求常数c和E(X)（当n=4时）。",
        contentLatex: "P(X=k)=\\frac{c}{k(k+1)},\\ k=1,...,4",
        options: nil,
        answer: "c=5/4, E(X)=77/48",
        difficulty: 0.70,
        averageTime: 240,
        hints: ["sum(P)=1", "裂项: 1/(k(k+1))=1/k-1/(k+1)"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "归一化", latex: "c \\sum_{k=1}^{4}\\frac{1}{k(k+1)}=1", annotation: ""),
                SolutionStep(order: 2, description: "裂项求和", latex: "\\sum=1-\\frac{1}{5}=\\frac{4}{5}", annotation: "telescoping"),
                SolutionStep(order: 3, description: "求c", latex: "c=\\frac{5}{4}", annotation: ""),
                SolutionStep(order: 4, description: "E(X)", latex: "=\\sum_{k=1}^{4}k \\cdot \\frac{5/4}{k(k+1)}=\\frac{5}{4}\\sum \\frac{1}{k+1}=\\frac{5}{4}(\\frac{1}{2}+\\frac{1}{3}+\\frac{1}{4}+\\frac{1}{5})", annotation: ""),
                SolutionStep(order: 5, description: "计算", latex: "=\\frac{5}{4} \\times \\frac{77}{60}=\\frac{77}{48}", annotation: "")
            ],
            keyInsight: "裂项消去简化求和，k·1/(k(k+1))=1/(k+1)",
            commonMistakes: ["裂项后求和出错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "裂项归一化", latex: "c \\times 4/5=1 \\Rightarrow c=5/4", annotation: ""),
                    SolutionStep(order: 2, description: "化简求E", latex: "E(X)=c \\sum 1/(k+1)", annotation: "")
                ],
                keyInsight: "标准法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "约分秒杀", latex: "k \\cdot \\frac{1}{k(k+1)}=\\frac{1}{k+1}", annotation: "k和分母的k约掉"),
                    SolutionStep(order: 2, description: "E(X)=c·sum(1/(k+1))", latex: "=\\frac{5}{4}(\\frac{1}{2}+\\frac{1}{3}+\\frac{1}{4}+\\frac{1}{5})=\\frac{77}{48}", annotation: "")
                ],
                keyInsight: "先约分再求和",
                commonMistakes: []
            ),
            weaponUsed: "约分化简",
            timeRatio: 1.5,
            detailedExplanation: """
                【技巧】
                求E(X)时，k·P(X=k) 先化简再求和
                k · c/(k(k+1)) = c/(k+1)
                避免展开复杂表达式
                """
        ),
        gaokaoYear: nil,
        tags: ["概率", "分布", "期望", "裂项", "核心"]
    ),

    Problem(
        id: "prob_s_025",
        type: .calculation,
        tier: 6,
        formulaIds: ["combination", "binomial_distribution"],
        content: "某考试有10道选择题，每题4个选项只有1个正确。考生对6道题有把握（正确率0.9），其余4题随机猜（正确率0.25）。求答对8题及以上的概率（精确到0.001）。",
        contentLatex: "6\\text{题}p=0.9,\\ 4\\text{题}p=0.25",
        options: nil,
        answer: "约0.212",
        difficulty: 0.80,
        averageTime: 420,
        hints: ["X~B(6,0.9), Y~B(4,0.25), 求P(X+Y>=8)", "分情况讨论"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "分情况", latex: "X+Y \\geq 8: (X,Y)=(6,2),(6,3),(6,4),(5,3),(5,4),(4,4)", annotation: ""),
                SolutionStep(order: 2, description: "X=6的概率", latex: "P(X=6)=0.9^6 \\approx 0.5314", annotation: ""),
                SolutionStep(order: 3, description: "X=5", latex: "P(X=5)=C_6^5 \\cdot 0.9^5 \\cdot 0.1=6 \\times 0.05905=0.3543", annotation: ""),
                SolutionStep(order: 4, description: "X=4", latex: "P(X=4)=C_6^4 \\cdot 0.9^4 \\cdot 0.01=15 \\times 0.006561=0.0984", annotation: ""),
                SolutionStep(order: 5, description: "Y的概率", latex: "P(Y \\geq 2)=1-C_4^0(3/4)^4-C_4^1(1/4)(3/4)^3=1-0.3164-0.4219=0.2617", annotation: ""),
                SolutionStep(order: 6, description: "组合计算", latex: "P \\approx 0.5314 \\times 0.2617+0.3543 \\times P(Y \\geq 3)+0.0984 \\times P(Y=4)", annotation: "需逐项")
            ],
            keyInsight: "两个独立二项分布的和：分情况枚举",
            commonMistakes: ["遗漏某种情况组合"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "枚举所有(X,Y)组合", latex: "P=\\sum P(X=i)P(Y=j),\\ i+j \\geq 8", annotation: ""),
                    SolutionStep(order: 2, description: "逐项计算", latex: "\\text{需要精确计算各项}", annotation: "")
                ],
                keyInsight: "标准枚举法",
                commonMistakes: ["计算量大"]
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "先处理确定部分", latex: "6题中答对>=6: P(X=6)=0.531", annotation: ""),
                    SolutionStep(order: 2, description: "贡献最大的项", latex: "P \\approx P(X=6)P(Y \\geq 2)+P(X=5)P(Y \\geq 3)+P(X=4)P(Y=4)", annotation: ""),
                    SolutionStep(order: 3, description: "估算", latex: "\\approx 0.53 \\times 0.26+0.35 \\times 0.05+0.10 \\times 0.004 \\approx 0.156", annotation: "")
                ],
                keyInsight: "近似估算：主要贡献来自X=6的项",
                commonMistakes: []
            ),
            weaponUsed: "主项近似法",
            timeRatio: 1.5,
            detailedExplanation: """
                【独立和的分布】
                X和Y独立时，P(X+Y=k) = sum(P(X=i)P(Y=k-i))
                实际计算时按贡献大小排序，主要项先算
                """
        ),
        gaokaoYear: nil,
        tags: ["概率", "二项分布", "独立", "综合", "压轴"]
    ),

    ]
}
