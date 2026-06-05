import Foundation

// MARK: - 指数与对数运算专题 (12道, 填补高考函数基础缺口)
// 涵盖: 对数运算法则、换底公式、指对互逆、分数/负指数、对数方程、比较大小。
// 原则: 答案确定、步骤闭合。LaTeX 用 raw string。

extension SampleData {
    static let expLogProblems: [Problem] = [
        elProblem(
            id: "el_001",
            type: .fillInBlank,
            tier: 2,
            formulaIds: ["log_product", "log_power"],
            content: "计算 log₂8 + log₂(1/2)。",
            contentLatex: #"\log_2 8+\log_2\frac12=?"#,
            answer: "2",
            difficulty: 0.30,
            averageTime: 60,
            hints: ["log₂8=3", "log₂(1/2)=-1"],
            standardSteps: [
                elStep(1, "分别求值", #"\log_2 8=3,\ \log_2\frac12=-1"#),
                elStep(2, "相加", #"3+(-1)=2"#)
            ],
            shortcutSteps: [
                elStep(1, "合并秒杀", #"\log_2\left(8\cdot\frac12\right)=\log_2 4=2"#)
            ],
            keyInsight: "logₐM+logₐN=logₐ(MN)。",
            shortcutInsight: "先合并真数 8×½=4，再取对数。",
            weapon: "对数加法法则",
            timeRatio: 1.6,
            tags: ["函数", "对数运算", "高考", "核心"]
        ),

        elProblem(
            id: "el_002",
            type: .fillInBlank,
            tier: 2,
            formulaIds: ["log_product"],
            content: "计算 lg2 + lg5（lg为常用对数）。",
            contentLatex: #"\lg2+\lg5=?"#,
            answer: "1",
            difficulty: 0.28,
            averageTime: 50,
            hints: ["lg2+lg5=lg(2×5)", "lg10=1"],
            standardSteps: [
                elStep(1, "合并", #"\lg2+\lg5=\lg(2\times5)=\lg10=1"#)
            ],
            shortcutSteps: [
                elStep(1, "凑10秒杀", #"\lg10=1"#)
            ],
            keyInsight: "lg2与lg5互补，和为lg10=1。",
            shortcutInsight: "见lg2+lg5立即想到=1。",
            weapon: "对数加法法则",
            timeRatio: 1.5,
            tags: ["函数", "对数运算", "高考"]
        ),

        elProblem(
            id: "el_003",
            type: .fillInBlank,
            tier: 2,
            formulaIds: ["log_product"],
            content: "计算 log₂6 - log₂3。",
            contentLatex: #"\log_2 6-\log_2 3=?"#,
            answer: "1",
            difficulty: 0.30,
            averageTime: 50,
            hints: ["相减=商的对数"],
            standardSteps: [
                elStep(1, "合并", #"\log_2\frac63=\log_2 2=1"#)
            ],
            shortcutSteps: [
                elStep(1, "商法则秒杀", #"\log_2 2=1"#)
            ],
            keyInsight: "logₐM-logₐN=logₐ(M/N)。",
            shortcutInsight: "真数相除6/3=2，对数=1。",
            weapon: "对数减法法则",
            timeRatio: 1.5,
            tags: ["函数", "对数运算", "高考"]
        ),

        elProblem(
            id: "el_004",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["log_change_base"],
            content: "利用换底公式计算 log₄8。",
            contentLatex: #"\log_4 8=?"#,
            answer: "3/2",
            difficulty: 0.40,
            averageTime: 70,
            hints: ["换成以2为底", "log₄8=log₂8/log₂4"],
            standardSteps: [
                elStep(1, "换底", #"\log_4 8=\frac{\log_2 8}{\log_2 4}=\frac{3}{2}"#)
            ],
            shortcutSteps: [
                elStep(1, "化同底秒杀", #"\log_{2^2}2^3=\frac32\log_2 2=\frac32"#)
            ],
            keyInsight: "换底公式logₐb=logₖb/logₖa。",
            shortcutInsight: "log_(2^m)(2^n)=n/m，直接得3/2。",
            weapon: "换底公式",
            timeRatio: 1.8,
            tags: ["函数", "对数运算", "换底", "高考", "核心"]
        ),

        elProblem(
            id: "el_005",
            type: .fillInBlank,
            tier: 2,
            formulaIds: ["exp_rule", "log_product"],
            content: "计算 2^(log₂5)。",
            contentLatex: #"2^{\log_2 5}=?"#,
            answer: "5",
            difficulty: 0.34,
            averageTime: 50,
            hints: ["指对互为逆运算", "a^(logₐN)=N"],
            standardSteps: [
                elStep(1, "互逆", #"a^{\log_a N}=N\Rightarrow2^{\log_2 5}=5"#)
            ],
            shortcutSteps: [
                elStep(1, "互逆秒杀", #"=5"#)
            ],
            keyInsight: "a^(logₐN)=N，指数与对数互为反函数。",
            shortcutInsight: "底数与对数底相同，直接得真数。",
            weapon: "指对互逆",
            timeRatio: 1.5,
            tags: ["函数", "指对运算", "高考", "核心"]
        ),

        elProblem(
            id: "el_006",
            type: .fillInBlank,
            tier: 2,
            formulaIds: ["exp_rule"],
            content: "计算 8^(2/3)。",
            contentLatex: #"8^{\frac23}=?"#,
            answer: "4",
            difficulty: 0.32,
            averageTime: 50,
            hints: ["8=2³", "分数指数=根号"],
            standardSteps: [
                elStep(1, "化幂", #"8^{2/3}=(2^3)^{2/3}=2^2=4"#)
            ],
            shortcutSteps: [
                elStep(1, "底化2秒杀", #"=2^2=4"#)
            ],
            keyInsight: "a^(m/n)=ⁿ√(aᵐ)，先把底化为质数幂。",
            shortcutInsight: "8=2³，指数相乘 3×2/3=2。",
            weapon: "分数指数幂",
            timeRatio: 1.5,
            tags: ["函数", "指数运算", "高考"]
        ),

        elProblem(
            id: "el_007",
            type: .fillInBlank,
            tier: 2,
            formulaIds: ["exp_rule"],
            content: "计算 (1/2)^(-2) + (1/27)^(1/3)。",
            contentLatex: #"\left(\frac12\right)^{-2}+\left(\frac1{27}\right)^{\frac13}=?"#,
            answer: "13/3",
            difficulty: 0.38,
            averageTime: 70,
            hints: ["负指数取倒数", "(1/27)^(1/3)=1/3"],
            standardSteps: [
                elStep(1, "负指数", #"\left(\frac12\right)^{-2}=2^2=4"#),
                elStep(2, "分数指数", #"\left(\frac1{27}\right)^{1/3}=\frac13"#),
                elStep(3, "相加", #"4+\frac13=\frac{13}{3}"#)
            ],
            shortcutSteps: [
                elStep(1, "逐项秒杀", #"4+\frac13=\frac{13}{3}"#)
            ],
            keyInsight: "负指数=倒数，分数指数=方根。",
            shortcutInsight: "(1/2)⁻²=4，(1/27)^⅓=1/3。",
            weapon: "指数运算法则",
            timeRatio: 1.6,
            tags: ["函数", "指数运算", "高考"]
        ),

        elProblem(
            id: "el_008",
            type: .fillInBlank,
            tier: 2,
            formulaIds: ["log_product", "log_power"],
            content: "计算 lg25 + lg4。",
            contentLatex: #"\lg25+\lg4=?"#,
            answer: "2",
            difficulty: 0.30,
            averageTime: 50,
            hints: ["合并真数25×4=100"],
            standardSteps: [
                elStep(1, "合并", #"\lg(25\times4)=\lg100=2"#)
            ],
            shortcutSteps: [
                elStep(1, "凑100秒杀", #"\lg100=2"#)
            ],
            keyInsight: "对数加法合并真数。",
            shortcutInsight: "25×4=100，lg100=2。",
            weapon: "对数加法法则",
            timeRatio: 1.5,
            tags: ["函数", "对数运算", "高考"]
        ),

        elProblem(
            id: "el_009",
            type: .calculation,
            tier: 3,
            formulaIds: ["log_product"],
            content: "解方程 log₂(x-1) = 3。",
            contentLatex: #"\log_2(x-1)=3,\ x=?"#,
            answer: "x=9",
            difficulty: 0.36,
            averageTime: 70,
            hints: ["化指数式x-1=2³", "检验真数>0"],
            standardSteps: [
                elStep(1, "化指数式", #"x-1=2^3=8"#),
                elStep(2, "解出并检验", #"x=9,\ x-1=8>0\ \checkmark"#)
            ],
            shortcutSteps: [
                elStep(1, "对数定义秒杀", #"x-1=8\Rightarrow x=9"#)
            ],
            keyInsight: "对数方程化为指数式求解，并检验真数为正。",
            shortcutInsight: "logₐb=c⟺b=aᶜ。",
            weapon: "对数方程",
            timeRatio: 1.7,
            tags: ["函数", "对数方程", "高考"]
        ),

        elProblem(
            id: "el_010",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["exp_rule", "log_power"],
            content: "计算 9^(log₃2)。",
            contentLatex: #"9^{\log_3 2}=?"#,
            answer: "4",
            difficulty: 0.46,
            averageTime: 80,
            hints: ["9=3²", "(3²)^(log₃2)=3^(2log₃2)=3^(log₃4)"],
            standardSteps: [
                elStep(1, "底化3", #"9^{\log_3 2}=(3^2)^{\log_3 2}=3^{2\log_3 2}"#),
                elStep(2, "幂入对数", #"=3^{\log_3 4}=4"#)
            ],
            shortcutSteps: [
                elStep(1, "幂法则秒杀", #"9^{\log_3 2}=3^{\log_3 2^2}=2^2=4"#)
            ],
            keyInsight: "把底化成与对数同底，再用a^(logₐN)=N。",
            shortcutInsight: "9^(log₃2)=(3^(log₃2))²=2²=4。",
            weapon: "指对互逆+幂法则",
            timeRatio: 2.0,
            tags: ["函数", "指对运算", "高考", "压轴"]
        ),

        elProblem(
            id: "el_011",
            type: .multipleChoice,
            tier: 3,
            formulaIds: ["log_change_base"],
            content: "比较 log₂3 与 log₃2 的大小。",
            contentLatex: #"\log_2 3\ \text{与}\ \log_3 2\ \text{的大小}"#,
            options: ["log₂3 > log₃2", "log₂3 < log₃2", "log₂3 = log₃2", "无法比较"],
            answer: "log₂3 > log₃2",
            difficulty: 0.44,
            averageTime: 80,
            hints: ["log₂3>log₂2=1", "log₃2<log₃3=1"],
            standardSteps: [
                elStep(1, "log₂3与1比", #"\log_2 3>\log_2 2=1"#),
                elStep(2, "log₃2与1比", #"\log_3 2<\log_3 3=1"#),
                elStep(3, "结论", #"\log_2 3>1>\log_3 2"#)
            ],
            shortcutSteps: [
                elStep(1, "以1为桥秒杀", #"\log_2 3>1>\log_3 2"#)
            ],
            keyInsight: "用中间量1分隔两个对数：底<真数则>1，底>真数则<1。",
            shortcutInsight: "logₐb与1比较看a、b大小关系。",
            weapon: "中间量比较法",
            timeRatio: 1.8,
            tags: ["函数", "对数", "比较大小", "高考"]
        ),

        elProblem(
            id: "el_012",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["log_product", "exp_rule"],
            content: "计算 log₅25 + 2^(log₂3) - lg1000。",
            contentLatex: #"\log_5 25+2^{\log_2 3}-\lg1000=?"#,
            answer: "2",
            difficulty: 0.48,
            averageTime: 90,
            hints: ["log₅25=2", "2^(log₂3)=3", "lg1000=3"],
            standardSteps: [
                elStep(1, "逐项", #"\log_5 25=2,\ 2^{\log_2 3}=3,\ \lg1000=3"#),
                elStep(2, "相加减", #"2+3-3=2"#)
            ],
            shortcutSteps: [
                elStep(1, "逐项秒杀", #"2+3-3=2"#)
            ],
            keyInsight: "综合运用对数求值、指对互逆、常用对数。",
            shortcutInsight: "三项分别为2、3、3，结果2。",
            weapon: "指对综合运算",
            timeRatio: 2.0,
            tags: ["函数", "指对运算", "综合", "高考", "核心"]
        )
    ]

    // MARK: - 工厂方法
    private static func elStep(_ order: Int, _ description: String, _ latex: String, _ annotation: String = "") -> SolutionStep {
        SolutionStep(order: order, description: description, latex: latex, annotation: annotation)
    }

    private static func elProblem(
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
        commonMistakes: [String] = ["对数真数必须为正", "换底方向写反", "负指数与分数指数混淆"]
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
