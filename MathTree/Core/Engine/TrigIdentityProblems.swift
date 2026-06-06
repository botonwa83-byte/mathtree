import Foundation

// MARK: - 三角恒等变换补充专题 (12道, 填补半角/积化和差/和差化积/降幂缺口)
// 原则: 答案确定、步骤闭合。LaTeX 用 raw string。

extension SampleData {
    static let trigIdentityProblems: [Problem] = [
        tiProblem(
            id: "ti_001",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["half_angle", "cos_half_angle"],
            content: "已知cosα=3/5，α∈(0,π/2)，求cos(α/2)。",
            contentLatex: #"\cos\alpha=\frac35,\ \alpha\in(0,\tfrac\pi2),\ \cos\frac\alpha2=?"#,
            answer: "2√5/5",
            difficulty: 0.46,
            averageTime: 90,
            hints: ["半角公式cos(α/2)=√((1+cosα)/2)", "α/2在第一象限取正"],
            standardSteps: [
                tiStep(1, "半角公式", #"\cos\frac\alpha2=\sqrt{\frac{1+\cos\alpha}{2}}"#),
                tiStep(2, "代入", #"=\sqrt{\frac{1+3/5}{2}}=\sqrt{\frac{4}{5}}=\frac{2\sqrt5}{5}"#)
            ],
            shortcutSteps: [
                tiStep(1, "半角直代秒杀", #"\cos\frac\alpha2=\sqrt{\frac{1+3/5}{2}}=\frac{2\sqrt5}{5}"#)
            ],
            keyInsight: "半角余弦由1+cosα决定，符号看α/2所在象限。",
            shortcutInsight: "α∈(0,π/2)⟹α/2∈(0,π/4)，余弦取正。",
            weapon: "余弦半角公式",
            timeRatio: 2.0,
            tags: ["三角", "半角公式", "高考", "核心"]
        ),

        tiProblem(
            id: "ti_002",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["half_angle"],
            content: "已知cosα=3/5，α∈(0,π/2)，求sin(α/2)。",
            contentLatex: #"\cos\alpha=\frac35,\ \alpha\in(0,\tfrac\pi2),\ \sin\frac\alpha2=?"#,
            answer: "√5/5",
            difficulty: 0.46,
            averageTime: 90,
            hints: ["sin(α/2)=√((1-cosα)/2)"],
            standardSteps: [
                tiStep(1, "半角公式", #"\sin\frac\alpha2=\sqrt{\frac{1-\cos\alpha}{2}}"#),
                tiStep(2, "代入", #"=\sqrt{\frac{1-3/5}{2}}=\sqrt{\frac15}=\frac{\sqrt5}{5}"#)
            ],
            shortcutSteps: [
                tiStep(1, "半角直代秒杀", #"\sin\frac\alpha2=\sqrt{\frac15}=\frac{\sqrt5}{5}"#)
            ],
            keyInsight: "半角正弦由1-cosα决定。",
            shortcutInsight: "α/2在第一象限取正根。",
            weapon: "正弦半角公式",
            timeRatio: 2.0,
            tags: ["三角", "半角公式", "高考"]
        ),

        tiProblem(
            id: "ti_003",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["tan_half_angle"],
            content: "已知cosα=3/5，α∈(0,π/2)，求tan(α/2)。",
            contentLatex: #"\cos\alpha=\frac35,\ \alpha\in(0,\tfrac\pi2),\ \tan\frac\alpha2=?"#,
            answer: "1/2",
            difficulty: 0.48,
            averageTime: 90,
            hints: ["tan(α/2)=sinα/(1+cosα)", "sinα=4/5"],
            standardSteps: [
                tiStep(1, "求sinα", #"\sin\alpha=\sqrt{1-\tfrac{9}{25}}=\frac45\ (\alpha\in(0,\tfrac\pi2))"#),
                tiStep(2, "万能公式", #"\tan\frac\alpha2=\frac{\sin\alpha}{1+\cos\alpha}=\frac{4/5}{1+3/5}=\frac{4/5}{8/5}=\frac12"#)
            ],
            shortcutSteps: [
                tiStep(1, "半角正切秒杀", #"\tan\frac\alpha2=\frac{\sin\alpha}{1+\cos\alpha}=\frac12"#)
            ],
            keyInsight: "tan(α/2)=sinα/(1+cosα)=(1-cosα)/sinα，避免分别求半角正余弦。",
            shortcutInsight: "用sinα/(1+cosα)一步出，无需开方。",
            weapon: "半角正切公式",
            timeRatio: 2.2,
            tags: ["三角", "半角公式", "高考", "核心"]
        ),

        tiProblem(
            id: "ti_004",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["product_to_sum"],
            content: "求 sin75°·cos15° 的值。",
            contentLatex: #"\sin75^\circ\cos15^\circ=?"#,
            answer: "(2+√3)/4",
            difficulty: 0.48,
            averageTime: 90,
            hints: ["积化和差 sinAcosB=½[sin(A+B)+sin(A-B)]"],
            standardSteps: [
                tiStep(1, "积化和差", #"\sin75^\circ\cos15^\circ=\frac12[\sin90^\circ+\sin60^\circ]"#),
                tiStep(2, "求值", #"=\frac12\left[1+\frac{\sqrt3}{2}\right]=\frac{2+\sqrt3}{4}"#)
            ],
            shortcutSteps: [
                tiStep(1, "积化和差秒杀", #"=\frac12(\sin90^\circ+\sin60^\circ)=\frac{2+\sqrt3}{4}"#)
            ],
            keyInsight: "积化和差把乘积化为和，便于代入特殊角。",
            shortcutInsight: "sinAcosB=½[sin(A+B)+sin(A-B)]。",
            weapon: "积化和差公式",
            timeRatio: 2.0,
            tags: ["三角", "积化和差", "高考", "核心"]
        ),

        tiProblem(
            id: "ti_005",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["sum_to_product"],
            content: "求 sin75° + sin15° 的值。",
            contentLatex: #"\sin75^\circ+\sin15^\circ=?"#,
            answer: "√6/2",
            difficulty: 0.48,
            averageTime: 90,
            hints: ["和差化积 sinA+sinB=2sin((A+B)/2)cos((A-B)/2)"],
            standardSteps: [
                tiStep(1, "和差化积", #"\sin75^\circ+\sin15^\circ=2\sin45^\circ\cos30^\circ"#),
                tiStep(2, "求值", #"=2\cdot\frac{\sqrt2}{2}\cdot\frac{\sqrt3}{2}=\frac{\sqrt6}{2}"#)
            ],
            shortcutSteps: [
                tiStep(1, "和差化积秒杀", #"=2\sin45^\circ\cos30^\circ=\frac{\sqrt6}{2}"#)
            ],
            keyInsight: "和差化积把和化为积，露出特殊角。",
            shortcutInsight: "sinA+sinB=2sin(半和)cos(半差)。",
            weapon: "和差化积公式",
            timeRatio: 2.0,
            tags: ["三角", "和差化积", "高考", "核心"]
        ),

        tiProblem(
            id: "ti_006",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["sum_to_product"],
            content: "求 cos75° - cos15° 的值。",
            contentLatex: #"\cos75^\circ-\cos15^\circ=?"#,
            answer: "-√2/2",
            difficulty: 0.50,
            averageTime: 90,
            hints: ["cosA-cosB=-2sin((A+B)/2)sin((A-B)/2)"],
            standardSteps: [
                tiStep(1, "和差化积", #"\cos75^\circ-\cos15^\circ=-2\sin45^\circ\sin30^\circ"#),
                tiStep(2, "求值", #"=-2\cdot\frac{\sqrt2}{2}\cdot\frac12=-\frac{\sqrt2}{2}"#)
            ],
            shortcutSteps: [
                tiStep(1, "和差化积秒杀", #"=-2\sin45^\circ\sin30^\circ=-\frac{\sqrt2}{2}"#)
            ],
            keyInsight: "余弦差化积带负号：cosA-cosB=-2sin(半和)sin(半差)。",
            shortcutInsight: "注意前面的负号。",
            weapon: "和差化积公式",
            timeRatio: 2.0,
            tags: ["三角", "和差化积", "高考"]
        ),

        tiProblem(
            id: "ti_007",
            type: .fillInBlank,
            tier: 2,
            formulaIds: ["cos_double"],
            content: "求 2cos²15° - 1 的值。",
            contentLatex: #"2\cos^2 15^\circ-1=?"#,
            answer: "√3/2",
            difficulty: 0.36,
            averageTime: 60,
            hints: ["二倍角 2cos²θ-1=cos2θ"],
            standardSteps: [
                tiStep(1, "降幂/倍角", #"2\cos^2 15^\circ-1=\cos30^\circ=\frac{\sqrt3}{2}"#)
            ],
            shortcutSteps: [
                tiStep(1, "倍角逆用秒杀", #"=\cos(2\times15^\circ)=\cos30^\circ=\frac{\sqrt3}{2}"#)
            ],
            keyInsight: "2cos²θ-1=cos2θ是二倍角的逆用(降幂)。",
            shortcutInsight: "直接识别为cos30°。",
            weapon: "二倍角降幂",
            timeRatio: 1.6,
            tags: ["三角", "降幂", "二倍角", "高考"]
        ),

        tiProblem(
            id: "ti_008",
            type: .fillInBlank,
            tier: 2,
            formulaIds: ["sin_sub"],
            content: "求 sin15° 的值。",
            contentLatex: #"\sin15^\circ=?"#,
            answer: "(√6-√2)/4",
            difficulty: 0.40,
            averageTime: 70,
            hints: ["15°=45°-30°", "差角公式"],
            standardSteps: [
                tiStep(1, "拆角", #"\sin15^\circ=\sin(45^\circ-30^\circ)"#),
                tiStep(2, "差角公式", #"=\sin45\cos30-\cos45\sin30=\frac{\sqrt2}{2}\cdot\frac{\sqrt3}{2}-\frac{\sqrt2}{2}\cdot\frac12=\frac{\sqrt6-\sqrt2}{4}"#)
            ],
            shortcutSteps: [
                tiStep(1, "差角秒杀", #"\sin(45^\circ-30^\circ)=\frac{\sqrt6-\sqrt2}{4}"#)
            ],
            keyInsight: "非特殊角拆成两特殊角之差，用差角公式。",
            shortcutInsight: "15°=45°-30°。",
            weapon: "正弦差角公式",
            timeRatio: 1.8,
            tags: ["三角", "差角公式", "高考", "核心"]
        ),

        tiProblem(
            id: "ti_009",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["tan_half_angle"],
            content: "已知cosθ=-3/5，θ∈(π/2,π)，求tan(θ/2)。",
            contentLatex: #"\cos\theta=-\frac35,\ \theta\in(\tfrac\pi2,\pi),\ \tan\frac\theta2=?"#,
            answer: "2",
            difficulty: 0.56,
            averageTime: 110,
            hints: ["sinθ=4/5(第二象限)", "tan(θ/2)=sinθ/(1+cosθ)"],
            standardSteps: [
                tiStep(1, "求sinθ", #"\theta\in(\tfrac\pi2,\pi)\Rightarrow\sin\theta=\sqrt{1-\tfrac{9}{25}}=\frac45"#),
                tiStep(2, "半角正切", #"\tan\frac\theta2=\frac{\sin\theta}{1+\cos\theta}=\frac{4/5}{1-3/5}=\frac{4/5}{2/5}=2"#)
            ],
            shortcutSteps: [
                tiStep(1, "半角正切秒杀", #"\tan\frac\theta2=\frac{\sin\theta}{1+\cos\theta}=2"#)
            ],
            keyInsight: "用万能公式tan(θ/2)=sinθ/(1+cosθ)避免象限讨论开方。",
            shortcutInsight: "θ/2∈(π/4,π/2)正切为正，结果2。",
            weapon: "半角正切公式",
            timeRatio: 2.2,
            tags: ["三角", "半角公式", "高考", "压轴"]
        ),

        tiProblem(
            id: "ti_010",
            type: .fillInBlank,
            tier: 2,
            formulaIds: ["sin_double"],
            content: "求 2sin15°cos15° 的值。",
            contentLatex: #"2\sin15^\circ\cos15^\circ=?"#,
            answer: "1/2",
            difficulty: 0.34,
            averageTime: 50,
            hints: ["二倍角 2sinθcosθ=sin2θ"],
            standardSteps: [
                tiStep(1, "二倍角", #"2\sin15^\circ\cos15^\circ=\sin30^\circ=\frac12"#)
            ],
            shortcutSteps: [
                tiStep(1, "倍角秒杀", #"=\sin30^\circ=\frac12"#)
            ],
            keyInsight: "2sinθcosθ=sin2θ。",
            shortcutInsight: "直接得sin30°。",
            weapon: "正弦二倍角",
            timeRatio: 1.5,
            tags: ["三角", "二倍角", "高考"]
        ),

        tiProblem(
            id: "ti_011",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["sum_to_product"],
            content: "化简求值：(sin40°+sin20°)/(cos40°+cos20°)。",
            contentLatex: #"\frac{\sin40^\circ+\sin20^\circ}{\cos40^\circ+\cos20^\circ}=?"#,
            answer: "√3/3",
            difficulty: 0.58,
            averageTime: 110,
            hints: ["分子分母分别和差化积", "公共因子cos10°约去"],
            standardSteps: [
                tiStep(1, "分子", #"\sin40^\circ+\sin20^\circ=2\sin30^\circ\cos10^\circ"#),
                tiStep(2, "分母", #"\cos40^\circ+\cos20^\circ=2\cos30^\circ\cos10^\circ"#),
                tiStep(3, "约分", #"\frac{2\sin30^\circ\cos10^\circ}{2\cos30^\circ\cos10^\circ}=\tan30^\circ=\frac{\sqrt3}{3}"#)
            ],
            shortcutSteps: [
                tiStep(1, "和差化积约分秒杀", #"=\tan30^\circ=\frac{\sqrt3}{3}"#)
            ],
            keyInsight: "分子分母同用和差化积，公共因子约去化为正切。",
            shortcutInsight: "(sinA+sinB)/(cosA+cosB)=tan((A+B)/2)。",
            weapon: "和差化积约分",
            timeRatio: 2.4,
            tags: ["三角", "和差化积", "化简", "高考", "压轴"]
        ),

        tiProblem(
            id: "ti_012",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["cos_double"],
            content: "用降幂公式求 sin²15° 的值。",
            contentLatex: #"\sin^2 15^\circ=?"#,
            answer: "(2-√3)/4",
            difficulty: 0.44,
            averageTime: 80,
            hints: ["降幂 sin²θ=(1-cos2θ)/2"],
            standardSteps: [
                tiStep(1, "降幂公式", #"\sin^2 15^\circ=\frac{1-\cos30^\circ}{2}"#),
                tiStep(2, "求值", #"=\frac{1-\frac{\sqrt3}{2}}{2}=\frac{2-\sqrt3}{4}"#)
            ],
            shortcutSteps: [
                tiStep(1, "降幂秒杀", #"=\frac{1-\cos30^\circ}{2}=\frac{2-\sqrt3}{4}"#)
            ],
            keyInsight: "sin²θ=(1-cos2θ)/2把平方降为一次，便于代特殊角。",
            shortcutInsight: "降幂后用cos30°求值。",
            weapon: "降幂公式",
            timeRatio: 1.9,
            tags: ["三角", "降幂", "高考", "核心"]
        )
    ]

    // MARK: - 工厂方法
    private static func tiStep(_ order: Int, _ description: String, _ latex: String, _ annotation: String = "") -> SolutionStep {
        SolutionStep(order: order, description: description, latex: latex, annotation: annotation)
    }

    private static func tiProblem(
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
        commonMistakes: [String] = ["半角符号未按象限确定", "积化和差/和差化积公式记混", "降幂公式角度漏乘2"]
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
