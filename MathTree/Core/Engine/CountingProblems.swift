import Foundation

// MARK: - 计数原理 / 排列组合 / 二项式定理专题
// 目标: 覆盖两个计数原理、排列组合应用(捆绑/插空/隔板/分组)、二项式定理。
// 秒杀思路: 间接法(对立)、隔板法、赋值法、二项通项。

extension SampleData {
    static let countingProblems: [Problem] = [
        countingProblem(
            id: "cnt_001",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["addition_multiplication_principle"],
            content: "从甲地到乙地有3条公路2条铁路,从乙地到丙地有2条公路4条铁路。求从甲地经乙地到丙地的不同走法总数。",
            contentLatex: #"\text{甲到乙}(3+2)\text{,乙到丙}(2+4),\ \text{走法}?"#,
            answer: "30",
            difficulty: 0.36,
            averageTime: 70,
            hints: ["甲到乙共5种", "乙到丙共6种", "分步相乘"],
            standardSteps: [
                countingStep(1, "甲到乙", #"3+2=5\text{种}"#),
                countingStep(2, "乙到丙", #"2+4=6\text{种}"#),
                countingStep(3, "分步乘法", #"5\times6=30"#)
            ],
            shortcutSteps: [
                countingStep(1, "分类加+分步乘秒杀", #"(3+2)(2+4)=30"#)
            ],
            keyInsight: "完成一件事分类用加法,分步用乘法。",
            shortcutInsight: "每段内部加法,段间乘法,一式算完。",
            weapon: "两个计数原理",
            timeRatio: 1.6,
            tags: ["计数", "计数原理", "必考", "核心"]
        ),

        countingProblem(
            id: "cnt_002",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["permutation"],
            content: "5个人排成一排照相,求不同的排法总数。",
            contentLatex: #"5\text{人排一排},\ A_5^5=?"#,
            answer: "120",
            difficulty: 0.30,
            averageTime: 50,
            hints: ["全排列", "5!=5×4×3×2×1"],
            standardSteps: [
                countingStep(1, "全排列", #"A_5^5=5!=120"#)
            ],
            shortcutSteps: [
                countingStep(1, "阶乘秒杀", #"5!=120"#)
            ],
            keyInsight: "n个不同元素全部排列共n!种。",
            shortcutInsight: "直接算5!=120。",
            weapon: "全排列",
            timeRatio: 1.5,
            tags: ["计数", "排列", "基础"]
        ),

        countingProblem(
            id: "cnt_003",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["permutation", "bundling"],
            content: "5人排成一排,其中甲乙两人必须相邻,求排法总数。",
            contentLatex: #"5\text{人排队,甲乙相邻},\ \text{排法}?"#,
            answer: "48",
            difficulty: 0.50,
            averageTime: 90,
            hints: ["捆绑法", "甲乙看作一个整体", "整体内部可交换"],
            standardSteps: [
                countingStep(1, "捆绑", #"\text{甲乙捆成一个整体,与其余3人共}4\text{个元素排列}A_4^4=24"#),
                countingStep(2, "内部排列", #"\text{甲乙内部}A_2^2=2"#),
                countingStep(3, "相乘", #"24\times2=48"#)
            ],
            shortcutSteps: [
                countingStep(1, "捆绑法秒杀", #"A_4^4\cdot A_2^2=24\cdot2=48"#)
            ],
            keyInsight: "相邻问题用捆绑法:先整体排,再内部排。",
            shortcutInsight: "(n-1)!·(相邻元素内部排列),一步出。",
            weapon: "捆绑法",
            timeRatio: 1.8,
            tags: ["计数", "排列", "捆绑法", "必考"]
        ),

        countingProblem(
            id: "cnt_004",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["permutation", "gap_method"],
            content: "5人排成一排,其中甲乙两人不相邻,求排法总数。",
            contentLatex: #"5\text{人排队,甲乙不相邻},\ \text{排法}?"#,
            answer: "72",
            difficulty: 0.54,
            averageTime: 100,
            hints: ["插空法", "先排其余3人", "在4个空位插甲乙"],
            standardSteps: [
                countingStep(1, "先排其余", #"\text{先排另外}3\text{人}:A_3^3=6"#),
                countingStep(2, "插空", #"3\text{人产生}4\text{个空,插入甲乙}:A_4^2=12"#),
                countingStep(3, "相乘", #"6\times12=72"#)
            ],
            shortcutSteps: [
                countingStep(1, "插空法秒杀", #"A_3^3\cdot A_4^2=6\cdot12=72"#),
                countingStep(2, "或对立面", #"5!-48=120-48=72"#)
            ],
            keyInsight: "不相邻问题用插空法:先排定其余,再往空位插。",
            shortcutInsight: "插空法或'全排-相邻'两种思路结果一致。",
            weapon: "插空法/间接法",
            timeRatio: 2.0,
            tags: ["计数", "排列", "插空法", "必考", "核心"]
        ),

        countingProblem(
            id: "cnt_005",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["permutation", "digits"],
            content: "用0,1,2,3,4组成没有重复数字的三位数,求个数。",
            contentLatex: #"\{0,1,2,3,4\}\text{组三位数(无重复)},\ \text{个数}?"#,
            answer: "48",
            difficulty: 0.52,
            averageTime: 100,
            hints: ["首位不能为0", "首位4种选择", "后两位排列"],
            standardSteps: [
                countingStep(1, "首位", #"\text{首位非0:}4\text{种}"#),
                countingStep(2, "后两位", #"\text{从剩余4个数选2排:}A_4^2=12"#),
                countingStep(3, "相乘", #"4\times12=48"#)
            ],
            shortcutSteps: [
                countingStep(1, "特殊位置优先秒杀", #"4\cdot A_4^2=4\cdot12=48"#)
            ],
            keyInsight: "数字排列问题优先处理首位非0的特殊限制。",
            shortcutInsight: "先定首位(4种),再排后两位(A₄²),相乘。",
            weapon: "特殊位置优先法",
            timeRatio: 1.9,
            tags: ["计数", "排列", "数字问题", "必考"]
        ),

        countingProblem(
            id: "cnt_006",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["combination"],
            content: "从10名学生中选3名参加竞赛,求不同的选法总数。",
            contentLatex: #"C_{10}^3=?"#,
            answer: "120",
            difficulty: 0.34,
            averageTime: 50,
            hints: ["组合数", "无顺序", "C(10,3)"],
            standardSteps: [
                countingStep(1, "组合数", #"C_{10}^3=\frac{10\times9\times8}{3\times2\times1}=120"#)
            ],
            shortcutSteps: [
                countingStep(1, "组合公式秒杀", #"C_{10}^3=120"#)
            ],
            keyInsight: "选取不计顺序用组合数。",
            shortcutInsight: "直接套C(n,k)=n!/(k!(n-k)!)。",
            weapon: "组合数",
            timeRatio: 1.5,
            tags: ["计数", "组合", "基础"]
        ),

        countingProblem(
            id: "cnt_007",
            type: .fillInBlank,
            tier: 5,
            formulaIds: ["combination", "partition_method"],
            content: "将10个相同的小球放入3个不同的盒子,每盒至少一个,求放法总数。",
            contentLatex: #"10\text{相同球入}3\text{不同盒,每盒}\ge1"#,
            answer: "36",
            difficulty: 0.66,
            averageTime: 130,
            hints: ["隔板法", "10个球9个间隙插2块板", "C(9,2)"],
            standardSteps: [
                countingStep(1, "隔板模型", #"10\text{球排成一行,有}9\text{个间隙}"#),
                countingStep(2, "插板", #"\text{插入}2\text{块隔板分成}3\text{组}:C_9^2"#),
                countingStep(3, "计算", #"C_9^2=36"#)
            ],
            shortcutSteps: [
                countingStep(1, "隔板法秒杀", #"C_{n-1}^{k-1}=C_9^2=36"#)
            ],
            keyInsight: "相同物品分给不同对象且每组非空,用隔板法。",
            shortcutInsight: "n个相同球分k组每组≥1,共C(n-1,k-1)种。",
            weapon: "隔板法",
            timeRatio: 2.2,
            tags: ["计数", "组合", "隔板法", "压轴", "核心"]
        ),

        countingProblem(
            id: "cnt_008",
            type: .fillInBlank,
            tier: 5,
            formulaIds: ["combination", "grouping"],
            content: "将6本不同的书平均分成3组,每组2本,求分组方法数。",
            contentLatex: #"6\text{本不同书平均分}3\text{组,每组}2\text{本}"#,
            answer: "15",
            difficulty: 0.68,
            averageTime: 130,
            hints: ["逐组选取", "平均分组要除以组数阶乘", "消除组间顺序"],
            standardSteps: [
                countingStep(1, "逐组选", #"C_6^2 C_4^2 C_2^2=15\cdot6\cdot1=90"#),
                countingStep(2, "除组序", #"\text{三组等量,除以}A_3^3=6"#),
                countingStep(3, "结论", #"\frac{90}{6}=15"#)
            ],
            shortcutSteps: [
                countingStep(1, "平均分组公式秒杀", #"\frac{C_6^2 C_4^2 C_2^2}{3!}=\frac{90}{6}=15"#)
            ],
            keyInsight: "平均分组(各组数量相同)必须除以组数的阶乘消除重复。",
            shortcutInsight: "记口诀:平均分组要'除以组数!'。",
            weapon: "平均分组去重",
            timeRatio: 2.2,
            tags: ["计数", "组合", "分组", "压轴"]
        ),

        countingProblem(
            id: "cnt_009",
            type: .fillInBlank,
            tier: 5,
            formulaIds: ["combination", "indirect_method"],
            content: "从4名男生3名女生中选3人,要求至少有1名女生,求选法总数。",
            contentLatex: #"4\text{男}3\text{女选}3\text{人,至少}1\text{女}"#,
            answer: "31",
            difficulty: 0.56,
            averageTime: 100,
            hints: ["间接法", "总数-全是男生", "C(7,3)-C(4,3)"],
            standardSteps: [
                countingStep(1, "总选法", #"C_7^3=35"#),
                countingStep(2, "全男生", #"C_4^3=4"#),
                countingStep(3, "至少1女", #"35-4=31"#)
            ],
            shortcutSteps: [
                countingStep(1, "间接法秒杀", #"C_7^3-C_4^3=35-4=31"#)
            ],
            keyInsight: "'至少'型问题用间接法(总数减去反面)最简。",
            shortcutInsight: "至少1女=全部-一个女生都没有,一步出。",
            weapon: "间接法(对立)",
            timeRatio: 2.0,
            tags: ["计数", "组合", "间接法", "必考", "核心"]
        ),

        countingProblem(
            id: "cnt_010",
            type: .fillInBlank,
            tier: 5,
            formulaIds: ["coloring"],
            content: "用4种不同颜色给如图4个相邻区域(围成一圈)染色,相邻区域不同色,求染色方法数。",
            contentLatex: #"4\text{色给环形}4\text{区域染,相邻异色}"#,
            answer: "84",
            difficulty: 0.72,
            averageTime: 150,
            hints: ["环形染色公式", "(k-1)ⁿ+(-1)ⁿ(k-1)", "k=4,n=4"],
            standardSteps: [
                countingStep(1, "环形公式", #"P=(k-1)^n+(-1)^n(k-1)"#),
                countingStep(2, "代入", #"=(4-1)^4+(-1)^4(4-1)=81+3=84"#)
            ],
            shortcutSteps: [
                countingStep(1, "环染色公式秒杀", #"(k-1)^n+(-1)^n(k-1)=81+3=84"#)
            ],
            keyInsight: "环形区域染色有专门的递推/通项公式。",
            shortcutInsight: "环形n区域k色公式(k-1)ⁿ+(-1)ⁿ(k-1)直接代。",
            weapon: "环形染色公式",
            timeRatio: 2.3,
            tags: ["计数", "染色问题", "压轴"]
        ),

        countingProblem(
            id: "cnt_011",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["binomial_theorem", "general_term"],
            content: "求 (2x-1/x)⁶ 展开式中的常数项。",
            contentLatex: #"\left(2x-\frac1x\right)^6\ \text{的常数项}"#,
            answer: "-160",
            difficulty: 0.60,
            averageTime: 130,
            hints: ["通项T(r+1)=C₆ʳ(2x)^(6-r)(-1/x)ʳ", "x指数=0", "解r"],
            standardSteps: [
                countingStep(1, "通项", #"T_{r+1}=C_6^r(2x)^{6-r}\left(-\frac1x\right)^r=C_6^r 2^{6-r}(-1)^r x^{6-2r}"#),
                countingStep(2, "常数项条件", #"6-2r=0\Rightarrow r=3"#),
                countingStep(3, "代入", #"C_6^3 2^3(-1)^3=20\cdot8\cdot(-1)=-160"#)
            ],
            shortcutSteps: [
                countingStep(1, "通项定r秒杀", #"x^{6-2r}=x^0\Rightarrow r=3,\ T_4=C_6^3 2^3(-1)^3=-160"#)
            ],
            keyInsight: "二项展开找特定项先写通项,由x的指数定r。",
            shortcutInsight: "令x指数为目标值解r,再代通项算系数。",
            weapon: "二项式通项",
            timeRatio: 2.2,
            tags: ["计数", "二项式定理", "常数项", "必考", "核心"]
        ),

        countingProblem(
            id: "cnt_012",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["binomial_theorem", "assignment"],
            content: "已知 (1+2x)ⁿ 的展开式中各项系数之和为243,求n。",
            contentLatex: #"(1+2x)^n\ \text{各项系数和}=243,\ n=?"#,
            answer: "5",
            difficulty: 0.50,
            averageTime: 90,
            hints: ["系数和:令x=1", "(1+2)ⁿ=3ⁿ", "3ⁿ=243"],
            standardSteps: [
                countingStep(1, "赋值x=1", #"\text{各项系数和}=(1+2)^n=3^n"#),
                countingStep(2, "解方程", #"3^n=243=3^5\Rightarrow n=5"#)
            ],
            shortcutSteps: [
                countingStep(1, "赋值法秒杀", #"x=1\Rightarrow3^n=243\Rightarrow n=5"#)
            ],
            keyInsight: "求各项系数和令x=1,求二项式系数和令系数全为1。",
            shortcutInsight: "系数和=代x=1的函数值,直接解指数方程。",
            weapon: "赋值法",
            timeRatio: 1.9,
            tags: ["计数", "二项式定理", "赋值法", "必考"]
        ),

        countingProblem(
            id: "cnt_013",
            type: .fillInBlank,
            tier: 5,
            formulaIds: ["binomial_theorem", "assignment"],
            content: "若 (1+x)¹⁰=a₀+a₁x+…+a₁₀x¹⁰,求 a₁+a₃+a₅+a₇+a₉(奇数项系数和)。",
            contentLatex: #"(1+x)^{10}=\sum a_k x^k,\ a_1+a_3+\cdots+a_9=?"#,
            answer: "512",
            difficulty: 0.66,
            averageTime: 130,
            hints: ["x=1得全部和", "x=-1得交错和", "两式相减除以2"],
            standardSteps: [
                countingStep(1, "x=1", #"a_0+a_1+\cdots+a_{10}=2^{10}=1024"#),
                countingStep(2, "x=-1", #"a_0-a_1+a_2-\cdots+a_{10}=0"#),
                countingStep(3, "相减÷2", #"a_1+a_3+\cdots+a_9=\frac{1024-0}{2}=512"#)
            ],
            shortcutSteps: [
                countingStep(1, "1与-1赋值秒杀", #"\frac{f(1)-f(-1)}{2}=\frac{1024-0}{2}=512"#)
            ],
            keyInsight: "奇数项系数和=(f(1)-f(-1))/2,偶数项=(f(1)+f(-1))/2。",
            shortcutInsight: "代x=±1作差(求奇)或作和(求偶)再除以2。",
            weapon: "正负赋值法",
            timeRatio: 2.2,
            tags: ["计数", "二项式定理", "赋值法", "压轴", "核心"]
        ),

        countingProblem(
            id: "cnt_014",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["binomial_theorem", "max_coefficient"],
            content: "求 (1+x)⁸ 展开式中二项式系数最大的项。",
            contentLatex: #"(1+x)^8\ \text{二项式系数最大项}"#,
            answer: "第5项 70x⁴",
            difficulty: 0.52,
            averageTime: 90,
            hints: ["n=8为偶数", "中间项二项式系数最大", "第n/2+1项"],
            standardSteps: [
                countingStep(1, "中间项", #"n=8\text{偶数,最大在第}\frac82+1=5\text{项}"#),
                countingStep(2, "求该项", #"T_5=C_8^4 x^4=70x^4"#)
            ],
            shortcutSteps: [
                countingStep(1, "偶数中间项秒杀", #"\text{第}5\text{项}=C_8^4 x^4=70x^4"#)
            ],
            keyInsight: "二项式系数在中间取最大:n偶取第n/2+1项。",
            shortcutInsight: "n偶时唯一最大项是正中间那项C(n,n/2)。",
            weapon: "二项式系数最大项",
            timeRatio: 1.8,
            tags: ["计数", "二项式定理", "最大项", "必考"]
        ),

        countingProblem(
            id: "cnt_015",
            type: .fillInBlank,
            tier: 5,
            formulaIds: ["permutation", "gap_method", "complex"],
            content: "5个男生3个女生排成一排,女生互不相邻,求排法数。",
            contentLatex: #"5\text{男}3\text{女排队,女生互不相邻}"#,
            answer: "14400",
            difficulty: 0.66,
            averageTime: 130,
            hints: ["先排男生", "5男产生6个空", "女生插空A(6,3)"],
            standardSteps: [
                countingStep(1, "排男生", #"A_5^5=120"#),
                countingStep(2, "插空", #"5\text{男有}6\text{空,插}3\text{女}:A_6^3=120"#),
                countingStep(3, "相乘", #"120\times120=14400"#)
            ],
            shortcutSteps: [
                countingStep(1, "插空法秒杀", #"A_5^5\cdot A_6^3=120\cdot120=14400"#)
            ],
            keyInsight: "多元素互不相邻仍用插空:先排无限制元素,再插。",
            shortcutInsight: "5男全排×6空选3排女,直接相乘。",
            weapon: "插空法",
            timeRatio: 2.0,
            tags: ["计数", "排列", "插空法", "压轴"]
        ),

        countingProblem(
            id: "cnt_016",
            type: .fillInBlank,
            tier: 5,
            formulaIds: ["combination", "geometry_counting"],
            content: "平面内有10个点,任意三点不共线,求以这些点为顶点可作多少个三角形。",
            contentLatex: #"10\text{点任三不共线,三角形个数}?"#,
            answer: "120",
            difficulty: 0.44,
            averageTime: 70,
            hints: ["任取3点定一个三角形", "无顺序", "C(10,3)"],
            standardSteps: [
                countingStep(1, "选三点", #"\text{任意三点构成一个三角形}:C_{10}^3"#),
                countingStep(2, "计算", #"C_{10}^3=120"#)
            ],
            shortcutSteps: [
                countingStep(1, "组合秒杀", #"C_{10}^3=120"#)
            ],
            keyInsight: "几何计数:三角形⟺选3个不共线点,组合即可。",
            shortcutInsight: "任三不共线时直接C(10,3)。",
            weapon: "几何组合计数",
            timeRatio: 1.6,
            tags: ["计数", "组合", "几何计数"]
        ),

        countingProblem(
            id: "cnt_017",
            type: .fillInBlank,
            tier: 5,
            formulaIds: ["derangement"],
            content: "4封信投入4个对应的信箱,求恰好全部投错(没有一封投对)的方法数。",
            contentLatex: #"4\text{封信全投错(错位排列)}D_4=?"#,
            answer: "9",
            difficulty: 0.62,
            averageTime: 110,
            hints: ["错位排列(全错位)", "D₄递推或公式", "Dₙ=n!Σ(-1)ᵏ/k!"],
            standardSteps: [
                countingStep(1, "错位公式", #"D_n=n!\sum_{k=0}^n\frac{(-1)^k}{k!}"#),
                countingStep(2, "代n=4", #"D_4=24\left(1-1+\frac12-\frac16+\frac1{24}\right)=24\cdot\frac{9}{24}=9"#)
            ],
            shortcutSteps: [
                countingStep(1, "错位数列秒杀", #"D_1=0,D_2=1,D_3=2,D_4=9\text{(可背)}"#)
            ],
            keyInsight: "全部错位是经典错位排列(德蒙特模特)问题。",
            shortcutInsight: "小规模错位数D₄=9可直接记忆。",
            weapon: "错位排列",
            timeRatio: 2.0,
            tags: ["计数", "错位排列", "压轴"]
        ),

        countingProblem(
            id: "cnt_018",
            type: .fillInBlank,
            tier: 5,
            formulaIds: ["combination", "distribution"],
            content: "将4个不同的小球放入3个不同的盒子,每个盒子可空,求放法数。",
            contentLatex: #"4\text{不同球入}3\text{不同盒,可空}"#,
            answer: "81",
            difficulty: 0.46,
            averageTime: 80,
            hints: ["每个球独立选盒", "每球3种选择", "3⁴"],
            standardSteps: [
                countingStep(1, "逐球选盒", #"\text{每个球有}3\text{种选择,共}4\text{球}"#),
                countingStep(2, "乘法原理", #"3^4=81"#)
            ],
            shortcutSteps: [
                countingStep(1, "幂运算秒杀", #"3^4=81"#)
            ],
            keyInsight: "不同球入不同盒(可空)是每球独立选择,用乘法原理。",
            shortcutInsight: "答案=盒数^球数=3⁴。",
            weapon: "分步乘法原理",
            timeRatio: 1.6,
            tags: ["计数", "分配", "乘法原理"]
        ),

        countingProblem(
            id: "cnt_019",
            type: .fillInBlank,
            tier: 5,
            formulaIds: ["combination", "complex_distribution"],
            content: "将6本不同的书分给甲乙丙三人,甲2本乙2本丙2本,求分配方法数。",
            contentLatex: #"6\text{不同书分甲乙丙各}2\text{本}"#,
            answer: "90",
            difficulty: 0.58,
            averageTime: 100,
            hints: ["分给指定的人,不除组数阶乘", "C(6,2)C(4,2)C(2,2)"],
            standardSteps: [
                countingStep(1, "逐人选", #"C_6^2 C_4^2 C_2^2=15\cdot6\cdot1=90"#),
                countingStep(2, "说明", #"\text{书分给不同的人(有区别),无需除}3!"#)
            ],
            shortcutSteps: [
                countingStep(1, "定向分配秒杀", #"C_6^2 C_4^2 C_2^2=90"#)
            ],
            keyInsight: "分给特定对象(有区别)是定向分配,不除组数阶乘。",
            shortcutInsight: "对比cnt_008:这里组有名字,故不除3!。",
            weapon: "定向分配",
            timeRatio: 1.8,
            tags: ["计数", "组合", "分配", "核心"]
        ),

        countingProblem(
            id: "cnt_020",
            type: .fillInBlank,
            tier: 5,
            formulaIds: ["binomial_theorem", "specific_coefficient"],
            content: "求 (1+x)³+(1+x)⁴+(1+x)⁵ 展开式中 x² 的系数。",
            contentLatex: #"(1+x)^3+(1+x)^4+(1+x)^5,\ x^2\text{系数}"#,
            answer: "19",
            difficulty: 0.56,
            averageTime: 100,
            hints: ["各项x²系数为C(k,2)", "C(3,2)+C(4,2)+C(5,2)"],
            standardSteps: [
                countingStep(1, "各项系数", #"C_3^2+C_4^2+C_5^2=3+6+10"#),
                countingStep(2, "求和", #"=19"#)
            ],
            shortcutSteps: [
                countingStep(1, "曲棍球恒等式", #"C_3^2+C_4^2+C_5^2=C_6^3-C_3^3=20-1=19"#)
            ],
            keyInsight: "多个二项式同次项系数相加=组合数之和。",
            shortcutInsight: "用朱世杰恒等式ΣC(k,2)=C(n+1,3)闭合(注意起点)。",
            weapon: "组合数求和",
            timeRatio: 2.0,
            tags: ["计数", "二项式定理", "组合恒等式", "压轴"]
        )
    ]

    // MARK: - 工厂方法
    private static func countingStep(_ order: Int, _ description: String, _ latex: String, _ annotation: String = "") -> SolutionStep {
        SolutionStep(order: order, description: description, latex: latex, annotation: annotation)
    }

    private static func countingProblem(
        id: String,
        type: ProblemType,
        tier: Int,
        formulaIds: [String],
        content: String,
        contentLatex: String,
        options: [String]? = nil,
        answer: String,
        difficulty: Double,
        averageTime: TimeInterval,
        hints: [String],
        standardSteps: [SolutionStep],
        shortcutSteps: [SolutionStep],
        keyInsight: String,
        shortcutInsight: String,
        weapon: String,
        timeRatio: Double,
        tags: [String],
        gaokaoYear: Int? = nil,
        commonMistakes: [String] = ["平均分组忘记除组数阶乘", "首位为0的排列未排除", "至少/至多未用间接法导致重复或遗漏"]
    ) -> Problem {
        Problem(
            id: id,
            type: type,
            tier: tier,
            formulaIds: formulaIds,
            content: content,
            contentLatex: contentLatex,
            options: options,
            answer: answer,
            difficulty: difficulty,
            averageTime: averageTime,
            hints: hints,
            solution: SolutionPath(
                steps: standardSteps,
                keyInsight: keyInsight,
                commonMistakes: commonMistakes
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: standardSteps,
                    keyInsight: keyInsight,
                    commonMistakes: commonMistakes
                ),
                descentMethod: SolutionPath(
                    steps: shortcutSteps,
                    keyInsight: shortcutInsight,
                    commonMistakes: []
                ),
                weaponUsed: weapon,
                timeRatio: timeRatio,
                detailedExplanation: "秒杀关键：\(shortcutInsight)"
            ),
            gaokaoYear: gaokaoYear,
            tags: tags
        )
    }
}
