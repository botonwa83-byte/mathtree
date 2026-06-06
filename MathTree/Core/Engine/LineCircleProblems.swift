import Foundation

// MARK: - 直线与圆方程专题 (16道, 填补高考解析几何基础缺口)
// 涵盖: 直线斜率/点斜式/斜截式/一般式、两直线平行垂直/交点、点到直线距离、平行线距离、
//       对称; 圆的标准/一般方程、直线与圆相切、点圆位置、圆上点到直线最值、切线方程。
// 原则: 答案确定、步骤闭合。LaTeX 用 raw string。

extension SampleData {
    static let lineCircleProblems: [Problem] = [
        lcProblem(
            id: "lc_001",
            type: .fillInBlank,
            tier: 2,
            formulaIds: ["line_slope", "line_point_slope"],
            content: "求过点A(1,2)、B(3,6)的直线的斜率及其方程。",
            contentLatex: #"A(1,2),B(3,6),\ k=?,\ \text{直线方程}=?"#,
            answer: "k=2，y=2x",
            difficulty: 0.32,
            averageTime: 70,
            hints: ["k=(y₂-y₁)/(x₂-x₁)", "点斜式"],
            standardSteps: [
                lcStep(1, "斜率", #"k=\frac{6-2}{3-1}=2"#),
                lcStep(2, "点斜式", #"y-2=2(x-1)\Rightarrow y=2x"#)
            ],
            shortcutSteps: [
                lcStep(1, "两点式秒杀", #"k=2,\ \text{过}(1,2):\ y=2x"#)
            ],
            keyInsight: "两点确定斜率，再用点斜式写方程。",
            shortcutInsight: "斜率=纵差/横差，代任一点即得。",
            weapon: "斜率+点斜式",
            timeRatio: 1.6,
            tags: ["解析几何", "直线", "高考", "核心"]
        ),

        lcProblem(
            id: "lc_002",
            type: .fillInBlank,
            tier: 2,
            formulaIds: ["line_point_slope"],
            content: "求过点(2,-1)且斜率为-3的直线的一般式方程。",
            contentLatex: #"\text{过}(2,-1),\ k=-3,\ \text{一般式}=?"#,
            answer: "3x+y-5=0",
            difficulty: 0.30,
            averageTime: 60,
            hints: ["点斜式y-y₀=k(x-x₀)", "整理为Ax+By+C=0"],
            standardSteps: [
                lcStep(1, "点斜式", #"y-(-1)=-3(x-2)\Rightarrow y+1=-3x+6"#),
                lcStep(2, "一般式", #"3x+y-5=0"#)
            ],
            shortcutSteps: [
                lcStep(1, "直接整理", #"y=-3x+5\Rightarrow3x+y-5=0"#)
            ],
            keyInsight: "点斜式展开后移项即得一般式。",
            shortcutInsight: "斜率为k则一般式x系数与y系数之比为-k。",
            weapon: "点斜式",
            timeRatio: 1.5,
            tags: ["解析几何", "直线", "高考"]
        ),

        lcProblem(
            id: "lc_003",
            type: .fillInBlank,
            tier: 2,
            formulaIds: ["line_slope_intercept"],
            content: "直线l过点(0,3)且与直线y=2x+1平行，求l的方程。",
            contentLatex: #"\text{过}(0,3),\ \parallel y=2x+1,\ l=?"#,
            answer: "y=2x+3",
            difficulty: 0.30,
            averageTime: 60,
            hints: ["平行则斜率相等k=2", "过(0,3)截距3"],
            standardSteps: [
                lcStep(1, "斜率", #"\text{平行}\Rightarrow k=2"#),
                lcStep(2, "斜截式", #"\text{过}(0,3)\Rightarrow y=2x+3"#)
            ],
            shortcutSteps: [
                lcStep(1, "斜截式秒杀", #"k=2,b=3\Rightarrow y=2x+3"#)
            ],
            keyInsight: "两直线平行斜率相等，y轴交点给出截距。",
            shortcutInsight: "直接读斜率与截距。",
            weapon: "斜截式",
            timeRatio: 1.5,
            tags: ["解析几何", "直线", "平行", "高考"]
        ),

        lcProblem(
            id: "lc_004",
            type: .fillInBlank,
            tier: 2,
            formulaIds: ["line_general", "line_slope_intercept"],
            content: "求直线2x-3y+6=0的斜率和在y轴上的截距。",
            contentLatex: #"2x-3y+6=0,\ k=?,\ \text{y截距}=?"#,
            answer: "k=2/3，y截距=2",
            difficulty: 0.30,
            averageTime: 60,
            hints: ["化为斜截式y=kx+b"],
            standardSteps: [
                lcStep(1, "化斜截式", #"3y=2x+6\Rightarrow y=\frac23 x+2"#),
                lcStep(2, "读取", #"k=\frac23,\ \text{y截距}=2"#)
            ],
            shortcutSteps: [
                lcStep(1, "系数公式秒杀", #"Ax+By+C=0:\ k=-\frac AB=\frac23,\ \text{y截距}=-\frac CB=2"#)
            ],
            keyInsight: "一般式化斜截式即可读出斜率与截距。",
            shortcutInsight: "k=-A/B，y截距=-C/B。",
            weapon: "一般式↔斜截式",
            timeRatio: 1.5,
            tags: ["解析几何", "直线", "高考"]
        ),

        lcProblem(
            id: "lc_005",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["line_general", "parallel_lines"],
            content: "已知直线l₁:2x+ay-1=0与l₂:x-y+2=0平行，求a。",
            contentLatex: #"l_1:2x+ay-1=0\parallel l_2:x-y+2=0,\ a=?"#,
            answer: "a=-2",
            difficulty: 0.44,
            averageTime: 90,
            hints: ["平行:A₁B₂-A₂B₁=0", "验证不重合"],
            standardSteps: [
                lcStep(1, "平行条件", #"2\cdot(-1)-1\cdot a=0\Rightarrow a=-2"#),
                lcStep(2, "验证不重合", #"a=-2:\ l_1:2x-2y-1=0,\ l_2:2x-2y+4=0\ \text{常数不同,平行}"#)
            ],
            shortcutSteps: [
                lcStep(1, "系数交叉秒杀", #"\frac21=\frac{a}{-1}\Rightarrow a=-2\ (\text{且常数项不成比例})"#)
            ],
            keyInsight: "两直线平行⟺一次项系数成比例且不重合。",
            shortcutInsight: "A₁B₂=A₂B₁，再排除重合。",
            weapon: "平行条件",
            timeRatio: 2.0,
            tags: ["解析几何", "直线", "平行", "含参", "高考", "核心"]
        ),

        lcProblem(
            id: "lc_006",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["perpendicular_lines"],
            content: "已知直线l₁:ax+y-1=0与l₂:x-2y+3=0垂直，求a。",
            contentLatex: #"l_1:ax+y-1=0\perp l_2:x-2y+3=0,\ a=?"#,
            answer: "a=2",
            difficulty: 0.44,
            averageTime: 90,
            hints: ["垂直:A₁A₂+B₁B₂=0", "或斜率积=-1"],
            standardSteps: [
                lcStep(1, "垂直条件", #"A_1A_2+B_1B_2=a\cdot1+1\cdot(-2)=0\Rightarrow a=2"#)
            ],
            shortcutSteps: [
                lcStep(1, "系数点积秒杀", #"a-2=0\Rightarrow a=2"#)
            ],
            keyInsight: "两直线垂直⟺A₁A₂+B₁B₂=0（无需讨论斜率是否存在）。",
            shortcutInsight: "一般式系数点积为0即垂直。",
            weapon: "垂直条件",
            timeRatio: 1.8,
            tags: ["解析几何", "直线", "垂直", "含参", "高考", "核心"]
        ),

        lcProblem(
            id: "lc_007",
            type: .fillInBlank,
            tier: 2,
            formulaIds: ["line_intersection"],
            content: "求直线2x+y=4与x-y=-1的交点坐标。",
            contentLatex: #"\begin{cases}2x+y=4\\x-y=-1\end{cases}\ \text{交点}=?"#,
            answer: "(1,2)",
            difficulty: 0.30,
            averageTime: 60,
            hints: ["两式相加消y"],
            standardSteps: [
                lcStep(1, "相加", #"3x=3\Rightarrow x=1"#),
                lcStep(2, "回代", #"y=2\Rightarrow(1,2)"#)
            ],
            shortcutSteps: [
                lcStep(1, "消元秒杀", #"\text{两式相加}3x=3\Rightarrow(1,2)"#)
            ],
            keyInsight: "两直线交点=方程组的解。",
            shortcutInsight: "加减消元最快。",
            weapon: "解方程组",
            timeRatio: 1.5,
            tags: ["解析几何", "直线", "交点", "高考"]
        ),

        lcProblem(
            id: "lc_008",
            type: .fillInBlank,
            tier: 2,
            formulaIds: ["dist_point_line"],
            content: "求点P(2,3)到直线3x+4y-5=0的距离。",
            contentLatex: #"P(2,3),\ 3x+4y-5=0,\ d=?"#,
            answer: "13/5",
            difficulty: 0.34,
            averageTime: 60,
            hints: ["d=|Ax₀+By₀+C|/√(A²+B²)"],
            standardSteps: [
                lcStep(1, "距离公式", #"d=\frac{|3\cdot2+4\cdot3-5|}{\sqrt{3^2+4^2}}=\frac{|13|}{5}=\frac{13}{5}"#)
            ],
            shortcutSteps: [
                lcStep(1, "公式秒杀", #"d=\frac{13}{5}"#)
            ],
            keyInsight: "点到直线距离=|代入一般式|/系数模长。",
            shortcutInsight: "分母√(A²+B²)=5，分子绝对值13。",
            weapon: "点到直线距离公式",
            timeRatio: 1.5,
            tags: ["解析几何", "直线", "距离", "高考", "核心"]
        ),

        lcProblem(
            id: "lc_009",
            type: .fillInBlank,
            tier: 2,
            formulaIds: ["dist_point_line"],
            content: "求两条平行直线3x+4y-1=0与3x+4y+9=0之间的距离。",
            contentLatex: #"3x+4y-1=0\ \text{与}\ 3x+4y+9=0,\ d=?"#,
            answer: "2",
            difficulty: 0.36,
            averageTime: 70,
            hints: ["平行线距离=|C₁-C₂|/√(A²+B²)", "需先统一A,B"],
            standardSteps: [
                lcStep(1, "平行线距离", #"d=\frac{|-1-9|}{\sqrt{3^2+4^2}}=\frac{10}{5}=2"#)
            ],
            shortcutSteps: [
                lcStep(1, "公式秒杀", #"d=\frac{|C_1-C_2|}{\sqrt{A^2+B^2}}=2"#)
            ],
            keyInsight: "平行线间距离公式要求两式的A、B系数一致。",
            shortcutInsight: "|常数差|除以系数模长。",
            weapon: "平行线距离公式",
            timeRatio: 1.6,
            tags: ["解析几何", "直线", "平行线距离", "高考"]
        ),

        lcProblem(
            id: "lc_010",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["line", "symmetry"],
            content: "求点P(2,1)关于直线x+y=0的对称点P'。",
            contentLatex: #"P(2,1),\ \text{关于}x+y=0\text{对称},\ P'=?"#,
            answer: "(-1,-2)",
            difficulty: 0.46,
            averageTime: 90,
            hints: ["关于y=-x对称:(x,y)→(-y,-x)", "或用垂直+中点"],
            standardSteps: [
                lcStep(1, "对称规律", #"\text{关于}y=-x\text{对称}:(x,y)\to(-y,-x)"#),
                lcStep(2, "代入", #"P(2,1)\to(-1,-2)"#)
            ],
            shortcutSteps: [
                lcStep(1, "坐标互换变号秒杀", #"(2,1)\to(-1,-2)"#)
            ],
            keyInsight: "关于直线y=-x对称的点坐标互换并变号。",
            shortcutInsight: "(x,y)关于y=-x对称得(-y,-x)。",
            weapon: "对称变换",
            timeRatio: 1.8,
            tags: ["解析几何", "直线", "对称", "高考"]
        ),

        lcProblem(
            id: "lc_011",
            type: .fillInBlank,
            tier: 2,
            formulaIds: ["circle"],
            content: "求以C(1,-2)为圆心且过原点的圆的标准方程。",
            contentLatex: #"\text{圆心}C(1,-2),\ \text{过原点},\ \text{标准方程}=?"#,
            answer: "(x-1)²+(y+2)²=5",
            difficulty: 0.34,
            averageTime: 70,
            hints: ["半径=|CO|", "r²=1²+2²"],
            standardSteps: [
                lcStep(1, "半径", #"r^2=|CO|^2=1^2+(-2)^2=5"#),
                lcStep(2, "标准方程", #"(x-1)^2+(y+2)^2=5"#)
            ],
            shortcutSteps: [
                lcStep(1, "心径秒杀", #"r^2=5\Rightarrow(x-1)^2+(y+2)^2=5"#)
            ],
            keyInsight: "圆心到圆上点(原点)的距离即半径。",
            shortcutInsight: "r²=圆心坐标平方和(过原点时)。",
            weapon: "圆的标准方程",
            timeRatio: 1.6,
            tags: ["解析几何", "圆", "方程", "高考", "核心"]
        ),

        lcProblem(
            id: "lc_012",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["circle_general"],
            content: "把圆的方程x²+y²-4x+6y-3=0化为标准方程，并求圆心和半径。",
            contentLatex: #"x^2+y^2-4x+6y-3=0,\ \text{圆心,半径}=?"#,
            answer: "(x-2)²+(y+3)²=16，圆心(2,-3)，半径4",
            difficulty: 0.46,
            averageTime: 90,
            hints: ["配方", "圆心(-D/2,-E/2)"],
            standardSteps: [
                lcStep(1, "配方", #"(x-2)^2-4+(y+3)^2-9-3=0"#),
                lcStep(2, "标准方程", #"(x-2)^2+(y+3)^2=16"#),
                lcStep(3, "圆心半径", #"\text{圆心}(2,-3),\ r=4"#)
            ],
            shortcutSteps: [
                lcStep(1, "一般式公式秒杀", #"\text{圆心}\left(-\frac D2,-\frac E2\right)=(2,-3),\ r=\frac12\sqrt{D^2+E^2-4F}=\frac12\sqrt{16+36+12}=4"#)
            ],
            keyInsight: "一般方程配方得标准方程，确定圆心半径。",
            shortcutInsight: "圆心(-D/2,-E/2)，r=½√(D²+E²-4F)。",
            weapon: "圆一般方程配方",
            timeRatio: 2.0,
            tags: ["解析几何", "圆", "一般方程", "高考", "核心"]
        ),

        lcProblem(
            id: "lc_013",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["line_circle", "tangent"],
            content: "若直线x+y+c=0与圆x²+y²=2相切，求c的值。",
            contentLatex: #"x+y+c=0\ \text{与}\ x^2+y^2=2\ \text{相切},\ c=?"#,
            answer: "c=±2",
            difficulty: 0.46,
            averageTime: 90,
            hints: ["相切:圆心到直线距离=r", "d=|c|/√2=√2"],
            standardSteps: [
                lcStep(1, "相切条件", #"d=\frac{|0+0+c|}{\sqrt{1+1}}=\sqrt2"#),
                lcStep(2, "解c", #"\frac{|c|}{\sqrt2}=\sqrt2\Rightarrow|c|=2\Rightarrow c=\pm2"#)
            ],
            shortcutSteps: [
                lcStep(1, "距离=半径秒杀", #"|c|=r\sqrt2=2\Rightarrow c=\pm2"#)
            ],
            keyInsight: "直线与圆相切⟺圆心到直线距离=半径。",
            shortcutInsight: "令距离公式=r解出参数。",
            weapon: "相切条件d=r",
            timeRatio: 2.0,
            tags: ["解析几何", "圆", "直线与圆", "相切", "高考"]
        ),

        lcProblem(
            id: "lc_014",
            type: .multipleChoice,
            tier: 2,
            formulaIds: ["circle"],
            content: "判断点(3,4)与圆x²+y²=16的位置关系。",
            contentLatex: #"\text{点}(3,4)\ \text{与圆}\ x^2+y^2=16"#,
            options: ["圆内", "圆上", "圆外", "无法确定"],
            answer: "圆外",
            difficulty: 0.34,
            averageTime: 60,
            hints: ["比较点到圆心距离与半径", "3²+4²与r²=16比较"],
            standardSteps: [
                lcStep(1, "代入", #"3^2+4^2=25,\ r^2=16"#),
                lcStep(2, "比较", #"25>16\Rightarrow|OP|>r\Rightarrow\text{点在圆外}"#)
            ],
            shortcutSteps: [
                lcStep(1, "距离比较秒杀", #"|OP|=5>4=r\Rightarrow\text{圆外}"#)
            ],
            keyInsight: "点与圆位置由点到圆心距离与半径比较决定。",
            shortcutInsight: "|OP|=5，r=4，5>4故在圆外。",
            weapon: "点圆位置判定",
            timeRatio: 1.5,
            tags: ["解析几何", "圆", "位置关系", "高考"]
        ),

        lcProblem(
            id: "lc_015",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["circle", "dist_point_line", "max_min"],
            content: "求圆(x-1)²+(y-1)²=1上的点到直线3x+4y+10=0的距离的最大值和最小值。",
            contentLatex: #"(x-1)^2+(y-1)^2=1,\ \text{到}3x+4y+10=0\text{距离的}\max,\min"#,
            answer: "最大22/5，最小12/5",
            difficulty: 0.50,
            averageTime: 100,
            hints: ["圆心到直线距离d", "max=d+r,min=d-r"],
            standardSteps: [
                lcStep(1, "圆心距离", #"d=\frac{|3+4+10|}{5}=\frac{17}{5}"#),
                lcStep(2, "最值", #"\max=d+r=\frac{17}{5}+1=\frac{22}{5},\ \min=d-r=\frac{17}{5}-1=\frac{12}{5}"#)
            ],
            shortcutSteps: [
                lcStep(1, "心距±半径秒杀", #"\frac{17}{5}\pm1=\frac{22}{5},\frac{12}{5}"#)
            ],
            keyInsight: "圆上点到直线距离的最值=圆心到直线距离±半径。",
            shortcutInsight: "先算圆心到直线距离，再±r。",
            weapon: "圆上点到直线最值",
            timeRatio: 2.0,
            tags: ["解析几何", "圆", "最值", "高考", "核心"]
        ),

        lcProblem(
            id: "lc_016",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["circle", "tangent"],
            content: "求圆x²+y²=5在点(1,2)处的切线方程。",
            contentLatex: #"x^2+y^2=5,\ \text{在}(1,2)\text{处的切线}=?"#,
            answer: "x+2y-5=0",
            difficulty: 0.44,
            averageTime: 80,
            hints: ["圆x²+y²=r²在(x₀,y₀)切线为x₀x+y₀y=r²", "或切线⊥半径"],
            standardSteps: [
                lcStep(1, "验证在圆上", #"1^2+2^2=5\ \checkmark"#),
                lcStep(2, "切线公式", #"x_0x+y_0y=r^2\Rightarrow1\cdot x+2\cdot y=5"#),
                lcStep(3, "结论", #"x+2y-5=0"#)
            ],
            shortcutSteps: [
                lcStep(1, "切点弦公式秒杀", #"x_0x+y_0y=r^2:\ x+2y=5"#)
            ],
            keyInsight: "圆x²+y²=r²上一点(x₀,y₀)的切线为x₀x+y₀y=r²。",
            shortcutInsight: "把切点坐标代入'x₀x+y₀y=r²'即得切线。",
            weapon: "圆切线公式",
            timeRatio: 1.8,
            tags: ["解析几何", "圆", "切线", "高考", "核心"]
        )
    ]

    // MARK: - 工厂方法
    private static func lcStep(_ order: Int, _ description: String, _ latex: String, _ annotation: String = "") -> SolutionStep {
        SolutionStep(order: order, description: description, latex: latex, annotation: annotation)
    }

    private static func lcProblem(
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
        commonMistakes: [String] = ["平行忘记排除重合", "点到直线距离忘记取绝对值", "圆一般方程配方出错"]
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
