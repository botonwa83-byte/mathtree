import Foundation

// MARK: - 高考解析几何压轴专题 (10道, 替补重建)
// 涵盖: 椭圆方程/离心率、中点弦、焦点弦定值、弦长、焦点三角形、双曲线渐近线、抛物线、向量定值。
// 原则: 答案确定、步骤闭合、常规法 + 秒杀(定值公式/几何性质)。LaTeX 用 raw string。

extension SampleData {
    static let gaokaoConicAdvProblems: [Problem] = [
        caProblem(
            id: "gca_001",
            type: .calculation,
            tier: 4,
            formulaIds: ["ellipse", "eccentricity"],
            content: "已知椭圆x²/a²+y²/b²=1(a>b>0)过点(2,1)，离心率为√3/2，求椭圆方程。",
            contentLatex: #"\text{过}(2,1),\ e=\frac{\sqrt3}{2},\ \text{求椭圆方程}"#,
            answer: "x²/8+y²/2=1",
            difficulty: 0.52,
            averageTime: 120,
            hints: ["e²=1-b²/a²=3/4", "得a²=4b²", "代入点(2,1)"],
            standardSteps: [
                caStep(1, "离心率", #"e^2=1-\frac{b^2}{a^2}=\frac34\Rightarrow a^2=4b^2"#),
                caStep(2, "代入点", #"\frac{4}{a^2}+\frac{1}{b^2}=1\Rightarrow\frac{4}{4b^2}+\frac1{b^2}=\frac{2}{b^2}=1"#),
                caStep(3, "求解", #"b^2=2,\ a^2=8\Rightarrow\frac{x^2}{8}+\frac{y^2}{2}=1"#)
            ],
            shortcutSteps: [
                caStep(1, "比例代入秒杀", #"a^2=4b^2,\ \frac{2}{b^2}=1\Rightarrow b^2=2,a^2=8"#)
            ],
            keyInsight: "由离心率得a²,b²的比例关系，再用过定点确定具体值。",
            shortcutInsight: "a²=4b²代入点方程，左边合并为2/b²，一步出。",
            weapon: "离心率+待定系数",
            timeRatio: 2.0,
            tags: ["解析几何", "椭圆", "离心率", "高考", "核心"]
        ),

        caProblem(
            id: "gca_002",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["ellipse", "midpoint_chord"],
            content: "椭圆x²/4+y²=1的一条弦的中点为M(1,1/2)，求该弦所在直线的斜率。",
            contentLatex: #"\frac{x^2}{4}+y^2=1,\ \text{弦中点}M(1,\tfrac12),\ k=?"#,
            answer: "-1/2",
            difficulty: 0.58,
            averageTime: 120,
            hints: ["点差法", "k=-b²x₀/(a²y₀)"],
            standardSteps: [
                caStep(1, "点差法", #"\frac{x_1^2-x_2^2}{4}+(y_1^2-y_2^2)=0"#),
                caStep(2, "中点斜率", #"k=-\frac{x_1+x_2}{4(y_1+y_2)}=-\frac{2x_0}{4\cdot2y_0}=-\frac{x_0}{4y_0}"#),
                caStep(3, "代入", #"k=-\frac{1}{4\cdot\tfrac12}=-\frac12"#)
            ],
            shortcutSteps: [
                caStep(1, "中点弦公式秒杀", #"k=-\frac{b^2x_0}{a^2y_0}=-\frac{1\cdot1}{4\cdot\tfrac12}=-\frac12"#)
            ],
            keyInsight: "中点弦问题用点差法，斜率由中点坐标决定。",
            shortcutInsight: "椭圆中点弦斜率k=-b²x₀/(a²y₀)直接代。",
            weapon: "点差法/中点弦公式",
            timeRatio: 2.4,
            tags: ["解析几何", "椭圆", "中点弦", "高考", "核心"]
        ),

        caProblem(
            id: "gca_003",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["parabola", "focal_chord"],
            content: "抛物线y²=4x的焦点为F，过F的弦AB，求1/|AF|+1/|BF|的值。",
            contentLatex: #"y^2=4x,\ \text{焦点弦}AB,\ \frac{1}{|AF|}+\frac{1}{|BF|}=?"#,
            answer: "1",
            difficulty: 0.60,
            averageTime: 130,
            hints: ["焦半径|AF|=x_A+1", "通径2p=4", "1/AF+1/BF=2/p为定值"],
            standardSteps: [
                caStep(1, "焦半径", #"|AF|=x_A+1,\ |BF|=x_B+1\ (\text{准线}x=-1)"#),
                caStep(2, "定值公式", #"\frac1{|AF|}+\frac1{|BF|}=\frac{2}{p}\ (\text{半通径}p=2)"#),
                caStep(3, "结论", #"=\frac{2}{2}=1"#)
            ],
            shortcutSteps: [
                caStep(1, "定值秒杀", #"\frac1{|AF|}+\frac1{|BF|}=\frac{2}{\text{半通径}}=\frac22=1"#)
            ],
            keyInsight: "过焦点弦的两焦半径倒数和是定值2/(半通径)。",
            shortcutInsight: "y²=4x半通径=2，倒数和=1，与弦的方向无关。",
            weapon: "焦点弦倒数和定值",
            timeRatio: 2.5,
            tags: ["解析几何", "抛物线", "焦点弦", "定值", "高考", "压轴"]
        ),

        caProblem(
            id: "gca_004",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["ellipse", "chord_length"],
            content: "直线y=x+1与椭圆x²/4+y²=1交于A、B两点，求|AB|。",
            contentLatex: #"y=x+1\ \text{与}\ \frac{x^2}{4}+y^2=1\ \text{交于}A,B,\ |AB|=?"#,
            answer: "8√2/5",
            difficulty: 0.56,
            averageTime: 130,
            hints: ["联立消y", "5x²+8x=0", "|AB|=√(1+k²)|x₁-x₂|"],
            standardSteps: [
                caStep(1, "联立", #"\frac{x^2}{4}+(x+1)^2=1\Rightarrow5x^2+8x=0"#),
                caStep(2, "解根", #"x=0\ \text{或}\ x=-\frac85,\ |x_1-x_2|=\frac85"#),
                caStep(3, "弦长", #"|AB|=\sqrt{1+1^2}\cdot\frac85=\frac{8\sqrt2}{5}"#)
            ],
            shortcutSteps: [
                caStep(1, "弦长公式秒杀", #"|AB|=\sqrt2\,|x_1-x_2|=\sqrt2\cdot\frac85=\frac{8\sqrt2}{5}"#)
            ],
            keyInsight: "直线与椭圆弦长=√(1+k²)·|x₁-x₂|。",
            shortcutInsight: "联立得5x²+8x=0，两根差8/5，乘√2即弦长。",
            weapon: "联立+弦长公式",
            timeRatio: 2.2,
            tags: ["解析几何", "椭圆", "弦长", "高考"]
        ),

        caProblem(
            id: "gca_005",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["hyperbola", "asymptote"],
            content: "双曲线x²/9-y²/16=1的右焦点到其一条渐近线的距离。",
            contentLatex: #"\frac{x^2}{9}-\frac{y^2}{16}=1,\ \text{右焦点到渐近线距离}=?"#,
            answer: "4",
            difficulty: 0.46,
            averageTime: 90,
            hints: ["a=3,b=4,c=5", "渐近线4x±3y=0", "点到直线距离"],
            standardSteps: [
                caStep(1, "基本量", #"a=3,b=4,c=5,\ \text{右焦点}(5,0)"#),
                caStep(2, "渐近线", #"y=\frac43 x\Rightarrow4x-3y=0"#),
                caStep(3, "距离", #"d=\frac{|4\cdot5-0|}{\sqrt{16+9}}=\frac{20}{5}=4"#)
            ],
            shortcutSteps: [
                caStep(1, "定理秒杀", #"\text{焦点到渐近线距离}=b=4"#)
            ],
            keyInsight: "焦点到渐近线的距离恒等于虚半轴长b。",
            shortcutInsight: "直接记结论：距离=b=4。",
            weapon: "焦点到渐近线=b",
            timeRatio: 2.0,
            tags: ["解析几何", "双曲线", "渐近线", "高考", "核心"]
        ),

        caProblem(
            id: "gca_006",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["parabola", "focal_radius"],
            content: "抛物线y²=8x上一点P到焦点的距离为6，求点P的坐标。",
            contentLatex: #"y^2=8x,\ |PF|=6,\ P=?"#,
            answer: "(4, 4√2) 或 (4, -4√2)",
            difficulty: 0.48,
            averageTime: 100,
            hints: ["准线x=-2，焦点(2,0)", "|PF|=x_P+2", "代回抛物线"],
            standardSteps: [
                caStep(1, "焦半径", #"|PF|=x_P+2=6\Rightarrow x_P=4"#),
                caStep(2, "代回", #"y_P^2=8\cdot4=32\Rightarrow y_P=\pm4\sqrt2"#),
                caStep(3, "结论", #"P(4,4\sqrt2)\ \text{或}\ P(4,-4\sqrt2)"#)
            ],
            shortcutSteps: [
                caStep(1, "焦半径秒杀", #"x_P=|PF|-\frac p2=6-2=4,\ y_P=\pm4\sqrt2"#)
            ],
            keyInsight: "抛物线焦半径|PF|=x_P+p/2，由距离反求横坐标。",
            shortcutInsight: "x_P=|PF|-2，再代回求y。",
            weapon: "抛物线焦半径公式",
            timeRatio: 2.0,
            tags: ["解析几何", "抛物线", "焦半径", "高考"]
        ),

        caProblem(
            id: "gca_007",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["ellipse", "focal_triangle"],
            content: "椭圆x²/25+y²/9=1，过左焦点F₁的弦AB，F₂为右焦点，求△ABF₂的周长。",
            contentLatex: #"\frac{x^2}{25}+\frac{y^2}{9}=1,\ \text{过}F_1\text{的弦}AB,\ \text{周长}_{\triangle ABF_2}=?"#,
            answer: "20",
            difficulty: 0.48,
            averageTime: 90,
            hints: ["椭圆定义|AF₁|+|AF₂|=2a", "周长=4a"],
            standardSteps: [
                caStep(1, "椭圆定义", #"|AF_1|+|AF_2|=2a,\ |BF_1|+|BF_2|=2a"#),
                caStep(2, "周长", #"|AB|+|AF_2|+|BF_2|=(|AF_1|+|BF_1|)+|AF_2|+|BF_2|=4a"#),
                caStep(3, "结论", #"4a=4\times5=20"#)
            ],
            shortcutSteps: [
                caStep(1, "焦点弦三角形周长秒杀", #"\text{周长}=4a=20"#)
            ],
            keyInsight: "过一焦点的弦与另一焦点构成的三角形周长恒为4a。",
            shortcutInsight: "记结论：焦点弦三角形周长=4a。",
            weapon: "椭圆定义",
            timeRatio: 1.8,
            tags: ["解析几何", "椭圆", "焦点三角形", "高考"]
        ),

        caProblem(
            id: "gca_008",
            type: .fillInBlank,
            tier: 5,
            formulaIds: ["ellipse", "eccentricity", "range"],
            content: "椭圆x²/a²+y²/b²=1(a>b>0)上存在点P使∠F₁PF₂=90°，求离心率e的取值范围。",
            contentLatex: #"\exists P:\ \angle F_1PF_2=90^\circ,\ e\in?"#,
            answer: "[√2/2, 1)",
            difficulty: 0.72,
            averageTime: 160,
            hints: ["∠F₁PF₂最大在短轴端点", "存在直角需短轴端点张角≥90°", "b≤c"],
            standardSteps: [
                caStep(1, "张角最大处", #"\angle F_1PF_2\text{在短轴端点}B\text{处最大}"#),
                caStep(2, "存在直角条件", #"\angle F_1BF_2\ge90^\circ\Rightarrow\text{在}B\text{处}\tan\frac{\angle}{2}=\frac cb\ge1\Rightarrow b\le c"#),
                caStep(3, "化为e", #"b^2\le c^2\Rightarrow a^2-c^2\le c^2\Rightarrow e^2\ge\frac12"#),
                caStep(4, "结论", #"e\in\left[\frac{\sqrt2}{2},1\right)"#)
            ],
            shortcutSteps: [
                caStep(1, "短轴端点秒杀", #"\text{需}b\le c\Rightarrow e=\frac ca\ge\frac{\sqrt2}{2}"#)
            ],
            keyInsight: "P在短轴端点时∠F₁PF₂最大，存在90°要求该最大角≥90°。",
            shortcutInsight: "条件等价于b≤c，即e≥√2/2。",
            weapon: "短轴端点张角最大",
            timeRatio: 2.5,
            tags: ["解析几何", "椭圆", "离心率", "范围", "高考", "压轴"]
        ),

        caProblem(
            id: "gca_009",
            type: .multipleChoice,
            tier: 3,
            formulaIds: ["circle", "line"],
            content: "判断直线3x+4y-1=0与圆(x-3)²+(y-4)²=4的位置关系。",
            contentLatex: #"3x+4y-1=0\ \text{与}\ (x-3)^2+(y-4)^2=4"#,
            options: ["相交", "相切", "相离", "无法确定"],
            answer: "相离",
            difficulty: 0.44,
            averageTime: 80,
            hints: ["圆心(3,4)半径2", "圆心到直线距离d与r比较"],
            standardSteps: [
                caStep(1, "圆心半径", #"\text{圆心}(3,4),\ r=2"#),
                caStep(2, "圆心距", #"d=\frac{|3\cdot3+4\cdot4-1|}{\sqrt{9+16}}=\frac{24}{5}=4.8"#),
                caStep(3, "比较", #"d=4.8>2=r\Rightarrow\text{相离}"#)
            ],
            shortcutSteps: [
                caStep(1, "距离比较秒杀", #"d=\frac{24}{5}>r=2\Rightarrow\text{相离}"#)
            ],
            keyInsight: "直线与圆位置关系由圆心到直线距离d与半径r比较决定。",
            shortcutInsight: "d>r相离，d=r相切，d<r相交。",
            weapon: "点到直线距离判位置",
            timeRatio: 1.8,
            tags: ["解析几何", "圆", "直线", "高考"]
        ),

        caProblem(
            id: "gca_010",
            type: .fillInBlank,
            tier: 5,
            formulaIds: ["parabola", "vector_dot", "focal_chord"],
            content: "抛物线y²=4x，O为原点，过焦点F的直线交抛物线于A、B两点，求向量OA·OB的值。",
            contentLatex: #"y^2=4x,\ \text{过}F\text{的弦}AB,\ \vec{OA}\cdot\vec{OB}=?"#,
            answer: "-3",
            difficulty: 0.74,
            averageTime: 160,
            hints: ["焦点弦y₁y₂=-p²", "x₁x₂=(y₁y₂)²/16", "OA·OB=x₁x₂+y₁y₂"],
            standardSteps: [
                caStep(1, "焦点弦性质", #"y^2=4x\Rightarrow2p=4,\ \text{焦点弦}y_1y_2=-p^2=-4"#),
                caStep(2, "求x₁x₂", #"x_i=\frac{y_i^2}{4}\Rightarrow x_1x_2=\frac{(y_1y_2)^2}{16}=\frac{16}{16}=1"#),
                caStep(3, "数量积", #"\vec{OA}\cdot\vec{OB}=x_1x_2+y_1y_2=1+(-4)=-3"#)
            ],
            shortcutSteps: [
                caStep(1, "焦点弦定值秒杀", #"y_1y_2=-4,\ x_1x_2=1\Rightarrow\vec{OA}\cdot\vec{OB}=-3"#)
            ],
            keyInsight: "过焦点弦的y₁y₂=-p²、x₁x₂=p²/4均为定值，故OA·OB为定值。",
            shortcutInsight: "记焦点弦y₁y₂=-p²(=-4)、x₁x₂=p²/4(=1)，数量积=-3。",
            weapon: "焦点弦坐标积定值",
            timeRatio: 2.4,
            tags: ["解析几何", "抛物线", "向量", "定值", "高考", "压轴"]
        )
    ]

    // MARK: - 工厂方法
    private static func caStep(_ order: Int, _ description: String, _ latex: String, _ annotation: String = "") -> SolutionStep {
        SolutionStep(order: order, description: description, latex: latex, annotation: annotation)
    }

    private static func caProblem(
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
        commonMistakes: [String] = ["焦半径公式p/2用错", "中点弦斜率公式记反", "弦长漏乘√(1+k²)"]
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
