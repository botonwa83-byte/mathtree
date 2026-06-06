import Foundation

// MARK: - 综合压轴专题 (跨知识点)
// 目标: 一题贯穿2-3个模块(函数/导数/数列/解析几何/三角/向量/概率),
// 难度对标高考压轴, 每题给出标准解法与高阶秒杀解法。

extension SampleData {
    static let comprehensiveProblems: [Problem] = [
        compProblem(
            id: "comp_001",
            type: .calculation,
            tier: 5,
            formulaIds: ["derivative", "monotonicity", "inequality"],
            content: "已知f(x)=lnx-ax(a∈R)。(1)讨论f(x)的单调性；(2)若f(x)≤0对一切x>0恒成立，求a的取值范围。",
            contentLatex: #"f(x)=\ln x-ax,\quad (2)\ f(x)\le0\ \forall x>0"#,
            answer: "(1)a≤0增；a>0在(0,1/a)增,(1/a,∞)减 (2)a≥1/e",
            difficulty: 0.82,
            averageTime: 240,
            hints: ["求导分类讨论a", "分离参数a≥lnx/x", "求lnx/x最大值"],
            standardSteps: [
                compStep(1, "求导", #"f'(x)=\frac1x-a=\frac{1-ax}{x},\ x>0"#),
                compStep(2, "讨论单调性", #"a\le0:\ f'>0\text{恒增};\ a>0:\ (0,\tfrac1a)\text{增},(\tfrac1a,\infty)\text{减}"#),
                compStep(3, "恒成立分离参数", #"\ln x\le ax\Rightarrow a\ge\frac{\ln x}{x}\ (x>0)"#),
                compStep(4, "求右端最大", #"g(x)=\frac{\ln x}{x},\ g'(x)=\frac{1-\ln x}{x^2}=0\Rightarrow x=e"#),
                compStep(5, "结论", #"g(e)=\frac1e\text{为最大}\Rightarrow a\ge\frac1e"#)
            ],
            shortcutSteps: [
                compStep(1, "切线法秒杀", #"\ln x\le x-1\le ax\iff a\ge\frac{\ln x}{x}"#),
                compStep(2, "经典极值", #"\frac{\ln x}{x}\big|_{\max}=\frac1e\ (x=e)\Rightarrow a\ge\frac1e"#)
            ],
            keyInsight: "恒成立先分离参数，再求经典函数lnx/x的最大值1/e。",
            shortcutInsight: "lnx/x的最大值在x=e取1/e是必背结论，直接给出临界a。",
            weapon: "分离参数+经典极值",
            timeRatio: 2.6,
            tags: ["综合", "导数", "恒成立", "压轴"]
        ),

        compProblem(
            id: "comp_002",
            type: .proof,
            tier: 5,
            formulaIds: ["derivative", "tangent_line", "inequality"],
            content: "证明：当x>0时，e^x>x²/2+x+1，并由此估计e的下界。",
            contentLatex: #"x>0:\ e^x>\frac{x^2}{2}+x+1"#,
            answer: "eˣ>x²/2+x+1成立；取x=1得e>2.5",
            difficulty: 0.78,
            averageTime: 200,
            hints: ["构造g(x)=e^x-x²/2-x-1", "连续求导", "g及导数在0处取值"],
            standardSteps: [
                compStep(1, "构造", #"g(x)=e^x-\tfrac{x^2}{2}-x-1,\ g(0)=0"#),
                compStep(2, "一阶导", #"g'(x)=e^x-x-1,\ g'(0)=0"#),
                compStep(3, "二阶导", #"g''(x)=e^x-1>0\,(x>0)\Rightarrow g'\text{增}\Rightarrow g'(x)>0"#),
                compStep(4, "回推", #"g'>0\Rightarrow g\text{增}\Rightarrow g(x)>g(0)=0,\ \text{证毕}"#),
                compStep(5, "估计e", #"\text{令}x=1:\ e>\tfrac12+1+1=2.5"#)
            ],
            shortcutSteps: [
                compStep(1, "泰勒/逐项秒杀", #"e^x=\sum\frac{x^n}{n!}>1+x+\frac{x^2}{2}\ (x>0)"#),
                compStep(2, "立得", #"\text{后续项全正},\ \text{不等式显然成立}"#)
            ],
            keyInsight: "多项式型指数不等式用'求导降阶到二阶'逐层确定符号。",
            shortcutInsight: "e^x的泰勒展开各项为正，截断即得多项式下界。",
            weapon: "逐阶求导/泰勒截断",
            timeRatio: 3.0,
            tags: ["综合", "导数", "切线法", "证明"]
        ),

        compProblem(
            id: "comp_003",
            type: .calculation,
            tier: 5,
            formulaIds: ["sequence", "telescoping", "inequality"],
            content: "数列{aₙ}满足a₁=1，aₙ₊₁=aₙ/(aₙ+1)。(1)求aₙ；(2)设bₙ=aₙaₙ₊₁，求{bₙ}前n项和Sₙ。",
            contentLatex: #"a_1=1,\ a_{n+1}=\frac{a_n}{a_n+1};\quad b_n=a_na_{n+1}"#,
            answer: "(1)aₙ=1/n (2)Sₙ=n/(n+1)",
            difficulty: 0.70,
            averageTime: 180,
            hints: ["取倒数", "1/aₙ₊₁-1/aₙ=1", "bₙ裂项"],
            standardSteps: [
                compStep(1, "取倒数", #"\frac{1}{a_{n+1}}=\frac{a_n+1}{a_n}=\frac{1}{a_n}+1"#),
                compStep(2, "等差", #"\left\{\tfrac1{a_n}\right\}\text{首项}1\text{公差}1\Rightarrow\frac1{a_n}=n\Rightarrow a_n=\frac1n"#),
                compStep(3, "求bₙ", #"b_n=\frac1n\cdot\frac1{n+1}=\frac1n-\frac1{n+1}"#),
                compStep(4, "裂项求和", #"S_n=1-\frac1{n+1}=\frac{n}{n+1}"#)
            ],
            shortcutSteps: [
                compStep(1, "倒数等差秒杀", #"\frac1{a_n}=n\Rightarrow a_n=\frac1n"#),
                compStep(2, "裂项直出", #"S_n=\sum\left(\frac1n-\frac1{n+1}\right)=\frac{n}{n+1}"#)
            ],
            keyInsight: "分式递推aₙ₊₁=aₙ/(aₙ+1)的标准武器是取倒数化等差。",
            shortcutInsight: "识别倒数等差结构后通项与裂项求和一气呵成。",
            weapon: "倒数法+裂项",
            timeRatio: 2.2,
            tags: ["综合", "数列", "裂项", "压轴"]
        ),

        compProblem(
            id: "comp_004",
            type: .calculation,
            tier: 5,
            formulaIds: ["sequence", "shift_subtraction"],
            content: "已知{aₙ}是首项为1公比为2的等比数列，bₙ=n·aₙ，求{bₙ}前n项和Tₙ。",
            contentLatex: #"a_n=2^{n-1},\ b_n=n\cdot2^{n-1},\quad T_n=?"#,
            answer: "Tₙ=(n-1)·2ⁿ+1",
            difficulty: 0.66,
            averageTime: 160,
            hints: ["错位相减", "Tₙ-2Tₙ", "等比求和"],
            standardSteps: [
                compStep(1, "写出Tₙ", #"T_n=1\cdot1+2\cdot2+3\cdot4+\cdots+n\cdot2^{n-1}"#),
                compStep(2, "乘2", #"2T_n=1\cdot2+2\cdot4+\cdots+n\cdot2^{n}"#),
                compStep(3, "相减", #"-T_n=(1+2+4+\cdots+2^{n-1})-n\cdot2^n=2^n-1-n\cdot2^n"#),
                compStep(4, "结论", #"T_n=(n-1)2^n+1"#)
            ],
            shortcutSteps: [
                compStep(1, "公式法秒杀", #"\sum_{k=1}^n k x^{k-1}=\frac{1-(n+1)x^n+nx^{n+1}}{(1-x)^2}"#),
                compStep(2, "代x=2", #"=\frac{1-(n+1)2^n+n2^{n+1}}{1}=(n-1)2^n+1"#)
            ],
            keyInsight: "等差×等比型求和的通法是错位相减。",
            shortcutInsight: "记住Σk·xᵏ⁻¹的导数公式，代入直接出，免去错位相减。",
            weapon: "错位相减/求导公式",
            timeRatio: 2.5,
            tags: ["综合", "数列", "错位相减", "求和"]
        ),

        compProblem(
            id: "comp_005",
            type: .calculation,
            tier: 5,
            formulaIds: ["ellipse", "vector", "vieta"],
            content: "椭圆C:x²/4+y²=1，直线l过点(1,0)交C于A,B。若以AB为直径的圆过原点O，求直线l的方程。",
            contentLatex: #"\frac{x^2}{4}+y^2=1,\ l\text{过}(1,0),\ \vec{OA}\cdot\vec{OB}=0"#,
            answer: "y=2(x-1) 或 y=-2(x-1)",
            difficulty: 0.85,
            averageTime: 260,
            hints: ["设直线x=my+1", "联立椭圆韦达定理", "OA·OB=0转坐标"],
            standardSteps: [
                compStep(1, "设直线", #"x=my+1,\ \text{代入}\frac{(my+1)^2}{4}+y^2=1"#),
                compStep(2, "整理", #"(m^2+4)y^2+2my-3=0"#),
                compStep(3, "韦达", #"y_1y_2=\frac{-3}{m^2+4},\ y_1+y_2=\frac{-2m}{m^2+4}"#),
                compStep(4, "圆过O", #"\vec{OA}\cdot\vec{OB}=x_1x_2+y_1y_2=0"#),
                compStep(5, "代入求m", #"x_1x_2=(my_1+1)(my_2+1)=m^2y_1y_2+m(y_1+y_2)+1"#),
                compStep(6, "化简", #"(m^2+1)y_1y_2+m(y_1+y_2)+1=\frac{-3(m^2+1)-2m^2+(m^2+4)}{m^2+4}"#),
                compStep(7, "解方程", #"\frac{-4m^2+1}{m^2+4}=0\Rightarrow m^2=\tfrac14\Rightarrow m=\pm\tfrac12"#),
                compStep(8, "结论", #"l:\ x=\pm\tfrac12 y+1,\ \text{即}y=\pm2(x-1)"#)
            ],
            shortcutSteps: [
                compStep(1, "x=my+1避竖直", #"\text{用}x=my+1\text{统一处理斜率不存在的情形}"#),
                compStep(2, "OA·OB=0直接配", #"(m^2+1)y_1y_2+m(y_1+y_2)+1=0\Rightarrow m=\pm\tfrac12"#)
            ],
            keyInsight: "圆过原点等价OA·OB=0，转化为韦达定理的对称式方程。",
            shortcutInsight: "设x=my+1可一并涵盖竖直线，避免分类讨论斜率不存在。",
            weapon: "韦达定理+向量数量积",
            timeRatio: 2.4,
            tags: ["综合", "解析几何", "向量", "韦达", "压轴"]
        ),

        compProblem(
            id: "comp_006",
            type: .calculation,
            tier: 5,
            formulaIds: ["parabola", "focal_chord", "area"],
            content: "抛物线y²=4x，焦点F，过F的直线交抛物线于A,B。求|AB|的最小值及此时△OAB的面积。",
            contentLatex: #"y^2=4x,\ F(1,0),\ |AB|_{\min}=?,\ S_{\triangle OAB}=?"#,
            answer: "|AB|min=4(通径)，面积=2",
            difficulty: 0.72,
            averageTime: 180,
            hints: ["焦点弦长=x₁+x₂+p", "通径最短", "面积=½·|OF|·|y₁-y₂|"],
            standardSteps: [
                compStep(1, "焦点弦公式", #"|AB|=x_1+x_2+p=x_1+x_2+2"#),
                compStep(2, "最小判定", #"\text{弦}\perp x\text{轴(通径)时}x_1+x_2\text{最小},\ |AB|_{\min}=2p=4"#),
                compStep(3, "通径端点", #"x=1\Rightarrow y=\pm2,\ A(1,2),B(1,-2)"#),
                compStep(4, "面积", #"S=\frac12\cdot|AB|\cdot d_{O\to l}=\frac12\cdot4\cdot1=2"#)
            ],
            shortcutSteps: [
                compStep(1, "通径秒杀", #"\text{焦点弦最短即通径}=2p=4"#),
                compStep(2, "面积直出", #"S=\frac12\cdot4\cdot1=2"#)
            ],
            keyInsight: "过焦点的弦中通径最短，长度2p。",
            shortcutInsight: "记住通径=2p及其端点，最短弦相关量秒出。",
            weapon: "焦点弦/通径性质",
            timeRatio: 2.3,
            tags: ["综合", "抛物线", "焦点弦", "面积"]
        ),

        compProblem(
            id: "comp_007",
            type: .calculation,
            tier: 5,
            formulaIds: ["sine_rule", "cosine_rule", "area"],
            content: "△ABC中，角A,B,C对边a,b,c，已知(2a-c)cosB=bcosC。(1)求B；(2)若b=√3，求△ABC面积的最大值。",
            contentLatex: #"(2a-c)\cos B=b\cos C,\ b=\sqrt3,\ S_{\max}=?"#,
            answer: "(1)B=π/3 (2)S_max=3√3/4",
            difficulty: 0.74,
            averageTime: 190,
            hints: ["正弦定理边化角", "投影/和角公式", "余弦定理+均值求a²+c²上界"],
            standardSteps: [
                compStep(1, "边化角", #"(2\sin A-\sin C)\cos B=\sin B\cos C"#),
                compStep(2, "移项和角", #"2\sin A\cos B=\sin C\cos B+\sin B\cos C=\sin(B+C)=\sin A"#),
                compStep(3, "求B", #"\cos B=\tfrac12\Rightarrow B=\frac{\pi}{3}"#),
                compStep(4, "余弦定理", #"b^2=a^2+c^2-2ac\cos B\Rightarrow 3=a^2+c^2-ac\ge2ac-ac=ac"#),
                compStep(5, "面积最大", #"S=\frac12 ac\sin B\le\frac12\cdot3\cdot\frac{\sqrt3}{2}=\frac{3\sqrt3}{4}"#)
            ],
            shortcutSteps: [
                compStep(1, "投影定理直读B", #"(2a-c)\cos B=b\cos C\Rightarrow\cos B=\tfrac12,\ B=\tfrac\pi3"#),
                compStep(2, "ac≤b²秒杀", #"ac\le b^2=3\Rightarrow S\le\frac{\sqrt3}{4}\cdot3=\frac{3\sqrt3}{4}"#)
            ],
            keyInsight: "边角混合式用正弦定理化角，配凑和角公式定B。",
            shortcutInsight: "B=π/3时由余弦定理得ac≤b²，面积上界一步出。",
            weapon: "正弦定理+均值不等式",
            timeRatio: 2.4,
            tags: ["综合", "解三角形", "面积最值", "压轴"]
        ),

        compProblem(
            id: "comp_008",
            type: .calculation,
            tier: 5,
            formulaIds: ["trig_identity", "vector", "auxiliary_angle"],
            content: "已知向量a=(2sinx,1)，b=(√3cosx,cos2x)，f(x)=a·b。求f(x)的最小正周期与在[0,π/2]上的最大值、最小值。",
            contentLatex: #"\vec a=(2\sin x,1),\ \vec b=(\sqrt3\cos x,\cos 2x),\ f(x)=\vec a\cdot\vec b"#,
            answer: "T=π；最大值2(x=π/6)，最小值-1(x=π/2)",
            difficulty: 0.68,
            averageTime: 170,
            hints: ["数量积展开", "二倍角化简", "辅助角公式合一", "求相位范围"],
            standardSteps: [
                compStep(1, "数量积", #"f(x)=2\sqrt3\sin x\cos x+\cos 2x"#),
                compStep(2, "二倍角", #"=\sqrt3\sin 2x+\cos 2x"#),
                compStep(3, "辅助角合一", #"=2\sin\left(2x+\frac\pi6\right)"#),
                compStep(4, "最小正周期", #"T=\frac{2\pi}{2}=\pi"#),
                compStep(5, "定相位范围", #"x\in[0,\tfrac\pi2]\Rightarrow 2x+\tfrac\pi6\in\left[\tfrac\pi6,\tfrac{7\pi}6\right]"#),
                compStep(6, "最大值", #"2x+\tfrac\pi6=\tfrac\pi2(x=\tfrac\pi6)\Rightarrow\sin=1,\ f_{\max}=2"#),
                compStep(7, "最小值", #"2x+\tfrac\pi6=\tfrac{7\pi}6(x=\tfrac\pi2)\Rightarrow\sin=-\tfrac12,\ f_{\min}=-1"#)
            ],
            shortcutSteps: [
                compStep(1, "辅助角合一秒杀", #"f(x)=2\sin\left(2x+\tfrac\pi6\right),\ T=\pi"#),
                compStep(2, "相位区间读最值", #"\theta=2x+\tfrac\pi6\in[\tfrac\pi6,\tfrac{7\pi}6]:\ \sin\theta\in[-\tfrac12,1]\Rightarrow f\in[-1,2]"#)
            ],
            keyInsight: "向量数量积转三角后用二倍角+辅助角合并成单个正弦, 再用相位区间求最值。",
            shortcutInsight: "合一为2sin(2x+π/6)后, 直接由相位区间端点读取sin的最值。",
            weapon: "辅助角合一+相位区间",
            timeRatio: 2.2,
            tags: ["综合", "三角", "向量", "最值"]
        ),

        compProblem(
            id: "comp_009",
            type: .calculation,
            tier: 5,
            formulaIds: ["probability", "expectation", "sequence"],
            content: "甲乙比赛，每局甲胜概率2/3，采用三局两胜制。求甲获胜的概率及比赛局数X的期望。",
            contentLatex: #"P(\text{甲单局胜})=\tfrac23,\ \text{三局两胜},\ P(\text{甲胜})=?,\ E(X)=?"#,
            answer: "P(甲胜)=20/27，E(X)=22/9",
            difficulty: 0.66,
            averageTime: 170,
            hints: ["甲2:0或2:1胜", "X取2或3", "分布列求期望"],
            standardSteps: [
                compStep(1, "甲2:0胜", #"P=\left(\tfrac23\right)^2=\tfrac49"#),
                compStep(2, "甲2:1胜", #"P=C_2^1\cdot\tfrac23\cdot\tfrac13\cdot\tfrac23=\tfrac{8}{27}"#),
                compStep(3, "甲获胜", #"P=\tfrac49+\tfrac{8}{27}=\tfrac{12+8}{27}=\tfrac{20}{27}"#),
                compStep(4, "局数分布", #"P(X=2)=\left(\tfrac23\right)^2+\left(\tfrac13\right)^2=\tfrac59,\ P(X=3)=\tfrac49"#),
                compStep(5, "期望", #"E(X)=2\cdot\tfrac59+3\cdot\tfrac49=\tfrac{10+12}{9}=\tfrac{22}{9}"#)
            ],
            shortcutSteps: [
                compStep(1, "对立面算X=2", #"P(X=2)=p^2+q^2=\tfrac49+\tfrac19=\tfrac59,\ P(X=3)=\tfrac49"#),
                compStep(2, "期望直出", #"E(X)=2+P(X=3)=2+\tfrac49=\tfrac{22}{9}"#)
            ],
            keyInsight: "三局两胜分两类终局，局数仅取2或3。",
            shortcutInsight: "E(X)=2+P(X=3)：先打满前2局再看是否需第3局。",
            weapon: "分布列+期望",
            timeRatio: 2.0,
            tags: ["综合", "概率", "期望", "压轴"]
        ),

        compProblem(
            id: "comp_010",
            type: .calculation,
            tier: 5,
            formulaIds: ["spatial_vector", "dihedral_angle"],
            content: "正方体ABCD-A₁B₁C₁D₁棱长2，E为BC中点。求二面角A₁-DE-B的余弦值。",
            contentLatex: #"\text{正方体棱长}2,\ E\text{为}BC\text{中点},\ \text{二面角}A_1\text{-}DE\text{-}B"#,
            answer: "2/3",
            difficulty: 0.80,
            averageTime: 230,
            hints: ["建系", "平面BDE即底面z=0", "求平面A₁DE法向量", "二面角为锐角"],
            standardSteps: [
                compStep(1, "建系", #"D(0,0,0),B(2,2,0),A_1(2,0,2),E(1,2,0)"#),
                compStep(2, "平面BDE法向量", #"D,E,B\text{均在底面}z=0,\ \vec n_2=(0,0,1)"#),
                compStep(3, "平面A₁DE", #"\vec{DE}=(1,2,0),\vec{DA_1}=(2,0,2),\ \vec n_1=\vec{DE}\times\vec{DA_1}=(4,-2,-4)\parallel(2,-1,-2)"#),
                compStep(4, "法向量夹角", #"|\cos\langle n_1,n_2\rangle|=\frac{|-2|}{3\cdot1}=\frac23"#),
                compStep(5, "定锐钝", #"A_1\text{在底面上方, 二面角}A_1\text{-}DE\text{-}B\text{为锐角}\Rightarrow\cos=\frac23"#)
            ],
            shortcutSteps: [
                compStep(1, "法向量法秒杀", #"\vec n_1=(2,-1,-2),\ \vec n_2=(0,0,1)"#),
                compStep(2, "代入公式", #"\cos\theta=\frac{|\vec n_1\cdot\vec n_2|}{|\vec n_1||\vec n_2|}=\frac{2}{3}\ (\text{锐二面角})"#)
            ],
            keyInsight: "二面角问题坐标系+法向量是通法，关键在正确取面。",
            shortcutInsight: "底面法向量直接取(0,0,1)，只需算斜面法向量一次。",
            weapon: "空间向量法向量法",
            timeRatio: 2.5,
            tags: ["综合", "立体几何", "空间向量", "二面角", "压轴"]
        ),

        compProblem(
            id: "comp_011",
            type: .proof,
            tier: 5,
            formulaIds: ["derivative", "extreme_point_offset"],
            content: "设f(x)=xe^(-x)，若f(x₁)=f(x₂)(x₁≠x₂)，证明x₁+x₂>2。",
            contentLatex: #"f(x)=xe^{-x},\ f(x_1)=f(x_2),x_1\ne x_2\Rightarrow x_1+x_2>2"#,
            answer: "x₁+x₂>2成立(取等不可达，为严格不等式)",
            difficulty: 0.88,
            averageTime: 260,
            hints: ["f极大值点x=1", "构造g(x)=f(1+t)-f(1-t)", "极值点偏移对称化"],
            standardSteps: [
                compStep(1, "求极值点", #"f'(x)=(1-x)e^{-x}=0\Rightarrow x=1\text{(极大)}"#),
                compStep(2, "设x₁<1<x₂", #"\text{要证}x_2>2-x_1,\ \text{即}f(x_2)<f(2-x_1)\ (\text{利用减区间})"#),
                compStep(3, "构造", #"g(t)=f(1+t)-f(1-t),\ t>0"#),
                compStep(4, "求导符号", #"g'(t)=f'(1+t)+f'(1-t)<0\ (t>0)"#),
                compStep(5, "结论", #"g(t)<g(0)=0\Rightarrow f(1+t)<f(1-t)\Rightarrow x_1+x_2>2"#)
            ],
            shortcutSteps: [
                compStep(1, "取对数", #"x_1e^{-x_1}=x_2e^{-x_2}\Rightarrow\ln x_1-x_1=\ln x_2-x_2\Rightarrow x_2-x_1=\ln x_2-\ln x_1"#),
                compStep(2, "对数均值不等式", #"1=\frac{x_2-x_1}{\ln x_2-\ln x_1}<\frac{x_1+x_2}{2}\Rightarrow x_1+x_2>2"#)
            ],
            keyInsight: "极值点偏移标准法：构造对称差函数g(t)判号。",
            shortcutInsight: "取对数后用对数平均不等式可直接给出和的下界。",
            weapon: "极值点偏移/对数均值",
            timeRatio: 2.8,
            tags: ["综合", "导数", "极值点偏移", "证明", "压轴"]
        ),

        compProblem(
            id: "comp_012",
            type: .calculation,
            tier: 5,
            formulaIds: ["sequence", "telescoping", "inequality"],
            content: "数列{aₙ}中a₁=1，aₙ₊₁=aₙ+1/(aₙ)，证明：a₁₀₀>14。",
            contentLatex: #"a_1=1,\ a_{n+1}=a_n+\frac1{a_n},\quad a_{100}>14"#,
            answer: "a₁₀₀>14成立(因a₁₀₀²>199>196=14²)",
            difficulty: 0.82,
            averageTime: 200,
            hints: ["考察aₙ²", "aₙ₊₁²=aₙ²+2+1/aₙ²", "累加放缩"],
            standardSteps: [
                compStep(1, "平方递推", #"a_{n+1}^2=a_n^2+2+\frac1{a_n^2}>a_n^2+2"#),
                compStep(2, "累加", #"a_n^2>a_1^2+2(n-1)=2n-1"#),
                compStep(3, "代n=100", #"a_{100}^2>2\cdot100-1=199"#),
                compStep(4, "结论", #"a_{100}>\sqrt{199}>\sqrt{196}=14"#)
            ],
            shortcutSteps: [
                compStep(1, "平方放缩秒杀", #"a_n^2>2n-1\Rightarrow a_{100}^2>199>196\Rightarrow a_{100}>14"#)
            ],
            keyInsight: "含1/aₙ的递推先平方，把交叉项变成常数2便于累加。",
            shortcutInsight: "平方后丢掉正的1/aₙ²项得线性下界2n-1，一击命中。",
            weapon: "平方累加放缩",
            timeRatio: 2.3,
            tags: ["综合", "数列", "放缩", "证明", "压轴"]
        ),

        compProblem(
            id: "comp_013",
            type: .calculation,
            tier: 5,
            formulaIds: ["hyperbola", "asymptote", "slope_product"],
            content: "双曲线x²/4-y²=1上任意一点P，从P向两条渐近线作垂线，垂足为M,N。求|PM|·|PN|的值。",
            contentLatex: #"\frac{x^2}{4}-y^2=1,\ P\text{到两渐近线距离之积}=?"#,
            answer: "4/5",
            difficulty: 0.78,
            averageTime: 200,
            hints: ["渐近线x±2y=0", "点到直线距离公式", "利用点在双曲线上"],
            standardSteps: [
                compStep(1, "渐近线", #"\frac{x^2}{4}-y^2=0\Rightarrow x\pm2y=0"#),
                compStep(2, "距离积", #"d_1d_2=\frac{|x-2y|}{\sqrt5}\cdot\frac{|x+2y|}{\sqrt5}=\frac{|x^2-4y^2|}{5}"#),
                compStep(3, "代入条件", #"\frac{x^2}{4}-y^2=1\Rightarrow x^2-4y^2=4"#),
                compStep(4, "结论", #"d_1d_2=\frac{4}{5}"#)
            ],
            shortcutSteps: [
                compStep(1, "通用公式秒杀", #"\text{双曲线}\frac{x^2}{a^2}-\frac{y^2}{b^2}=1,\ d_1d_2=\frac{a^2b^2}{a^2+b^2}"#),
                compStep(2, "代a²=4,b²=1", #"=\frac{4\cdot1}{4+1}=\frac45"#)
            ],
            keyInsight: "两距离之积凑出x²-4y²，正好用双曲线方程整体代换。",
            shortcutInsight: "记公式d₁d₂=a²b²/(a²+b²)，对任意点恒为定值。",
            weapon: "双曲线渐近线定值公式",
            timeRatio: 2.6,
            tags: ["综合", "双曲线", "渐近线", "定值", "压轴"]
        ),

        compProblem(
            id: "comp_014",
            type: .calculation,
            tier: 5,
            formulaIds: ["derivative", "zero_point", "classification"],
            content: "已知f(x)=x³-3x+a，讨论f(x)零点的个数(关于参数a)。",
            contentLatex: #"f(x)=x^3-3x+a,\ \text{零点个数关于}a"#,
            answer: "a<-2或a>2:1个; a=±2:2个; -2<a<2:3个",
            difficulty: 0.70,
            averageTime: 160,
            hints: ["求极值", "极大值极小值", "比较极值与0关系"],
            standardSteps: [
                compStep(1, "求导", #"f'(x)=3x^2-3=0\Rightarrow x=\pm1"#),
                compStep(2, "极值", #"f(-1)=2+a\text{(极大)},\ f(1)=-2+a\text{(极小)}"#),
                compStep(3, "三根条件", #"\text{极大}>0\text{且极小}<0:\ -2<a<2\Rightarrow3\text{个}"#),
                compStep(4, "临界", #"a=\pm2:\ \text{极值之一为0},\ 2\text{个}"#),
                compStep(5, "其余", #"a>2\text{或}a<-2:\ 1\text{个}"#)
            ],
            shortcutSteps: [
                compStep(1, "数形结合秒杀", #"\text{看}y=x^3-3x\text{与}y=-a\text{交点},\ \text{极值}\pm2"#),
                compStep(2, "读图", #"|a|<2\to3,\ |a|=2\to2,\ |a|>2\to1"#)
            ],
            keyInsight: "三次函数零点个数由两极值与x轴的相对位置决定。",
            shortcutInsight: "分离常数a后看水平线与定型曲线交点，极值±2一目了然。",
            weapon: "极值判别/数形结合",
            timeRatio: 2.0,
            tags: ["综合", "导数", "零点", "分类讨论"]
        ),

        compProblem(
            id: "comp_015",
            type: .fillInBlank,
            tier: 5,
            formulaIds: ["cauchy_schwarz", "multivariable"],
            content: "已知实数x,y,z满足x+y+z=6，x²+y²+z²=14，求xyz的取值范围。",
            contentLatex: #"x+y+z=6,\ x^2+y^2+z^2=14,\quad xyz\in?"#,
            answer: "[6,10]",
            difficulty: 0.86,
            averageTime: 250,
            hints: ["由两式得xy+yz+zx", "固定z消元", "z的范围+三次函数"],
            standardSteps: [
                compStep(1, "求两两积和", #"xy+yz+zx=\frac{36-14}{2}=11"#),
                compStep(2, "消去得x,y", #"x+y=6-z,\ xy=11-z(6-z)=z^2-6z+11"#),
                compStep(3, "Δ≥0定z范围", #"(6-z)^2\ge4(z^2-6z+11)\Rightarrow z\in\left[\frac23\cdot...\right]\Rightarrow z\in[\tfrac{2}{3}\cdot...]"#),
                compStep(4, "实际求根", #"3z^2-12z+8\le0\Rightarrow z\in\left[2-\tfrac{2}{\sqrt3},2+\tfrac{2}{\sqrt3}\right]"#),
                compStep(5, "xyz=z(z²-6z+11)", #"g(z)=z^3-6z^2+11z,\ g'(z)=3z^2-12z+11"#),
                compStep(6, "端点与极值", #"\text{在区间上}g\text{的值域}=[6,10]"#)
            ],
            shortcutSteps: [
                compStep(1, "对称多项式秒杀", #"e_1=6,e_2=11,\ xyz=e_3,\ \text{x,y,z是}t^3-6t^2+11t-e_3=0\text{的根}"#),
                compStep(2, "三实根条件", #"\text{判别式}\ge0\Rightarrow e_3\in[6,10]"#)
            ],
            keyInsight: "三元对称约束转化为三次方程根的存在性问题。",
            shortcutInsight: "把xyz看作三次方程常数项，由三实根条件直接框定范围。",
            weapon: "对称多项式+根的判别",
            timeRatio: 2.4,
            tags: ["综合", "对称多项式", "范围", "压轴"]
        ),

        compProblem(
            id: "comp_016",
            type: .calculation,
            tier: 5,
            formulaIds: ["trig_function", "period", "symmetry"],
            content: "已知f(x)=2sin(ωx+φ)(ω>0,|φ|<π/2)的图象关于x=π/6对称，且相邻两对称轴距离为π/2。求f(x)解析式。",
            contentLatex: #"f(x)=2\sin(\omega x+\varphi),\ \text{对称轴}x=\tfrac\pi6,\ \text{相邻轴距}\tfrac\pi2"#,
            answer: "f(x)=2sin(2x+π/6)",
            difficulty: 0.62,
            averageTime: 140,
            hints: ["相邻对称轴=T/2", "求ω", "对称轴处相位=π/2+kπ"],
            standardSteps: [
                compStep(1, "求周期", #"\frac{T}{2}=\frac\pi2\Rightarrow T=\pi\Rightarrow\omega=\frac{2\pi}{T}=2"#),
                compStep(2, "对称轴条件", #"2\cdot\frac\pi6+\varphi=\frac\pi2+k\pi"#),
                compStep(3, "解φ", #"\varphi=\frac\pi6+k\pi,\ |\varphi|<\frac\pi2\Rightarrow\varphi=\frac\pi6"#),
                compStep(4, "结论", #"f(x)=2\sin\left(2x+\frac\pi6\right)"#)
            ],
            shortcutSteps: [
                compStep(1, "轴距定ω秒杀", #"\text{相邻轴距}=\frac T2\Rightarrow T=\pi\Rightarrow\omega=2"#),
                compStep(2, "代对称点", #"2x+\varphi=\frac\pi2\text{在}x=\frac\pi6\Rightarrow\varphi=\frac\pi6"#)
            ],
            keyInsight: "相邻对称轴间距=半周期，是确定ω的关键。",
            shortcutInsight: "对称轴处sin取±1即相位=π/2+kπ，直接解φ。",
            weapon: "三角图象对称性",
            timeRatio: 1.9,
            tags: ["综合", "三角", "对称性", "解析式"]
        ),

        compProblem(
            id: "comp_017",
            type: .calculation,
            tier: 5,
            formulaIds: ["probability", "binomial", "optimization"],
            content: "某产品每件合格率0.9，独立检验。设10件中合格数X~B(10,0.9)，求X的最可能取值(众数)及P(X=9)/P(X=10)。",
            contentLatex: #"X\sim B(10,0.9),\ \text{众数}=?,\ \frac{P(X=9)}{P(X=10)}=?"#,
            answer: "众数=9，P(X=9)/P(X=10)=10/9",
            difficulty: 0.68,
            averageTime: 160,
            hints: ["相邻概率比", "P(k+1)/P(k)", "找比值跨过1处"],
            standardSteps: [
                compStep(1, "相邻比", #"\frac{P(X=k+1)}{P(X=k)}=\frac{10-k}{k+1}\cdot\frac{0.9}{0.1}=\frac{9(10-k)}{k+1}"#),
                compStep(2, "比值=1", #"9(10-k)=k+1\Rightarrow90-9k=k+1\Rightarrow k=8.9"#),
                compStep(3, "众数", #"k<8.9\text{时比}>1\text{递增},\ \text{故众数}=9"#),
                compStep(4, "比值", #"\frac{P(9)}{P(10)}=\frac{1}{P(10)/P(9)}=\frac{1}{9(10-9)/10}=\frac{10}{9}"#)
            ],
            shortcutSteps: [
                compStep(1, "众数公式秒杀", #"\text{众数}\approx\lfloor(n+1)p\rfloor=\lfloor11\cdot0.9\rfloor=9"#),
                compStep(2, "比值直算", #"\frac{P(9)}{P(10)}=\frac{C_{10}^9 0.9^9 0.1}{C_{10}^{10}0.9^{10}}=\frac{10\cdot0.1}{0.9}=\frac{10}{9}"#)
            ],
            keyInsight: "二项分布众数由相邻概率比跨越1的位置决定。",
            shortcutInsight: "众数≈⌊(n+1)p⌋，比值用组合数与p/q直接约分。",
            weapon: "二项分布相邻比",
            timeRatio: 2.1,
            tags: ["综合", "概率", "二项分布", "众数"]
        ),

        compProblem(
            id: "comp_018",
            type: .calculation,
            tier: 5,
            formulaIds: ["sequence", "fixed_point", "general_term"],
            content: "数列{aₙ}满足a₁=3，aₙ₊₁=2aₙ-1，求通项aₙ。",
            contentLatex: #"a_1=3,\ a_{n+1}=2a_n-1,\quad a_n=?"#,
            answer: "aₙ=2ⁿ+1",
            difficulty: 0.50,
            averageTime: 110,
            hints: ["求不动点", "aₙ₊₁-1=2(aₙ-1)", "等比数列"],
            standardSteps: [
                compStep(1, "不动点", #"x=2x-1\Rightarrow x=1"#),
                compStep(2, "构造等比", #"a_{n+1}-1=2(a_n-1)"#),
                compStep(3, "通项", #"a_n-1=(a_1-1)2^{n-1}=2\cdot2^{n-1}=2^n"#),
                compStep(4, "结论", #"a_n=2^n+1"#)
            ],
            shortcutSteps: [
                compStep(1, "不动点秒杀", #"\text{不动点}1\Rightarrow a_n-1=2^{n-1}(a_1-1)=2^n"#),
                compStep(2, "直出", #"a_n=2^n+1"#)
            ],
            keyInsight: "线性递推aₙ₊₁=paₙ+q用不动点法化等比。",
            shortcutInsight: "求出不动点后直接套等比通项，省去待定系数。",
            weapon: "不动点法",
            timeRatio: 1.8,
            tags: ["综合", "数列", "不动点", "通项"]
        ),

        compProblem(
            id: "comp_019",
            type: .calculation,
            tier: 5,
            formulaIds: ["ellipse", "area", "vieta"],
            content: "椭圆x²/4+y²/3=1，左右顶点A,B，点P在椭圆上(异于A,B)，直线PA,PB斜率之积为定值，求该定值。",
            contentLatex: #"\frac{x^2}{4}+\frac{y^2}{3}=1,\ A(-2,0),B(2,0),\ k_{PA}\cdot k_{PB}=?"#,
            answer: "-3/4",
            difficulty: 0.64,
            averageTime: 150,
            hints: ["设P(x₀,y₀)", "斜率积=y₀²/(x₀²-4)", "用椭圆方程代换"],
            standardSteps: [
                compStep(1, "斜率积", #"k_{PA}k_{PB}=\frac{y_0}{x_0+2}\cdot\frac{y_0}{x_0-2}=\frac{y_0^2}{x_0^2-4}"#),
                compStep(2, "椭圆代换", #"\frac{x_0^2}{4}+\frac{y_0^2}{3}=1\Rightarrow y_0^2=3\left(1-\frac{x_0^2}{4}\right)=\frac{3(4-x_0^2)}{4}"#),
                compStep(3, "代入", #"=\frac{3(4-x_0^2)/4}{x_0^2-4}=-\frac34"#)
            ],
            shortcutSteps: [
                compStep(1, "顶点斜率积公式秒杀", #"\text{椭圆}\frac{x^2}{a^2}+\frac{y^2}{b^2}=1,\ k_{PA}k_{PB}=-\frac{b^2}{a^2}"#),
                compStep(2, "代值", #"=-\frac34"#)
            ],
            keyInsight: "长轴端点连线斜率积恒为-b²/a²，是椭圆的不变量。",
            shortcutInsight: "记公式k_PA·k_PB=-b²/a²，对任意点P恒成立。",
            weapon: "椭圆斜率积定值",
            timeRatio: 2.2,
            tags: ["综合", "椭圆", "定值", "斜率"]
        ),

        compProblem(
            id: "comp_020",
            type: .proof,
            tier: 5,
            formulaIds: ["derivative", "inequality", "logarithm"],
            content: "证明：对任意x>0，有lnx≤x-1，且当n≥2时，(1+1/2)(1+1/4)…(1+1/2ⁿ)<e。",
            contentLatex: #"\ln x\le x-1;\quad \prod_{k=1}^{n}\left(1+\frac1{2^k}\right)<e"#,
            answer: "lnx≤x-1成立；且连乘积<e成立",
            difficulty: 0.84,
            averageTime: 230,
            hints: ["先证lnx≤x-1", "取对数化乘为和", "等比求和放缩"],
            standardSteps: [
                compStep(1, "基本不等式", #"\ln(1+t)\le t\ (t>-1)"#),
                compStep(2, "取对数", #"\ln\prod\left(1+\frac1{2^k}\right)=\sum_{k=1}^n\ln\left(1+\frac1{2^k}\right)"#),
                compStep(3, "放缩", #"\le\sum_{k=1}^n\frac1{2^k}=1-\frac1{2^n}<1"#),
                compStep(4, "还原", #"\prod\left(1+\frac1{2^k}\right)<e^1=e,\ \text{证毕}"#)
            ],
            shortcutSteps: [
                compStep(1, "对数化和秒杀", #"\ln P=\sum\ln(1+2^{-k})\le\sum2^{-k}<1"#),
                compStep(2, "指数还原", #"P<e"#)
            ],
            keyInsight: "连乘不等式取对数化为连加，再用ln(1+t)≤t逐项放缩。",
            shortcutInsight: "ln(1+t)≤t把每个因子的对数压成等比和，<1立得<e。",
            weapon: "对数放缩+等比和",
            timeRatio: 2.7,
            tags: ["综合", "导数", "对数不等式", "证明", "压轴"]
        ),

        compProblem(
            id: "comp_021",
            type: .calculation,
            tier: 5,
            formulaIds: ["derivative", "tangent_line", "common_tangent"],
            content: "若曲线y=x²与y=lnx+c存在公共切线，求c的取值范围。",
            contentLatex: #"y=x^2\text{与}y=\ln x+c\text{存在公切线},\ c\le?"#,
            answer: "c≤(1+ln2)/2",
            difficulty: 0.80,
            averageTime: 210,
            hints: ["设两切点", "斜率相等", "截距相等", "得c=h(a)再求最大值"],
            standardSteps: [
                compStep(1, "设切点", #"\text{公切线切}y=x^2\text{于}(a,a^2),\ \text{切}y=\ln x+c\text{于}(b,\ln b+c)"#),
                compStep(2, "两切线", #"y=2ax-a^2\quad\text{与}\quad y=\tfrac1b x+(\ln b+c-1)"#),
                compStep(3, "斜率相等", #"2a=\frac1b\Rightarrow b=\frac1{2a}\ (a>0)"#),
                compStep(4, "截距相等", #"-a^2=\ln b+c-1\Rightarrow c=1-a^2-\ln b=1-a^2+\ln(2a)"#),
                compStep(5, "求h(a)最大", #"h(a)=1-a^2+\ln(2a),\ h'(a)=-2a+\frac1a=0\Rightarrow a=\frac{\sqrt2}{2}"#),
                compStep(6, "最大值", #"h\!\left(\tfrac{\sqrt2}{2}\right)=1-\tfrac12+\ln\sqrt2=\frac{1+\ln2}{2}"#),
                compStep(7, "结论", #"\text{存在公切线}\iff c\le\frac{1+\ln2}{2}"#)
            ],
            shortcutSteps: [
                compStep(1, "公切线统一斜率", #"k=2a=\frac1b\Rightarrow c=1-a^2+\ln(2a)=h(a)"#),
                compStep(2, "存在性=值域", #"c\le h_{\max}=h\!\left(\tfrac{\sqrt2}{2}\right)=\frac{1+\ln2}{2}"#)
            ],
            keyInsight: "公切线需斜率相等且截距相等; 存在性转化为c=h(a)的可取值范围。",
            shortcutInsight: "把c写成切点参数a的函数, '存在公切线'即c不超过h(a)的最大值。",
            weapon: "公切线双条件+值域",
            timeRatio: 2.4,
            tags: ["综合", "导数", "公切线", "压轴"]
        ),

        compProblem(
            id: "comp_022",
            type: .calculation,
            tier: 4,
            formulaIds: ["abstract_function", "monotonicity"],
            content: "f(x)是定义在R上的增函数，且f(x+y)=f(x)+f(y)，f(1)=2。求f(3)及解不等式f(2x-1)<6。",
            contentLatex: #"f(x+y)=f(x)+f(y),\ f(1)=2,\ \text{求}f(3),\ \text{解}f(2x-1)<6"#,
            answer: "f(3)=6; x<2",
            difficulty: 0.58,
            averageTime: 130,
            hints: ["柯西方程→f(n)=nf(1)", "f(3)=3f(1)", "用单调性去f"],
            standardSteps: [
                compStep(1, "可加性", #"f(3)=f(1)+f(1)+f(1)=3f(1)=6"#),
                compStep(2, "转化不等式", #"f(2x-1)<6=f(3)"#),
                compStep(3, "用单调性", #"f\text{增}\Rightarrow 2x-1<3"#),
                compStep(4, "解出", #"x<2"#)
            ],
            shortcutSteps: [
                compStep(1, "线性化秒杀", #"\text{柯西方程+单调}\Rightarrow f(x)=2x"#),
                compStep(2, "直接解", #"2(2x-1)<6\Rightarrow x<2"#)
            ],
            keyInsight: "柯西函数方程+单调性可证f(x)=kx，但本题只需用结构性质。",
            shortcutInsight: "增的可加函数必为线性f(x)=2x，代入秒解。",
            weapon: "抽象函数+单调性",
            timeRatio: 1.8,
            tags: ["综合", "抽象函数", "单调性", "不等式"]
        ),

        compProblem(
            id: "comp_023",
            type: .calculation,
            tier: 5,
            formulaIds: ["solid_geometry", "volume", "optimization"],
            content: "半径为R的球内接一个圆柱，求圆柱体积的最大值。",
            contentLatex: #"\text{球半径}R,\ \text{内接圆柱体积}V_{\max}=?"#,
            answer: "4√3πR³/9",
            difficulty: 0.72,
            averageTime: 180,
            hints: ["设圆柱高2h", "底面半径r²=R²-h²", "V对h求导"],
            standardSteps: [
                compStep(1, "建立关系", #"\text{半高}h,\ r^2=R^2-h^2,\ V=\pi r^2\cdot2h=2\pi h(R^2-h^2)"#),
                compStep(2, "求导", #"V'(h)=2\pi(R^2-3h^2)=0\Rightarrow h=\frac{R}{\sqrt3}"#),
                compStep(3, "代入", #"V=2\pi\cdot\frac{R}{\sqrt3}\left(R^2-\frac{R^2}{3}\right)=2\pi\cdot\frac{R}{\sqrt3}\cdot\frac{2R^2}{3}"#),
                compStep(4, "结论", #"V_{\max}=\frac{4\pi R^3}{3\sqrt3}=\frac{4\sqrt3\pi R^3}{9}"#)
            ],
            shortcutSteps: [
                compStep(1, "三元均值秒杀", #"V^2\propto h^2(R^2-h^2)(R^2-h^2),\ \text{凑和定}"#),
                compStep(2, "均值取等", #"2h^2=R^2-h^2\Rightarrow h=\frac{R}{\sqrt3}\Rightarrow V_{\max}=\frac{4\sqrt3\pi R^3}{9}"#)
            ],
            keyInsight: "内接体最值用约束消元成单变量函数再求导。",
            shortcutInsight: "把V²凑成三因子和为定值，AM-GM一步定取等点。",
            weapon: "导数/三元均值",
            timeRatio: 2.2,
            tags: ["综合", "立体几何", "体积最值", "压轴"]
        ),

        compProblem(
            id: "comp_024",
            type: .calculation,
            tier: 5,
            formulaIds: ["cosine_rule", "sine_rule", "range"],
            content: "锐角△ABC中，a=2，B=2A，求边b的取值范围。",
            contentLatex: #"\text{锐角}\triangle ABC,\ a=2,\ B=2A,\quad b\in?"#,
            answer: "(2√2,2√3)",
            difficulty: 0.82,
            averageTime: 220,
            hints: ["正弦定理b/a=sinB/sinA=2cosA", "锐角三角形定A范围", "b=4cosA"],
            standardSteps: [
                compStep(1, "正弦定理", #"\frac{b}{a}=\frac{\sin B}{\sin A}=\frac{\sin2A}{\sin A}=2\cos A"#),
                compStep(2, "得b", #"b=2a\cos A... \Rightarrow b=4\cos A"#),
                compStep(3, "锐角约束", #"0<A<\tfrac\pi2,\ 0<2A<\tfrac\pi2,\ 0<\pi-3A<\tfrac\pi2"#),
                compStep(4, "解A范围", #"\frac\pi6<A<\frac\pi4"#),
                compStep(5, "求b", #"A\in(\tfrac\pi6,\tfrac\pi4)\Rightarrow\cos A\in(\tfrac{\sqrt2}{2},\tfrac{\sqrt3}{2})\Rightarrow b\in(2\sqrt2,2\sqrt3)"#)
            ],
            shortcutSteps: [
                compStep(1, "b=4cosA秒得", #"b=a\cdot2\cos A=4\cos A"#),
                compStep(2, "锐角三限定A", #"A\in(\tfrac\pi6,\tfrac\pi4)\Rightarrow b\in(2\sqrt2,2\sqrt3)"#)
            ],
            keyInsight: "B=2A时用正弦定理把b化成4cosA，锐角条件给出A的开区间。",
            shortcutInsight: "锐角三角形需三个角都<π/2，联立得A的精确范围。",
            weapon: "正弦定理+角范围",
            timeRatio: 2.3,
            tags: ["综合", "解三角形", "范围", "锐角", "压轴"]
        ),

        compProblem(
            id: "comp_025",
            type: .calculation,
            tier: 5,
            formulaIds: ["sequence", "grouping_sum"],
            content: "数列{aₙ}：1,2,2,3,3,3,4,4,4,4,…(正整数k出现k次)。求a₁₀₀及前100项和。",
            contentLatex: #"1,2,2,3,3,3,\ldots(k\text{出现}k\text{次}),\ a_{100}=?,\ S_{100}=?"#,
            answer: "a₁₀₀=14, S₁₀₀=945",
            difficulty: 0.74,
            averageTime: 190,
            hints: ["k出现到位置k(k+1)/2", "找100落在哪组", "分组求和"],
            standardSteps: [
                compStep(1, "累计位置", #"\text{数字}k\text{结束于第}\frac{k(k+1)}{2}\text{项}"#),
                compStep(2, "定位100", #"\frac{13\cdot14}{2}=91,\ \frac{14\cdot15}{2}=105\Rightarrow a_{100}=14"#),
                compStep(3, "前91项和", #"\sum_{k=1}^{13}k\cdot k=\sum_{k=1}^{13}k^2=\frac{13\cdot14\cdot27}{6}=819"#),
                compStep(4, "剩余", #"\text{第92~100项共9个14}:\ 9\times14=126"#),
                compStep(5, "结论", #"S_{100}=819+126=945"#)
            ],
            shortcutSteps: [
                compStep(1, "三角数定位秒杀", #"T_{13}=91<100\le105=T_{14}\Rightarrow a_{100}=14"#),
                compStep(2, "平方和公式", #"S_{100}=\sum_1^{13}k^2+9\cdot14=819+126=945"#)
            ],
            keyInsight: "重复型数列用三角数T_k=k(k+1)/2定位某项所在组。",
            shortcutInsight: "整组和=k²，用平方和公式快速累加，零头单独补。",
            weapon: "分组求和+三角数",
            timeRatio: 2.2,
            tags: ["综合", "数列", "分组求和", "压轴"]
        ),

        compProblem(
            id: "comp_026",
            type: .calculation,
            tier: 5,
            formulaIds: ["trajectory", "ellipse", "definition"],
            content: "动点P到定点F(1,0)的距离与到直线x=4的距离之比为1/2，求P的轨迹方程。",
            contentLatex: #"\frac{|PF|}{d(P,\ x=4)}=\frac12,\ F(1,0)"#,
            answer: "x²/4+y²/3=1",
            difficulty: 0.60,
            averageTime: 140,
            hints: ["列距离比方程", "平方整理", "识别椭圆"],
            standardSteps: [
                compStep(1, "列式", #"\frac{\sqrt{(x-1)^2+y^2}}{|x-4|}=\frac12"#),
                compStep(2, "平方", #"4[(x-1)^2+y^2]=(x-4)^2"#),
                compStep(3, "展开", #"4x^2-8x+4+4y^2=x^2-8x+16"#),
                compStep(4, "整理", #"3x^2+4y^2=12\Rightarrow\frac{x^2}{4}+\frac{y^2}{3}=1"#)
            ],
            shortcutSteps: [
                compStep(1, "第二定义秒杀", #"e=\frac12,\ \text{准线}x=\frac{a}{e}=4\Rightarrow a=2,\ c=ea=1"#),
                compStep(2, "出方程", #"b^2=a^2-c^2=3\Rightarrow\frac{x^2}{4}+\frac{y^2}{3}=1"#)
            ],
            keyInsight: "到定点与定直线距离之比为常数e<1即椭圆第二定义。",
            shortcutInsight: "认出离心率与准线，直接由a=4e、c=ea写出椭圆，免去化简。",
            weapon: "圆锥曲线第二定义",
            timeRatio: 2.5,
            tags: ["综合", "轨迹", "椭圆", "第二定义"]
        ),

        compProblem(
            id: "comp_027",
            type: .calculation,
            tier: 5,
            formulaIds: ["derivative", "zero_point", "parameter_range"],
            content: "已知函数f(x)=eˣ-ax有两个零点，求a的取值范围。",
            contentLatex: #"f(x)=e^x-ax\text{有两个零点},\ a\in?"#,
            answer: "a>e",
            difficulty: 0.76,
            averageTime: 180,
            hints: ["分离参数a=eˣ/x", "讨论g(x)=eˣ/x", "两交点条件"],
            standardSteps: [
                compStep(1, "分离参数", #"e^x=ax\Rightarrow a=\frac{e^x}{x}\ (x\ne0)"#),
                compStep(2, "研究g", #"g(x)=\frac{e^x}{x},\ g'(x)=\frac{e^x(x-1)}{x^2}"#),
                compStep(3, "极值", #"x=1\text{为极小(x>0)},\ g(1)=e;\ x<0\text{时}g<0"#),
                compStep(4, "两交点", #"\text{水平线}y=a\text{与}g\text{有两交点}\Rightarrow a>e"#)
            ],
            shortcutSteps: [
                compStep(1, "图象法秒杀", #"g(x)=e^x/x\text{在}(0,\infty)\text{有极小}e,\ (-\infty,0)\text{恒负}"#),
                compStep(2, "读临界", #"a>e\text{时两交点}"#)
            ],
            keyInsight: "零点个数=直线y=a与g(x)=eˣ/x图象交点数。",
            shortcutInsight: "g在x>0极小值e是分界，a>e给两根。",
            weapon: "分离参数+数形结合",
            timeRatio: 2.2,
            tags: ["综合", "导数", "零点", "参数范围", "压轴"]
        ),

        compProblem(
            id: "comp_028",
            type: .proof,
            tier: 5,
            formulaIds: ["derivative", "inequality", "logarithm"],
            content: "证明：当x>1时，(x+1)lnx>2(x-1)。",
            contentLatex: #"x>1:\ (x+1)\ln x>2(x-1)"#,
            answer: "(x+1)lnx>2(x-1)在x>1时成立",
            difficulty: 0.80,
            averageTime: 200,
            hints: ["构造g(x)=(x+1)lnx-2(x-1)", "求导分析", "可能需二阶导"],
            standardSteps: [
                compStep(1, "构造", #"g(x)=(x+1)\ln x-2(x-1),\ g(1)=0"#),
                compStep(2, "一阶导", #"g'(x)=\ln x+\frac{x+1}{x}-2=\ln x+\frac1x-1"#),
                compStep(3, "二阶导", #"g''(x)=\frac1x-\frac1{x^2}=\frac{x-1}{x^2}>0\,(x>1)"#),
                compStep(4, "推单调", #"g'\text{增},\ g'(1)=0\Rightarrow g'(x)>0\,(x>1)"#),
                compStep(5, "结论", #"g\text{增},\ g(x)>g(1)=0,\ \text{证毕}"#)
            ],
            shortcutSteps: [
                compStep(1, "对数均值秒杀", #"\frac{x-1}{\ln x}<\frac{x+1}{2}\ (\text{对数均值}<\text{算术均值})"#),
                compStep(2, "等价变形", #"\Leftrightarrow(x+1)\ln x>2(x-1)"#)
            ],
            keyInsight: "对数型不等式构造差函数，必要时降到二阶导定符号。",
            shortcutInsight: "它本质是对数平均<算术平均：(x-1)/lnx<(x+1)/2。",
            weapon: "对数均值不等式",
            timeRatio: 2.6,
            tags: ["综合", "导数", "对数不等式", "证明", "压轴"]
        ),

        compProblem(
            id: "comp_029",
            type: .calculation,
            tier: 5,
            formulaIds: ["binomial_theorem", "sequence"],
            content: "求(1+x)+(1+x)²+…+(1+x)¹⁰中x²项的系数。",
            contentLatex: #"\sum_{k=1}^{10}(1+x)^k,\ \text{求}x^2\text{的系数}"#,
            answer: "165",
            difficulty: 0.66,
            averageTime: 150,
            hints: ["每项x²系数为C(k,2)", "求ΣC(k,2)", "组合恒等式"],
            standardSteps: [
                compStep(1, "单项系数", #"(1+x)^k\text{中}x^2\text{系数}=C_k^2"#),
                compStep(2, "求和", #"\sum_{k=2}^{10}C_k^2"#),
                compStep(3, "曲棍球恒等式", #"\sum_{k=2}^{10}C_k^2=C_{11}^3"#),
                compStep(4, "结论", #"C_{11}^3=\frac{11\cdot10\cdot9}{6}=165"#)
            ],
            shortcutSteps: [
                compStep(1, "朱世杰恒等式秒杀", #"\sum_{k=r}^{n}C_k^r=C_{n+1}^{r+1}"#),
                compStep(2, "代入", #"\sum_{k=2}^{10}C_k^2=C_{11}^3=165"#)
            ],
            keyInsight: "多项二项式同次幂系数求和归结为组合数求和。",
            shortcutInsight: "朱世杰(曲棍球)恒等式ΣC(k,r)=C(n+1,r+1)直接闭合求和。",
            weapon: "二项式+组合恒等式",
            timeRatio: 2.4,
            tags: ["综合", "二项式", "组合恒等式", "压轴"]
        ),

        compProblem(
            id: "comp_030",
            type: .calculation,
            tier: 5,
            formulaIds: ["derivative", "inequality", "extreme_value"],
            content: "已知f(x)=x-1-alnx(a>0)。(1)若f(x)≥0恒成立，求a；(2)证明:对n∈N*，1/2+1/3+…+1/(n+1)<ln(n+1)。",
            contentLatex: #"f(x)=x-1-a\ln x\ge0\ \forall x>0;\quad \sum_{k=2}^{n+1}\frac1k<\ln(n+1)"#,
            answer: "(1)a=1；(2)不等式成立",
            difficulty: 0.86,
            averageTime: 250,
            hints: ["(1)求最小值=0定a", "(2)由lnx>1-1/x", "令x=(k+1)/k累加"],
            standardSteps: [
                compStep(1, "求导", #"f'(x)=1-\frac{a}{x}=0\Rightarrow x=a\text{(极小)}"#),
                compStep(2, "最小值", #"f(a)=a-1-a\ln a\ge0,\ \text{且要恒成立}\Rightarrow a=1"#),
                compStep(3, "得基本不等式", #"a=1:\ x-1\ge\ln x\Rightarrow\ln x\le x-1,\ \text{反代}\ln x>1-\frac1x"#),
                compStep(4, "构造", #"\text{令}x=\frac{k+1}{k}:\ \ln\frac{k+1}{k}>1-\frac{k}{k+1}=\frac1{k+1}"#),
                compStep(5, "累加", #"\sum_{k=1}^{n}\ln\frac{k+1}{k}=\ln(n+1)>\sum_{k=1}^{n}\frac1{k+1}=\sum_{k=2}^{n+1}\frac1k"#)
            ],
            shortcutSteps: [
                compStep(1, "切线不等式秒杀", #"\ln x>1-\frac1x\ (x>1)"#),
                compStep(2, "裂项累加", #"x=\frac{k+1}{k}\Rightarrow\ln(n+1)=\sum\ln\frac{k+1}{k}>\sum\frac1{k+1}"#)
            ],
            keyInsight: "第(1)问定出a=1给出关键不等式lnx<x-1，第(2)问由它构造裂项。",
            shortcutInsight: "用对偶切线不等式lnx>1-1/x，代x=(k+1)/k累加即证。",
            weapon: "切线不等式+裂项累加",
            timeRatio: 2.8,
            tags: ["综合", "导数", "数列不等式", "证明", "压轴"]
        )
    ]

    // MARK: - 工厂方法
    private static func compStep(_ order: Int, _ description: String, _ latex: String, _ annotation: String = "") -> SolutionStep {
        SolutionStep(order: order, description: description, latex: latex, annotation: annotation)
    }

    private static func compProblem(
        id: String,
        type: ProblemType,
        tier: Int,
        formulaIds: [String],
        content: String,
        contentLatex: String,
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
        commonMistakes: [String] = ["分类讨论遗漏边界情形", "恒成立与存在性条件混淆", "放缩方向取反"]
    ) -> Problem {
        Problem(
            id: id,
            type: type,
            tier: tier,
            formulaIds: formulaIds,
            content: content,
            contentLatex: contentLatex,
            options: nil,
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
