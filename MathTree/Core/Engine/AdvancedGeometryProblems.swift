import Foundation

// MARK: - 几何补充专题 (立体几何 + 解析几何进阶)
// 目标: 补足空间向量、外接球、线面角、圆与直线、轨迹等高频压轴题型。
// 每题含标准法与高阶秒杀法(向量法/公式法/几何不变量)。

extension SampleData {
    static let advancedGeometryProblems: [Problem] = [
        advGeoProblem(
            id: "ageo_001",
            type: .calculation,
            tier: 5,
            formulaIds: ["circumsphere", "rectangular_solid"],
            content: "长方体的三条棱长分别为1,2,2，求其外接球的表面积。",
            contentLatex: #"\text{长方体棱长}1,2,2,\ \text{外接球表面积}=?"#,
            answer: "9π",
            difficulty: 0.50,
            averageTime: 90,
            hints: ["体对角线=球直径", "2R=√(a²+b²+c²)", "S=4πR²"],
            standardSteps: [
                advGeoStep(1, "体对角线", #"d=\sqrt{1^2+2^2+2^2}=\sqrt9=3"#),
                advGeoStep(2, "球半径", #"2R=d=3\Rightarrow R=\frac32"#),
                advGeoStep(3, "表面积", #"S=4\pi R^2=4\pi\cdot\frac94=9\pi"#)
            ],
            shortcutSteps: [
                advGeoStep(1, "公式直出", #"S=\pi(a^2+b^2+c^2)=\pi(1+4+4)=9\pi"#)
            ],
            keyInsight: "长方体外接球直径=体对角线。",
            shortcutInsight: "长方体外接球表面积=π(a²+b²+c²)，跳过求R。",
            weapon: "外接球体对角线模型",
            timeRatio: 2.0,
            tags: ["几何", "立体几何", "外接球", "代表题"]
        ),

        advGeoProblem(
            id: "ageo_002",
            type: .calculation,
            tier: 5,
            formulaIds: ["circumsphere", "regular_tetrahedron"],
            content: "正四面体棱长为2，求其外接球半径。",
            contentLatex: #"\text{正四面体棱长}a=2,\ R=?"#,
            answer: "√6/2",
            difficulty: 0.66,
            averageTime: 140,
            hints: ["补成正方体", "棱长a的正四面体嵌入棱长a/√2的正方体", "R=√6a/4"],
            standardSteps: [
                advGeoStep(1, "补形", #"\text{正四面体可嵌入正方体, 棱长}b=\frac{a}{\sqrt2}=\sqrt2"#),
                advGeoStep(2, "正方体外接球", #"2R=\sqrt{3}b=\sqrt3\cdot\sqrt2=\sqrt6"#),
                advGeoStep(3, "结论", #"R=\frac{\sqrt6}{2}"#)
            ],
            shortcutSteps: [
                advGeoStep(1, "公式秒杀", #"R=\frac{\sqrt6}{4}a=\frac{\sqrt6}{4}\cdot2=\frac{\sqrt6}{2}"#)
            ],
            keyInsight: "正四面体补成正方体后共用外接球。",
            shortcutInsight: "正四面体外接球R=√6a/4是必背结论。",
            weapon: "补形法/外接球公式",
            timeRatio: 2.4,
            tags: ["几何", "立体几何", "外接球", "正四面体"]
        ),

        advGeoProblem(
            id: "ageo_003",
            type: .calculation,
            tier: 5,
            formulaIds: ["spatial_vector", "line_plane_angle"],
            content: "正方体ABCD-A₁B₁C₁D₁，求直线BC₁与平面A₁BD所成角的正弦值。",
            contentLatex: #"\text{正方体},\ \text{直线}BC_1\text{与平面}A_1BD\text{所成角}"#,
            answer: "√6/3",
            difficulty: 0.76,
            averageTime: 200,
            hints: ["设棱长1建系", "求平面A₁BD法向量", "sinθ=|cos⟨方向向量,法向量⟩|"],
            standardSteps: [
                advGeoStep(1, "建系", #"\text{棱长}1:\ B(1,1,0),C_1(0,1,1),A_1(1,0,1),D(0,0,0)"#),
                advGeoStep(2, "方向向量", #"\vec{BC_1}=(-1,0,1)"#),
                advGeoStep(3, "平面法向量", #"\vec{DB}=(1,1,0),\vec{DA_1}=(1,0,1),\ \vec n=(1,-1,-1)"#),
                advGeoStep(4, "夹角", #"\sin\theta=\frac{|\vec{BC_1}\cdot\vec n|}{|\vec{BC_1}||\vec n|}=\frac{|-1-1|}{\sqrt2\cdot\sqrt3}=\frac{2}{\sqrt6}=\frac{\sqrt6}{3}"#)
            ],
            shortcutSteps: [
                advGeoStep(1, "法向量法秒杀", #"\vec n=(1,-1,-1),\vec{BC_1}=(-1,0,1)"#),
                advGeoStep(2, "直接代", #"\sin\theta=\frac{2}{\sqrt6}=\frac{\sqrt6}{3}"#)
            ],
            keyInsight: "线面角正弦=方向向量与法向量夹角余弦的绝对值。",
            shortcutInsight: "建系后法向量法机械套公式，无需找垂足。",
            weapon: "空间向量法向量法",
            timeRatio: 2.6,
            tags: ["几何", "立体几何", "线面角", "空间向量", "压轴"]
        ),

        advGeoProblem(
            id: "ageo_004",
            type: .calculation,
            tier: 5,
            formulaIds: ["spatial_vector", "point_plane_distance"],
            content: "正方体ABCD-A₁B₁C₁D₁棱长2，求点A到平面A₁BD的距离。",
            contentLatex: #"\text{正方体棱长}2,\ d(A,\ \text{平面}A_1BD)=?"#,
            answer: "2√3/3",
            difficulty: 0.70,
            averageTime: 170,
            hints: ["建系", "求平面法向量", "点到面距离公式"],
            standardSteps: [
                advGeoStep(1, "建系", #"D(0,0,0),A(2,0,0),B(2,2,0),A_1(2,0,2)"#),
                advGeoStep(2, "法向量", #"\vec{DB}=(2,2,0),\vec{DA_1}=(2,0,2),\ \vec n=(1,-1,-1)"#),
                advGeoStep(3, "距离公式", #"d=\frac{|\vec{DA}\cdot\vec n|}{|\vec n|}=\frac{|2|}{\sqrt3}=\frac{2\sqrt3}{3}"#)
            ],
            shortcutSteps: [
                advGeoStep(1, "等体积法秒杀", #"V_{A_1\text{-}ABD}=V_{A\text{-}A_1BD}\Rightarrow \frac13 S_{ABD}\cdot AA_1=\frac13 S_{A_1BD}\cdot d"#),
                advGeoStep(2, "代面积", #"S_{ABD}=2,S_{A_1BD}=2\sqrt3\Rightarrow d=\frac{2\cdot2}{2\sqrt3}=\frac{2\sqrt3}{3}"#)
            ],
            keyInsight: "点到面距离=向量在法向量上的投影长。",
            shortcutInsight: "等体积法换底面，避免建系求法向量。",
            weapon: "向量投影/等体积法",
            timeRatio: 2.3,
            tags: ["几何", "立体几何", "点面距离", "空间向量"]
        ),

        advGeoProblem(
            id: "ageo_005",
            type: .calculation,
            tier: 4,
            formulaIds: ["line_circle", "distance"],
            content: "直线l:3x+4y-5=0与圆C:x²+y²=4相交所得弦长。",
            contentLatex: #"l:3x+4y-5=0,\ C:x^2+y^2=4,\ \text{弦长}=?"#,
            answer: "2√3",
            difficulty: 0.45,
            averageTime: 90,
            hints: ["圆心到直线距离d", "半弦²=r²-d²", "弦长=2√(r²-d²)"],
            standardSteps: [
                advGeoStep(1, "圆心距离", #"d=\frac{|3\cdot0+4\cdot0-5|}{\sqrt{9+16}}=\frac{5}{5}=1"#),
                advGeoStep(2, "弦长公式", #"L=2\sqrt{r^2-d^2}=2\sqrt{4-1}=2\sqrt3"#)
            ],
            shortcutSteps: [
                advGeoStep(1, "弦长公式秒杀", #"L=2\sqrt{4-1}=2\sqrt3"#)
            ],
            keyInsight: "弦长由半径、圆心到弦距离构成的直角三角形给出。",
            shortcutInsight: "L=2√(r²-d²)，先算d再代入，两步出。",
            weapon: "垂径定理",
            timeRatio: 1.8,
            tags: ["几何", "解析几何", "直线与圆", "弦长"]
        ),

        advGeoProblem(
            id: "ageo_006",
            type: .calculation,
            tier: 4,
            formulaIds: ["circle", "tangent_line"],
            content: "过点P(3,1)作圆C:(x-1)²+y²=4的切线，求切线长及切线方程条数。",
            contentLatex: #"P(3,1),\ C:(x-1)^2+y^2=4,\ \text{切线长}=?"#,
            answer: "切线长=1，两条切线",
            difficulty: 0.52,
            averageTime: 110,
            hints: ["切线长²=|PC|²-r²", "P在圆外", "外点必有两切线"],
            standardSteps: [
                advGeoStep(1, "PC距离", #"|PC|^2=(3-1)^2+1^2=5"#),
                advGeoStep(2, "切线长", #"\ell=\sqrt{|PC|^2-r^2}=\sqrt{5-4}=1"#),
                advGeoStep(3, "判定", #"|PC|=\sqrt5>r=2,\ P\text{在圆外}\Rightarrow\text{两条切线}"#)
            ],
            shortcutSteps: [
                advGeoStep(1, "切线长公式秒杀", #"\ell=\sqrt{|PC|^2-r^2}=\sqrt{5-4}=1"#)
            ],
            keyInsight: "切线长=√(点到圆心距²-半径²)，由切点处直角三角形得到。",
            shortcutInsight: "切线长公式直接出，正值即在圆外有两切线。",
            weapon: "切线长公式",
            timeRatio: 1.9,
            tags: ["几何", "解析几何", "圆", "切线"]
        ),

        advGeoProblem(
            id: "ageo_007",
            type: .calculation,
            tier: 5,
            formulaIds: ["spatial_vector", "dihedral_angle"],
            content: "三棱锥P-ABC中，PA⊥平面ABC，PA=AB=AC=2，BC=2√2，求二面角P-BC-A的正切值。",
            contentLatex: #"PA\perp\text{面}ABC,\ PA=AB=AC=2,\ BC=2\sqrt2,\ \text{二面角}P\text{-}BC\text{-}A"#,
            answer: "√2",
            difficulty: 0.72,
            averageTime: 180,
            hints: ["先证AB⊥AC", "取BC中点M", "PA⊥底面+三垂线定理"],
            standardSteps: [
                advGeoStep(1, "判直角", #"AB^2+AC^2=8=BC^2\Rightarrow AB\perp AC"#),
                advGeoStep(2, "取中点M", #"M\text{为}BC\text{中点},\ AM\perp BC,\ AM=\frac12 BC=\sqrt2"#),
                advGeoStep(3, "三垂线", #"PA\perp\text{底}\Rightarrow PM\perp BC,\ \angle PMA\text{为二面角}"#),
                advGeoStep(4, "正切", #"\tan\angle PMA=\frac{PA}{AM}=\frac{2}{\sqrt2}=\sqrt2"#)
            ],
            shortcutSteps: [
                advGeoStep(1, "三垂线定二面角", #"\angle PMA,\ \tan=\frac{PA}{AM}"#),
                advGeoStep(2, "代值", #"=\frac{2}{\sqrt2}=\sqrt2"#)
            ],
            keyInsight: "PA垂直底面时，二面角的平面角由三垂线定理在中点处构造。",
            shortcutInsight: "tan(二面角)=竖直边/底面投影边，直接读直角三角形。",
            weapon: "三垂线定理",
            timeRatio: 2.2,
            tags: ["几何", "立体几何", "二面角", "三垂线", "压轴"]
        ),

        advGeoProblem(
            id: "ageo_008",
            type: .calculation,
            tier: 5,
            formulaIds: ["ellipse", "focal_triangle"],
            content: "椭圆x²/25+y²/9=1上一点P，F₁,F₂为焦点，∠F₁PF₂=60°，求△F₁PF₂的面积。",
            contentLatex: #"\frac{x^2}{25}+\frac{y^2}{9}=1,\ \angle F_1PF_2=60^\circ,\ S=?"#,
            answer: "3√3",
            difficulty: 0.68,
            averageTime: 150,
            hints: ["焦点三角形面积公式", "S=b²tan(θ/2)", "代θ=60°"],
            standardSteps: [
                advGeoStep(1, "基本量", #"a=5,b=3,c=4"#),
                advGeoStep(2, "焦三角公式", #"S=b^2\tan\frac{\theta}{2}=9\tan30^\circ"#),
                advGeoStep(3, "结论", #"=9\cdot\frac{\sqrt3}{3}=3\sqrt3"#)
            ],
            shortcutSteps: [
                advGeoStep(1, "面积公式秒杀", #"S=b^2\tan\frac{\theta}{2}=9\tan30^\circ=3\sqrt3"#)
            ],
            keyInsight: "椭圆焦点三角形面积只与b和顶角有关。",
            shortcutInsight: "S=b²tan(θ/2)一步出，无需求|PF₁|,|PF₂|。",
            weapon: "焦点三角形面积公式",
            timeRatio: 2.5,
            tags: ["几何", "解析几何", "椭圆", "焦点三角形", "代表题"]
        ),

        advGeoProblem(
            id: "ageo_009",
            type: .calculation,
            tier: 5,
            formulaIds: ["hyperbola", "focal_triangle"],
            content: "双曲线x²/9-y²/16=1上一点P，F₁,F₂为焦点，∠F₁PF₂=90°，求△F₁PF₂的面积。",
            contentLatex: #"\frac{x^2}{9}-\frac{y^2}{16}=1,\ \angle F_1PF_2=90^\circ,\ S=?"#,
            answer: "16",
            difficulty: 0.70,
            averageTime: 160,
            hints: ["双曲线焦三角公式", "S=b²/tan(θ/2)", "θ=90°"],
            standardSteps: [
                advGeoStep(1, "基本量", #"a=3,b=4,c=5"#),
                advGeoStep(2, "焦三角面积(双曲线)", #"S=\frac{b^2}{\tan(\theta/2)}=\frac{16}{\tan45^\circ}"#),
                advGeoStep(3, "结论", #"=\frac{16}{1}=16"#)
            ],
            shortcutSteps: [
                advGeoStep(1, "公式秒杀", #"S=\frac{b^2}{\tan(\theta/2)}=\frac{16}{1}=16"#)
            ],
            keyInsight: "双曲线焦点三角形面积公式与椭圆互为倒切关系。",
            shortcutInsight: "S=b²/tan(θ/2)，θ=90°时直接=b²。",
            weapon: "双曲线焦点三角形公式",
            timeRatio: 2.4,
            tags: ["几何", "解析几何", "双曲线", "焦点三角形"]
        ),

        advGeoProblem(
            id: "ageo_010",
            type: .calculation,
            tier: 5,
            formulaIds: ["spatial_vector", "skew_lines"],
            content: "正方体ABCD-A₁B₁C₁D₁棱长1，求异面直线AC与BD₁所成角的余弦值。",
            contentLatex: #"\text{正方体棱长}1,\ \text{异面直线}AC\text{与}BD_1\text{所成角}"#,
            answer: "0（即AC⊥BD₁）",
            difficulty: 0.66,
            averageTime: 150,
            hints: ["建系求方向向量", "cosθ=|cos⟨向量⟩|", "数量积为0即垂直"],
            standardSteps: [
                advGeoStep(1, "建系", #"A(0,0,0),C(1,1,0),B(1,0,0),D_1(0,1,1)"#),
                advGeoStep(2, "方向向量", #"\vec{AC}=(1,1,0),\ \vec{BD_1}=(-1,1,1)"#),
                advGeoStep(3, "数量积", #"\vec{AC}\cdot\vec{BD_1}=(1)(-1)+(1)(1)+(0)(1)=0"#),
                advGeoStep(4, "结论", #"\cos\theta=\frac{|0|}{\sqrt2\cdot\sqrt3}=0,\ \text{即}AC\perp BD_1"#)
            ],
            shortcutSteps: [
                advGeoStep(1, "向量法直判", #"\vec{AC}\cdot\vec{BD_1}=(1)(-1)+(1)(1)+0=0"#),
                advGeoStep(2, "结论", #"AC\perp BD_1,\ \cos\theta=0"#)
            ],
            keyInsight: "异面直线夹角用方向向量点积的绝对值除以模长积。",
            shortcutInsight: "点积为0直接判定垂直，余弦为0。",
            weapon: "空间向量异面角",
            timeRatio: 2.2,
            tags: ["几何", "立体几何", "异面直线", "空间向量"]
        ),

        advGeoProblem(
            id: "ageo_011",
            type: .calculation,
            tier: 4,
            formulaIds: ["circle", "locus"],
            content: "已知A(-2,0),B(2,0)，动点P满足|PA|=2|PB|，求P的轨迹方程。",
            contentLatex: #"A(-2,0),B(2,0),\ |PA|=2|PB|,\ \text{轨迹}=?"#,
            answer: "(x-10/3)²+y²=(8/3)² (阿波罗尼斯圆)",
            difficulty: 0.58,
            averageTime: 130,
            hints: ["设P(x,y)列方程", "平方化简", "配方成圆"],
            standardSteps: [
                advGeoStep(1, "列式", #"\sqrt{(x+2)^2+y^2}=2\sqrt{(x-2)^2+y^2}"#),
                advGeoStep(2, "平方", #"(x+2)^2+y^2=4[(x-2)^2+y^2]"#),
                advGeoStep(3, "整理", #"3x^2+3y^2-20x+12=0\Rightarrow x^2+y^2-\frac{20}{3}x+4=0"#),
                advGeoStep(4, "配方", #"\left(x-\frac{10}{3}\right)^2+y^2=\frac{64}{9}"#)
            ],
            shortcutSteps: [
                advGeoStep(1, "阿氏圆秒杀", #"|PA|/|PB|=\lambda=2\text{的轨迹是圆(阿波罗尼斯圆)}"#),
                advGeoStep(2, "心径直算", #"\text{圆心}\left(\frac{10}{3},0\right),\ r=\frac83"#)
            ],
            keyInsight: "到两定点距离之比为常数(≠1)的轨迹是圆。",
            shortcutInsight: "识别阿波罗尼斯圆，列式平方配方即得。",
            weapon: "阿波罗尼斯圆",
            timeRatio: 2.1,
            tags: ["几何", "解析几何", "轨迹", "阿氏圆"]
        ),

        advGeoProblem(
            id: "ageo_012",
            type: .calculation,
            tier: 5,
            formulaIds: ["spatial_vector", "volume"],
            content: "四面体ABCD中，AB=CD=√(2)，AC=BD=√5，AD=BC=√(5)，求其体积(等腰四面体)。",
            contentLatex: #"\text{对棱相等四面体}\ AB=CD,AC=BD,AD=BC,\ V=?"#,
            answer: "2/3",
            difficulty: 0.84,
            averageTime: 230,
            hints: ["对棱相等→补成长方体", "解长方体棱长", "V=长方体的1/3"],
            standardSteps: [
                advGeoStep(1, "补形", #"\text{对棱相等四面体补成长方体, 设棱长}p,q,r"#),
                advGeoStep(2, "面对角线", #"p^2+q^2=AB^2=2,\ q^2+r^2=AC^2=5,\ p^2+r^2=AD^2=5"#),
                advGeoStep(3, "解出", #"p^2=1,q^2=1,r^2=4\Rightarrow p=1,q=1,r=2"#),
                advGeoStep(4, "长方体体积", #"V_{\text{长方体}}=pqr=1\cdot1\cdot2=2"#),
                advGeoStep(5, "四面体体积", #"V=\frac13 V_{\text{长方体}}=\frac23"#)
            ],
            shortcutSteps: [
                advGeoStep(1, "补形公式秒杀", #"\text{对棱相等四面体}=\text{长方体切去4角锥},\ V=\frac13 pqr"#),
                advGeoStep(2, "代入", #"V=\frac13\cdot1\cdot1\cdot2=\frac23"#)
            ],
            keyInsight: "对棱相等的四面体一定能补成长方体。",
            shortcutInsight: "补形后四面体体积=长方体体积的1/3。",
            weapon: "等腰四面体补形",
            timeRatio: 2.6,
            tags: ["几何", "立体几何", "体积", "补形", "压轴"]
        ),

        advGeoProblem(
            id: "ageo_013",
            type: .calculation,
            tier: 4,
            formulaIds: ["line", "symmetry"],
            content: "求点A(4,3)关于直线l:x-y+1=0的对称点A'。",
            contentLatex: #"A(4,3),\ l:x-y+1=0,\ A'=?"#,
            answer: "(2,5)",
            difficulty: 0.40,
            averageTime: 100,
            hints: ["AA'⊥l且中点在l上", "斜率乘积-1", "联立解"],
            standardSteps: [
                advGeoStep(1, "垂直条件", #"l\text{斜率}1,\ AA'\text{斜率}-1:\ \frac{y-3}{x-4}=-1\Rightarrow x+y=7"#),
                advGeoStep(2, "中点在l", #"\frac{x+4}{2}-\frac{y+3}{2}+1=0\Rightarrow x-y+3=0"#),
                advGeoStep(3, "联立", #"\begin{cases}x+y=7\\x-y=-3\end{cases}\Rightarrow x=2,\ y=5"#),
                advGeoStep(4, "结论", #"A'(2,5)"#)
            ],
            shortcutSteps: [
                advGeoStep(1, "反射公式秒杀", #"d=\frac{4-3+1}{1^2+(-1)^2}=1,\ A'=(4-2\cdot1\cdot1,\ 3-2\cdot(-1)\cdot1)=(2,5)"#)
            ],
            keyInsight: "对称点满足'AA'垂直于l且中点在l上'两条件。",
            shortcutInsight: "用点关于直线的反射公式一步算出对称点坐标。",
            weapon: "对称点垂直平分模型",
            timeRatio: 1.7,
            tags: ["几何", "解析几何", "对称", "直线"]
        ),

        advGeoProblem(
            id: "ageo_014",
            type: .calculation,
            tier: 5,
            formulaIds: ["spatial_vector", "line_plane_angle"],
            content: "正三棱柱ABC-A₁B₁C₁底面边长2，侧棱长2√3，求AB₁与底面ABC所成角。",
            contentLatex: #"\text{正三棱柱, 底边}2,\ \text{侧棱}2\sqrt3,\ AB_1\text{与底面ABC夹角}"#,
            answer: "60°（即π/3）",
            difficulty: 0.58,
            averageTime: 120,
            hints: ["B₁在底面投影为B", "∠B₁AB为线面角", "tan∠B₁AB=BB₁/AB"],
            standardSteps: [
                advGeoStep(1, "确定射影", #"BB_1\perp\text{底面},\ B_1\text{在底面投影为}B,\ \angle B_1AB\text{为AB}_1\text{与底面所成角}"#),
                advGeoStep(2, "直角三角形", #"\triangle B_1AB\text{中}\angle ABB_1=90^\circ,\ AB=2,\ BB_1=2\sqrt3"#),
                advGeoStep(3, "正切", #"\tan\angle B_1AB=\frac{BB_1}{AB}=\frac{2\sqrt3}{2}=\sqrt3"#),
                advGeoStep(4, "结论", #"\angle B_1AB=60^\circ"#)
            ],
            shortcutSteps: [
                advGeoStep(1, "投影模型秒杀", #"\tan\theta=\frac{\text{侧棱}}{\text{底面投影}AB}=\frac{2\sqrt3}{2}=\sqrt3\Rightarrow\theta=60^\circ"#)
            ],
            keyInsight: "正棱柱侧棱顶点在底面投影即下底顶点，线面角由直角三角形确定。",
            shortcutInsight: "tan(线面角)=侧棱长/底面投影边长。",
            weapon: "射影定义线面角",
            timeRatio: 1.9,
            tags: ["几何", "立体几何", "线面角", "棱柱"]
        ),

        advGeoProblem(
            id: "ageo_015",
            type: .calculation,
            tier: 5,
            formulaIds: ["parabola", "directrix", "min_distance"],
            content: "抛物线y²=4x上一点P到准线x=-1与到点A(3,2)的距离之和的最小值。",
            contentLatex: #"y^2=4x,\ \min\big(d(P,\text{准线})+|PA|\big),\ A(3,2)"#,
            answer: "4",
            difficulty: 0.66,
            averageTime: 150,
            hints: ["判断A在抛物线内部", "过A作准线的垂线(水平线)", "最小值=A到准线的水平距离"],
            standardSteps: [
                advGeoStep(1, "判断A位置", #"2^2=4<4\cdot3=12\Rightarrow A\text{在抛物线内部}"#),
                advGeoStep(2, "化折为直", #"\text{过}A\text{作准线}x=-1\text{的垂线(水平线}y=2\text{), 交抛物线于}P"#),
                advGeoStep(3, "最小值", #"d(P,\text{准线})+|PA|\ge A\text{到准线的距离}=x_A-(-1)=3+1=4"#),
                advGeoStep(4, "取得点", #"\text{当}P=(1,2)\text{时取得最小值}4"#)
            ],
            shortcutSteps: [
                advGeoStep(1, "A在内部秒杀", #"\min=d(A,\text{准线})=x_A+1=4\ (\text{在}P=(1,2)\text{处})"#)
            ],
            keyInsight: "A在抛物线内部时, '到准线+到A'的最小值是A到准线的距离(PA垂直准线)。",
            shortcutInsight: "过A向准线作垂线交抛物线即最优P, 最小值=A的横坐标+准线距。",
            weapon: "抛物线化折为直",
            timeRatio: 2.3,
            tags: ["几何", "解析几何", "抛物线", "最值", "压轴"]
        ),

        advGeoProblem(
            id: "ageo_016",
            type: .calculation,
            tier: 4,
            formulaIds: ["circle", "common_chord"],
            content: "两圆C₁:x²+y²=4与C₂:x²+y²-4x+2y-4=0的公共弦长。",
            contentLatex: #"C_1:x^2+y^2=4,\ C_2:x^2+y^2-4x+2y-4=0,\ \text{公共弦长}=?"#,
            answer: "4（公共弦过C₁圆心，为C₁的直径）",
            difficulty: 0.56,
            averageTime: 130,
            hints: ["两式相减得公共弦所在直线", "C₁圆心到该线距离d", "弦长公式"],
            standardSteps: [
                advGeoStep(1, "相减得弦线", #"(x^2+y^2-4)-(x^2+y^2-4x+2y-4)=0\Rightarrow 4x-2y=0\Rightarrow 2x-y=0"#),
                advGeoStep(2, "C₁心到线距", #"d=\frac{|0|}{\sqrt{4+1}}=0"#),
                advGeoStep(3, "弦长", #"\text{直线过C₁圆心}\Rightarrow\text{弦为直径}=2r=4"#)
            ],
            shortcutSteps: [
                advGeoStep(1, "作差求弦线秒杀", #"\text{两圆方程相减}\Rightarrow 2x-y=0\text{过原点(C₁心)}"#),
                advGeoStep(2, "结论", #"\text{公共弦=直径}=4"#)
            ],
            keyInsight: "两圆方程相减消去二次项即得公共弦所在直线。",
            shortcutInsight: "弦线过C₁圆心则公共弦即直径，长度2r。",
            weapon: "两圆作差求根轴",
            timeRatio: 2.0,
            tags: ["几何", "解析几何", "圆", "公共弦"]
        ),

        advGeoProblem(
            id: "ageo_017",
            type: .calculation,
            tier: 5,
            formulaIds: ["spatial_vector", "volume", "optimization"],
            content: "正四棱锥底面边长a，侧棱与底面成45°，用a表示其体积，并在表面积固定为S时讨论体积最大(定性)。",
            contentLatex: #"\text{正四棱锥, 底边}a,\ \text{侧棱与底成}45^\circ,\ V=?"#,
            answer: "V=(√2/6)a³",
            difficulty: 0.68,
            averageTime: 160,
            hints: ["对角线半长=a√2/2", "高h=对角线半长·tan45°", "V=⅓a²h"],
            standardSteps: [
                advGeoStep(1, "底面对角线半长", #"r=\frac{\sqrt2}{2}a"#),
                advGeoStep(2, "求高", #"h=r\tan45^\circ=\frac{\sqrt2}{2}a"#),
                advGeoStep(3, "体积", #"V=\frac13 a^2 h=\frac13 a^2\cdot\frac{\sqrt2}{2}a=\frac{\sqrt2}{6}a^3"#)
            ],
            shortcutSteps: [
                advGeoStep(1, "几何关系秒杀", #"45^\circ\Rightarrow h=\text{底对角线半长}=\frac{\sqrt2}{2}a"#),
                advGeoStep(2, "代体积公式", #"V=\frac{\sqrt2}{6}a^3"#)
            ],
            keyInsight: "侧棱与底成45°时高等于底面外接圆半径(对角线半长)。",
            shortcutInsight: "45°的tan=1，高=对角线半长，直接代体积公式。",
            weapon: "棱锥高与底面投影关系",
            timeRatio: 2.0,
            tags: ["几何", "立体几何", "棱锥", "体积"]
        ),

        advGeoProblem(
            id: "ageo_018",
            type: .calculation,
            tier: 5,
            formulaIds: ["ellipse", "chord_midpoint", "point_difference"],
            content: "椭圆x²/16+y²/4=1的一条弦被点M(2,1)平分，求该弦所在直线的斜率。",
            contentLatex: #"\frac{x^2}{16}+\frac{y^2}{4}=1,\ \text{弦中点}M(2,1),\ k=?"#,
            answer: "-1/2",
            difficulty: 0.70,
            averageTime: 150,
            hints: ["点差法", "两端点代入相减", "k=-b²x₀/(a²y₀)"],
            standardSteps: [
                advGeoStep(1, "设端点", #"A(x_1,y_1),B(x_2,y_2)\text{均在椭圆上,作差}"#),
                advGeoStep(2, "点差", #"\frac{x_1^2-x_2^2}{16}+\frac{y_1^2-y_2^2}{4}=0"#),
                advGeoStep(3, "中点斜率", #"k=\frac{y_1-y_2}{x_1-x_2}=-\frac{4}{16}\cdot\frac{x_1+x_2}{y_1+y_2}=-\frac14\cdot\frac{2\cdot2}{2\cdot1}"#),
                advGeoStep(4, "结论", #"k=-\frac14\cdot2=-\frac12"#)
            ],
            shortcutSteps: [
                advGeoStep(1, "中点弦公式秒杀", #"k=-\frac{b^2 x_0}{a^2 y_0}=-\frac{4\cdot2}{16\cdot1}=-\frac12"#)
            ],
            keyInsight: "中点弦问题首选点差法把端点坐标差转成中点坐标。",
            shortcutInsight: "椭圆中点弦斜率公式k=-b²x₀/(a²y₀)直接代。",
            weapon: "点差法/中点弦公式",
            timeRatio: 2.5,
            tags: ["几何", "解析几何", "椭圆", "中点弦", "压轴"]
        ),

        advGeoProblem(
            id: "ageo_019",
            type: .calculation,
            tier: 4,
            formulaIds: ["line", "distance", "optimization"],
            content: "已知直线l:(2+m)x+(1-2m)y+4-3m=0(m∈R)恒过定点P，求P坐标。",
            contentLatex: #"(2+m)x+(1-2m)y+4-3m=0\ \text{恒过定点}P"#,
            answer: "(-1,-2)",
            difficulty: 0.54,
            averageTime: 110,
            hints: ["按m分组", "m(x-2y-3)+(2x+y+4)=0", "两括号同时为0"],
            standardSteps: [
                advGeoStep(1, "按m整理", #"m(x-2y-3)+(2x+y+4)=0"#),
                advGeoStep(2, "对任意m成立", #"\begin{cases}x-2y-3=0\\2x+y+4=0\end{cases}"#),
                advGeoStep(3, "解方程组", #"x=-1,\ y=-2"#),
                advGeoStep(4, "结论", #"P(-1,-2)"#)
            ],
            shortcutSteps: [
                advGeoStep(1, "参数分离秒杀", #"\text{令}m\text{系数与常数项分别为0}\Rightarrow P(-1,-2)"#)
            ],
            keyInsight: "含参直线恒过定点：按参数分组令各组系数为0。",
            shortcutInsight: "把方程写成m·(…)+(…)=0，两括号联立即得定点。",
            weapon: "参数分离定点法",
            timeRatio: 2.0,
            tags: ["几何", "解析几何", "直线", "定点"]
        ),

        advGeoProblem(
            id: "ageo_020",
            type: .calculation,
            tier: 5,
            formulaIds: ["spatial_vector", "distance_lines"],
            content: "正方体ABCD-A₁B₁C₁D₁棱长2，求异面直线AB₁与BC₁之间的距离。",
            contentLatex: #"\text{正方体棱长}2,\ \text{异面直线}AB_1\text{与}BC_1\text{的距离}"#,
            answer: "2√3/3",
            difficulty: 0.82,
            averageTime: 220,
            hints: ["建系求两方向向量", "公垂向量n=v₁×v₂", "d=|AB·n|/|n|"],
            standardSteps: [
                advGeoStep(1, "建系", #"A(0,0,0),B(2,0,0),B_1(2,0,2),C_1(2,2,2)"#),
                advGeoStep(2, "方向向量", #"\vec{AB_1}=(2,0,2),\ \vec{BC_1}=(0,2,2)"#),
                advGeoStep(3, "公垂向量", #"\vec n=\vec{AB_1}\times\vec{BC_1}=(-4,-4,4)\parallel(1,1,-1)"#),
                advGeoStep(4, "连接向量", #"\vec{AB}=(2,0,0)"#),
                advGeoStep(5, "距离", #"d=\frac{|\vec{AB}\cdot\vec n|}{|\vec n|}=\frac{2}{\sqrt3}=\frac{2\sqrt3}{3}"#)
            ],
            shortcutSteps: [
                advGeoStep(1, "公垂向量法秒杀", #"\vec n=\vec{AB_1}\times\vec{BC_1}\parallel(1,1,-1)"#),
                advGeoStep(2, "投影直出", #"d=\frac{|\vec{AB}\cdot\vec n|}{|\vec n|}=\frac{2}{\sqrt3}=\frac{2\sqrt3}{3}"#)
            ],
            keyInsight: "异面直线距离=连接向量在公垂方向(叉积)上的投影。",
            shortcutInsight: "叉积得公垂向量，任取连接向量做投影，机械化求距。",
            weapon: "向量叉积求异面距离",
            timeRatio: 2.6,
            tags: ["几何", "立体几何", "异面距离", "空间向量", "压轴"]
        ),

        advGeoProblem(
            id: "ageo_021",
            type: .calculation,
            tier: 4,
            formulaIds: ["circle", "max_min"],
            content: "圆C:(x-3)²+(y-4)²=4上的点到原点O的距离的最大值与最小值。",
            contentLatex: #"(x-3)^2+(y-4)^2=4,\ \text{到}O\text{距离}\max,\min=?"#,
            answer: "max=7, min=3",
            difficulty: 0.42,
            averageTime: 80,
            hints: ["圆心到O距离", "max=|OC|+r", "min=|OC|-r"],
            standardSteps: [
                advGeoStep(1, "圆心距", #"|OC|=\sqrt{3^2+4^2}=5"#),
                advGeoStep(2, "最值", #"\max=|OC|+r=5+2=7,\ \min=|OC|-r=5-2=3"#)
            ],
            shortcutSteps: [
                advGeoStep(1, "心距±半径秒杀", #"5\pm2\Rightarrow\max7,\min3"#)
            ],
            keyInsight: "圆外定点到圆上点的距离在过圆心连线方向取最值。",
            shortcutInsight: "max/min=|OC|±r，先算圆心距即可。",
            weapon: "圆上点到定点距离模型",
            timeRatio: 1.6,
            tags: ["几何", "解析几何", "圆", "最值"]
        ),

        advGeoProblem(
            id: "ageo_022",
            type: .calculation,
            tier: 5,
            formulaIds: ["spatial_vector", "perpendicular"],
            content: "在三棱锥P-ABC中，已知\\vec{PA},\\vec{PB},\\vec{PC}两两夹角均为60°，且模长均为1。求\\vec{PA}·(\\vec{PB}+\\vec{PC})及|\\vec{PA}+\\vec{PB}+\\vec{PC}|。",
            contentLatex: #"|\vec{PA}|=|\vec{PB}|=|\vec{PC}|=1,\ \text{两两夹角}60^\circ"#,
            answer: "PA·(PB+PC)=1; |和|=√6",
            difficulty: 0.70,
            averageTime: 160,
            hints: ["a·b=1·1·cos60°=1/2", "展开数量积", "|和|²=Σ模²+2Σ两两积"],
            standardSteps: [
                advGeoStep(1, "两两数量积", #"\vec{PA}\cdot\vec{PB}=\vec{PA}\cdot\vec{PC}=\frac12"#),
                advGeoStep(2, "第一问", #"\vec{PA}\cdot(\vec{PB}+\vec{PC})=\frac12+\frac12=1"#),
                advGeoStep(3, "模平方", #"|\vec{PA}+\vec{PB}+\vec{PC}|^2=3\cdot1+2\cdot3\cdot\frac12=3+3=6"#),
                advGeoStep(4, "结论", #"|\vec{PA}+\vec{PB}+\vec{PC}|=\sqrt6"#)
            ],
            shortcutSteps: [
                advGeoStep(1, "模平方公式秒杀", #"|\sum\vec v|^2=\sum|\vec v|^2+2\sum_{i<j}\vec v_i\cdot\vec v_j=3+2\cdot3\cdot\tfrac12=6"#)
            ],
            keyInsight: "空间向量和的模用模平方公式展开成各模与两两数量积。",
            shortcutInsight: "对称结构下三项模相等、三对数量积相等，直接代入。",
            weapon: "向量模平方展开",
            timeRatio: 2.1,
            tags: ["几何", "立体几何", "空间向量", "数量积"]
        ),

        advGeoProblem(
            id: "ageo_023",
            type: .calculation,
            tier: 5,
            formulaIds: ["ellipse", "area", "max"],
            content: "椭圆x²/4+y²=1，O为原点，直线l与椭圆交于A,B两点且OA⊥OB，求△OAB面积的最小值。",
            contentLatex: #"\frac{x^2}{4}+y^2=1,\ OA\perp OB,\ S_{\triangle OAB}_{\min}=?"#,
            answer: "4/5",
            difficulty: 0.86,
            averageTime: 240,
            hints: ["1/|OA|²+1/|OB|²为定值", "用极坐标或公式", "S=½|OA||OB|"],
            standardSteps: [
                advGeoStep(1, "椭圆性质", #"OA\perp OB\Rightarrow\frac1{|OA|^2}+\frac1{|OB|^2}=\frac1{a^2}+\frac1{b^2}=\frac14+1=\frac54"#),
                advGeoStep(2, "面积", #"S=\frac12|OA||OB|"#),
                advGeoStep(3, "原点到AB距离定值", #"d=\frac{|OA||OB|}{|AB|},\ \text{且}\frac1{d^2}=\frac54\Rightarrow d=\frac{2}{\sqrt5}"#),
                advGeoStep(4, "最小面积", #"S=\frac12|AB|\cdot d,\ \text{当}|AB|\text{最小(}=2d\text{,即}|OA|=|OB|\text{)}"#),
                advGeoStep(5, "结论", #"S_{\min}=\frac12\cdot\frac{2}{\sqrt5}\cdot... =\frac45"#)
            ],
            shortcutSteps: [
                advGeoStep(1, "调和性质秒杀", #"\frac1{|OA|^2}+\frac1{|OB|^2}=\frac54,\ S=\frac{|OA||OB|}{2}"#),
                advGeoStep(2, "AM-GM定最小", #"|OA||OB|\ge\frac{2}{5/4}=\frac85\Rightarrow S_{\min}=\frac45"#)
            ],
            keyInsight: "OA⊥OB时1/|OA|²+1/|OB|²=1/a²+1/b²是椭圆不变量。",
            shortcutInsight: "由定和的倒数平方用均值得|OA||OB|下界，面积最小立得。",
            weapon: "椭圆垂径调和性质",
            timeRatio: 2.5,
            tags: ["几何", "解析几何", "椭圆", "面积最值", "压轴"]
        ),

        advGeoProblem(
            id: "ageo_024",
            type: .calculation,
            tier: 4,
            formulaIds: ["circle", "tangent", "line"],
            content: "求过点P(2,3)且与圆x²+y²=4相切的直线方程。",
            contentLatex: #"P(2,3),\ \text{圆}x^2+y^2=4\text{的切线}"#,
            answer: "x=2 及 5x-12y+26=0",
            difficulty: 0.60,
            averageTime: 140,
            hints: ["P在圆外有两切线", "设斜率k讨论+竖直线", "圆心到线距=r"],
            standardSteps: [
                advGeoStep(1, "竖直线验证", #"x=2:\ \text{到圆心}(0,0)\text{距}=2=r,\ \text{相切!}"#),
                advGeoStep(2, "设斜率线", #"y-3=k(x-2)\Rightarrow kx-y+3-2k=0"#),
                advGeoStep(3, "相切条件", #"\frac{|3-2k|}{\sqrt{k^2+1}}=2"#),
                advGeoStep(4, "解k", #"(3-2k)^2=4(k^2+1)\Rightarrow 9-12k=4\Rightarrow k=\frac{5}{12}"#),
                advGeoStep(5, "结论", #"x=2\ \text{及}\ 5x-12y+26=0"#)
            ],
            shortcutSteps: [
                advGeoStep(1, "勿漏竖直线", #"\text{先验}x=2\text{是否相切(本题相切)}"#),
                advGeoStep(2, "斜率法补另一条", #"k=\frac{5}{12}\Rightarrow 5x-12y+26=0"#)
            ],
            keyInsight: "过圆外点的切线有两条，须单独检验竖直线。",
            shortcutInsight: "设斜率只得一条时，另一条往往是竖直线x=x_P。",
            weapon: "切线距离条件",
            timeRatio: 2.0,
            tags: ["几何", "解析几何", "圆", "切线"]
        ),

        advGeoProblem(
            id: "ageo_025",
            type: .calculation,
            tier: 5,
            formulaIds: ["spatial_vector", "circumsphere", "cone"],
            content: "圆锥的底面半径为3，高为4，求其内切球半径。",
            contentLatex: #"\text{圆锥底半径}3,\ \text{高}4,\ \text{内切球半径}r=?"#,
            answer: "3/2",
            difficulty: 0.62,
            averageTime: 130,
            hints: ["轴截面是等腰三角形", "内切球=三角形内切圆", "r=面积/半周长"],
            standardSteps: [
                advGeoStep(1, "轴截面", #"\text{等腰三角形底}2\times3=6,\ \text{高}4,\ \text{腰}=\sqrt{3^2+4^2}=5"#),
                advGeoStep(2, "内切圆半径", #"r=\frac{S}{p}=\frac{\frac12\cdot6\cdot4}{\frac{6+5+5}{2}}=\frac{12}{8}"#),
                advGeoStep(3, "结论", #"r=\frac32"#)
            ],
            shortcutSteps: [
                advGeoStep(1, "内切圆公式秒杀", #"r=\frac{\text{面积}}{\text{半周长}}=\frac{12}{8}=\frac32"#)
            ],
            keyInsight: "圆锥内切球半径=轴截面等腰三角形的内切圆半径。",
            shortcutInsight: "降维到二维三角形，用r=S/p一步求出。",
            weapon: "轴截面降维",
            timeRatio: 2.2,
            tags: ["几何", "立体几何", "内切球", "圆锥", "压轴"]
        )
    ]

    // MARK: - 工厂方法
    private static func advGeoStep(_ order: Int, _ description: String, _ latex: String, _ annotation: String = "") -> SolutionStep {
        SolutionStep(order: order, description: description, latex: latex, annotation: annotation)
    }

    private static func advGeoProblem(
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
        commonMistakes: [String] = ["建系坐标取错", "线面角与二面角混淆", "切线漏掉竖直情形"]
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
