import Foundation

// MARK: - 大学公式秒杀高考 专题 (12道, 易懂入门)
// 理念: 每题用一个"大学公式"(洛必达/泰勒/拉格朗日中值/叉积/定积分)轻松解决高考题,
//       standardMethod=高中常规解法, descentMethod=大学公式秒杀。帮助理解公式威力。
// LaTeX 用 raw string。

extension SampleData {
    static let collegeWeaponProblems: [Problem] = [
        cwProblem(
            id: "cw_001",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["lopital_rule"],
            content: "求极限 lim(x→0) (eˣ-1)/x。",
            contentLatex: #"\lim_{x\to0}\frac{e^x-1}{x}=?"#,
            answer: "1",
            difficulty: 0.40,
            averageTime: 80,
            hints: ["0/0型", "重要极限或洛必达"],
            standardSteps: [
                cwStep(1, "重要极限", #"\lim_{x\to0}\frac{e^x-1}{x}=1\ (\text{基本极限})"#)
            ],
            shortcutSteps: [
                cwStep(1, "洛必达秒杀", #"0/0\Rightarrow\lim\frac{(e^x-1)'}{x'}=\lim\frac{e^x}{1}=e^0=1"#)
            ],
            keyInsight: "(eˣ-1)/x 当 x→0 是 0/0 型，其值为基本极限 1。",
            shortcutInsight: "洛必达：分子分母各求导得 eˣ/1，代 x=0 即 1。",
            weapon: "洛必达法则",
            timeRatio: 2.0,
            tags: ["大学公式秒杀", "洛必达", "极限", "高考", "核心"]
        ),

        cwProblem(
            id: "cw_002",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["lopital_rule"],
            content: "求极限 lim(x→0) (1-cosx)/x²。",
            contentLatex: #"\lim_{x\to0}\frac{1-\cos x}{x^2}=?"#,
            answer: "1/2",
            difficulty: 0.46,
            averageTime: 90,
            hints: ["0/0型", "可用倍角或两次洛必达"],
            standardSteps: [
                cwStep(1, "倍角降幂", #"1-\cos x=2\sin^2\frac x2"#),
                cwStep(2, "化重要极限", #"\frac{2\sin^2(x/2)}{x^2}=\frac12\left(\frac{\sin(x/2)}{x/2}\right)^2\to\frac12"#)
            ],
            shortcutSteps: [
                cwStep(1, "洛必达两次", #"\frac{1-\cos x}{x^2}\to\frac{\sin x}{2x}\to\frac{\cos x}{2}=\frac12"#)
            ],
            keyInsight: "经典 0/0 极限，结果 1/2。",
            shortcutInsight: "连用两次洛必达：先得 sinx/(2x)，再得 cosx/2=1/2。",
            weapon: "洛必达法则",
            timeRatio: 2.4,
            tags: ["大学公式秒杀", "洛必达", "极限", "高考"]
        ),

        cwProblem(
            id: "cw_003",
            type: .calculation,
            tier: 5,
            formulaIds: ["lopital_rule", "taylor_series"],
            content: "若 lim(x→0) (ln(1+x)-ax)/x² 存在（为有限值），求a及该极限值。",
            contentLatex: #"\lim_{x\to0}\frac{\ln(1+x)-ax}{x^2}\text{有限},\ a=?,\ \text{极限}=?"#,
            answer: "a=1，极限=-1/2",
            difficulty: 0.60,
            averageTime: 130,
            hints: ["ln(1+x)=x-x²/2+...", "x的一次项系数须抵消"],
            standardSteps: [
                cwStep(1, "洛必达分析", #"0/0:\ \lim\frac{\frac1{1+x}-a}{2x},\ \text{分子需}\to0\Rightarrow1-a=0\Rightarrow a=1"#),
                cwStep(2, "再洛必达", #"\lim\frac{\frac1{1+x}-1}{2x}=\lim\frac{-1/(1+x)^2}{2}=-\frac12"#)
            ],
            shortcutSteps: [
                cwStep(1, "泰勒秒杀", #"\ln(1+x)=x-\frac{x^2}{2}+o(x^2)"#),
                cwStep(2, "代入", #"\frac{x-\frac{x^2}{2}-ax}{x^2}=\frac{(1-a)x-\frac{x^2}{2}}{x^2}"#),
                cwStep(3, "有限条件", #"\text{须}1-a=0\Rightarrow a=1,\ \text{极限}=-\frac12"#)
            ],
            keyInsight: "极限有限要求分子最低次项与分母匹配，定出参数a。",
            shortcutInsight: "泰勒展开 ln(1+x) 后，x 一次项系数必须为0，瞬间得 a=1、极限 -1/2。",
            weapon: "泰勒展开+洛必达",
            timeRatio: 2.5,
            tags: ["大学公式秒杀", "泰勒", "洛必达", "含参极限", "高考", "压轴"]
        ),

        cwProblem(
            id: "cw_004",
            type: .proof,
            tier: 4,
            formulaIds: ["taylor_series"],
            content: "证明：对一切实数x，eˣ≥1+x。",
            contentLatex: #"e^x\ge1+x\ (\forall x\in\mathbb R)"#,
            answer: "成立，当x=0时取等",
            difficulty: 0.46,
            averageTime: 90,
            hints: ["构造g(x)=eˣ-1-x", "或泰勒带余项"],
            standardSteps: [
                cwStep(1, "构造函数", #"g(x)=e^x-1-x,\ g'(x)=e^x-1"#),
                cwStep(2, "单调性", #"g'<0(x<0),g'>0(x>0),\ x=0\text{为最小}"#),
                cwStep(3, "结论", #"g(x)\ge g(0)=0\Rightarrow e^x\ge1+x"#)
            ],
            shortcutSteps: [
                cwStep(1, "泰勒带余项秒杀", #"e^x=1+x+\frac{e^\xi}{2}x^2\ge1+x"#),
                cwStep(2, "因余项非负", #"\frac{e^\xi}{2}x^2\ge0\Rightarrow e^x\ge1+x"#)
            ],
            keyInsight: "eˣ≥1+x 是切线不等式（y=x+1 是 eˣ 在 0 处切线）。",
            shortcutInsight: "泰勒展开到二阶，余项 e^ξ·x²/2≥0，立得不等式。",
            weapon: "泰勒展开",
            timeRatio: 2.0,
            tags: ["大学公式秒杀", "泰勒", "切线不等式", "证明", "高考", "核心"]
        ),

        cwProblem(
            id: "cw_005",
            type: .proof,
            tier: 4,
            formulaIds: ["taylor_series"],
            content: "证明：当x>0时，ln(1+x)<x。",
            contentLatex: #"x>0:\ \ln(1+x)<x"#,
            answer: "成立",
            difficulty: 0.44,
            averageTime: 80,
            hints: ["ln(1+x)=x-x²/2+...", "后续项使其小于x"],
            standardSteps: [
                cwStep(1, "构造", #"h(x)=x-\ln(1+x),\ h'(x)=1-\frac1{1+x}=\frac{x}{1+x}>0"#),
                cwStep(2, "结论", #"h\text{递增},h(0)=0\Rightarrow h(x)>0\Rightarrow\ln(1+x)<x"#)
            ],
            shortcutSteps: [
                cwStep(1, "泰勒秒杀", #"\ln(1+x)=x-\frac{x^2}{2}+\frac{x^3}{3}-\cdots"#),
                cwStep(2, "x>0交错估计", #"\ln(1+x)=x-\left(\frac{x^2}{2}-\frac{x^3}{3}+\cdots\right)<x"#)
            ],
            keyInsight: "ln(1+x) 的泰勒主项是 x，扣掉正的余量后小于 x。",
            shortcutInsight: "展开式首项 x，其余净为正被减去，故 <x。",
            weapon: "泰勒展开",
            timeRatio: 2.0,
            tags: ["大学公式秒杀", "泰勒", "对数不等式", "证明", "高考"]
        ),

        cwProblem(
            id: "cw_006",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["taylor_series"],
            content: "用线性近似估计 √1.02 的值（精确到0.001）。",
            contentLatex: #"\sqrt{1.02}\approx?\ (\text{线性近似})"#,
            answer: "≈1.010",
            difficulty: 0.42,
            averageTime: 80,
            hints: ["(1+x)^(1/2)≈1+x/2", "x=0.02"],
            standardSteps: [
                cwStep(1, "二项近似", #"(1+x)^{1/2}\approx1+\frac12 x\ (x\text{小})"#),
                cwStep(2, "代入", #"\sqrt{1.02}=(1+0.02)^{1/2}\approx1+0.01=1.010"#)
            ],
            shortcutSteps: [
                cwStep(1, "泰勒一阶秒杀", #"\sqrt{1+x}\approx1+\frac x2\Rightarrow1.010"#)
            ],
            keyInsight: "在 x=0 附近用一次泰勒（切线）近似函数值。",
            shortcutInsight: "(1+x)ᵏ≈1+kx，取 k=1/2、x=0.02。",
            weapon: "泰勒线性近似",
            timeRatio: 2.0,
            tags: ["大学公式秒杀", "泰勒", "近似计算", "高考"]
        ),

        cwProblem(
            id: "cw_007",
            type: .proof,
            tier: 4,
            formulaIds: ["lagrange_mean"],
            content: "证明：对任意实数 x₁,x₂，有 |sinx₁ - sinx₂| ≤ |x₁-x₂|。",
            contentLatex: #"|\sin x_1-\sin x_2|\le|x_1-x_2|"#,
            answer: "成立",
            difficulty: 0.50,
            averageTime: 100,
            hints: ["对sin用拉格朗日中值定理", "|cosξ|≤1"],
            standardSteps: [
                cwStep(1, "和差化积", #"|\sin x_1-\sin x_2|=2\left|\cos\frac{x_1+x_2}{2}\sin\frac{x_1-x_2}{2}\right|"#),
                cwStep(2, "放缩", #"\le2\left|\sin\frac{x_1-x_2}{2}\right|\le2\cdot\frac{|x_1-x_2|}{2}=|x_1-x_2|"#)
            ],
            shortcutSteps: [
                cwStep(1, "拉格朗日中值秒杀", #"\sin x_1-\sin x_2=\cos\xi\,(x_1-x_2),\ \xi\text{介于二者间}"#),
                cwStep(2, "取绝对值", #"|\sin x_1-\sin x_2|=|\cos\xi||x_1-x_2|\le|x_1-x_2|"#)
            ],
            keyInsight: "增量 f(x₁)-f(x₂)=f'(ξ)(x₁-x₂)，对 f=sin 即得 Lipschitz 估计。",
            shortcutInsight: "中值定理一步把差化为 cosξ·(差)，|cosξ|≤1 立得。",
            weapon: "拉格朗日中值定理",
            timeRatio: 2.2,
            tags: ["大学公式秒杀", "拉格朗日中值", "不等式", "证明", "高考", "核心"]
        ),

        cwProblem(
            id: "cw_008",
            type: .proof,
            tier: 5,
            formulaIds: ["lagrange_mean"],
            content: "设 0<a<b，证明：(b-a)/b < ln(b/a) < (b-a)/a。",
            contentLatex: #"0<a<b:\ \frac{b-a}{b}<\ln\frac ba<\frac{b-a}{a}"#,
            answer: "成立",
            difficulty: 0.62,
            averageTime: 130,
            hints: ["对f(x)=lnx在[a,b]用中值定理", "lnb-lna=(1/ξ)(b-a)", "a<ξ<b"],
            standardSteps: [
                cwStep(1, "中值定理", #"\ln b-\ln a=\frac1\xi(b-a),\ a<\xi<b"#),
                cwStep(2, "夹ξ", #"a<\xi<b\Rightarrow\frac1b<\frac1\xi<\frac1a"#),
                cwStep(3, "乘(b-a)>0", #"\frac{b-a}{b}<\frac{b-a}{\xi}=\ln\frac ba<\frac{b-a}{a}"#)
            ],
            shortcutSteps: [
                cwStep(1, "中值定理秒杀", #"\ln\frac ba=\frac{b-a}{\xi},\ \xi\in(a,b)\Rightarrow\text{用}\frac1b<\frac1\xi<\frac1a\text{夹}"#)
            ],
            keyInsight: "lnb-lna 由中值定理化为 (b-a)/ξ，再用 ξ 的范围夹出双边不等式。",
            shortcutInsight: "中值定理把对数差变成 (b-a)/ξ，ξ∈(a,b) 直接夹逼。",
            weapon: "拉格朗日中值定理",
            timeRatio: 2.4,
            tags: ["大学公式秒杀", "拉格朗日中值", "对数不等式", "证明", "高考", "压轴"]
        ),

        cwProblem(
            id: "cw_009",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["vector_cross", "area"],
            content: "已知A(0,0)、B(3,1)、C(1,4)，求△ABC的面积。",
            contentLatex: #"A(0,0),B(3,1),C(1,4),\ S_{\triangle ABC}=?"#,
            answer: "11/2",
            difficulty: 0.42,
            averageTime: 80,
            hints: ["AB=(3,1),AC=(1,4)", "叉积(2D)=x₁y₂-x₂y₁", "S=½|叉积|"],
            standardSteps: [
                cwStep(1, "两边向量", #"\vec{AB}=(3,1),\ \vec{AC}=(1,4)"#),
                cwStep(2, "叉积模(行列式)", #"|\vec{AB}\times\vec{AC}|=|3\cdot4-1\cdot1|=11"#),
                cwStep(3, "面积", #"S=\frac12\times11=\frac{11}{2}"#)
            ],
            shortcutSteps: [
                cwStep(1, "叉积秒杀", #"S=\frac12|x_1y_2-x_2y_1|=\frac12|12-1|=\frac{11}{2}"#)
            ],
            keyInsight: "三角形面积=½×两边向量叉积的模。",
            shortcutInsight: "二维叉积=行列式 x₁y₂-x₂y₁，省去求夹角。",
            weapon: "向量叉积求面积",
            timeRatio: 2.2,
            tags: ["大学公式秒杀", "叉积", "面积", "高考", "核心"]
        ),

        cwProblem(
            id: "cw_010",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["vector_cross"],
            content: "求过三点A(1,0,0)、B(0,1,0)、C(0,0,1)的平面的一个法向量。",
            contentLatex: #"A(1,0,0),B(0,1,0),C(0,0,1),\ \text{平面法向量}=?"#,
            answer: "(1,1,1)",
            difficulty: 0.50,
            averageTime: 100,
            hints: ["AB=(-1,1,0),AC=(-1,0,1)", "n=AB×AC"],
            standardSteps: [
                cwStep(1, "两向量", #"\vec{AB}=(-1,1,0),\ \vec{AC}=(-1,0,1)"#),
                cwStep(2, "叉积", #"\vec n=\vec{AB}\times\vec{AC}=(1\cdot1-0\cdot0,\ 0\cdot(-1)-(-1)\cdot1,\ (-1)\cdot0-1\cdot(-1))=(1,1,1)"#)
            ],
            shortcutSteps: [
                cwStep(1, "叉积一步秒杀", #"\vec n=\vec{AB}\times\vec{AC}=(1,1,1)"#)
            ],
            keyInsight: "平面法向量=平面内两向量的叉积，一次运算得到。",
            shortcutInsight: "叉积直接给法向量，免去解 n·AB=0、n·AC=0 方程组。",
            weapon: "向量叉积求法向量",
            timeRatio: 2.5,
            tags: ["大学公式秒杀", "叉积", "立体几何", "法向量", "高考", "压轴"]
        ),

        cwProblem(
            id: "cw_011",
            type: .calculation,
            tier: 4,
            formulaIds: ["fundamental_theorem", "int_power"],
            content: "求抛物线y=x²与直线y=x所围成图形的面积。",
            contentLatex: #"y=x^2\ \text{与}\ y=x\ \text{围成面积}=?"#,
            answer: "1/6",
            difficulty: 0.48,
            averageTime: 100,
            hints: ["交点x=0,1", "S=∫₀¹(上-下)dx=∫₀¹(x-x²)dx"],
            standardSteps: [
                cwStep(1, "求交点", #"x^2=x\Rightarrow x=0,1"#),
                cwStep(2, "定积分", #"S=\int_0^1(x-x^2)dx=\left[\frac{x^2}{2}-\frac{x^3}{3}\right]_0^1"#),
                cwStep(3, "求值", #"=\frac12-\frac13=\frac16"#)
            ],
            shortcutSteps: [
                cwStep(1, "1/6公式秒杀", #"\text{抛物线与直线围成}S=\frac{|a|(x_2-x_1)^3}{6}=\frac{1\cdot1^3}{6}=\frac16"#)
            ],
            keyInsight: "曲线间面积=∫(上曲线-下曲线)dx，用牛顿-莱布尼茨求值。",
            shortcutInsight: "抛物线与直线围成面积有‘1/6公式’：|a|(x₂-x₁)³/6。",
            weapon: "定积分(牛顿-莱布尼茨)",
            timeRatio: 2.2,
            tags: ["大学公式秒杀", "定积分", "面积", "高考", "核心"]
        ),

        cwProblem(
            id: "cw_012",
            type: .calculation,
            tier: 4,
            formulaIds: ["fundamental_theorem", "int_power"],
            content: "求抛物线y=4-x²与x轴所围成图形的面积。",
            contentLatex: #"y=4-x^2\ \text{与}\ x\text{轴围成面积}=?"#,
            answer: "32/3",
            difficulty: 0.46,
            averageTime: 90,
            hints: ["与x轴交点x=±2", "S=∫₋₂²(4-x²)dx"],
            standardSteps: [
                cwStep(1, "交点", #"4-x^2=0\Rightarrow x=\pm2"#),
                cwStep(2, "定积分", #"S=\int_{-2}^{2}(4-x^2)dx=\left[4x-\frac{x^3}{3}\right]_{-2}^{2}"#),
                cwStep(3, "求值", #"=\left(8-\frac83\right)-\left(-8+\frac83\right)=16-\frac{16}{3}=\frac{32}{3}"#)
            ],
            shortcutSteps: [
                cwStep(1, "偶函数对称秒杀", #"S=2\int_0^2(4-x^2)dx=2\left[8-\frac83\right]=2\cdot\frac{16}{3}=\frac{32}{3}"#)
            ],
            keyInsight: "曲边图形面积用定积分，注意上下限为交点横坐标。",
            shortcutInsight: "被积函数为偶函数，可用对称性取 2∫₀² 简化。",
            weapon: "定积分(对称简化)",
            timeRatio: 2.0,
            tags: ["大学公式秒杀", "定积分", "面积", "高考"]
        )
    ]

    // MARK: - 工厂方法
    private static func cwStep(_ order: Int, _ description: String, _ latex: String, _ annotation: String = "") -> SolutionStep {
        SolutionStep(order: order, description: description, latex: latex, annotation: annotation)
    }

    private static func cwProblem(
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
        commonMistakes: [String] = ["洛必达须先确认0/0或∞/∞型", "泰勒展开保留阶数不足", "中值定理ξ的范围用错方向"]
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
                detailedExplanation: "大学公式秒杀：\(shortcutInsight)"
            ),
            gaokaoYear: gaokaoYear,
            tags: tags
        )
    }
}
