import Foundation

// MARK: - 不等式选讲专题 (选考)
// 目标: 绝对值不等式的解法与最值、含参恒成立/存在性、柯西与均值的证明应用。
// 秒杀思路: 绝对值几何意义(数轴距离)、三角不等式 ||a|-|b||≤|a±b|≤|a|+|b|。
// 注意: 每题答案均为确定数值。

extension SampleData {
    static let inequalitySelectedProblems: [Problem] = [
        ineqsProblem(
            id: "ineqs_001",
            type: .calculation,
            tier: 3,
            formulaIds: ["absolute_inequality"],
            content: "解不等式 |2x-1|≤3。",
            contentLatex: #"|2x-1|\le3"#,
            answer: "-1≤x≤2",
            difficulty: 0.40,
            averageTime: 70,
            hints: ["|f|≤a ⟺ -a≤f≤a", "-3≤2x-1≤3"],
            standardSteps: [
                ineqsStep(1, "去绝对值", #"-3\le2x-1\le3"#),
                ineqsStep(2, "解", #"-2\le2x\le4\Rightarrow-1\le x\le2"#)
            ],
            shortcutSteps: [
                ineqsStep(1, "区间公式秒杀", #"|2x-1|\le3\Rightarrow x\in[-1,2]"#)
            ],
            keyInsight: "|f(x)|≤a(a>0)等价于-a≤f(x)≤a。",
            shortcutInsight: "直接展成双向不等式一次解出。",
            weapon: "绝对值不等式基本型",
            timeRatio: 1.6,
            tags: ["不等式选讲", "绝对值", "必考", "核心"]
        ),

        ineqsProblem(
            id: "ineqs_002",
            type: .calculation,
            tier: 4,
            formulaIds: ["absolute_inequality"],
            content: "解不等式 |x-1|+|x+2|≥5。",
            contentLatex: #"|x-1|+|x+2|\ge5"#,
            answer: "x≤-3 或 x≥2",
            difficulty: 0.56,
            averageTime: 120,
            hints: ["零点分段x=-2,1", "分三段讨论", "或用几何意义"],
            standardSteps: [
                ineqsStep(1, "x<-2", #"-(x-1)-(x+2)=-2x-1\ge5\Rightarrow x\le-3"#),
                ineqsStep(2, "-2≤x≤1", #"-(x-1)+(x+2)=3\ge5\ \text{不成立}"#),
                ineqsStep(3, "x>1", #"(x-1)+(x+2)=2x+1\ge5\Rightarrow x\ge2"#),
                ineqsStep(4, "合并", #"x\le-3\ \text{或}\ x\ge2"#)
            ],
            shortcutSteps: [
                ineqsStep(1, "几何意义秒杀", #"\text{到}1\text{与}-2\text{距离和}\ge5,\ \text{两点间距}3"#),
                ineqsStep(2, "向外扩", #"\text{超出部分}(5-3)/2=1,\ \text{故}x\le-2-1\text{或}x\ge1+1"#),
                ineqsStep(3, "结果", #"x\le-3\ \text{或}\ x\ge2"#)
            ],
            keyInsight: "和式绝对值不等式用零点分段法是通法。",
            shortcutInsight: "几何上距离和≥定值, 在两定点外侧各扩(差额/2)。",
            weapon: "零点分段/几何意义",
            timeRatio: 2.2,
            tags: ["不等式选讲", "绝对值", "分段", "必考", "核心"]
        ),

        ineqsProblem(
            id: "ineqs_003",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["absolute_inequality", "min"],
            content: "求函数 f(x)=|x-3|+|x+1| 的最小值。",
            contentLatex: #"f(x)=|x-3|+|x+1|,\ f_{\min}=?"#,
            answer: "4",
            difficulty: 0.44,
            averageTime: 80,
            hints: ["三角不等式", "|x-3|+|x+1|≥|(x-3)-(x+1)|", "=|−4|"],
            standardSteps: [
                ineqsStep(1, "三角不等式", #"|x-3|+|x+1|\ge|(x-3)-(x+1)|=4"#),
                ineqsStep(2, "取等", #"-1\le x\le3\text{时取等},\ f_{\min}=4"#)
            ],
            shortcutSteps: [
                ineqsStep(1, "两点间距秒杀", #"f_{\min}=|3-(-1)|=4"#)
            ],
            keyInsight: "|x-a|+|x-b|的最小值是|a-b|(两定点间距)。",
            shortcutInsight: "最小值=两零点之差的绝对值, 直接读。",
            weapon: "绝对值三角不等式",
            timeRatio: 2.0,
            tags: ["不等式选讲", "绝对值", "最值", "必考"]
        ),

        ineqsProblem(
            id: "ineqs_004",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["absolute_inequality", "max"],
            content: "求函数 f(x)=|x+2|-|x-3| 的最大值。",
            contentLatex: #"f(x)=|x+2|-|x-3|,\ f_{\max}=?"#,
            answer: "5",
            difficulty: 0.48,
            averageTime: 90,
            hints: ["差式三角不等式", "|x+2|-|x-3|≤|(x+2)-(x-3)|", "=5"],
            standardSteps: [
                ineqsStep(1, "三角不等式", #"|x+2|-|x-3|\le|(x+2)-(x-3)|=5"#),
                ineqsStep(2, "取等", #"x\ge3\text{时取等},\ f_{\max}=5"#)
            ],
            shortcutSteps: [
                ineqsStep(1, "差式上界秒杀", #"f_{\max}=|(+2)-(-3)|=5"#)
            ],
            keyInsight: "差式|x-a|-|x-b|的取值范围是[-|a-b|,|a-b|]。",
            shortcutInsight: "最大值=两零点间距, 在右端外侧取得。",
            weapon: "绝对值差式三角不等式",
            timeRatio: 2.0,
            tags: ["不等式选讲", "绝对值", "最值", "必考"]
        ),

        ineqsProblem(
            id: "ineqs_005",
            type: .calculation,
            tier: 5,
            formulaIds: ["absolute_inequality", "parameter"],
            content: "若不等式 |x-1|+|x+3|≥a 对一切实数 x 恒成立, 求 a 的取值范围。",
            contentLatex: #"|x-1|+|x+3|\ge a\ \forall x\in\mathbb R,\ a=?"#,
            answer: "a≤4",
            difficulty: 0.58,
            averageTime: 110,
            hints: ["恒成立⟺a≤左边最小值", "左边最小值=|1-(-3)|=4"],
            standardSteps: [
                ineqsStep(1, "左边最小值", #"\min(|x-1|+|x+3|)=|1-(-3)|=4"#),
                ineqsStep(2, "恒成立条件", #"a\le\text{最小值}=4"#)
            ],
            shortcutSteps: [
                ineqsStep(1, "最小值卡参秒杀", #"a\le4"#)
            ],
            keyInsight: "f(x)≥a恒成立⟺a≤f(x)的最小值。",
            shortcutInsight: "和式绝对值最小值=两定点间距, 直接给a上界。",
            weapon: "恒成立转最值",
            timeRatio: 2.0,
            tags: ["不等式选讲", "绝对值", "恒成立", "压轴", "核心"]
        ),

        ineqsProblem(
            id: "ineqs_006",
            type: .calculation,
            tier: 5,
            formulaIds: ["absolute_inequality", "parameter", "existence"],
            content: "若存在实数 x 使 |x-2|-|x+1|≥a 成立, 求 a 的取值范围。",
            contentLatex: #"\exists x:\ |x-2|-|x+1|\ge a,\ a=?"#,
            answer: "a≤3",
            difficulty: 0.62,
            averageTime: 120,
            hints: ["存在⟺a≤左边最大值", "差式最大值=|2-(-1)|=3"],
            standardSteps: [
                ineqsStep(1, "左边最大值", #"\max(|x-2|-|x+1|)=|2-(-1)|=3"#),
                ineqsStep(2, "存在条件", #"a\le\text{最大值}=3"#)
            ],
            shortcutSteps: [
                ineqsStep(1, "存在性取最大秒杀", #"a\le3"#)
            ],
            keyInsight: "存在x使f(x)≥a⟺a≤f(x)的最大值(与恒成立相反)。",
            shortcutInsight: "差式绝对值最大值=两定点间距, 给a上界。",
            weapon: "存在性转最值",
            timeRatio: 2.0,
            tags: ["不等式选讲", "绝对值", "存在性", "压轴"]
        ),

        ineqsProblem(
            id: "ineqs_007",
            type: .calculation,
            tier: 4,
            formulaIds: ["absolute_inequality"],
            content: "解不等式 |x+1|<|x-3|。",
            contentLatex: #"|x+1|<|x-3|"#,
            answer: "x<1",
            difficulty: 0.50,
            averageTime: 90,
            hints: ["两边非负可平方", "(x+1)²<(x-3)²", "或几何:离-1更近"],
            standardSteps: [
                ineqsStep(1, "平方", #"(x+1)^2<(x-3)^2"#),
                ineqsStep(2, "展开", #"x^2+2x+1<x^2-6x+9"#),
                ineqsStep(3, "解", #"8x<8\Rightarrow x<1"#)
            ],
            shortcutSteps: [
                ineqsStep(1, "几何意义秒杀", #"\text{到}-1\text{比到}3\text{近}\Rightarrow x<\frac{-1+3}{2}=1"#)
            ],
            keyInsight: "两个绝对值比大小可平方去绝对值。",
            shortcutInsight: "几何上离哪个点更近, 以中点为界。",
            weapon: "平方法/几何意义",
            timeRatio: 2.0,
            tags: ["不等式选讲", "绝对值", "必考"]
        ),

        ineqsProblem(
            id: "ineqs_008",
            type: .proof,
            tier: 5,
            formulaIds: ["cauchy_schwarz"],
            content: "已知 a,b,c>0 且 a+b+c=1, 用柯西不等式证明 a²+b²+c²≥1/3。",
            contentLatex: #"a+b+c=1,\ a,b,c>0:\ a^2+b^2+c^2\ge\frac13"#,
            answer: "a²+b²+c²≥1/3成立，当a=b=c=1/3时取等",
            difficulty: 0.56,
            averageTime: 110,
            hints: ["柯西(a²+b²+c²)(1+1+1)≥(a+b+c)²", "代入约束"],
            standardSteps: [
                ineqsStep(1, "柯西不等式", #"(a^2+b^2+c^2)(1^2+1^2+1^2)\ge(a+b+c)^2"#),
                ineqsStep(2, "代入", #"3(a^2+b^2+c^2)\ge1"#),
                ineqsStep(3, "结论", #"a^2+b^2+c^2\ge\frac13,\ a=b=c=\frac13\text{取等}"#)
            ],
            shortcutSteps: [
                ineqsStep(1, "二次幂平均秒杀", #"a^2+b^2+c^2\ge\frac{(a+b+c)^2}{3}=\frac13"#)
            ],
            keyInsight: "平方和的下界由柯西不等式给出。",
            shortcutInsight: "Σxᵢ²≥(Σxᵢ)²/n是柯西直接推论。",
            weapon: "柯西不等式",
            timeRatio: 2.2,
            tags: ["不等式选讲", "柯西", "证明", "核心"]
        ),

        ineqsProblem(
            id: "ineqs_009",
            type: .proof,
            tier: 5,
            formulaIds: ["am_gm", "comparison_method"],
            content: "已知 a,b>0, 用比较法证明 a³+b³≥a²b+ab²。",
            contentLatex: #"a,b>0:\ a^3+b^3\ge a^2b+ab^2"#,
            answer: "a³+b³≥a²b+ab²成立，当a=b时取等",
            difficulty: 0.54,
            averageTime: 100,
            hints: ["作差", "a³+b³-a²b-ab²", "因式分解"],
            standardSteps: [
                ineqsStep(1, "作差", #"a^3+b^3-a^2b-ab^2=a^2(a-b)-b^2(a-b)"#),
                ineqsStep(2, "因式分解", #"=(a-b)(a^2-b^2)=(a-b)^2(a+b)"#),
                ineqsStep(3, "判号", #"(a-b)^2(a+b)\ge0\Rightarrow a^3+b^3\ge a^2b+ab^2"#)
            ],
            shortcutSteps: [
                ineqsStep(1, "完全平方因式秒杀", #"\text{差}=(a-b)^2(a+b)\ge0"#)
            ],
            keyInsight: "比较法证明:作差→因式分解→判断符号。",
            shortcutInsight: "差能写成(a-b)²(a+b)显然非负, a=b取等。",
            weapon: "比较法(作差)",
            timeRatio: 2.0,
            tags: ["不等式选讲", "比较法", "证明", "必考"]
        ),

        ineqsProblem(
            id: "ineqs_010",
            type: .calculation,
            tier: 5,
            formulaIds: ["absolute_inequality", "parameter"],
            content: "若关于 x 的不等式 |x-a|≤2 的解集为 [-1,3], 求 a。",
            contentLatex: #"|x-a|\le2\ \text{解集}[-1,3],\ a=?"#,
            answer: "1",
            difficulty: 0.44,
            averageTime: 80,
            hints: ["|x-a|≤2⟺a-2≤x≤a+2", "对应区间端点"],
            standardSteps: [
                ineqsStep(1, "解集形式", #"a-2\le x\le a+2"#),
                ineqsStep(2, "对应端点", #"a-2=-1\Rightarrow a=1\ (\text{且}a+2=3\text{一致})"#),
                ineqsStep(3, "结论", #"a=1"#)
            ],
            shortcutSteps: [
                ineqsStep(1, "区间中点秒杀", #"a=\text{区间中点}=\frac{-1+3}{2}=1"#)
            ],
            keyInsight: "|x-a|≤2的解集是以a为中心、半径2的对称区间。",
            shortcutInsight: "a即解集区间的中点。",
            weapon: "绝对值解集对称性",
            timeRatio: 1.8,
            tags: ["不等式选讲", "绝对值", "含参", "必考"]
        ),

        ineqsProblem(
            id: "ineqs_011",
            type: .proof,
            tier: 5,
            formulaIds: ["cauchy_schwarz"],
            content: "已知 x,y,z>0 且 x+y+z=1, 用柯西不等式证明 1/x+1/y+1/z≥9。",
            contentLatex: #"x+y+z=1,\ x,y,z>0:\ \frac1x+\frac1y+\frac1z\ge9"#,
            answer: "1/x+1/y+1/z≥9成立，当x=y=z=1/3时取等",
            difficulty: 0.58,
            averageTime: 110,
            hints: ["柯西(Σ1/x)(Σx)≥9", "代入约束"],
            standardSteps: [
                ineqsStep(1, "柯西不等式", #"\left(\frac1x+\frac1y+\frac1z\right)(x+y+z)\ge(1+1+1)^2=9"#),
                ineqsStep(2, "代入", #"\frac1x+\frac1y+\frac1z\ge9"#),
                ineqsStep(3, "取等", #"x=y=z=\frac13"#)
            ],
            shortcutSteps: [
                ineqsStep(1, "权方和秒杀", #"\sum\frac1x\ge\frac{(1+1+1)^2}{x+y+z}=9"#)
            ],
            keyInsight: "倒数和的下界由柯西/权方和与约束相乘得到。",
            shortcutInsight: "权方和Σ1/xᵢ≥n²/Σxᵢ一步出。",
            weapon: "柯西/权方和",
            timeRatio: 2.2,
            tags: ["不等式选讲", "柯西", "权方和", "证明"]
        ),

        ineqsProblem(
            id: "ineqs_012",
            type: .calculation,
            tier: 5,
            formulaIds: ["absolute_inequality", "parameter", "subset"],
            content: "若不等式 |x-1|<a 的解集是 |x-2|<3 的解集的子集, 求正数 a 的取值范围。",
            contentLatex: #"\{|x-1|<a\}\subseteq\{|x-2|<3\},\ a>0,\ a=?"#,
            answer: "0<a≤2",
            difficulty: 0.66,
            averageTime: 140,
            hints: ["前者解集(1-a,1+a)", "后者解集(-1,5)", "子集要求端点"],
            standardSteps: [
                ineqsStep(1, "两解集", #"A=(1-a,1+a),\ B=(-1,5)"#),
                ineqsStep(2, "A⊆B条件", #"1-a\ge-1\ \text{且}\ 1+a\le5"#),
                ineqsStep(3, "解", #"a\le2\ \text{且}\ a\le4\Rightarrow a\le2"#),
                ineqsStep(4, "结论", #"0<a\le2"#)
            ],
            shortcutSteps: [
                ineqsStep(1, "端点包含秒杀", #"\begin{cases}1-a\ge-1\\1+a\le5\end{cases}\Rightarrow0<a\le2"#)
            ],
            keyInsight: "区间子集关系转化为左右端点的不等式约束。",
            shortcutInsight: "A的左端≥B左端、A右端≤B右端, 取交集。",
            weapon: "区间包含端点法",
            timeRatio: 2.2,
            tags: ["不等式选讲", "绝对值", "含参", "子集", "压轴"]
        )
    ]

    // MARK: - 工厂方法
    private static func ineqsStep(_ order: Int, _ description: String, _ latex: String, _ annotation: String = "") -> SolutionStep {
        SolutionStep(order: order, description: description, latex: latex, annotation: annotation)
    }

    private static func ineqsProblem(
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
        commonMistakes: [String] = ["分段时漏掉端点或区间", "恒成立取最小、存在取最大易混", "绝对值平方时未确认两边非负"]
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
