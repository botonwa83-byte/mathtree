import Foundation

// MARK: - 极坐标与参数方程专题 (选考重点)
// 目标: 极坐标⇄直角互化、圆/直线/圆锥曲线参数方程、直线参数方程 t 的几何意义。
// 秒杀思路: ρ²=x²+y², ρcosθ=x, ρsinθ=y; 直线参数方程标准形中 |t| 即到定点距离。
// 注意: 每题答案均为确定数值。

extension SampleData {
    static let polarParametricProblems: [Problem] = [
        ppProblem(
            id: "pp_001",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["polar_rectangular"],
            content: "把直角坐标点 (-1, √3) 化为极坐标 (ρ≥0, 0≤θ<2π)。",
            contentLatex: #"(-1,\sqrt3)\to(\rho,\theta),\ \rho\ge0,0\le\theta<2\pi"#,
            answer: "(2, 2π/3)",
            difficulty: 0.42,
            averageTime: 80,
            hints: ["ρ=√(x²+y²)", "tanθ=y/x注意象限", "点在第二象限"],
            standardSteps: [
                ppStep(1, "求ρ", #"\rho=\sqrt{(-1)^2+(\sqrt3)^2}=\sqrt4=2"#),
                ppStep(2, "求θ", #"\text{点在第二象限},\ \tan\theta=\frac{\sqrt3}{-1}\Rightarrow\theta=\frac{2\pi}{3}"#),
                ppStep(3, "结论", #"\left(2,\frac{2\pi}{3}\right)"#)
            ],
            shortcutSteps: [
                ppStep(1, "模长+象限定角秒杀", #"\rho=2,\ \text{第二象限}\Rightarrow\theta=\frac{2\pi}{3}"#)
            ],
            keyInsight: "直角化极坐标先求模ρ, 再由象限确定极角θ。",
            shortcutInsight: "ρ取模长, θ结合点所在象限避免反正切的多值。",
            weapon: "极坐标互化",
            timeRatio: 1.8,
            tags: ["极坐标", "坐标互化", "必考", "核心"]
        ),

        ppProblem(
            id: "pp_002",
            type: .calculation,
            tier: 3,
            formulaIds: ["polar_rectangular", "circle"],
            content: "将极坐标方程 ρ=2cosθ 化为直角坐标方程, 并指出曲线形状。",
            contentLatex: #"\rho=2\cos\theta\ \to\ \text{直角方程}?"#,
            answer: "(x-1)²+y²=1，圆心(1,0)半径1",
            difficulty: 0.46,
            averageTime: 90,
            hints: ["两边乘ρ", "ρ²=x²+y², ρcosθ=x", "配方"],
            standardSteps: [
                ppStep(1, "乘ρ", #"\rho^2=2\rho\cos\theta"#),
                ppStep(2, "代换", #"x^2+y^2=2x"#),
                ppStep(3, "配方", #"(x-1)^2+y^2=1"#),
                ppStep(4, "结论", #"\text{圆心}(1,0),\ \text{半径}1"#)
            ],
            shortcutSteps: [
                ppStep(1, "ρ=2cosθ模型秒杀", #"\rho=2a\cos\theta\Leftrightarrow\text{圆心}(a,0)\text{过原点, }r=a"#),
                ppStep(2, "代a=1", #"(x-1)^2+y^2=1"#)
            ],
            keyInsight: "极坐标化直角方程的关键是制造ρ²,ρcosθ,ρsinθ以便整体代换。",
            shortcutInsight: "ρ=2a cosθ是过极点、圆心在极轴上的圆, 直接读心径。",
            weapon: "极坐标方程互化",
            timeRatio: 2.0,
            tags: ["极坐标", "坐标互化", "圆", "必考", "核心"]
        ),

        ppProblem(
            id: "pp_003",
            type: .calculation,
            tier: 3,
            formulaIds: ["polar_rectangular", "circle"],
            content: "将极坐标方程 ρ=4sinθ 化为直角坐标方程。",
            contentLatex: #"\rho=4\sin\theta\ \to\ ?"#,
            answer: "x²+(y-2)²=4，圆心(0,2)半径2",
            difficulty: 0.44,
            averageTime: 80,
            hints: ["乘ρ", "ρsinθ=y", "配方"],
            standardSteps: [
                ppStep(1, "乘ρ", #"\rho^2=4\rho\sin\theta\Rightarrow x^2+y^2=4y"#),
                ppStep(2, "配方", #"x^2+(y-2)^2=4"#)
            ],
            shortcutSteps: [
                ppStep(1, "ρ=2a sinθ模型秒杀", #"\text{圆心}(0,a)\text{过原点},r=a;\ a=2\Rightarrow x^2+(y-2)^2=4"#)
            ],
            keyInsight: "ρ=2a sinθ是圆心在y轴上、过极点的圆。",
            shortcutInsight: "对照标准模型直接写圆心(0,2)半径2。",
            weapon: "极坐标方程互化",
            timeRatio: 1.9,
            tags: ["极坐标", "坐标互化", "圆", "必考"]
        ),

        ppProblem(
            id: "pp_004",
            type: .calculation,
            tier: 3,
            formulaIds: ["polar_line"],
            content: "将极坐标方程 ρcosθ=3 化为直角坐标方程。",
            contentLatex: #"\rho\cos\theta=3\ \to\ ?"#,
            answer: "x=3（竖直线）",
            difficulty: 0.36,
            averageTime: 60,
            hints: ["ρcosθ=x"],
            standardSteps: [
                ppStep(1, "直接代换", #"\rho\cos\theta=x\Rightarrow x=3"#)
            ],
            shortcutSteps: [
                ppStep(1, "一步代换", #"x=3"#)
            ],
            keyInsight: "ρcosθ=x、ρsinθ=y是最常用的两条互化公式。",
            shortcutInsight: "ρcosθ整体即x, 立得x=3。",
            weapon: "极坐标互化",
            timeRatio: 1.5,
            tags: ["极坐标", "坐标互化", "直线", "必考"]
        ),

        ppProblem(
            id: "pp_005",
            type: .calculation,
            tier: 3,
            formulaIds: ["parametric_circle"],
            content: "将圆的参数方程 x=2+3cosφ, y=-1+3sinφ (φ为参数) 化为普通方程。",
            contentLatex: #"\begin{cases}x=2+3\cos\varphi\\y=-1+3\sin\varphi\end{cases}\to?"#,
            answer: "(x-2)²+(y+1)²=9",
            difficulty: 0.40,
            averageTime: 70,
            hints: ["移项", "平方相加", "用sin²+cos²=1"],
            standardSteps: [
                ppStep(1, "移项", #"x-2=3\cos\varphi,\ y+1=3\sin\varphi"#),
                ppStep(2, "平方相加", #"(x-2)^2+(y+1)^2=9(\cos^2\varphi+\sin^2\varphi)=9"#)
            ],
            shortcutSteps: [
                ppStep(1, "圆参数模型秒杀", #"\text{圆心}(2,-1),\ r=3\Rightarrow(x-2)^2+(y+1)^2=9"#)
            ],
            keyInsight: "圆参数方程消参用平方相加配合sin²+cos²=1。",
            shortcutInsight: "直接读出圆心(常数项)与半径(系数)。",
            weapon: "参数方程消参",
            timeRatio: 1.7,
            tags: ["参数方程", "圆", "消参", "必考"]
        ),

        ppProblem(
            id: "pp_006",
            type: .calculation,
            tier: 3,
            formulaIds: ["parametric_ellipse"],
            content: "将椭圆参数方程 x=4cosφ, y=3sinφ (φ为参数) 化为普通方程。",
            contentLatex: #"\begin{cases}x=4\cos\varphi\\y=3\sin\varphi\end{cases}\to?"#,
            answer: "x²/16+y²/9=1",
            difficulty: 0.40,
            averageTime: 70,
            hints: ["cosφ=x/4,sinφ=y/3", "平方相加"],
            standardSteps: [
                ppStep(1, "解出三角", #"\cos\varphi=\frac x4,\ \sin\varphi=\frac y3"#),
                ppStep(2, "平方相加", #"\frac{x^2}{16}+\frac{y^2}{9}=1"#)
            ],
            shortcutSteps: [
                ppStep(1, "椭圆参数模型秒杀", #"a=4,b=3\Rightarrow\frac{x^2}{16}+\frac{y^2}{9}=1"#)
            ],
            keyInsight: "椭圆参数方程x=acosφ,y=bsinφ消参得标准方程。",
            shortcutInsight: "系数a,b即半轴长, 直接写标准式。",
            weapon: "参数方程消参",
            timeRatio: 1.7,
            tags: ["参数方程", "椭圆", "消参", "必考"]
        ),

        ppProblem(
            id: "pp_007",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["parametric_line"],
            content: "直线参数方程 x=1+(√2/2)t, y=(√2/2)t (t为参数)。指出该直线过的定点与倾斜角。",
            contentLatex: #"\begin{cases}x=1+\frac{\sqrt2}{2}t\\y=\frac{\sqrt2}{2}t\end{cases}"#,
            answer: "过点(1,0)，倾斜角45°",
            difficulty: 0.48,
            averageTime: 80,
            hints: ["t=0对应定点", "方向向量(√2/2,√2/2)", "单位向量→t表示距离"],
            standardSteps: [
                ppStep(1, "定点", #"t=0\Rightarrow(1,0)"#),
                ppStep(2, "方向", #"\left(\frac{\sqrt2}{2},\frac{\sqrt2}{2}\right)\text{是单位向量, 倾斜角}45^\circ"#)
            ],
            shortcutSteps: [
                ppStep(1, "标准形识别秒杀", #"\text{系数为}(\cos45^\circ,\sin45^\circ)\Rightarrow\text{过}(1,0),\text{倾角}45^\circ"#)
            ],
            keyInsight: "直线参数方程标准形中方向系数为(cosα,sinα)时, t的绝对值即到定点距离。",
            shortcutInsight: "常数项给定点, 三角系数给倾斜角。",
            weapon: "直线参数方程标准形",
            timeRatio: 1.8,
            tags: ["参数方程", "直线", "几何意义", "必考", "核心"]
        ),

        ppProblem(
            id: "pp_008",
            type: .calculation,
            tier: 4,
            formulaIds: ["parametric_line", "chord_length"],
            content: "直线 x=1+(√2/2)t, y=(√2/2)t 与圆 x²+y²=4 交于 A,B 两点, 求弦长 |AB|。",
            contentLatex: #"l:\ x=1+\tfrac{\sqrt2}{2}t,y=\tfrac{\sqrt2}{2}t;\ x^2+y^2=4"#,
            answer: "√14",
            difficulty: 0.62,
            averageTime: 140,
            hints: ["代入圆方程得关于t的二次", "韦达定理", "|AB|=|t₁-t₂|"],
            standardSteps: [
                ppStep(1, "代入", #"\left(1+\tfrac{\sqrt2}{2}t\right)^2+\left(\tfrac{\sqrt2}{2}t\right)^2=4"#),
                ppStep(2, "整理", #"t^2+\sqrt2\,t-3=0"#),
                ppStep(3, "韦达", #"t_1+t_2=-\sqrt2,\ t_1t_2=-3"#),
                ppStep(4, "弦长", #"|AB|=|t_1-t_2|=\sqrt{(t_1+t_2)^2-4t_1t_2}=\sqrt{2+12}=\sqrt{14}"#)
            ],
            shortcutSteps: [
                ppStep(1, "t几何意义秒杀", #"\text{标准形中}|AB|=|t_1-t_2|=\sqrt{2-4(-3)}=\sqrt{14}"#)
            ],
            keyInsight: "直线参数方程标准形下, 弦长=|t₁-t₂|, 无需求交点坐标。",
            shortcutInsight: "代入后用韦达直接算√((t₁+t₂)²-4t₁t₂)。",
            weapon: "参数t的弦长意义",
            timeRatio: 2.2,
            tags: ["参数方程", "直线", "弦长", "压轴", "核心"]
        ),

        ppProblem(
            id: "pp_009",
            type: .calculation,
            tier: 4,
            formulaIds: ["parametric_line", "midpoint"],
            content: "承上题, 求弦 AB 的中点 M 对应的参数 t 及中点坐标。",
            contentLatex: #"t^2+\sqrt2 t-3=0,\ \text{中点对应}t=?"#,
            answer: "t=-√2/2，中点(1/2,-1/2)",
            difficulty: 0.58,
            averageTime: 110,
            hints: ["中点t=(t₁+t₂)/2", "代回参数方程"],
            standardSteps: [
                ppStep(1, "中点参数", #"t_M=\frac{t_1+t_2}{2}=\frac{-\sqrt2}{2}"#),
                ppStep(2, "代回x", #"x=1+\frac{\sqrt2}{2}\cdot\left(-\frac{\sqrt2}{2}\right)=1-\frac12=\frac12"#),
                ppStep(3, "代回y", #"y=\frac{\sqrt2}{2}\cdot\left(-\frac{\sqrt2}{2}\right)=-\frac12"#),
                ppStep(4, "结论", #"M\left(\frac12,-\frac12\right)"#)
            ],
            shortcutSteps: [
                ppStep(1, "中点t秒杀", #"t_M=\frac{t_1+t_2}{2}=-\frac{\sqrt2}{2}\Rightarrow M\left(\tfrac12,-\tfrac12\right)"#)
            ],
            keyInsight: "弦中点对应参数为两根之和的一半。",
            shortcutInsight: "t_M=(t₁+t₂)/2代回参数方程即得中点。",
            weapon: "参数t的中点意义",
            timeRatio: 2.0,
            tags: ["参数方程", "直线", "中点", "压轴"]
        ),

        ppProblem(
            id: "pp_010",
            type: .calculation,
            tier: 4,
            formulaIds: ["polar_distance"],
            content: "极坐标系中, 两点 A(2, π/3), B(2, 2π/3), 求 |AB|。",
            contentLatex: #"A(2,\tfrac\pi3),B(2,\tfrac{2\pi}3),\ |AB|=?"#,
            answer: "2",
            difficulty: 0.52,
            averageTime: 100,
            hints: ["极坐标两点距离公式", "|AB|²=ρ₁²+ρ₂²-2ρ₁ρ₂cos(θ₁-θ₂)"],
            standardSteps: [
                ppStep(1, "距离公式", #"|AB|^2=\rho_1^2+\rho_2^2-2\rho_1\rho_2\cos(\theta_1-\theta_2)"#),
                ppStep(2, "代入", #"=4+4-2\cdot4\cos\left(\frac{2\pi}3-\frac\pi3\right)=8-8\cos\frac\pi3"#),
                ppStep(3, "计算", #"=8-8\cdot\frac12=4\Rightarrow|AB|=2"#)
            ],
            shortcutSteps: [
                ppStep(1, "余弦定理秒杀", #"|AB|^2=8-8\cdot\tfrac12=4\Rightarrow|AB|=2"#)
            ],
            keyInsight: "极坐标两点距离本质是△OAB中的余弦定理。",
            shortcutInsight: "直接套|AB|²=ρ₁²+ρ₂²-2ρ₁ρ₂cosΔθ。",
            weapon: "极坐标距离公式",
            timeRatio: 2.0,
            tags: ["极坐标", "距离", "余弦定理", "必考"]
        ),

        ppProblem(
            id: "pp_011",
            type: .calculation,
            tier: 4,
            formulaIds: ["polar_area"],
            content: "极坐标系中, O为极点, A(3, π/6), B(4, π/2), 求 △OAB 的面积。",
            contentLatex: #"A(3,\tfrac\pi6),B(4,\tfrac\pi2),\ S_{\triangle OAB}=?"#,
            answer: "3√3",
            difficulty: 0.54,
            averageTime: 110,
            hints: ["S=½ρ₁ρ₂sin(θ₂-θ₁)", "夹角=π/2-π/6=π/3"],
            standardSteps: [
                ppStep(1, "面积公式", #"S=\frac12\rho_1\rho_2\sin(\theta_2-\theta_1)"#),
                ppStep(2, "代入", #"=\frac12\cdot3\cdot4\cdot\sin\left(\frac\pi2-\frac\pi6\right)=6\sin\frac\pi3"#),
                ppStep(3, "计算", #"=6\cdot\frac{\sqrt3}2=3\sqrt3"#)
            ],
            shortcutSteps: [
                ppStep(1, "极坐标面积秒杀", #"S=\frac12\cdot3\cdot4\sin\frac\pi3=3\sqrt3"#)
            ],
            keyInsight: "以极点为顶点的三角形面积=½·两极径·夹角正弦。",
            shortcutInsight: "夹角取θ之差, 直接代面积公式。",
            weapon: "极坐标三角形面积",
            timeRatio: 2.0,
            tags: ["极坐标", "面积", "压轴"]
        ),

        ppProblem(
            id: "pp_012",
            type: .calculation,
            tier: 4,
            formulaIds: ["parametric_eliminate"],
            content: "将参数方程 x=t+1/t, y=t-1/t (t为参数, t≠0) 化为普通方程。",
            contentLatex: #"\begin{cases}x=t+\frac1t\\y=t-\frac1t\end{cases}\to?"#,
            answer: "x²-y²=4",
            difficulty: 0.60,
            averageTime: 120,
            hints: ["平方作差", "(t+1/t)²-(t-1/t)²=4"],
            standardSteps: [
                ppStep(1, "平方", #"x^2=t^2+2+\frac1{t^2},\ y^2=t^2-2+\frac1{t^2}"#),
                ppStep(2, "作差", #"x^2-y^2=4"#)
            ],
            shortcutSteps: [
                ppStep(1, "平方差恒等秒杀", #"(t+\tfrac1t)^2-(t-\tfrac1t)^2=4\Rightarrow x^2-y^2=4"#)
            ],
            keyInsight: "含t与1/t的参数方程常用平方作差消参。",
            shortcutInsight: "利用(a+b)²-(a-b)²=4ab直接消去。",
            weapon: "参数方程消参(平方差)",
            timeRatio: 2.0,
            tags: ["参数方程", "消参", "双曲线", "压轴"]
        ),

        ppProblem(
            id: "pp_013",
            type: .calculation,
            tier: 4,
            formulaIds: ["polar_line_circle", "chord_length"],
            content: "极坐标系中, 圆 ρ=4cosθ 与直线 θ=π/4 (ρ∈R) 相交, 求弦长。",
            contentLatex: #"\rho=4\cos\theta\ \text{与}\ \theta=\tfrac\pi4,\ \text{弦长}=?"#,
            answer: "2√2",
            difficulty: 0.64,
            averageTime: 140,
            hints: ["圆化直角(x-2)²+y²=4", "直线θ=π/4即y=x", "弦长=2√(r²-d²)"],
            standardSteps: [
                ppStep(1, "圆化直角", #"\rho=4\cos\theta\Rightarrow(x-2)^2+y^2=4,\ \text{圆心}(2,0),r=2"#),
                ppStep(2, "直线", #"\theta=\frac\pi4\Rightarrow y=x"#),
                ppStep(3, "圆心到线距", #"d=\frac{|2-0|}{\sqrt2}=\sqrt2"#),
                ppStep(4, "弦长", #"2\sqrt{r^2-d^2}=2\sqrt{4-2}=2\sqrt2"#)
            ],
            shortcutSteps: [
                ppStep(1, "化直角+垂径秒杀", #"d=\sqrt2,\ L=2\sqrt{4-2}=2\sqrt2"#)
            ],
            keyInsight: "极坐标的直线圆相交先化直角, 再用垂径定理。",
            shortcutInsight: "圆心到直线距离配合弦长公式一步出。",
            weapon: "极坐标化直角+垂径",
            timeRatio: 2.2,
            tags: ["极坐标", "直线与圆", "弦长", "压轴", "核心"]
        ),

        ppProblem(
            id: "pp_014",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["parametric_ellipse", "linear_max"],
            content: "椭圆 x=2cosφ, y=sinφ (φ为参数), 求 x+2y 的最大值。",
            contentLatex: #"x=2\cos\varphi,y=\sin\varphi,\ (x+2y)_{\max}=?"#,
            answer: "2√2",
            difficulty: 0.60,
            averageTime: 120,
            hints: ["代入x+2y", "辅助角公式", "2cosφ+2sinφ"],
            standardSteps: [
                ppStep(1, "代入", #"x+2y=2\cos\varphi+2\sin\varphi"#),
                ppStep(2, "辅助角", #"=2\sqrt2\sin\left(\varphi+\frac\pi4\right)"#),
                ppStep(3, "最大值", #"=2\sqrt2"#)
            ],
            shortcutSteps: [
                ppStep(1, "参数法辅助角秒杀", #"2\cos\varphi+2\sin\varphi\le2\sqrt2"#)
            ],
            keyInsight: "椭圆上线性表达式的最值用参数方程化为辅助角形式。",
            shortcutInsight: "acosφ+bsinφ的最大值=√(a²+b²)。",
            weapon: "参数法+辅助角",
            timeRatio: 2.2,
            tags: ["参数方程", "椭圆", "最值", "压轴"]
        ),

        ppProblem(
            id: "pp_015",
            type: .calculation,
            tier: 5,
            formulaIds: ["parametric_ellipse", "distance_max"],
            content: "椭圆 x=2cosφ, y=sinφ 上的点到直线 x+2y-8=0 的距离, 求最大值。",
            contentLatex: #"x=2\cos\varphi,y=\sin\varphi,\ \max d(P,\ x+2y-8=0)"#,
            answer: "(8+2√2)√5/5",
            difficulty: 0.74,
            averageTime: 180,
            hints: ["d=|2cosφ+2sinφ-8|/√5", "2cosφ+2sinφ∈[-2√2,2√2]", "取使分子最大"],
            standardSteps: [
                ppStep(1, "距离表达式", #"d=\frac{|2\cos\varphi+2\sin\varphi-8|}{\sqrt5}"#),
                ppStep(2, "辅助角范围", #"2\cos\varphi+2\sin\varphi=2\sqrt2\sin(\varphi+\tfrac\pi4)\in[-2\sqrt2,2\sqrt2]"#),
                ppStep(3, "分子最大", #"\text{因}2\sqrt2<8,\ |\cdots-8|_{\max}=8+2\sqrt2"#),
                ppStep(4, "最大距离", #"d_{\max}=\frac{8+2\sqrt2}{\sqrt5}=\frac{(8+2\sqrt2)\sqrt5}{5}"#)
            ],
            shortcutSteps: [
                ppStep(1, "参数法秒杀", #"d_{\max}=\frac{8+2\sqrt2}{\sqrt5}=\frac{(8+2\sqrt2)\sqrt5}{5}"#)
            ],
            keyInsight: "椭圆上点到定直线的距离用参数代入后转化为三角函数最值。",
            shortcutInsight: "分子内三角部分有界, 距离最值在其取端点时达到。",
            weapon: "参数法求距离最值",
            timeRatio: 2.4,
            tags: ["参数方程", "椭圆", "距离最值", "压轴"]
        ),

        ppProblem(
            id: "pp_016",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["parametric_circle", "range"],
            content: "已知圆 x=1+2cosθ, y=2+2sinθ (θ为参数), 求 x+y 的取值范围。",
            contentLatex: #"x=1+2\cos\theta,y=2+2\sin\theta,\ x+y\in?"#,
            answer: "[3-2√2, 3+2√2]",
            difficulty: 0.58,
            averageTime: 110,
            hints: ["x+y=3+2cosθ+2sinθ", "辅助角", "正弦范围[-1,1]"],
            standardSteps: [
                ppStep(1, "代入", #"x+y=3+2\cos\theta+2\sin\theta"#),
                ppStep(2, "辅助角", #"=3+2\sqrt2\sin\left(\theta+\frac\pi4\right)"#),
                ppStep(3, "范围", #"\in[3-2\sqrt2,\ 3+2\sqrt2]"#)
            ],
            shortcutSteps: [
                ppStep(1, "辅助角范围秒杀", #"3\pm2\sqrt2"#)
            ],
            keyInsight: "圆上线性表达式取值范围用参数代入化辅助角求界。",
            shortcutInsight: "常数±√(系数平方和)即上下界。",
            weapon: "参数法+辅助角",
            timeRatio: 2.0,
            tags: ["参数方程", "圆", "范围", "核心"]
        ),

        ppProblem(
            id: "pp_017",
            type: .calculation,
            tier: 3,
            formulaIds: ["polar_ray", "polar_curve"],
            content: "极坐标系中, 射线 θ=π/3 (ρ≥0) 与曲线 ρ=4cosθ 的交点(非极点)的极径 ρ。",
            contentLatex: #"\theta=\tfrac\pi3(\rho\ge0)\ \text{与}\ \rho=4\cos\theta,\ \rho=?"#,
            answer: "2",
            difficulty: 0.44,
            averageTime: 80,
            hints: ["把θ=π/3代入曲线", "ρ=4cos(π/3)"],
            standardSteps: [
                ppStep(1, "代入", #"\rho=4\cos\frac\pi3=4\cdot\frac12=2"#),
                ppStep(2, "结论", #"\text{交点极径}\rho=2"#)
            ],
            shortcutSteps: [
                ppStep(1, "直接代角秒杀", #"\rho=4\cos\frac\pi3=2"#)
            ],
            keyInsight: "射线与极坐标曲线的交点把θ值直接代入曲线方程求ρ。",
            shortcutInsight: "代θ=π/3即得ρ=2。",
            weapon: "极坐标代入求交",
            timeRatio: 1.7,
            tags: ["极坐标", "射线", "交点"]
        ),

        ppProblem(
            id: "pp_018",
            type: .calculation,
            tier: 3,
            formulaIds: ["parametric_line", "eliminate"],
            content: "将直线参数方程 x=2-t, y=1+t (t为参数) 化为普通方程。",
            contentLatex: #"\begin{cases}x=2-t\\y=1+t\end{cases}\to?"#,
            answer: "x+y=3",
            difficulty: 0.36,
            averageTime: 60,
            hints: ["两式相加消t"],
            standardSteps: [
                ppStep(1, "相加消t", #"x+y=(2-t)+(1+t)=3"#)
            ],
            shortcutSteps: [
                ppStep(1, "相加秒杀", #"x+y=3"#)
            ],
            keyInsight: "直线参数方程消参可用加减直接消去t。",
            shortcutInsight: "两式相加t正好抵消。",
            weapon: "参数方程消参",
            timeRatio: 1.5,
            tags: ["参数方程", "直线", "消参", "必考"]
        ),

        ppProblem(
            id: "pp_019",
            type: .calculation,
            tier: 4,
            formulaIds: ["polar_rectangular", "circle"],
            content: "将极坐标方程 ρ=2cosθ+4sinθ 化为直角坐标方程, 并求圆心与半径。",
            contentLatex: #"\rho=2\cos\theta+4\sin\theta\to?"#,
            answer: "(x-1)²+(y-2)²=5，圆心(1,2)半径√5",
            difficulty: 0.58,
            averageTime: 120,
            hints: ["两边乘ρ", "ρ²=x²+y²,ρcosθ=x,ρsinθ=y", "配方"],
            standardSteps: [
                ppStep(1, "乘ρ", #"\rho^2=2\rho\cos\theta+4\rho\sin\theta"#),
                ppStep(2, "代换", #"x^2+y^2=2x+4y"#),
                ppStep(3, "配方", #"(x-1)^2+(y-2)^2=5"#),
                ppStep(4, "结论", #"\text{圆心}(1,2),\ r=\sqrt5"#)
            ],
            shortcutSteps: [
                ppStep(1, "ρ=2a cosθ+2b sinθ模型秒杀", #"\text{圆心}(a,b)=(1,2),\ r=\sqrt{a^2+b^2}=\sqrt5"#)
            ],
            keyInsight: "ρ=2a cosθ+2b sinθ表示过极点、圆心(a,b)的圆。",
            shortcutInsight: "圆心(1,2), 半径√(1²+2²)=√5, 直接读。",
            weapon: "极坐标圆模型",
            timeRatio: 2.0,
            tags: ["极坐标", "坐标互化", "圆", "压轴"]
        ),

        ppProblem(
            id: "pp_020",
            type: .calculation,
            tier: 5,
            formulaIds: ["parametric_line", "product_of_t"],
            content: "直线 x=1+(√2/2)t, y=2+(√2/2)t (t为参数) 过点 M(1,2), 与圆 x²+y²=10 交于 A,B, 求 |MA|·|MB|。",
            contentLatex: #"l:\ x=1+\tfrac{\sqrt2}2 t,y=2+\tfrac{\sqrt2}2 t;\ x^2+y^2=10,\ |MA|\cdot|MB|=?"#,
            answer: "5",
            difficulty: 0.72,
            averageTime: 160,
            hints: ["代入圆得t的二次", "|MA|·|MB|=|t₁t₂|", "韦达定理"],
            standardSteps: [
                ppStep(1, "代入", #"\left(1+\tfrac{\sqrt2}2 t\right)^2+\left(2+\tfrac{\sqrt2}2 t\right)^2=10"#),
                ppStep(2, "整理", #"t^2+3\sqrt2\,t-5=0"#),
                ppStep(3, "韦达", #"t_1t_2=-5"#),
                ppStep(4, "结论", #"|MA|\cdot|MB|=|t_1t_2|=5"#)
            ],
            shortcutSteps: [
                ppStep(1, "t积几何意义秒杀", #"M\text{在标准形定点},\ |MA||MB|=|t_1t_2|=5"#)
            ],
            keyInsight: "直线参数方程标准形下, |MA|·|MB|=|t₁t₂|(M为定点)。",
            shortcutInsight: "代入后由韦达定理t₁t₂的绝对值直接给出距离之积。",
            weapon: "参数t的乘积意义",
            timeRatio: 2.3,
            tags: ["参数方程", "直线", "几何意义", "压轴", "核心"]
        )
    ]

    // MARK: - 工厂方法
    private static func ppStep(_ order: Int, _ description: String, _ latex: String, _ annotation: String = "") -> SolutionStep {
        SolutionStep(order: order, description: description, latex: latex, annotation: annotation)
    }

    private static func ppProblem(
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
        commonMistakes: [String] = ["极角象限判断错", "直线参数方程方向系数未单位化就用|t|当距离", "极坐标化直角忘记乘ρ"]
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
