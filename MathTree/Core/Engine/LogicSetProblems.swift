import Foundation

// MARK: - 集合与常用逻辑用语专题
// 目标: 覆盖集合运算、子集、充分必要条件、全称特称命题及其否定、逻辑联结词。
// 高考第1-2题必考, 重在概念精准与数轴/韦恩图工具。

extension SampleData {
    static let logicSetProblems: [Problem] = [
        logicProblem(
            id: "set_001",
            type: .fillInBlank,
            tier: 2,
            formulaIds: ["set_operation"],
            content: "已知 A={x|-1<x≤3}, B={x|x≥2}, 求 A∩B 与 A∪B。",
            contentLatex: #"A=\{x|-1<x\le3\},\ B=\{x|x\ge2\}"#,
            answer: "A∩B={x|2≤x≤3}, A∪B={x|x>-1}",
            difficulty: 0.36,
            averageTime: 80,
            hints: ["画数轴", "交集取重叠部分", "并集取覆盖范围"],
            standardSteps: [
                logicStep(1, "交集", #"A\cap B=\{x|2\le x\le3\}"#),
                logicStep(2, "并集", #"A\cup B=\{x|x>-1\}"#)
            ],
            shortcutSteps: [
                logicStep(1, "数轴秒杀", #"\text{交=重叠}[2,3],\ \text{并=}(-1,+\infty)"#)
            ],
            keyInsight: "区间型集合运算用数轴最直观,注意端点开闭。",
            shortcutInsight: "数轴上交取公共段、并取总覆盖,端点逐一核对。",
            weapon: "数轴法",
            timeRatio: 1.8,
            tags: ["集合", "集合运算", "必考", "核心"]
        ),

        logicProblem(
            id: "set_002",
            type: .fillInBlank,
            tier: 2,
            formulaIds: ["subset"],
            content: "集合 M={1,2,3} 的子集个数与真子集个数分别为？",
            contentLatex: #"M=\{1,2,3\},\ \text{子集数,真子集数}?"#,
            answer: "子集8个，真子集7个",
            difficulty: 0.32,
            averageTime: 60,
            hints: ["n元集合有2ⁿ个子集", "真子集=2ⁿ-1"],
            standardSteps: [
                logicStep(1, "子集数", #"2^3=8"#),
                logicStep(2, "真子集数", #"2^3-1=7"#)
            ],
            shortcutSteps: [
                logicStep(1, "幂公式秒杀", #"2^n=8,\ 2^n-1=7"#)
            ],
            keyInsight: "n元集合子集数2ⁿ、真子集2ⁿ-1、非空真子集2ⁿ-2。",
            shortcutInsight: "直接套2ⁿ系列公式。",
            weapon: "子集计数公式",
            timeRatio: 1.5,
            tags: ["集合", "子集", "必考"]
        ),

        logicProblem(
            id: "set_003",
            type: .multipleChoice,
            tier: 3,
            formulaIds: ["sufficient_necessary"],
            content: "\"x>2\" 是 \"x>1\" 的什么条件？",
            contentLatex: #"\text{“}x>2\text{”是“}x>1\text{”的(?)条件}"#,
            options: ["充分不必要", "必要不充分", "充要", "既不充分也不必要"],
            answer: "充分不必要",
            difficulty: 0.44,
            averageTime: 80,
            hints: ["小范围推大范围", "x>2⇒x>1成立", "反之不成立"],
            standardSteps: [
                logicStep(1, "正向", #"x>2\Rightarrow x>1\text{(成立),充分}"#),
                logicStep(2, "反向", #"x>1\not\Rightarrow x>2\text{(如1.5),不必要}"#),
                logicStep(3, "结论", #"\text{充分不必要条件}"#)
            ],
            shortcutSteps: [
                logicStep(1, "小推大秒杀", #"\{x>2\}\subsetneq\{x>1\}\Rightarrow\text{充分不必要}"#)
            ],
            keyInsight: "集合角度:A⊊B则A是B的充分不必要条件(小范围推大范围)。",
            shortcutInsight: "记口诀'小充分、大必要',子集是充分条件。",
            weapon: "集合包含判条件",
            timeRatio: 1.8,
            tags: ["逻辑", "充分必要", "必考", "核心"]
        ),

        logicProblem(
            id: "set_004",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["proposition_negation"],
            content: "写出命题 \"∀x∈R, x²+1>0\" 的否定。",
            contentLatex: #"\text{否定}\ \forall x\in\mathbb R,\ x^2+1>0"#,
            answer: "∃x∈R, x²+1≤0",
            difficulty: 0.42,
            averageTime: 70,
            hints: ["全称命题否定为特称", "∀变∃", ">的否定是≤"],
            standardSteps: [
                logicStep(1, "量词变换", #"\forall\to\exists"#),
                logicStep(2, "结论否定", #">\ \to\ \le"#),
                logicStep(3, "写出", #"\exists x\in\mathbb R,\ x^2+1\le0"#)
            ],
            shortcutSteps: [
                logicStep(1, "改量词+否结论秒杀", #"\exists x\in\mathbb R,\ x^2+1\le0"#)
            ],
            keyInsight: "全称命题的否定是特称命题:换量词且否定结论。",
            shortcutInsight: "∀↔∃同时把后面的不等号取反。",
            weapon: "量词命题否定",
            timeRatio: 1.7,
            tags: ["逻辑", "全称特称", "命题否定", "必考"]
        ),

        logicProblem(
            id: "set_005",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["set_operation", "complement"],
            content: "全集 U={1,2,3,4,5}, A={1,3,5}, B={2,3}, 求 (∁ᵤA)∩B。",
            contentLatex: #"U=\{1,2,3,4,5\},A=\{1,3,5\},B=\{2,3\},\ (\complement_U A)\cap B=?"#,
            answer: "{2}",
            difficulty: 0.40,
            averageTime: 80,
            hints: ["先求补集", "∁ᵤA={2,4}", "再与B交"],
            standardSteps: [
                logicStep(1, "补集", #"\complement_U A=\{2,4\}"#),
                logicStep(2, "交集", #"\{2,4\}\cap\{2,3\}=\{2\}"#)
            ],
            shortcutSteps: [
                logicStep(1, "补后取交秒杀", #"\{2,4\}\cap\{2,3\}=\{2\}"#)
            ],
            keyInsight: "补集是全集中不属于A的元素,再做后续运算。",
            shortcutInsight: "先列补集再交,逐元素核对。",
            weapon: "补集与交集",
            timeRatio: 1.6,
            tags: ["集合", "补集", "集合运算", "必考"]
        ),

        logicProblem(
            id: "set_006",
            type: .calculation,
            tier: 4,
            formulaIds: ["set_parameter", "empty_set"],
            content: "已知 A={x|1≤x≤2}, B={x|x≤a}, 若 A⊆B, 求 a 的取值范围。",
            contentLatex: #"A=\{x|1\le x\le2\},B=\{x|x\le a\},\ A\subseteq B,\ a=?"#,
            answer: "a≥2",
            difficulty: 0.50,
            averageTime: 100,
            hints: ["A的所有元素都在B中", "A的最大值2必须≤a", "画数轴"],
            standardSteps: [
                logicStep(1, "包含条件", #"A\subseteq B\Rightarrow A\text{中最大元}2\le a"#),
                logicStep(2, "结论", #"a\ge2"#)
            ],
            shortcutSteps: [
                logicStep(1, "右端点比较秒杀", #"A\subseteq B\Rightarrow a\ge\max A=2"#)
            ],
            keyInsight: "集合包含转化为边界点的不等关系,数轴确认。",
            shortcutInsight: "A⊆{x≤a}要求a不小于A的上确界2。",
            weapon: "包含关系数轴法",
            timeRatio: 1.9,
            tags: ["集合", "含参集合", "子集", "必考", "核心"]
        ),

        logicProblem(
            id: "set_007",
            type: .multipleChoice,
            tier: 3,
            formulaIds: ["logical_connective"],
            content: "若命题 p 为真, q 为假, 则下列命题中为真的是？",
            contentLatex: #"p\text{真},q\text{假},\ \text{下列为真的是}?"#,
            options: ["p∧q", "p∨q", "¬p", "¬p∧q"],
            answer: "p∨q",
            difficulty: 0.42,
            averageTime: 80,
            hints: ["且:全真才真", "或:有真即真", "非:取反"],
            standardSteps: [
                logicStep(1, "p∧q", #"\text{真}\wedge\text{假}=\text{假}"#),
                logicStep(2, "p∨q", #"\text{真}\vee\text{假}=\text{真}✓"#),
                logicStep(3, "¬p", #"\neg\text{真}=\text{假}"#)
            ],
            shortcutSteps: [
                logicStep(1, "真值表秒杀", #"\text{或:一真则真}\Rightarrow p\vee q\text{真}"#)
            ],
            keyInsight: "联结词真值:∧全真才真、∨有真则真、¬取反。",
            shortcutInsight: "p∨q只要有一个真即为真。",
            weapon: "逻辑联结词真值",
            timeRatio: 1.7,
            tags: ["逻辑", "联结词", "真值", "必考"]
        ),

        logicProblem(
            id: "set_008",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["set_operation", "inequality"],
            content: "已知 A={x|x²-3x+2≤0}, B={x|x²-1>0}, 求 A∩B。",
            contentLatex: #"A=\{x|x^2-3x+2\le0\},B=\{x|x^2-1>0\}"#,
            answer: "{x|1<x≤2}",
            difficulty: 0.54,
            averageTime: 110,
            hints: ["先解两个不等式", "A=[1,2]", "B=(-∞,-1)∪(1,∞)"],
            standardSteps: [
                logicStep(1, "解A", #"x^2-3x+2\le0\Rightarrow1\le x\le2"#),
                logicStep(2, "解B", #"x^2-1>0\Rightarrow x<-1\text{或}x>1"#),
                logicStep(3, "交集", #"A\cap B=\{x|1<x\le2\}"#)
            ],
            shortcutSteps: [
                logicStep(1, "解集求交秒杀", #"[1,2]\cap((-\infty,-1)\cup(1,\infty))=(1,2]"#)
            ],
            keyInsight: "集合由不等式定义时,先求各自解集再做集合运算。",
            shortcutInsight: "在数轴上画出两解集,取重叠且注意端点1开2闭。",
            weapon: "解不等式+数轴交集",
            timeRatio: 2.0,
            tags: ["集合", "不等式", "集合运算", "压轴", "核心"]
        ),

        logicProblem(
            id: "set_009",
            type: .multipleChoice,
            tier: 4,
            formulaIds: ["sufficient_necessary", "set"],
            content: "设集合 A={x|x>1}, B={x|x>a}, 若 \"x∈A\" 是 \"x∈B\" 的充分不必要条件, 求 a 的范围。",
            contentLatex: #"A=\{x>1\},B=\{x>a\},\ x\in A\text{是}x\in B\text{的充分不必要}"#,
            options: ["a<1", "a≤1", "a>1", "a≥1"],
            answer: "a<1",
            difficulty: 0.58,
            averageTime: 110,
            hints: ["充分不必要⟺A⊊B", "A真包含于B", "1≥a且不相等"],
            standardSteps: [
                logicStep(1, "条件转包含", #"\text{充分不必要}\Rightarrow A\subsetneq B"#),
                logicStep(2, "包含关系", #"\{x>1\}\subsetneq\{x>a\}\Rightarrow a<1"#),
                logicStep(3, "结论", #"a<1"#)
            ],
            shortcutSteps: [
                logicStep(1, "真包含秒杀", #"A\subsetneq B\Rightarrow a<1"#)
            ],
            keyInsight: "充分不必要条件等价于条件集真包含于结论集。",
            shortcutInsight: "A⊊B要求B的左端点a严格小于A的左端点1。",
            weapon: "充要条件的集合刻画",
            timeRatio: 2.0,
            tags: ["逻辑", "充分必要", "含参", "压轴"]
        ),

        logicProblem(
            id: "set_010",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["set_parameter", "empty_set"],
            content: "已知 A={x|x²-2x-3=0}, B={x|ax-1=0}, 若 B⊆A, 求实数 a 的所有可能值。",
            contentLatex: #"A=\{x|x^2-2x-3=0\},B=\{x|ax-1=0\},\ B\subseteq A"#,
            answer: "a∈{0, -1, 1/3}",
            difficulty: 0.66,
            averageTime: 140,
            hints: ["A={-1,3}", "B⊆A含B=∅情形", "a=0时B=∅"],
            standardSteps: [
                logicStep(1, "求A", #"x^2-2x-3=0\Rightarrow A=\{-1,3\}"#),
                logicStep(2, "B为空", #"a=0\text{时}B=\varnothing\subseteq A✓"#),
                logicStep(3, "B非空", #"a\ne0:\ x=\frac1a\in A\Rightarrow\frac1a=-1\text{或}3"#),
                logicStep(4, "解a", #"a=-1\text{或}a=\frac13"#),
                logicStep(5, "汇总", #"a\in\left\{0,-1,\frac13\right\}"#)
            ],
            shortcutSteps: [
                logicStep(1, "勿漏空集秒杀", #"B=\varnothing(a=0)\text{也满足}B\subseteq A"#),
                logicStep(2, "非空代入", #"\frac1a\in\{-1,3\}\Rightarrow a=-1,\tfrac13"#)
            ],
            keyInsight: "B⊆A的含参问题必须讨论B为空集的情形(空集是任何集合子集)。",
            shortcutInsight: "先放a=0得空集解,再让1/a落入A求其余解。",
            weapon: "空集讨论",
            timeRatio: 2.2,
            tags: ["集合", "含参集合", "空集", "压轴", "核心"]
        ),

        logicProblem(
            id: "set_011",
            type: .multipleChoice,
            tier: 3,
            formulaIds: ["proposition", "converse"],
            content: "命题 \"若 x=1, 则 x²=1\" 的逆否命题是？",
            contentLatex: #"\text{原命题:若}x=1\text{则}x^2=1"#,
            options: ["若x²≠1,则x≠1", "若x²=1,则x=1", "若x≠1,则x²≠1", "若x=1,则x²≠1"],
            answer: "若x²≠1,则x≠1",
            difficulty: 0.44,
            averageTime: 80,
            hints: ["逆否=否定条件结论并互换", "条件结论都取反再交换"],
            standardSteps: [
                logicStep(1, "逆否规则", #"\text{原:}p\to q,\ \text{逆否:}\neg q\to\neg p"#),
                logicStep(2, "写出", #"\text{若}x^2\ne1,\text{则}x\ne1"#)
            ],
            shortcutSteps: [
                logicStep(1, "否定+交换秒杀", #"\neg q\to\neg p:\ x^2\ne1\Rightarrow x\ne1"#)
            ],
            keyInsight: "逆否命题=对条件和结论同时否定并互换位置。",
            shortcutInsight: "原命题与逆否命题真假一致,可用于反证。",
            weapon: "四种命题关系",
            timeRatio: 1.8,
            tags: ["逻辑", "四种命题", "逆否", "必考"]
        ),

        logicProblem(
            id: "set_012",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["existential_proposition", "parameter"],
            content: "若命题 \"∃x∈R, x²+2x+a=0\" 为真, 求实数 a 的取值范围。",
            contentLatex: #"\exists x\in\mathbb R,\ x^2+2x+a=0\ \text{为真},\ a=?"#,
            answer: "a≤1",
            difficulty: 0.52,
            averageTime: 100,
            hints: ["特称为真即方程有实根", "判别式Δ≥0", "4-4a≥0"],
            standardSteps: [
                logicStep(1, "存在实根", #"\text{方程有解}\Rightarrow\Delta\ge0"#),
                logicStep(2, "判别式", #"\Delta=4-4a\ge0"#),
                logicStep(3, "结论", #"a\le1"#)
            ],
            shortcutSteps: [
                logicStep(1, "判别式秒杀", #"\Delta=4-4a\ge0\Rightarrow a\le1"#)
            ],
            keyInsight: "特称命题为真⟺存在性成立,二次方程转化为Δ≥0。",
            shortcutInsight: "'存在x使方程=0'即方程有实根,直接Δ≥0。",
            weapon: "特称命题+判别式",
            timeRatio: 1.9,
            tags: ["逻辑", "特称命题", "判别式", "参数", "必考"]
        )
    ]

    // MARK: - 工厂方法
    private static func logicStep(_ order: Int, _ description: String, _ latex: String, _ annotation: String = "") -> SolutionStep {
        SolutionStep(order: order, description: description, latex: latex, annotation: annotation)
    }

    private static func logicProblem(
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
        commonMistakes: [String] = ["含参集合忘记讨论空集", "充分必要方向判反", "区间端点开闭搞错", "全称否定漏改量词"]
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
