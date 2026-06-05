import Foundation

// MARK: - 复数专题
// 目标: 覆盖复数四则运算、模、共轭、几何意义、方程与最值, 高考必考小题。
// 秒杀思路: 模的乘性 |z₁z₂|=|z₁||z₂|、几何意义(复平面)、i的周期性。

extension SampleData {
    static let complexNumberProblems: [Problem] = [
        complexProblem(
            id: "cplx_001",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["complex_division"],
            content: "计算 (1+i)/(1-i) 的值。",
            contentLatex: #"\frac{1+i}{1-i}=?"#,
            answer: "i",
            difficulty: 0.40,
            averageTime: 70,
            hints: ["分子分母同乘共轭", "(1-i)的共轭是(1+i)", "i²=-1"],
            standardSteps: [
                complexStep(1, "同乘共轭", #"\frac{(1+i)(1+i)}{(1-i)(1+i)}=\frac{(1+i)^2}{1-i^2}"#),
                complexStep(2, "展开", #"=\frac{1+2i+i^2}{2}=\frac{2i}{2}=i"#)
            ],
            shortcutSteps: [
                complexStep(1, "记忆秒杀", #"\frac{1+i}{1-i}=i\ \text{(必背), 因}1+i=i(1-i)"#)
            ],
            keyInsight: "复数除法分子分母同乘分母的共轭以实化分母。",
            shortcutInsight: "1+i=i(1-i)，故比值直接为i，可背为常用结论。",
            weapon: "共轭实化分母",
            timeRatio: 2.0,
            tags: ["复数", "运算", "必考", "核心"]
        ),

        complexProblem(
            id: "cplx_002",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["complex_modulus"],
            content: "已知复数 z=(3+4i)/(1-2i)，求 |z|。",
            contentLatex: #"z=\frac{3+4i}{1-2i},\ |z|=?"#,
            answer: "√5",
            difficulty: 0.46,
            averageTime: 90,
            hints: ["模的乘性|z₁/z₂|=|z₁|/|z₂|", "|3+4i|=5", "|1-2i|=√5"],
            standardSteps: [
                complexStep(1, "先化简z", #"z=\frac{(3+4i)(1+2i)}{1+4}=\frac{3+6i+4i-8}{5}=\frac{-5+10i}{5}=-1+2i"#),
                complexStep(2, "求模", #"|z|=\sqrt{(-1)^2+2^2}=\sqrt5"#)
            ],
            shortcutSteps: [
                complexStep(1, "模的乘性秒杀", #"|z|=\frac{|3+4i|}{|1-2i|}=\frac{5}{\sqrt5}=\sqrt5"#)
            ],
            keyInsight: "求商的模可先化简再求，也可直接用模的商。",
            shortcutInsight: "|z₁/z₂|=|z₁|/|z₂|，免去通分化简，直接算两个模相除。",
            weapon: "模的乘性",
            timeRatio: 2.5,
            tags: ["复数", "模", "必考", "核心"]
        ),

        complexProblem(
            id: "cplx_003",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["complex_equal"],
            content: "已知 (a+i)(1-i)=3+bi (a,b∈R)，求 a,b。",
            contentLatex: #"(a+i)(1-i)=3+bi,\ a,b\in\mathbb R"#,
            answer: "a=2, b=1",
            difficulty: 0.44,
            averageTime: 90,
            hints: ["展开左边", "实部虚部分别相等", "解方程组"],
            standardSteps: [
                complexStep(1, "展开", #"(a+i)(1-i)=a-ai+i-i^2=(a+1)+(1-a)i"#),
                complexStep(2, "对应相等", #"\begin{cases}a+1=3\\1-a=b\end{cases}"#),
                complexStep(3, "解出", #"a=2,\ b=1-2=-1?... \Rightarrow b=-1"#),
                complexStep(4, "校验", #"b=1-a=1-2=-1,\ \text{故}a=2,b=-1"#)
            ],
            shortcutSteps: [
                complexStep(1, "实虚部对应秒杀", #"a+1=3\Rightarrow a=2;\ b=1-a=-1"#)
            ],
            keyInsight: "两复数相等⟺实部相等且虚部相等。",
            shortcutInsight: "展开后直接读实部、虚部两个方程，秒解。",
            weapon: "复数相等条件",
            timeRatio: 1.8,
            tags: ["复数", "运算", "方程", "核心"]
        ),

        complexProblem(
            id: "cplx_004",
            type: .multipleChoice,
            tier: 3,
            formulaIds: ["pure_imaginary"],
            content: "若复数 z=(a²-1)+(a-1)i 为纯虚数，则实数 a 的值为？",
            contentLatex: #"z=(a^2-1)+(a-1)i\ \text{为纯虚数}"#,
            options: ["a=1", "a=-1", "a=±1", "a=0"],
            answer: "a=-1",
            difficulty: 0.48,
            averageTime: 80,
            hints: ["纯虚数:实部=0且虚部≠0", "a²-1=0", "a-1≠0"],
            standardSteps: [
                complexStep(1, "纯虚数条件", #"\text{实部}=0:\ a^2-1=0\Rightarrow a=\pm1"#),
                complexStep(2, "虚部非零", #"\text{虚部}\ne0:\ a-1\ne0\Rightarrow a\ne1"#),
                complexStep(3, "结论", #"a=-1"#)
            ],
            shortcutSteps: [
                complexStep(1, "双条件秒杀", #"a^2-1=0\text{且}a\ne1\Rightarrow a=-1"#)
            ],
            keyInsight: "纯虚数必须实部为0且虚部不为0，两条件缺一不可。",
            shortcutInsight: "解实部=0得候选，用虚部≠0排除a=1。",
            weapon: "纯虚数双条件",
            timeRatio: 1.6,
            tags: ["复数", "纯虚数", "必考"]
        ),

        complexProblem(
            id: "cplx_005",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["power_of_i"],
            content: "计算 i+i²+i³+…+i²⁰²⁴ 的值。",
            contentLatex: #"\sum_{k=1}^{2024} i^k=?"#,
            answer: "0",
            difficulty: 0.50,
            averageTime: 90,
            hints: ["i的幂以4为周期", "i+i²+i³+i⁴=0", "2024÷4整除"],
            standardSteps: [
                complexStep(1, "周期性", #"i^1+i^2+i^3+i^4=i-1-i+1=0"#),
                complexStep(2, "整除分组", #"2024=4\times506,\ \text{恰好}506\text{组}"#),
                complexStep(3, "求和", #"506\times0=0"#)
            ],
            shortcutSteps: [
                complexStep(1, "周期和为0秒杀", #"4\mid2024\Rightarrow\text{每4项和为0}\Rightarrow\text{总和}=0"#)
            ],
            keyInsight: "i的幂周期为4：i,-1,-i,1，每连续四项之和为0。",
            shortcutInsight: "项数被4整除则总和为0，无需逐项。",
            weapon: "i幂周期性",
            timeRatio: 2.2,
            tags: ["复数", "i的幂", "周期", "核心"]
        ),

        complexProblem(
            id: "cplx_006",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["conjugate"],
            content: "已知 z 的共轭为 z̄，若 z+2z̄=3-i，求 z。",
            contentLatex: #"z+2\bar z=3-i,\ z=?"#,
            answer: "1+i",
            difficulty: 0.52,
            averageTime: 100,
            hints: ["设z=a+bi", "z̄=a-bi", "代入比较实虚部"],
            standardSteps: [
                complexStep(1, "设元", #"z=a+bi,\ \bar z=a-bi"#),
                complexStep(2, "代入", #"(a+bi)+2(a-bi)=3a-bi=3-i"#),
                complexStep(3, "对应相等", #"3a=3,\ -b=-1\Rightarrow a=1,b=1"#),
                complexStep(4, "结论", #"z=1+i"#)
            ],
            shortcutSteps: [
                complexStep(1, "实虚分离秒杀", #"3a=3,\ -b=-1\Rightarrow z=1+i"#)
            ],
            keyInsight: "含z与z̄的方程统一设z=a+bi转为实方程组。",
            shortcutInsight: "z+2z̄的实部=3a、虚部=-b，直接对应。",
            weapon: "设元法",
            timeRatio: 1.8,
            tags: ["复数", "共轭", "方程", "核心"]
        ),

        complexProblem(
            id: "cplx_007",
            type: .multipleChoice,
            tier: 3,
            formulaIds: ["complex_geometry"],
            content: "复数 z=(2-i)/(1+i) 在复平面内对应的点位于第几象限？",
            contentLatex: #"z=\frac{2-i}{1+i},\ \text{所在象限}?"#,
            options: ["第一象限", "第二象限", "第三象限", "第四象限"],
            answer: "第四象限",
            difficulty: 0.46,
            averageTime: 80,
            hints: ["化简z为a+bi", "看a,b符号", "实部正虚部负→第四象限"],
            standardSteps: [
                complexStep(1, "化简", #"z=\frac{(2-i)(1-i)}{2}=\frac{2-2i-i-1}{2}=\frac{1-3i}{2}"#),
                complexStep(2, "坐标", #"\left(\frac12,-\frac32\right):\ \text{实部}>0,\text{虚部}<0"#),
                complexStep(3, "结论", #"\text{第四象限}"#)
            ],
            shortcutSteps: [
                complexStep(1, "符号判定秒杀", #"\text{实部}+,\text{虚部}-\Rightarrow\text{第四象限}"#)
            ],
            keyInsight: "复数a+bi对应点(a,b)，象限由实部虚部符号决定。",
            shortcutInsight: "只需判断化简后实部、虚部的正负即可定象限。",
            weapon: "复平面对应点",
            timeRatio: 1.7,
            tags: ["复数", "几何意义", "象限", "必考"]
        ),

        complexProblem(
            id: "cplx_008",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["complex_modulus", "locus"],
            content: "复数 z 满足 |z-1|=|z+1|，求 z 对应点的轨迹。",
            contentLatex: #"|z-1|=|z+1|,\ z\text{的轨迹}?"#,
            answer: "虚轴(y轴, 即实部为0)",
            difficulty: 0.54,
            averageTime: 100,
            hints: ["到(1,0)与(-1,0)等距", "垂直平分线", "即y轴"],
            standardSteps: [
                complexStep(1, "几何意义", #"|z-1|=z\text{到}(1,0)\text{距},\ |z+1|=z\text{到}(-1,0)\text{距}"#),
                complexStep(2, "等距", #"\text{到两点等距}\Rightarrow\text{两点连线的垂直平分线}"#),
                complexStep(3, "结论", #"\text{即}x=0\text{(虚轴)}"#)
            ],
            shortcutSteps: [
                complexStep(1, "代数验证", #"z=x+yi:\ (x-1)^2=(x+1)^2\Rightarrow x=0"#)
            ],
            keyInsight: "|z-z₁|=|z-z₂|表示到两点等距，即垂直平分线。",
            shortcutInsight: "设z=x+yi平方即得x=0。",
            weapon: "复数模的几何意义",
            timeRatio: 2.0,
            tags: ["复数", "模", "轨迹", "几何意义"]
        ),

        complexProblem(
            id: "cplx_009",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["complex_modulus", "min_distance"],
            content: "复数 z 满足 |z-3-4i|=1，求 |z| 的最大值与最小值。",
            contentLatex: #"|z-3-4i|=1,\ |z|_{\max},|z|_{\min}=?"#,
            answer: "max=6, min=4",
            difficulty: 0.58,
            averageTime: 110,
            hints: ["z在以(3,4)为圆心半径1的圆上", "|z|=到原点距离", "圆心距±半径"],
            standardSteps: [
                complexStep(1, "几何意义", #"z\text{在圆心}(3,4)\text{半径}1\text{的圆上}"#),
                complexStep(2, "圆心到原点", #"d=\sqrt{3^2+4^2}=5"#),
                complexStep(3, "最值", #"|z|_{\max}=5+1=6,\ |z|_{\min}=5-1=4"#)
            ],
            shortcutSteps: [
                complexStep(1, "圆模型秒杀", #"|z|\in[5-1,5+1]=[4,6]"#)
            ],
            keyInsight: "|z-z₀|=r是圆，|z|的最值=圆心到原点距离±r。",
            shortcutInsight: "心距5±半径1，直接得[4,6]。",
            weapon: "复数圆模型",
            timeRatio: 2.2,
            tags: ["复数", "模", "最值", "圆"]
        ),

        complexProblem(
            id: "cplx_010",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["complex_equation", "conjugate"],
            content: "已知复数 z 满足 z·z̄+2z=3+2i，求 z。",
            contentLatex: #"z\cdot\bar z+2z=3+2i,\ z=?"#,
            answer: "z=(-1+√3)+i 或 z=(-1-√3)+i",
            difficulty: 0.66,
            averageTime: 140,
            hints: ["z·z̄=|z|²为实数", "设z=a+bi", "实虚部分离"],
            standardSteps: [
                complexStep(1, "设元", #"z=a+bi,\ z\bar z=a^2+b^2"#),
                complexStep(2, "代入", #"a^2+b^2+2(a+bi)=(a^2+b^2+2a)+2bi=3+2i"#),
                complexStep(3, "对应相等", #"\begin{cases}a^2+b^2+2a=3\\2b=2\end{cases}\Rightarrow b=1"#),
                complexStep(4, "解a", #"a^2+1+2a=3\Rightarrow a^2+2a-2=0\Rightarrow a=-1\pm\sqrt3"#),
                complexStep(5, "结论", #"z=(-1\pm\sqrt3)+i"#)
            ],
            shortcutSteps: [
                complexStep(1, "z·z̄实数定虚部", #"2b=2\Rightarrow b=1"#),
                complexStep(2, "回代解二次", #"a^2+2a-2=0\Rightarrow z=(-1\pm\sqrt3)+i"#)
            ],
            keyInsight: "z·z̄=|z|²恒为实数，对应虚部只来自2z。",
            shortcutInsight: "先用虚部方程定b，再回代解关于a的二次方程。",
            weapon: "模平方实数性+设元",
            timeRatio: 2.0,
            tags: ["复数", "共轭", "方程", "压轴"]
        ),

        complexProblem(
            id: "cplx_011",
            type: .multipleChoice,
            tier: 4,
            formulaIds: ["real_coefficient_equation"],
            content: "实系数一元二次方程 x²+px+q=0 有一根为 1+2i，则 p+q 的值为？",
            contentLatex: #"x^2+px+q=0\ (p,q\in\mathbb R),\ \text{一根}1+2i,\ p+q=?"#,
            options: ["3", "7", "5", "1"],
            answer: "3",
            difficulty: 0.56,
            averageTime: 100,
            hints: ["实系数方程虚根成对", "另一根1-2i", "韦达定理"],
            standardSteps: [
                complexStep(1, "共轭根", #"\text{另一根}=1-2i"#),
                complexStep(2, "韦达", #"x_1+x_2=2=-p\Rightarrow p=-2"#),
                complexStep(3, "积", #"x_1x_2=(1)^2+(2)^2=5=q"#),
                complexStep(4, "结论", #"p+q=-2+5=3"#)
            ],
            shortcutSteps: [
                complexStep(1, "共轭成对+韦达秒杀", #"p=-2\,\text{Re}=-2,\ q=|1+2i|^2=5\Rightarrow p+q=3"#)
            ],
            keyInsight: "实系数方程的虚根必共轭成对，可用韦达定理。",
            shortcutInsight: "和=2Re(根)的相反数，积=|根|²，直接出p,q。",
            weapon: "共轭根+韦达定理",
            timeRatio: 2.0,
            tags: ["复数", "实系数方程", "韦达", "必考"]
        ),

        complexProblem(
            id: "cplx_012",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["complex_power"],
            content: "计算 (1+i)¹⁰ 的值。",
            contentLatex: #"(1+i)^{10}=?"#,
            answer: "32i",
            difficulty: 0.54,
            averageTime: 100,
            hints: ["(1+i)²=2i", "化为(2i)⁵", "i⁵=i"],
            standardSteps: [
                complexStep(1, "平方", #"(1+i)^2=1+2i+i^2=2i"#),
                complexStep(2, "化简", #"(1+i)^{10}=[(1+i)^2]^5=(2i)^5"#),
                complexStep(3, "计算", #"=32i^5=32i"#)
            ],
            shortcutSteps: [
                complexStep(1, "平方降幂秒杀", #"(1+i)^2=2i\Rightarrow(1+i)^{10}=(2i)^5=32i"#)
            ],
            keyInsight: "(1+i)²=2i是高频结论，高次幂先平方降阶。",
            shortcutInsight: "把(1+i)的偶次幂转成(2i)的幂，i的周期收尾。",
            weapon: "平方降幂",
            timeRatio: 2.3,
            tags: ["复数", "幂运算", "核心"]
        ),

        complexProblem(
            id: "cplx_013",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["complex_modulus", "triangle_inequality"],
            content: "已知 |z₁|=2, |z₂|=3, |z₁+z₂|=4，求 |z₁-z₂|。",
            contentLatex: #"|z_1|=2,|z_2|=3,|z_1+z_2|=4,\ |z_1-z_2|=?"#,
            answer: "√10",
            difficulty: 0.64,
            averageTime: 120,
            hints: ["平行四边形恒等式", "|z₁+z₂|²+|z₁-z₂|²=2(|z₁|²+|z₂|²)"],
            standardSteps: [
                complexStep(1, "平行四边形恒等式", #"|z_1+z_2|^2+|z_1-z_2|^2=2(|z_1|^2+|z_2|^2)"#),
                complexStep(2, "代入", #"16+|z_1-z_2|^2=2(4+9)=26"#),
                complexStep(3, "结论", #"|z_1-z_2|^2=10\Rightarrow|z_1-z_2|=\sqrt{10}"#)
            ],
            shortcutSteps: [
                complexStep(1, "平行四边形律秒杀", #"|z_1-z_2|=\sqrt{2(4+9)-16}=\sqrt{10}"#)
            ],
            keyInsight: "复数的和差模满足平行四边形恒等式。",
            shortcutInsight: "对角线平方和=2倍邻边平方和，直接解出另一对角线。",
            weapon: "平行四边形恒等式",
            timeRatio: 2.4,
            tags: ["复数", "模", "恒等式", "压轴"]
        ),

        complexProblem(
            id: "cplx_014",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["complex_real_condition"],
            content: "已知复数 z=cosθ+isinθ，求使 z+1/z 为实数的条件，并求此时 z+1/z 的值。",
            contentLatex: #"z=\cos\theta+i\sin\theta,\ z+\frac1z\in\mathbb R?"#,
            answer: "恒为实数, z+1/z=2cosθ",
            difficulty: 0.62,
            averageTime: 130,
            hints: ["|z|=1时1/z=z̄", "z+z̄=2Re(z)", "结果为实数"],
            standardSteps: [
                complexStep(1, "模为1", #"|z|=\sqrt{\cos^2\theta+\sin^2\theta}=1"#),
                complexStep(2, "倒数即共轭", #"\frac1z=\bar z=\cos\theta-i\sin\theta"#),
                complexStep(3, "求和", #"z+\frac1z=2\cos\theta\in\mathbb R"#),
                complexStep(4, "结论", #"\text{对任意}\theta\text{恒为实数}"#)
            ],
            shortcutSteps: [
                complexStep(1, "单位圆秒杀", #"|z|=1\Rightarrow\frac1z=\bar z\Rightarrow z+\frac1z=2\text{Re}(z)=2\cos\theta"#)
            ],
            keyInsight: "单位圆上复数的倒数等于其共轭。",
            shortcutInsight: "|z|=1时z+1/z=2cosθ恒为实数，是棣莫弗的雏形。",
            weapon: "单位圆共轭性质",
            timeRatio: 2.2,
            tags: ["复数", "三角形式", "实数条件", "压轴"]
        ),

        complexProblem(
            id: "cplx_015",
            type: .multipleChoice,
            tier: 3,
            formulaIds: ["conjugate", "complex_division"],
            content: "若 z=2/(1+i)，则 z̄ 等于？",
            contentLatex: #"z=\frac{2}{1+i},\ \bar z=?"#,
            options: ["1+i", "1-i", "-1+i", "-1-i"],
            answer: "1+i",
            difficulty: 0.42,
            averageTime: 70,
            hints: ["先化简z", "z=1-i", "共轭变虚部符号"],
            standardSteps: [
                complexStep(1, "化简z", #"z=\frac{2(1-i)}{(1+i)(1-i)}=\frac{2(1-i)}{2}=1-i"#),
                complexStep(2, "取共轭", #"\bar z=1+i"#)
            ],
            shortcutSteps: [
                complexStep(1, "共轭秒杀", #"\bar z=\overline{\frac{2}{1+i}}=\frac{2}{1-i}=1+i"#)
            ],
            keyInsight: "共轭运算可与四则运算交换：商的共轭=共轭的商。",
            shortcutInsight: "直接对原式取共轭(分母1+i变1-i)再化简。",
            weapon: "共轭与运算交换",
            timeRatio: 1.8,
            tags: ["复数", "共轭", "运算", "核心"]
        )
    ]

    // MARK: - 工厂方法
    private static func complexStep(_ order: Int, _ description: String, _ latex: String, _ annotation: String = "") -> SolutionStep {
        SolutionStep(order: order, description: description, latex: latex, annotation: annotation)
    }

    private static func complexProblem(
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
        commonMistakes: [String] = ["忘记i²=-1", "纯虚数漏掉虚部非零条件", "共轭只变虚部符号易写错"]
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
