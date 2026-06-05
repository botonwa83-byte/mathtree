import Foundation

// MARK: - 平面向量综合压轴专题
// 目标: 用数量积统一夹角、投影、轨迹、最值和几何结构。

extension SampleData {
    static let vectorProblems: [Problem] = [
        vectorProblem(
            id: "vec_001",
            type: .calculation,
            tier: 4,
            formulaIds: ["vector_dot", "cosine_rule"],
            content: "已知|a|=2，|b|=3，|a+b|=√19，求a·b及a与b的夹角。",
            contentLatex: #"|\vec a|=2,\quad |\vec b|=3,\quad |\vec a+\vec b|=\sqrt{19}"#,
            answer: "a·b=3，夹角60°",
            difficulty: 0.70,
            averageTime: 150,
            hints: ["平方|a+b|", "|a+b|²=|a|²+|b|²+2a·b"],
            standardSteps: [
                vectorStep(1, "平方模长", #"|\vec a+\vec b|^2=|\vec a|^2+|\vec b|^2+2\vec a\cdot\vec b"#),
                vectorStep(2, "代入数据", #"19=4+9+2\vec a\cdot\vec b"#),
                vectorStep(3, "求数量积", #"\vec a\cdot\vec b=3"#),
                vectorStep(4, "求夹角", #"3=2\cdot3\cos\theta\Rightarrow \cos\theta=\frac12,\ \theta=60^\circ"#)
            ],
            shortcutSteps: [
                vectorStep(1, "模长平方秒杀", #"\vec a\cdot\vec b=\frac{|\vec a+\vec b|^2-|\vec a|^2-|\vec b|^2}{2}=3"#),
                vectorStep(2, "夹角反读", #"\cos\theta=\frac{3}{6}=\frac12"#)
            ],
            keyInsight: "向量和的模长条件本质是数量积条件。",
            shortcutInsight: "平方模长公式直接反推出夹角。",
            weapon: "模长平方反读数量积",
            timeRatio: 2.2,
            tags: ["向量", "数量积", "夹角", "代表题"]
        ),

        vectorProblem(
            id: "vec_002",
            type: .calculation,
            tier: 4,
            formulaIds: ["vector_dot"],
            content: "已知|a|=|b|=1，且(a+2b)⊥(2a-b)，求a与b的夹角。",
            contentLatex: #"|\vec a|=|\vec b|=1,\quad (\vec a+2\vec b)\perp(2\vec a-\vec b)"#,
            answer: "90°",
            difficulty: 0.68,
            averageTime: 140,
            hints: ["垂直等价于数量积为0", "展开数量积"],
            standardSteps: [
                vectorStep(1, "垂直转数量积", #"(\vec a+2\vec b)\cdot(2\vec a-\vec b)=0"#),
                vectorStep(2, "展开", #"2|\vec a|^2+3\vec a\cdot\vec b-2|\vec b|^2=0"#),
                vectorStep(3, "代入单位长度", #"2+3\vec a\cdot\vec b-2=0\Rightarrow \vec a\cdot\vec b=0"#),
                vectorStep(4, "得夹角", #"\cos\theta=0\Rightarrow \theta=90^\circ"#)
            ],
            shortcutSteps: [
                vectorStep(1, "同长项抵消", #"2|\vec a|^2-2|\vec b|^2=0"#),
                vectorStep(2, "只剩数量积", #"3\vec a\cdot\vec b=0\Rightarrow \vec a\perp\vec b"#)
            ],
            keyInsight: "垂直条件展开后，等长项会自动抵消。",
            shortcutInsight: "先观察等长结构，减少展开量。",
            weapon: "垂直条件数量积化",
            timeRatio: 2.4,
            tags: ["向量", "垂直", "数量积", "综合"]
        ),

        vectorProblem(
            id: "vec_003",
            type: .calculation,
            tier: 4,
            formulaIds: ["vector_dot"],
            content: "已知|a|=3，|b|=4，a与b夹角为60°，求|2a-b|。",
            contentLatex: #"|\vec a|=3,\quad |\vec b|=4,\quad \langle\vec a,\vec b\rangle=60^\circ,\quad |2\vec a-\vec b|=?"#,
            answer: "2√7",
            difficulty: 0.68,
            averageTime: 150,
            hints: ["先求a·b", "平方|2a-b|"],
            standardSteps: [
                vectorStep(1, "求数量积", #"\vec a\cdot\vec b=|\vec a||\vec b|\cos60^\circ=6"#),
                vectorStep(2, "平方展开", #"|2\vec a-\vec b|^2=4|\vec a|^2+|\vec b|^2-4\vec a\cdot\vec b"#),
                vectorStep(3, "代入", #"=4\cdot9+16-4\cdot6=28"#),
                vectorStep(4, "开方", #"|2\vec a-\vec b|=2\sqrt7"#)
            ],
            shortcutSteps: [
                vectorStep(1, "一次平方", #"|2a-b|^2=36+16-24=28"#),
                vectorStep(2, "直接开方", #"|2a-b|=2\sqrt7"#)
            ],
            keyInsight: "线性组合的模长统一用数量积展开。",
            shortcutInsight: "求模先平方，避免坐标化。",
            weapon: "向量线性组合平方",
            timeRatio: 2.1,
            tags: ["向量", "模长", "夹角", "代表题"]
        ),

        vectorProblem(
            id: "vec_004",
            type: .calculation,
            tier: 4,
            formulaIds: ["vector_dot", "dist_formula"],
            content: "已知A(1,2)，B(5,4)，C(t,0)，若∠ABC=90°，求t。",
            contentLatex: #"A(1,2),\ B(5,4),\ C(t,0),\quad \angle ABC=90^\circ"#,
            answer: "t=7",
            difficulty: 0.70,
            averageTime: 150,
            hints: ["用BA·BC=0", "注意角的顶点是B"],
            standardSteps: [
                vectorStep(1, "写出向量", #"\vec{BA}=(-4,-2),\quad \vec{BC}=(t-5,-4)"#),
                vectorStep(2, "垂直条件", #"\vec{BA}\cdot\vec{BC}=0"#),
                vectorStep(3, "代入计算", #"-4(t-5)+8=0"#),
                vectorStep(4, "求参数", #"t=7"#)
            ],
            shortcutSteps: [
                vectorStep(1, "顶点向量化", #"\angle ABC=90^\circ\Rightarrow \vec{BA}\cdot\vec{BC}=0"#),
                vectorStep(2, "一行解参", #"-4(t-5)+8=0\Rightarrow t=7"#)
            ],
            keyInsight: "坐标几何中的直角条件就是数量积为零。",
            shortcutInsight: "先找角的顶点，再写从顶点出发的两个向量。",
            weapon: "直角顶点数量积",
            timeRatio: 2.2,
            tags: ["向量", "解析几何", "垂直", "综合"]
        ),

        vectorProblem(
            id: "vec_005",
            type: .calculation,
            tier: 4,
            formulaIds: ["vector_dot", "tri_area_base"],
            content: "A(0,0)，B(6,0)，C(2,4)。求AC在AB方向上的投影长度，并求△ABC面积。",
            contentLatex: #"A(0,0),\ B(6,0),\ C(2,4)"#,
            answer: "投影长度2，面积12",
            difficulty: 0.66,
            averageTime: 140,
            hints: ["投影长度=(AC·AB)/|AB|", "面积用底高"],
            standardSteps: [
                vectorStep(1, "写向量", #"\vec{AB}=(6,0),\quad \vec{AC}=(2,4)"#),
                vectorStep(2, "投影长度", #"\frac{\vec{AC}\cdot\vec{AB}}{|\vec{AB}|}=\frac{12}{6}=2"#),
                vectorStep(3, "求高", #"C到AB的距离为4"#),
                vectorStep(4, "面积", #"S=\frac12\cdot6\cdot4=12"#)
            ],
            shortcutSteps: [
                vectorStep(1, "水平底秒读", #"AB在x轴上，AC的x分量就是投影长度2"#),
                vectorStep(2, "面积秒读", #"S=\frac12\cdot6\cdot4=12"#)
            ],
            keyInsight: "投影是数量积的几何意义，面积来自垂直分量。",
            shortcutInsight: "选好坐标轴后，投影和高可直接读分量。",
            weapon: "投影分量法",
            timeRatio: 2.0,
            tags: ["向量", "投影", "面积", "代表题"]
        ),

        vectorProblem(
            id: "vec_006",
            type: .calculation,
            tier: 5,
            formulaIds: ["vector_dot", "circle_eq"],
            content: "动点P在圆x²+y²=25上，求向量OP与u=(3,4)的数量积的最大值。",
            contentLatex: #"P\in x^2+y^2=25,\quad \vec u=(3,4),\quad \max(\vec{OP}\cdot\vec u)"#,
            answer: "25",
            difficulty: 0.72,
            averageTime: 160,
            hints: ["用柯西不等式/数量积", "|OP|=5，|u|=5"],
            standardSteps: [
                vectorStep(1, "数量积上界", #"\vec{OP}\cdot\vec u\le |\vec{OP}||\vec u|"#),
                vectorStep(2, "代入模长", #"|\vec{OP}|=5,\quad |\vec u|=5"#),
                vectorStep(3, "最大值", #"\max=25"#),
                vectorStep(4, "取等条件", #"\vec{OP}\parallel \vec u，且同向"#)
            ],
            shortcutSteps: [
                vectorStep(1, "点积最大即同向", #"\max \vec{OP}\cdot\vec u=5\cdot5=25"#)
            ],
            keyInsight: "定长向量与定向向量的数量积最大值等于模长乘积。",
            shortcutInsight: "点在圆上时，OP定长，直接用数量积上界。",
            weapon: "柯西点积上界",
            timeRatio: 2.5,
            tags: ["向量", "圆", "最值", "综合"]
        ),

        vectorProblem(
            id: "vec_007",
            type: .calculation,
            tier: 5,
            formulaIds: ["vector_dot", "double_angle"],
            content: "单位向量e=(cosθ,sinθ)，求e·(1,2)的取值范围。",
            contentLatex: #"\vec e=(\cos\theta,\sin\theta),\quad \vec e\cdot(1,2)"#,
            answer: "[-√5, √5]",
            difficulty: 0.70,
            averageTime: 150,
            hints: ["写成cosθ+2sinθ", "辅助角或数量积上界"],
            standardSteps: [
                vectorStep(1, "数量积表达", #"\vec e\cdot(1,2)=\cos\theta+2\sin\theta"#),
                vectorStep(2, "辅助角值域", #"\cos\theta+2\sin\theta=\sqrt5\sin(\theta+\varphi)"#),
                vectorStep(3, "读范围", #"[-\sqrt5,\sqrt5]"#)
            ],
            shortcutSteps: [
                vectorStep(1, "单位向量点积", #"|\vec e|=1,\quad |(1,2)|=\sqrt5"#),
                vectorStep(2, "数量积范围", #"\vec e\cdot(1,2)\in[-\sqrt5,\sqrt5]"#)
            ],
            keyInsight: "三角辅助角和单位向量点积是同一件事。",
            shortcutInsight: "单位向量与固定向量点积的范围就是正负模长。",
            weapon: "单位向量投影范围",
            timeRatio: 2.8,
            tags: ["向量", "三角函数", "投影", "综合"]
        ),

        vectorProblem(
            id: "vec_008",
            type: .proof,
            tier: 4,
            formulaIds: ["vector_dot"],
            content: "△ABC中，M为BC中点。证明：AB+AC=2AM（向量式）。",
            contentLatex: #"M为BC中点,\quad \vec{AB}+\vec{AC}=2\vec{AM}"#,
            answer: "恒等式成立",
            difficulty: 0.64,
            averageTime: 120,
            hints: ["用位置向量表示", "中点位置向量是平均值"],
            standardSteps: [
                vectorStep(1, "设位置向量", #"\vec A,\vec B,\vec C分别为A,B,C的位置向量"#),
                vectorStep(2, "中点向量", #"\vec M=\frac{\vec B+\vec C}{2}"#),
                vectorStep(3, "计算左边", #"\vec{AB}+\vec{AC}=(\vec B-\vec A)+(\vec C-\vec A)=\vec B+\vec C-2\vec A"#),
                vectorStep(4, "计算右边", #"2\vec{AM}=2(\vec M-\vec A)=\vec B+\vec C-2\vec A"#)
            ],
            shortcutSteps: [
                vectorStep(1, "中点平均", #"\vec{AM}=\frac{\vec{AB}+\vec{AC}}{2}"#),
                vectorStep(2, "直接移项", #"\vec{AB}+\vec{AC}=2\vec{AM}"#)
            ],
            keyInsight: "中点公式是向量几何中线问题的核心。",
            shortcutInsight: "中线向量等于两边向量的平均。",
            weapon: "中点向量平均法",
            timeRatio: 2.0,
            tags: ["向量", "中点", "证明", "代表题"]
        ),

        vectorProblem(
            id: "vec_009",
            type: .calculation,
            tier: 5,
            formulaIds: ["vector_dot", "cosine_rule"],
            content: "△ABC中，AB=4，AC=6，∠A=60°，M为BC中点，求AM。",
            contentLatex: #"AB=4,\quad AC=6,\quad \angle A=60^\circ,\quad M为BC中点"#,
            answer: "5",
            difficulty: 0.72,
            averageTime: 170,
            hints: ["AM=(AB+AC)/2", "平方求模"],
            standardSteps: [
                vectorStep(1, "中线向量", #"\vec{AM}=\frac{\vec{AB}+\vec{AC}}{2}"#),
                vectorStep(2, "平方模长", #"AM^2=\frac14(|AB|^2+|AC|^2+2\vec{AB}\cdot\vec{AC})"#),
                vectorStep(3, "数量积", #"\vec{AB}\cdot\vec{AC}=4\cdot6\cos60^\circ=12"#),
                vectorStep(4, "求长度", #"AM^2=\frac14(16+36+24)=25\Rightarrow AM=5"#)
            ],
            shortcutSteps: [
                vectorStep(1, "中线平方公式", #"AM^2=\frac{2AB^2+2AC^2-BC^2}{4}"#),
                vectorStep(2, "也可直接向量", #"AM=\frac12|\vec{AB}+\vec{AC}|=\frac12\sqrt{100}=5"#)
            ],
            keyInsight: "中线长度可由两边向量和的模长得到。",
            shortcutInsight: "中线就是两边向量平均，直接平方。",
            weapon: "中线向量平方法",
            timeRatio: 2.5,
            tags: ["向量", "中线", "数量积", "压轴"]
        ),

        vectorProblem(
            id: "vec_010",
            type: .calculation,
            tier: 4,
            formulaIds: ["vector_dot"],
            content: "已知|a|=|b|=1，|a-b|=1，求a·b和|a+b|。",
            contentLatex: #"|\vec a|=|\vec b|=1,\quad |\vec a-\vec b|=1"#,
            answer: "a·b=1/2，|a+b|=√3",
            difficulty: 0.66,
            averageTime: 130,
            hints: ["平方|a-b|", "再平方|a+b|"],
            standardSteps: [
                vectorStep(1, "平方差向量", #"|\vec a-\vec b|^2=2-2\vec a\cdot\vec b=1"#),
                vectorStep(2, "数量积", #"\vec a\cdot\vec b=\frac12"#),
                vectorStep(3, "求和向量", #"|\vec a+\vec b|^2=2+2\cdot\frac12=3"#),
                vectorStep(4, "开方", #"|\vec a+\vec b|=\sqrt3"#)
            ],
            shortcutSteps: [
                vectorStep(1, "差定角", #"2-2\cos\theta=1\Rightarrow \cos\theta=\frac12"#),
                vectorStep(2, "和定长", #"|\vec a+\vec b|^2=2+2\cos\theta=3"#)
            ],
            keyInsight: "单位向量的和差长度完全由夹角决定。",
            shortcutInsight: "差长为1的两个单位向量夹角60°。",
            weapon: "单位向量和差模板",
            timeRatio: 2.2,
            tags: ["向量", "单位向量", "数量积", "代表题"]
        ),

        vectorProblem(
            id: "vec_011",
            type: .proof,
            tier: 4,
            formulaIds: ["vector_dot"],
            content: "证明：若|a+b|=|a-b|，则a⊥b。",
            contentLatex: #"|\vec a+\vec b|=|\vec a-\vec b|\Rightarrow \vec a\perp\vec b"#,
            answer: "a·b=0，故a⊥b",
            difficulty: 0.64,
            averageTime: 110,
            hints: ["两边平方", "比较展开式"],
            standardSteps: [
                vectorStep(1, "两边平方", #"|\vec a+\vec b|^2=|\vec a-\vec b|^2"#),
                vectorStep(2, "展开左边", #"|\vec a|^2+|\vec b|^2+2\vec a\cdot\vec b"#),
                vectorStep(3, "展开右边", #"|\vec a|^2+|\vec b|^2-2\vec a\cdot\vec b"#),
                vectorStep(4, "比较得", #"4\vec a\cdot\vec b=0\Rightarrow \vec a\cdot\vec b=0"#)
            ],
            shortcutSteps: [
                vectorStep(1, "几何识别", #"a+b与a-b是平行四边形两条对角线"#),
                vectorStep(2, "等对角线反推", #"两条对角线相等\Rightarrow 邻边垂直"#)
            ],
            keyInsight: "和差向量的模长相等，等价于数量积为零。",
            shortcutInsight: "向量代数就是平行四边形几何。",
            weapon: "和差模长判垂直",
            timeRatio: 2.2,
            tags: ["向量", "垂直", "证明", "代表题"]
        ),

        vectorProblem(
            id: "vec_012",
            type: .calculation,
            tier: 5,
            formulaIds: ["vector_dot", "dist_formula"],
            content: "设a=(3,4)，b=(1,2)，t为实数。求|a-tb|的最小值及对应t。",
            contentLatex: #"\vec a=(3,4),\quad \vec b=(1,2),\quad \min_{t\in R}|\vec a-t\vec b|"#,
            answer: "最小值2√5/5，对应t=11/5",
            difficulty: 0.78,
            averageTime: 190,
            hints: ["投影思想", "最小时a-tb垂直b"],
            standardSteps: [
                vectorStep(1, "最小条件", #"|\vec a-t\vec b|最小时，\vec a-t\vec b\perp \vec b"#),
                vectorStep(2, "列数量积", #"(\vec a-t\vec b)\cdot\vec b=0"#),
                vectorStep(3, "求t", #"\vec a\cdot\vec b=11,\quad |\vec b|^2=5\Rightarrow t=\frac{11}{5}"#),
                vectorStep(4, "求最小值", #"d^2=|\vec a|^2-\frac{(\vec a\cdot\vec b)^2}{|\vec b|^2}=25-\frac{121}{5}=\frac45"#)
            ],
            shortcutSteps: [
                vectorStep(1, "投影系数", #"t=\frac{\vec a\cdot\vec b}{|\vec b|^2}=\frac{11}{5}"#),
                vectorStep(2, "垂距公式", #"d=\sqrt{25-\frac{121}{5}}=\frac{2\sqrt5}{5}"#)
            ],
            keyInsight: "向量到一条方向线的最短距离来自正交投影。",
            shortcutInsight: "最小时残差向量必垂直方向向量。",
            weapon: "正交投影最值",
            timeRatio: 2.8,
            tags: ["向量", "投影", "最值", "压轴"]
        ),

        vectorProblem(
            id: "vec_013",
            type: .calculation,
            tier: 5,
            formulaIds: ["vector_dot", "dist_formula"],
            content: "点P在直线y=x上运动，A(3,1)。求AP的最小值及此时P的坐标。",
            contentLatex: #"P(t,t),\quad A(3,1),\quad \min AP"#,
            answer: "P(2,2)，最小值√2",
            difficulty: 0.74,
            averageTime: 170,
            hints: ["设P(t,t)", "最小距离对应垂直投影"],
            standardSteps: [
                vectorStep(1, "设点", #"P(t,t)"#),
                vectorStep(2, "平方距离", #"AP^2=(t-3)^2+(t-1)^2=2t^2-8t+10"#),
                vectorStep(3, "求最小", #"AP^2=2(t-2)^2+2"#),
                vectorStep(4, "结论", #"P(2,2),\quad AP_{\min}=\sqrt2"#)
            ],
            shortcutSteps: [
                vectorStep(1, "投影到方向(1,1)", #"t=\frac{(3,1)\cdot(1,1)}{|(1,1)|^2}=2"#),
                vectorStep(2, "垂距", #"P=(2,2),\quad AP=\sqrt{(1)^2+(-1)^2}=\sqrt2"#)
            ],
            keyInsight: "点到直线最短距离就是向量正交投影。",
            shortcutInsight: "直线过原点时，投影系数一行算出。",
            weapon: "点到方向线投影",
            timeRatio: 2.6,
            tags: ["向量", "解析几何", "最值", "综合"]
        ),

        vectorProblem(
            id: "vec_014",
            type: .calculation,
            tier: 5,
            formulaIds: ["vector_dot"],
            content: "向量a=(t,1)，b=(1,t)，若a与b的夹角为60°，求t。",
            contentLatex: #"\vec a=(t,1),\quad \vec b=(1,t),\quad \angle(\vec a,\vec b)=60^\circ"#,
            answer: "t=2±√3",
            difficulty: 0.78,
            averageTime: 190,
            hints: ["用cos60°", "注意|a|=|b|=√(t²+1)"],
            standardSteps: [
                vectorStep(1, "数量积", #"\vec a\cdot\vec b=2t"#),
                vectorStep(2, "模长", #"|\vec a|=|\vec b|=\sqrt{t^2+1}"#),
                vectorStep(3, "夹角条件", #"\frac{2t}{t^2+1}=\frac12"#),
                vectorStep(4, "解方程", #"t^2-4t+1=0\Rightarrow t=2\pm\sqrt3"#)
            ],
            shortcutSteps: [
                vectorStep(1, "对称结构", #"\cos\theta=\frac{2t}{t^2+1}"#),
                vectorStep(2, "代60度", #"4t=t^2+1\Rightarrow t=2\pm\sqrt3"#)
            ],
            keyInsight: "坐标含参夹角题，数量积直接给参数方程。",
            shortcutInsight: "对称向量模长相同，式子会很简洁。",
            weapon: "含参夹角方程",
            timeRatio: 2.4,
            tags: ["向量", "夹角", "参数", "压轴"]
        ),

        vectorProblem(
            id: "vec_015",
            type: .calculation,
            tier: 4,
            formulaIds: ["vector_dot"],
            content: "平行四边形ABCD中，AB=3，AD=5，对角线AC=7，求另一条对角线BD。",
            contentLatex: #"AB=3,\quad AD=5,\quad AC=7,\quad BD=?"#,
            answer: "√19",
            difficulty: 0.70,
            averageTime: 160,
            hints: ["用平行四边形法则", "AC=a+b，BD=a-b"],
            standardSteps: [
                vectorStep(1, "设邻边向量", #"\vec{AB}=\vec a,\quad \vec{AD}=\vec b"#),
                vectorStep(2, "对角线", #"AC=|\vec a+\vec b|=7,\quad BD=|\vec a-\vec b|"#),
                vectorStep(3, "平行四边形恒等式", #"|\vec a+\vec b|^2+|\vec a-\vec b|^2=2(|\vec a|^2+|\vec b|^2)"#),
                vectorStep(4, "代入", #"49+BD^2=2(9+25)=68\Rightarrow BD=\sqrt{19}"#)
            ],
            shortcutSteps: [
                vectorStep(1, "对角线平方和", #"AC^2+BD^2=2(AB^2+AD^2)"#),
                vectorStep(2, "一行计算", #"BD^2=68-49=19"#)
            ],
            keyInsight: "平行四边形对角线公式来自向量和差平方。",
            shortcutInsight: "直接记住对角线平方和等于邻边平方和的2倍。",
            weapon: "平行四边形和差平方",
            timeRatio: 2.4,
            tags: ["向量", "平行四边形", "对角线", "代表题"]
        ),

        vectorProblem(
            id: "vec_016",
            type: .calculation,
            tier: 5,
            formulaIds: ["vector_dot"],
            content: "已知|a|=1，|b|=2，a与b夹角为120°。求|a+λb|的最小值及对应λ。",
            contentLatex: #"|\vec a|=1,\quad |\vec b|=2,\quad \angle(\vec a,\vec b)=120^\circ,\quad \min_\lambda|\vec a+\lambda\vec b|"#,
            answer: "最小值√3/2，对应λ=1/4",
            difficulty: 0.80,
            averageTime: 210,
            hints: ["平方后关于λ二次函数", "a·b=-1"],
            standardSteps: [
                vectorStep(1, "求数量积", #"\vec a\cdot\vec b=1\cdot2\cos120^\circ=-1"#),
                vectorStep(2, "平方模长", #"|\vec a+\lambda\vec b|^2=1+4\lambda^2+2\lambda(-1)"#),
                vectorStep(3, "配方", #"4\lambda^2-2\lambda+1=4(\lambda-\frac14)^2+\frac34"#),
                vectorStep(4, "结论", #"\lambda=\frac14,\quad \min=\frac{\sqrt3}{2}"#)
            ],
            shortcutSteps: [
                vectorStep(1, "投影最值", #"\lambda=-\frac{\vec a\cdot\vec b}{|\vec b|^2}=\frac14"#),
                vectorStep(2, "最小残差", #"d^2=|\vec a|^2-\frac{(\vec a\cdot\vec b)^2}{|\vec b|^2}=1-\frac14=\frac34"#)
            ],
            keyInsight: "线性组合模长最值本质是正交投影。",
            shortcutInsight: "最小点使a+λb垂直b。",
            weapon: "参数向量投影最值",
            timeRatio: 2.8,
            tags: ["向量", "参数", "最值", "压轴"]
        ),

        vectorProblem(
            id: "vec_017",
            type: .calculation,
            tier: 4,
            formulaIds: ["vector_dot"],
            content: "已知|a|=|b|=1，a与b夹角为60°，求(2a-b)·(a+3b)。",
            contentLatex: #"|\vec a|=|\vec b|=1,\quad \angle(\vec a,\vec b)=60^\circ"#,
            answer: "3/2",
            difficulty: 0.66,
            averageTime: 130,
            hints: ["先求a·b=1/2", "展开数量积"],
            standardSteps: [
                vectorStep(1, "求数量积", #"\vec a\cdot\vec b=\frac12"#),
                vectorStep(2, "展开", #"(2\vec a-\vec b)\cdot(\vec a+3\vec b)=2|\vec a|^2+5\vec a\cdot\vec b-3|\vec b|^2"#),
                vectorStep(3, "代入", #"=2+5\cdot\frac12-3=\frac32"#)
            ],
            shortcutSteps: [
                vectorStep(1, "一次展开", #"2+6a\cdot b-a\cdot b-3=5\cdot\frac12-1=\frac32"#)
            ],
            keyInsight: "复杂数量积先展开成|a|²、|b|²和a·b。",
            shortcutInsight: "所有信息最终只剩三个基础量。",
            weapon: "数量积基元化",
            timeRatio: 2.0,
            tags: ["向量", "数量积", "计算", "代表题"]
        ),

        vectorProblem(
            id: "vec_018",
            type: .calculation,
            tier: 5,
            formulaIds: ["vector_dot", "dist_formula"],
            content: "A(0,0)，B(4,0)，C(1,3)。求从B、C出发的两条中线所成角的余弦值。",
            contentLatex: #"A(0,0),\ B(4,0),\ C(1,3)"#,
            answer: "-8/√145",
            difficulty: 0.82,
            averageTime: 240,
            hints: ["先求两个中点", "写出两条中线方向向量"],
            standardSteps: [
                vectorStep(1, "求中点", #"AC中点M(\frac12,\frac32),\quad AB中点N(2,0)"#),
                vectorStep(2, "方向向量", #"\vec{BM}=(-\frac72,\frac32),\quad \vec{CN}=(1,-3)"#),
                vectorStep(3, "数量积", #"\vec{BM}\cdot\vec{CN}=-\frac72-\frac92=-8"#),
                vectorStep(4, "模长", #"|\vec{BM}|=\frac{\sqrt{58}}{2},\quad |\vec{CN}|=\sqrt{10}"#),
                vectorStep(5, "余弦", #"\cos\theta=\frac{-8}{(\sqrt{58}/2)\sqrt{10}}=-\frac8{\sqrt{145}}"#)
            ],
            shortcutSteps: [
                vectorStep(1, "中点后直接点积", #"\vec{BM}=(-3.5,1.5),\quad \vec{CN}=(1,-3)"#),
                vectorStep(2, "一行余弦", #"\cos\theta=\frac{-8}{\sqrt{14.5}\sqrt{10}}=-\frac8{\sqrt{145}}"#)
            ],
            keyInsight: "中线夹角问题转为两个方向向量的夹角。",
            shortcutInsight: "先求中点，再套点积公式。",
            weapon: "中线方向向量化",
            timeRatio: 2.5,
            tags: ["向量", "中线", "夹角", "压轴"]
        ),

        vectorProblem(
            id: "vec_019",
            type: .calculation,
            tier: 5,
            formulaIds: ["vector_dot", "circle_eq"],
            content: "A(-1,0)，B(1,0)，P在圆x²+y²=4上运动。求PA·PB的值。",
            contentLatex: #"A(-1,0),\ B(1,0),\ P(x,y),\ x^2+y^2=4"#,
            answer: "3",
            difficulty: 0.72,
            averageTime: 150,
            hints: ["写出PA和PB", "利用圆方程"],
            standardSteps: [
                vectorStep(1, "设P坐标", #"P(x,y)"#),
                vectorStep(2, "写向量", #"\vec{PA}=(-1-x,-y),\quad \vec{PB}=(1-x,-y)"#),
                vectorStep(3, "数量积", #"\vec{PA}\cdot\vec{PB}=x^2+y^2-1"#),
                vectorStep(4, "代入圆", #"x^2+y^2=4\Rightarrow \vec{PA}\cdot\vec{PB}=3"#)
            ],
            shortcutSteps: [
                vectorStep(1, "圆上不变量", #"\vec{PA}\cdot\vec{PB}=OP^2-OA^2"#),
                vectorStep(2, "直接代入", #"4-1=3"#)
            ],
            keyInsight: "对称定点与圆上动点的数量积会出现不变量。",
            shortcutInsight: "利用对称坐标可一眼看到OP²-OA²。",
            weapon: "圆上点积不变量",
            timeRatio: 2.8,
            tags: ["向量", "圆", "不变量", "压轴"]
        ),

        vectorProblem(
            id: "vec_020",
            type: .proof,
            tier: 5,
            formulaIds: ["vector_dot"],
            content: "设a、b、c为单位向量，且a+b+c=0。证明：a·b=b·c=c·a=-1/2。",
            contentLatex: #"|\vec a|=|\vec b|=|\vec c|=1,\quad \vec a+\vec b+\vec c=0"#,
            answer: "a·b=b·c=c·a=-1/2",
            difficulty: 0.76,
            averageTime: 180,
            hints: ["由a+b=-c平方", "循环同理"],
            standardSteps: [
                vectorStep(1, "由和为零", #"\vec a+\vec b=-\vec c"#),
                vectorStep(2, "两边平方", #"|\vec a+\vec b|^2=|\vec c|^2=1"#),
                vectorStep(3, "展开", #"1+1+2\vec a\cdot\vec b=1\Rightarrow \vec a\cdot\vec b=-\frac12"#),
                vectorStep(4, "循环同理", #"\vec b\cdot\vec c=\vec c\cdot\vec a=-\frac12"#)
            ],
            shortcutSteps: [
                vectorStep(1, "三向量闭合", #"三个单位向量和为0，首尾相接形成正三角形"#),
                vectorStep(2, "夹角120度", #"\cos120^\circ=-\frac12"#)
            ],
            keyInsight: "单位向量和为零意味着三方向两两成120°。",
            shortcutInsight: "闭合等长三向量就是正三角形。",
            weapon: "单位向量闭合结构",
            timeRatio: 2.5,
            tags: ["向量", "单位向量", "证明", "综合"]
        ),

        vectorProblem(
            id: "vec_021",
            type: .calculation,
            tier: 5,
            formulaIds: ["vector_dot", "tri_area_base"],
            content: "等腰三角形ABC中，AB=AC=5，BC=6。求AB·AC与△ABC面积。",
            contentLatex: #"AB=AC=5,\quad BC=6"#,
            answer: "AB·AC=7，面积12",
            difficulty: 0.72,
            averageTime: 170,
            hints: ["用|AB-AC|=BC", "面积可由高求"],
            standardSteps: [
                vectorStep(1, "向量差对应底边", #"|\vec{AB}-\vec{AC}|=BC=6"#),
                vectorStep(2, "平方展开", #"36=25+25-2\vec{AB}\cdot\vec{AC}"#),
                vectorStep(3, "数量积", #"\vec{AB}\cdot\vec{AC}=7"#),
                vectorStep(4, "求面积", #"高=\sqrt{5^2-3^2}=4,\quad S=\frac12\cdot6\cdot4=12"#)
            ],
            shortcutSteps: [
                vectorStep(1, "余弦定理点积版", #"\vec{AB}\cdot\vec{AC}=\frac{AB^2+AC^2-BC^2}{2}=7"#),
                vectorStep(2, "等腰高", #"h=4,\quad S=12"#)
            ],
            keyInsight: "三角形边长关系可直接转成两边向量的数量积。",
            shortcutInsight: "数量积就是余弦定理的向量形式。",
            weapon: "余弦定理向量化",
            timeRatio: 2.4,
            tags: ["向量", "三角形", "面积", "综合"]
        ),

        vectorProblem(
            id: "vec_022",
            type: .proof,
            tier: 5,
            formulaIds: ["vector_dot", "circle_eq"],
            content: "A(-1,0)，B(1,0)，动点P满足PA·PB=0。证明P的轨迹为圆x²+y²=1。",
            contentLatex: #"A(-1,0),\ B(1,0),\quad \vec{PA}\cdot\vec{PB}=0"#,
            answer: "x²+y²=1",
            difficulty: 0.74,
            averageTime: 170,
            hints: ["设P(x,y)", "展开数量积"],
            standardSteps: [
                vectorStep(1, "设点", #"P(x,y)"#),
                vectorStep(2, "写向量", #"\vec{PA}=(-1-x,-y),\quad \vec{PB}=(1-x,-y)"#),
                vectorStep(3, "数量积条件", #"(-1-x)(1-x)+y^2=0"#),
                vectorStep(4, "化简轨迹", #"x^2+y^2-1=0"#)
            ],
            shortcutSteps: [
                vectorStep(1, "直径圆识别", #"\vec{PA}\cdot\vec{PB}=0\Rightarrow PA\perp PB"#),
                vectorStep(2, "圆周角定理", #"以AB为直径的圆，半径1，方程x^2+y^2=1"#)
            ],
            keyInsight: "PA·PB=0是以AB为直径的圆的向量表达。",
            shortcutInsight: "点积为零直接识别直径圆。",
            weapon: "直径圆数量积轨迹",
            timeRatio: 3.0,
            tags: ["向量", "轨迹", "圆", "压轴"]
        ),

        vectorProblem(
            id: "vec_023",
            type: .calculation,
            tier: 5,
            formulaIds: ["vector_dot", "circle_eq"],
            content: "A(-2,0)，B(2,0)，动点P满足PA·PB=5。求P的轨迹方程。",
            contentLatex: #"A(-2,0),\ B(2,0),\quad \vec{PA}\cdot\vec{PB}=5"#,
            answer: "x²+y²=9",
            difficulty: 0.76,
            averageTime: 180,
            hints: ["设P(x,y)", "对称定点会化成x²+y²-4"],
            standardSteps: [
                vectorStep(1, "设点与向量", #"P(x,y),\quad \vec{PA}=(-2-x,-y),\quad \vec{PB}=(2-x,-y)"#),
                vectorStep(2, "展开数量积", #"\vec{PA}\cdot\vec{PB}=x^2+y^2-4"#),
                vectorStep(3, "代入条件", #"x^2+y^2-4=5"#),
                vectorStep(4, "轨迹方程", #"x^2+y^2=9"#)
            ],
            shortcutSteps: [
                vectorStep(1, "对称点积公式", #"\vec{PA}\cdot\vec{PB}=OP^2-OA^2"#),
                vectorStep(2, "直接得圆", #"OP^2-4=5\Rightarrow x^2+y^2=9"#)
            ],
            keyInsight: "对称定点的点积条件对应同心圆轨迹。",
            shortcutInsight: "PA·PB=OP²-a²。",
            weapon: "对称点积轨迹",
            timeRatio: 3.0,
            tags: ["向量", "轨迹", "圆", "压轴"]
        ),

        vectorProblem(
            id: "vec_024",
            type: .proof,
            tier: 4,
            formulaIds: ["vector_dot"],
            content: "证明：菱形的两条对角线互相垂直。",
            contentLatex: #"|\vec a|=|\vec b|,\quad (\vec a+\vec b)\cdot(\vec a-\vec b)=0"#,
            answer: "对角线互相垂直",
            difficulty: 0.66,
            averageTime: 130,
            hints: ["设相邻两边向量为a,b", "两条对角线为a+b与a-b"],
            standardSteps: [
                vectorStep(1, "设邻边向量", #"菱形相邻两边为\vec a,\vec b，且|\vec a|=|\vec b|"#),
                vectorStep(2, "写对角线向量", #"\vec{AC}=\vec a+\vec b,\quad \vec{BD}=\vec b-\vec a"#),
                vectorStep(3, "求数量积", #"(\vec a+\vec b)\cdot(\vec b-\vec a)=|\vec b|^2-|\vec a|^2"#),
                vectorStep(4, "利用等长", #"|\vec b|^2-|\vec a|^2=0\Rightarrow AC\perp BD"#)
            ],
            shortcutSteps: [
                vectorStep(1, "对角线和差", #"菱形对角线是等长邻边向量的和与差"#),
                vectorStep(2, "和差点积", #"(\vec a+\vec b)\cdot(\vec a-\vec b)=|\vec a|^2-|\vec b|^2=0"#)
            ],
            keyInsight: "菱形对角线垂直来自等长向量的和差正交。",
            shortcutInsight: "等长向量的和与差天然垂直。",
            weapon: "等长和差正交",
            timeRatio: 2.4,
            tags: ["向量", "菱形", "证明", "代表题"]
        ),

        vectorProblem(
            id: "vec_025",
            type: .calculation,
            tier: 5,
            formulaIds: ["vector_dot"],
            content: "已知|a|=2，|b|=3，a与b夹角为120°，求|a+b|、|a-b|，并判断(a+b)与(a-b)的夹角是锐角还是钝角。",
            contentLatex: #"|\vec a|=2,\quad |\vec b|=3,\quad \angle(\vec a,\vec b)=120^\circ"#,
            answer: "|a+b|=√7，|a-b|=√19，夹角为钝角",
            difficulty: 0.78,
            averageTime: 210,
            hints: ["先求a·b=-3", "夹角判断看(a+b)·(a-b)"],
            standardSteps: [
                vectorStep(1, "数量积", #"\vec a\cdot\vec b=2\cdot3\cos120^\circ=-3"#),
                vectorStep(2, "求和长", #"|\vec a+\vec b|^2=4+9+2(-3)=7"#),
                vectorStep(3, "求差长", #"|\vec a-\vec b|^2=4+9-2(-3)=19"#),
                vectorStep(4, "判断夹角", #"(\vec a+\vec b)\cdot(\vec a-\vec b)=|\vec a|^2-|\vec b|^2=-5<0，故为钝角"#)
            ],
            shortcutSteps: [
                vectorStep(1, "一口气平方", #"a\cdot b=-3,\quad |a+b|^2=7,\quad |a-b|^2=19"#),
                vectorStep(2, "和差夹角", #"(a+b)\cdot(a-b)=|a|^2-|b|^2<0，夹角钝"#)
            ],
            keyInsight: "和差向量夹角只由两原向量模长差决定。",
            shortcutInsight: "(a+b)·(a-b)=|a|²-|b|²。",
            weapon: "和差向量夹角判别",
            timeRatio: 2.7,
            tags: ["向量", "和差", "夹角", "压轴"]
        )
    ]

    private static func vectorStep(_ order: Int, _ description: String, _ latex: String, _ annotation: String = "") -> SolutionStep {
        SolutionStep(order: order, description: description, latex: latex, annotation: annotation)
    }

    private static func vectorProblem(
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
        commonMistakes: [String] = ["角的顶点向量写反", "数量积展开漏掉2倍项", "把向量模长直接当作坐标分量"]
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
