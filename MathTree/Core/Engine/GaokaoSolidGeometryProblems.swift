import Foundation

// MARK: - 高考立体几何压轴专题 (14道)
// 涵盖: 异面直线角、线面角、二面角、点面距离、外接球、体积、空间向量法。
// 原则: 答案确定、步骤闭合、常规建系/几何法 + 空间向量秒杀。LaTeX 用 raw string。

extension SampleData {
    static let gaokaoSolidGeometryProblems: [Problem] = [
        solidProblem(
            id: "solid_001",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["spatial_vector", "skew_lines"],
            content: "正方体ABCD-A₁B₁C₁D₁棱长为2，求异面直线A₁B与B₁C所成角的大小。",
            contentLatex: #"\text{正方体棱长}2,\ \text{异面直线}A_1B\text{与}B_1C\text{所成角}"#,
            answer: "60°",
            difficulty: 0.58,
            averageTime: 130,
            hints: ["建系求方向向量", "cosθ=|cos⟨向量⟩|"],
            standardSteps: [
                solidStep(1, "建系", #"A_1(0,0,2),B(2,0,0),B_1(2,0,2),C(2,2,0)"#),
                solidStep(2, "方向向量", #"\vec{A_1B}=(2,0,-2),\ \vec{B_1C}=(0,2,-2)"#),
                solidStep(3, "夹角", #"\cos\theta=\frac{|0+0+4|}{2\sqrt2\cdot2\sqrt2}=\frac{4}{8}=\frac12"#),
                solidStep(4, "结论", #"\theta=60^\circ"#)
            ],
            shortcutSteps: [
                solidStep(1, "向量秒杀", #"\vec{A_1B}\cdot\vec{B_1C}=4,\ \cos\theta=\frac12\Rightarrow60^\circ"#)
            ],
            keyInsight: "异面直线夹角=方向向量夹角余弦的绝对值。",
            shortcutInsight: "建系后点积除以模长积，取绝对值。",
            weapon: "空间向量异面角",
            timeRatio: 2.2,
            tags: ["立体几何", "异面直线", "空间向量", "高考", "核心"]
        ),

        solidProblem(
            id: "solid_002",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["spatial_vector", "line_plane_angle"],
            content: "正方体ABCD-A₁B₁C₁D₁棱长为1，求直线BD₁与底面ABCD所成角的正弦值。",
            contentLatex: #"\text{正方体棱长}1,\ BD_1\text{与底面}ABCD\text{所成角}"#,
            answer: "√3/3",
            difficulty: 0.52,
            averageTime: 110,
            hints: ["底面法向量(0,0,1)", "sinθ=|cos⟨BD₁,n⟩|"],
            standardSteps: [
                solidStep(1, "建系", #"B(1,0,0),D_1(0,1,1)"#),
                solidStep(2, "方向向量", #"\vec{BD_1}=(-1,1,1),\ |\vec{BD_1}|=\sqrt3"#),
                solidStep(3, "线面角", #"\sin\theta=\frac{|\vec{BD_1}\cdot(0,0,1)|}{\sqrt3\cdot1}=\frac{1}{\sqrt3}=\frac{\sqrt3}{3}"#)
            ],
            shortcutSteps: [
                solidStep(1, "投影秒杀", #"D_1\text{在底面投影}D,\ \sin\theta=\frac{DD_1}{BD_1}=\frac{1}{\sqrt3}=\frac{\sqrt3}{3}"#)
            ],
            keyInsight: "线面角的正弦=方向向量与平面法向量夹角余弦的绝对值。",
            shortcutInsight: "几何上=竖直高/斜线长，体对角线BD₁=√3。",
            weapon: "线面角向量法",
            timeRatio: 2.0,
            tags: ["立体几何", "线面角", "空间向量", "高考", "核心"]
        ),

        solidProblem(
            id: "solid_003",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["spatial_vector", "dihedral_angle"],
            content: "正方体ABCD-A₁B₁C₁D₁棱长为1，求二面角C₁-BD-C的余弦值。",
            contentLatex: #"\text{正方体棱长}1,\ \text{二面角}C_1\text{-}BD\text{-}C"#,
            answer: "√3/3",
            difficulty: 0.62,
            averageTime: 150,
            hints: ["取BD中点M", "MC⊥BD, MC₁⊥BD", "∠C₁MC为平面角"],
            standardSteps: [
                solidStep(1, "取中点", #"M\text{为}BD\text{中点},\ MC\perp BD,\ MC_1\perp BD"#),
                solidStep(2, "平面角", #"\angle C_1MC\text{即二面角},\ MC=\frac{\sqrt2}{2},\ CC_1=1"#),
                solidStep(3, "求MC₁", #"MC_1=\sqrt{MC^2+CC_1^2}=\sqrt{\tfrac12+1}=\frac{\sqrt6}{2}"#),
                solidStep(4, "余弦", #"\cos\angle C_1MC=\frac{MC}{MC_1}=\frac{\sqrt2/2}{\sqrt6/2}=\frac{1}{\sqrt3}=\frac{\sqrt3}{3}"#)
            ],
            shortcutSteps: [
                solidStep(1, "法向量秒杀", #"\text{底面}\vec n_2=(0,0,1),\ \text{面}BDC_1\ \vec n_1=(1,1,-1)"#),
                solidStep(2, "代入", #"\cos=\frac{|-1|}{\sqrt3\cdot1}=\frac{\sqrt3}{3}"#)
            ],
            keyInsight: "二面角取棱的中点作两条垂线得平面角，或用法向量法。",
            shortcutInsight: "底面法向量直接取(0,0,1)，只算斜面法向量一次。",
            weapon: "二面角(中点法/法向量)",
            timeRatio: 2.4,
            tags: ["立体几何", "二面角", "空间向量", "高考", "压轴"]
        ),

        solidProblem(
            id: "solid_004",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["circumsphere"],
            content: "长方体的三条棱长分别为2、3、6，求其外接球的表面积。",
            contentLatex: #"\text{长方体棱长}2,3,6,\ \text{外接球表面积}=?"#,
            answer: "49π",
            difficulty: 0.42,
            averageTime: 80,
            hints: ["体对角线=球直径", "2R=√(2²+3²+6²)"],
            standardSteps: [
                solidStep(1, "体对角线", #"2R=\sqrt{2^2+3^2+6^2}=\sqrt{49}=7"#),
                solidStep(2, "半径", #"R=\frac72"#),
                solidStep(3, "表面积", #"S=4\pi R^2=4\pi\cdot\frac{49}{4}=49\pi"#)
            ],
            shortcutSteps: [
                solidStep(1, "公式秒杀", #"S=\pi(a^2+b^2+c^2)=\pi(4+9+36)=49\pi"#)
            ],
            keyInsight: "长方体外接球直径=体对角线。",
            shortcutInsight: "外接球表面积=π(a²+b²+c²)，免去求R。",
            weapon: "外接球体对角线模型",
            timeRatio: 2.0,
            tags: ["立体几何", "外接球", "高考", "核心"]
        ),

        solidProblem(
            id: "solid_005",
            type: .calculation,
            tier: 4,
            formulaIds: ["pyramid_volume"],
            content: "正四棱锥P-ABCD的底面边长为2，侧棱长为√6，求其高和体积。",
            contentLatex: #"\text{正四棱锥底边}2,\ \text{侧棱}\sqrt6,\ \text{高与体积}=?"#,
            answer: "高2，体积8/3",
            difficulty: 0.50,
            averageTime: 110,
            hints: ["底面对角线半长=√2", "高=√(侧棱²-半对角线²)", "V=⅓·底面积·高"],
            standardSteps: [
                solidStep(1, "半对角线", #"\text{底面对角线}=2\sqrt2,\ \text{半长}=\sqrt2"#),
                solidStep(2, "求高", #"h=\sqrt{(\sqrt6)^2-(\sqrt2)^2}=\sqrt{6-2}=2"#),
                solidStep(3, "体积", #"V=\frac13\times2^2\times2=\frac83"#)
            ],
            shortcutSteps: [
                solidStep(1, "勾股+锥体公式秒杀", #"h=\sqrt{6-2}=2,\ V=\frac13\cdot4\cdot2=\frac83"#)
            ],
            keyInsight: "正棱锥高、侧棱、底面外接圆半径构成直角三角形。",
            shortcutInsight: "侧棱²=高²+半对角线²，先求高再代体积。",
            weapon: "正棱锥高的勾股关系",
            timeRatio: 2.0,
            tags: ["立体几何", "棱锥", "体积", "高考"]
        ),

        solidProblem(
            id: "solid_006",
            type: .calculation,
            tier: 4,
            formulaIds: ["three_perpendicular", "dihedral_angle"],
            content: "三棱锥P-ABC中，PA⊥平面ABC，PA=3，AB=AC=2，∠BAC=90°。求二面角P-BC-A的正切值。",
            contentLatex: #"PA\perp\text{面}ABC,\ PA=3,AB=AC=2,\angle BAC=90^\circ"#,
            answer: "3√2/2",
            difficulty: 0.66,
            averageTime: 150,
            hints: ["取BC中点M，AM⊥BC", "三垂线定理得PM⊥BC", "tan∠PMA=PA/AM"],
            standardSteps: [
                solidStep(1, "求BC,AM", #"BC=\sqrt{2^2+2^2}=2\sqrt2,\ AM=\frac12 BC=\sqrt2\ (\text{斜边中线})"#),
                solidStep(2, "三垂线", #"AM\perp BC,\ PA\perp\text{底}\Rightarrow PM\perp BC,\ \angle PMA\text{为平面角}"#),
                solidStep(3, "正切", #"\tan\angle PMA=\frac{PA}{AM}=\frac{3}{\sqrt2}=\frac{3\sqrt2}{2}"#)
            ],
            shortcutSteps: [
                solidStep(1, "三垂线秒杀", #"\tan(\text{二面角})=\frac{PA}{AM}=\frac{3}{\sqrt2}=\frac{3\sqrt2}{2}"#)
            ],
            keyInsight: "PA垂直底面时，二面角平面角由三垂线定理在BC中点构造。",
            shortcutInsight: "tan(二面角)=竖直边PA / 底面投影边AM。",
            weapon: "三垂线定理",
            timeRatio: 2.2,
            tags: ["立体几何", "二面角", "三垂线", "高考", "压轴"]
        ),

        solidProblem(
            id: "solid_007",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["prism", "line_plane_angle"],
            content: "正三棱柱ABC-A₁B₁C₁的底面边长为2，侧棱长为2，求AB₁与底面ABC所成角。",
            contentLatex: #"\text{正三棱柱底边}2,\ \text{侧棱}2,\ AB_1\text{与底面ABC所成角}"#,
            answer: "45°",
            difficulty: 0.44,
            averageTime: 90,
            hints: ["B₁投影为B", "∠B₁AB为线面角", "tan=BB₁/AB"],
            standardSteps: [
                solidStep(1, "射影", #"BB_1\perp\text{底},\ B_1\text{投影为}B,\ \angle B_1AB\text{为所成角}"#),
                solidStep(2, "正切", #"\tan\angle B_1AB=\frac{BB_1}{AB}=\frac{2}{2}=1"#),
                solidStep(3, "结论", #"\angle B_1AB=45^\circ"#)
            ],
            shortcutSteps: [
                solidStep(1, "投影模型秒杀", #"\tan\theta=\frac{\text{侧棱}}{\text{底边}AB}=1\Rightarrow45^\circ"#)
            ],
            keyInsight: "正棱柱侧棱顶点在底面投影即下底顶点。",
            shortcutInsight: "tan(线面角)=侧棱长/底面投影边长。",
            weapon: "射影定义线面角",
            timeRatio: 1.8,
            tags: ["立体几何", "线面角", "棱柱", "高考"]
        ),

        solidProblem(
            id: "solid_008",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["spatial_vector", "dihedral_angle"],
            content: "正方体ABCD-A₁B₁C₁D₁棱长为1，E为棱CC₁的中点，求二面角E-BD-C的余弦值。",
            contentLatex: #"\text{正方体棱长}1,\ E\text{为}CC_1\text{中点},\ \text{二面角}E\text{-}BD\text{-}C"#,
            answer: "√6/3",
            difficulty: 0.70,
            averageTime: 160,
            hints: ["建系", "底面法向量(0,0,1)", "求平面BDE法向量"],
            standardSteps: [
                solidStep(1, "建系", #"B(1,0,0),D(0,1,0),C(1,1,0),E(1,1,\tfrac12)"#),
                solidStep(2, "面BDE法向量", #"\vec{BD}=(-1,1,0),\vec{BE}=(0,1,\tfrac12),\ \vec n_1=(\tfrac12,\tfrac12,-1)\parallel(1,1,-2)"#),
                solidStep(3, "底面法向量", #"\vec n_2=(0,0,1)"#),
                solidStep(4, "余弦", #"\cos\theta=\frac{|{-2}|}{\sqrt{1+1+4}\cdot1}=\frac{2}{\sqrt6}=\frac{\sqrt6}{3}"#)
            ],
            shortcutSteps: [
                solidStep(1, "法向量秒杀", #"\vec n_1=(1,1,-2),\vec n_2=(0,0,1),\ \cos=\frac{2}{\sqrt6}=\frac{\sqrt6}{3}"#)
            ],
            keyInsight: "二面角用两面法向量夹角，底面法向量取(0,0,1)。",
            shortcutInsight: "只需算斜面BDE的法向量，与(0,0,1)点积即得。",
            weapon: "二面角法向量法",
            timeRatio: 2.4,
            tags: ["立体几何", "二面角", "空间向量", "高考", "压轴"]
        ),

        solidProblem(
            id: "solid_009",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["circumsphere", "cube"],
            content: "一个球的表面积为12π，正方体内接于该球，求正方体的体积。",
            contentLatex: #"\text{球表面积}12\pi,\ \text{内接正方体体积}=?"#,
            answer: "8",
            difficulty: 0.50,
            averageTime: 100,
            hints: ["由表面积求R", "正方体体对角线=2R", "棱长=2R/√3"],
            standardSteps: [
                solidStep(1, "求半径", #"4\pi R^2=12\pi\Rightarrow R=\sqrt3"#),
                solidStep(2, "体对角线", #"\sqrt3\,a=2R=2\sqrt3\Rightarrow a=2"#),
                solidStep(3, "体积", #"V=a^3=8"#)
            ],
            shortcutSteps: [
                solidStep(1, "对角线秒杀", #"R=\sqrt3\Rightarrow a=\frac{2R}{\sqrt3}=2\Rightarrow V=8"#)
            ],
            keyInsight: "正方体内接球时，体对角线=外接球直径。",
            shortcutInsight: "棱长a=2R/√3，体积a³。",
            weapon: "内接正方体体对角线",
            timeRatio: 2.0,
            tags: ["立体几何", "外接球", "正方体", "高考"]
        ),

        solidProblem(
            id: "solid_010",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["regular_tetrahedron", "volume"],
            content: "正四面体的棱长为2，求其体积。",
            contentLatex: #"\text{正四面体棱长}2,\ V=?"#,
            answer: "2√2/3",
            difficulty: 0.56,
            averageTime: 120,
            hints: ["正四面体体积公式V=√2a³/12", "或补成正方体"],
            standardSteps: [
                solidStep(1, "底面积", #"S=\frac{\sqrt3}{4}\cdot2^2=\sqrt3"#),
                solidStep(2, "高", #"h=\sqrt{2^2-\left(\frac{2}{\sqrt3}\right)^2}=\sqrt{4-\frac43}=\frac{2\sqrt6}{3}"#),
                solidStep(3, "体积", #"V=\frac13 S h=\frac13\cdot\sqrt3\cdot\frac{2\sqrt6}{3}=\frac{2\sqrt2}{3}"#)
            ],
            shortcutSteps: [
                solidStep(1, "公式秒杀", #"V=\frac{\sqrt2}{12}a^3=\frac{\sqrt2}{12}\cdot8=\frac{2\sqrt2}{3}"#)
            ],
            keyInsight: "正四面体高=√(a²-(外接圆半径)²)，外接圆半径=a/√3。",
            shortcutInsight: "记正四面体体积公式V=√2a³/12，直接代。",
            weapon: "正四面体体积公式",
            timeRatio: 2.2,
            tags: ["立体几何", "正四面体", "体积", "高考", "核心"]
        ),

        solidProblem(
            id: "solid_011",
            type: .calculation,
            tier: 3,
            formulaIds: ["cone"],
            content: "圆锥的底面半径为3，高为4，求其侧面积和体积。",
            contentLatex: #"\text{圆锥底半径}3,\ \text{高}4,\ \text{侧面积与体积}=?"#,
            answer: "侧面积15π，体积12π",
            difficulty: 0.40,
            averageTime: 90,
            hints: ["母线l=√(3²+4²)=5", "侧面积=πrl", "体积=⅓πr²h"],
            standardSteps: [
                solidStep(1, "母线", #"l=\sqrt{3^2+4^2}=5"#),
                solidStep(2, "侧面积", #"S_{\text{侧}}=\pi r l=\pi\cdot3\cdot5=15\pi"#),
                solidStep(3, "体积", #"V=\frac13\pi r^2 h=\frac13\pi\cdot9\cdot4=12\pi"#)
            ],
            shortcutSteps: [
                solidStep(1, "公式秒杀", #"l=5,\ S_{\text{侧}}=15\pi,\ V=12\pi"#)
            ],
            keyInsight: "圆锥母线、半径、高构成直角三角形。",
            shortcutInsight: "3-4-5得母线5，直接代侧面积πrl与体积πr²h/3。",
            weapon: "圆锥基本公式",
            timeRatio: 1.8,
            tags: ["立体几何", "圆锥", "表面积", "体积", "高考"]
        ),

        solidProblem(
            id: "solid_012",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["spatial_vector", "volume"],
            content: "在空间直角坐标系中，四面体OABC的顶点为O(0,0,0)，A(2,0,0)，B(0,2,0)，C(0,0,2)，求其体积。",
            contentLatex: #"O(0,0,0),A(2,0,0),B(0,2,0),C(0,0,2),\ V=?"#,
            answer: "4/3",
            difficulty: 0.48,
            averageTime: 90,
            hints: ["V=⅙|混合积|", "OA·(OB×OC)"],
            standardSteps: [
                solidStep(1, "三向量", #"\vec{OA}=(2,0,0),\vec{OB}=(0,2,0),\vec{OC}=(0,0,2)"#),
                solidStep(2, "混合积", #"\vec{OA}\cdot(\vec{OB}\times\vec{OC})=2\cdot2\cdot2=8"#),
                solidStep(3, "体积", #"V=\frac16|8|=\frac43"#)
            ],
            shortcutSteps: [
                solidStep(1, "正交锥体秒杀", #"\text{三棱两两垂直},\ V=\frac16\cdot2\cdot2\cdot2=\frac43"#)
            ],
            keyInsight: "四面体体积=⅙·三条棱向量的混合积绝对值。",
            shortcutInsight: "三棱两两垂直时V=⅙·棱长之积。",
            weapon: "向量混合积求体积",
            timeRatio: 2.0,
            tags: ["立体几何", "空间向量", "体积", "高考"]
        ),

        solidProblem(
            id: "solid_013",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["spatial_vector", "point_plane_distance"],
            content: "正方体ABCD-A₁B₁C₁D₁棱长为1，求点A₁到平面AB₁D₁的距离。",
            contentLatex: #"\text{正方体棱长}1,\ d(A_1,\ \text{平面}AB_1D_1)=?"#,
            answer: "√3/3",
            difficulty: 0.66,
            averageTime: 150,
            hints: ["建系", "求平面AB₁D₁法向量", "d=|A₁A·n|/|n|"],
            standardSteps: [
                solidStep(1, "建系", #"A(0,0,0),B_1(1,0,1),D_1(0,1,1),A_1(0,0,1)"#),
                solidStep(2, "法向量", #"\vec{AB_1}=(1,0,1),\vec{AD_1}=(0,1,1),\ \vec n=(-1,-1,1)"#),
                solidStep(3, "距离", #"d=\frac{|\vec{AA_1}\cdot\vec n|}{|\vec n|}=\frac{|(0,0,1)\cdot(-1,-1,1)|}{\sqrt3}=\frac{1}{\sqrt3}=\frac{\sqrt3}{3}"#)
            ],
            shortcutSteps: [
                solidStep(1, "向量投影秒杀", #"d=\frac{|\vec{AA_1}\cdot\vec n|}{|\vec n|}=\frac{\sqrt3}{3}"#)
            ],
            keyInsight: "点到平面距离=连接向量在法向量方向的投影长。",
            shortcutInsight: "建系求法向量后，机械套距离公式。",
            weapon: "点面距离向量法",
            timeRatio: 2.2,
            tags: ["立体几何", "点面距离", "空间向量", "高考", "压轴"]
        ),

        solidProblem(
            id: "solid_014",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["pyramid", "dihedral_angle"],
            content: "正四棱锥P-ABCD的底面边长为2，高为2，求侧面PAB与底面ABCD所成二面角的正切值。",
            contentLatex: #"\text{正四棱锥底边}2,\ \text{高}2,\ \text{二面角}P\text{-}AB\text{-底}"#,
            answer: "2",
            difficulty: 0.58,
            averageTime: 120,
            hints: ["取AB中点M，底面中心O", "OM⊥AB且OM=1", "PM⊥AB，∠PMO为平面角"],
            standardSteps: [
                solidStep(1, "构造平面角", #"M\text{为}AB\text{中点},O\text{为底面中心},\ OM\perp AB,PM\perp AB"#),
                solidStep(2, "求边", #"OM=\frac12\times2=1,\ PO=\text{高}=2"#),
                solidStep(3, "正切", #"\tan\angle PMO=\frac{PO}{OM}=\frac{2}{1}=2"#)
            ],
            shortcutSteps: [
                solidStep(1, "斜高模型秒杀", #"\tan(\text{二面角})=\frac{\text{锥高}PO}{\text{底面中心到边距}OM}=\frac21=2"#)
            ],
            keyInsight: "正棱锥侧面与底面的二面角，由锥高与底面中心到底边的距离决定。",
            shortcutInsight: "tan=锥高/(底面中心到该边的距离)，正方形底为半边长。",
            weapon: "正棱锥二面角模型",
            timeRatio: 2.0,
            tags: ["立体几何", "二面角", "棱锥", "高考", "核心"]
        )
    ]

    // MARK: - 工厂方法
    private static func solidStep(_ order: Int, _ description: String, _ latex: String, _ annotation: String = "") -> SolutionStep {
        SolutionStep(order: order, description: description, latex: latex, annotation: annotation)
    }

    private static func solidProblem(
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
        commonMistakes: [String] = ["建系坐标取错", "线面角与二面角混淆", "法向量方向致余弦符号判断错"]
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
