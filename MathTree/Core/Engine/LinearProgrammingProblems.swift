import Foundation

// MARK: - 线性规划专题
// 目标: 覆盖可行域、z=ax+by 最值、截距/斜率/距离几何意义、含参与应用题。
// 秒杀思路: 目标函数化为直线族, 平移看截距; 斜率型/距离型转几何量, 顶点代入验证。
// 注意: 每题答案均为确定数值。

extension SampleData {
    static let linearProgrammingProblems: [Problem] = [
        lpProblem(
            id: "lp_001",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["linear_programming"],
            content: "设变量 x,y 满足约束 x≥1, y≥1, x+y≤4, 求 z=2x+y 的最大值。",
            contentLatex: #"\begin{cases}x\ge1\\y\ge1\\x+y\le4\end{cases}\quad z=2x+y_{\max}"#,
            answer: "7",
            difficulty: 0.44,
            averageTime: 90,
            hints: ["画可行域(三角形)", "顶点(1,1),(3,1),(1,3)", "代入比较"],
            standardSteps: [
                lpStep(1, "确定顶点", #"\text{可行域为三角形, 顶点}(1,1),(3,1),(1,3)"#),
                lpStep(2, "逐点代入", #"z(1,1)=3,\ z(3,1)=7,\ z(1,3)=5"#),
                lpStep(3, "结论", #"z_{\max}=7,\ \text{在}(3,1)\text{取得}"#)
            ],
            shortcutSteps: [
                lpStep(1, "截距法秒杀", #"z=2x+y\Rightarrow y=-2x+z,\ \text{斜率}-2\text{较陡, 平移到最右顶点}(3,1)"#),
                lpStep(2, "代入", #"z=2\cdot3+1=7"#)
            ],
            keyInsight: "线性目标在凸多边形可行域的最值必在顶点取得。",
            shortcutInsight: "把z看作直线y=-2x+z的纵截距, 沿目标方向平移到顶点即得最值。",
            weapon: "顶点法/截距平移",
            timeRatio: 2.0,
            tags: ["线性规划", "最值", "必考", "核心"]
        ),

        lpProblem(
            id: "lp_002",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["linear_programming"],
            content: "设 x,y 满足 x+y≥4, x+2y≥6, x≥0, y≥0, 求 z=2x+3y 的最小值。",
            contentLatex: #"\begin{cases}x+y\ge4\\x+2y\ge6\\x\ge0,y\ge0\end{cases}\quad z=2x+3y_{\min}"#,
            answer: "10",
            difficulty: 0.54,
            averageTime: 110,
            hints: ["可行域无界(向右上)", "顶点(6,0),(2,2),(0,4)", "最小值在顶点"],
            standardSteps: [
                lpStep(1, "求顶点", #"x+y=4\text{与}x+2y=6\text{交于}(2,2);\ \text{另两顶点}(6,0),(0,4)"#),
                lpStep(2, "代入", #"z(6,0)=12,\ z(2,2)=10,\ z(0,4)=12"#),
                lpStep(3, "结论", #"z_{\min}=10,\ \text{在}(2,2)\text{取得}"#)
            ],
            shortcutSteps: [
                lpStep(1, "平移法秒杀", #"z=2x+3y\text{向原点方向平移, 首触顶点}(2,2)"#),
                lpStep(2, "代入", #"z=2\cdot2+3\cdot2=10"#)
            ],
            keyInsight: "无界可行域上线性函数若有最小值, 仍在顶点取得。",
            shortcutInsight: "目标直线向减小方向平移, 最先离开可行域的顶点给最小值。",
            weapon: "顶点法/截距平移",
            timeRatio: 2.0,
            tags: ["线性规划", "最值", "必考"]
        ),

        lpProblem(
            id: "lp_003",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["linear_programming"],
            content: "设 x,y 满足 x+y≤6, 0≤x≤4, 0≤y≤4, 求 z=3x+4y 的最大值。",
            contentLatex: #"\begin{cases}x+y\le6\\0\le x\le4\\0\le y\le4\end{cases}\quad z=3x+4y_{\max}"#,
            answer: "22",
            difficulty: 0.52,
            averageTime: 110,
            hints: ["五边形可行域", "关键顶点(4,2),(2,4)", "代入比较"],
            standardSteps: [
                lpStep(1, "求顶点", #"(0,0),(4,0),(4,2),(2,4),(0,4)"#),
                lpStep(2, "代入", #"z(4,2)=20,\ z(2,4)=22,\ z(4,0)=12,\ z(0,4)=16"#),
                lpStep(3, "结论", #"z_{\max}=22,\ \text{在}(2,4)\text{取得}"#)
            ],
            shortcutSteps: [
                lpStep(1, "斜率比较秒杀", #"z=3x+4y\text{斜率}-\tfrac34,\ \text{比}x+y=6\text{的}-1\text{平缓, 最大在}(2,4)"#),
                lpStep(2, "代入", #"z=3\cdot2+4\cdot4=22"#)
            ],
            keyInsight: "多约束时先画出所有边界交点确定顶点集。",
            shortcutInsight: "比较目标直线与边界斜率, 直接判断最优顶点位置。",
            weapon: "顶点法/斜率比较",
            timeRatio: 2.2,
            tags: ["线性规划", "最值", "核心"]
        ),

        lpProblem(
            id: "lp_004",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["linear_programming", "slope"],
            content: "设 x,y 满足 2≤x≤4, 1≤y≤3, 求 z=y/x 的最大值与最小值。",
            contentLatex: #"2\le x\le4,\ 1\le y\le3,\quad z=\frac yx"#,
            answer: "最大值3/2，最小值1/4",
            difficulty: 0.58,
            averageTime: 120,
            hints: ["z=y/x是(x,y)与原点连线斜率", "矩形可行域", "比较四个顶点斜率"],
            standardSteps: [
                lpStep(1, "几何意义", #"z=\frac yx=\text{点}(x,y)\text{与原点连线的斜率}"#),
                lpStep(2, "顶点斜率", #"(2,1):\tfrac12,\ (2,3):\tfrac32,\ (4,1):\tfrac14,\ (4,3):\tfrac34"#),
                lpStep(3, "结论", #"z_{\max}=\frac32\,(2,3),\ z_{\min}=\frac14\,(4,1)"#)
            ],
            shortcutSteps: [
                lpStep(1, "斜率极端秒杀", #"\text{左上角斜率最大}(2,3),\ \text{右下角最小}(4,1)"#),
                lpStep(2, "结果", #"\frac32\ \text{与}\ \frac14"#)
            ],
            keyInsight: "形如y/x的目标是到原点连线的斜率, 在区域'最陡/最缓'方向取极值。",
            shortcutInsight: "矩形区域内y/x最大在左上顶点、最小在右下顶点。",
            weapon: "斜率型目标几何法",
            timeRatio: 2.4,
            tags: ["线性规划", "斜率型", "最值", "压轴"]
        ),

        lpProblem(
            id: "lp_005",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["linear_programming", "distance"],
            content: "设 x,y 满足 x+y≥2, x≥0, y≥0, 求 z=x²+y² 的最小值。",
            contentLatex: #"x+y\ge2,\ x\ge0,\ y\ge0,\quad z=x^2+y^2_{\min}"#,
            answer: "2",
            difficulty: 0.56,
            averageTime: 110,
            hints: ["z=x²+y²是到原点距离的平方", "原点到直线x+y=2的距离", "垂足是否在可行域"],
            standardSteps: [
                lpStep(1, "几何意义", #"z=x^2+y^2=\text{点}(x,y)\text{到原点距离的平方}"#),
                lpStep(2, "点到线距离", #"d=\frac{|0+0-2|}{\sqrt2}=\sqrt2,\ \text{垂足}(1,1)\text{在可行域内}"#),
                lpStep(3, "结论", #"z_{\min}=d^2=2"#)
            ],
            shortcutSteps: [
                lpStep(1, "距离平方秒杀", #"z_{\min}=\left(\frac{2}{\sqrt2}\right)^2=2"#)
            ],
            keyInsight: "形如x²+y²的目标是到原点距离平方, 最小值=原点到边界的最近距离平方。",
            shortcutInsight: "直接用点到直线距离公式平方, 并验证垂足在可行域内。",
            weapon: "距离型目标几何法",
            timeRatio: 2.5,
            tags: ["线性规划", "距离型", "最值", "压轴", "核心"]
        ),

        lpProblem(
            id: "lp_006",
            type: .calculation,
            tier: 4,
            formulaIds: ["linear_programming", "application"],
            content: "工厂生产甲、乙两种产品。每件甲需工时1、材料3, 每件乙需工时2、材料2; 每天工时不超过8、材料不超过12。甲每件利润2千元、乙每件利润3千元。求每天最大利润。",
            contentLatex: #"\begin{cases}x+2y\le8\\3x+2y\le12\\x,y\ge0\end{cases}\quad z=2x+3y_{\max}"#,
            answer: "13(千元)，即生产甲2件乙3件",
            difficulty: 0.62,
            averageTime: 160,
            hints: ["设甲x件乙y件", "列约束(工时/材料)", "目标z=2x+3y"],
            standardSteps: [
                lpStep(1, "建模", #"x\text{件甲},y\text{件乙}:\ x+2y\le8,\ 3x+2y\le12,\ x,y\ge0"#),
                lpStep(2, "求顶点", #"\text{两线交于}(2,3);\ \text{另有}(4,0),(0,4)"#),
                lpStep(3, "代入", #"z(2,3)=13,\ z(0,4)=12,\ z(4,0)=8"#),
                lpStep(4, "结论", #"\text{最大利润}13\text{千元(甲2件乙3件)}"#)
            ],
            shortcutSteps: [
                lpStep(1, "瓶颈交点秒杀", #"\text{两资源都用尽时最优}:\ x+2y=8,3x+2y=12\Rightarrow(2,3)"#),
                lpStep(2, "利润", #"z=2\cdot2+3\cdot3=13"#)
            ],
            keyInsight: "应用题先设变量列约束与目标, 再转化为标准线性规划。",
            shortcutInsight: "最优常出现在两资源约束同时取等的交点处, 直接联立。",
            weapon: "线性规划建模",
            timeRatio: 1.8,
            tags: ["线性规划", "应用题", "最值", "必考"]
        ),

        lpProblem(
            id: "lp_007",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["linear_programming", "area"],
            content: "求不等式组 x≥0, y≥0, 2x+y≤4 所表示的平面区域的面积。",
            contentLatex: #"x\ge0,\ y\ge0,\ 2x+y\le4,\ \text{区域面积}=?"#,
            answer: "4",
            difficulty: 0.40,
            averageTime: 70,
            hints: ["区域是直角三角形", "顶点(0,0),(2,0),(0,4)", "面积=½底×高"],
            standardSteps: [
                lpStep(1, "求顶点", #"(0,0),(2,0),(0,4)"#),
                lpStep(2, "面积", #"S=\frac12\cdot2\cdot4=4"#)
            ],
            shortcutSteps: [
                lpStep(1, "直角三角形秒杀", #"S=\frac12\cdot\text{两直角边}=\frac12\cdot2\cdot4=4"#)
            ],
            keyInsight: "坐标轴与一条直线围成的区域是直角三角形。",
            shortcutInsight: "两截距相乘除以2即面积。",
            weapon: "可行域面积",
            timeRatio: 1.6,
            tags: ["线性规划", "可行域", "面积", "必考"]
        ),

        lpProblem(
            id: "lp_008",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["linear_programming", "range"],
            content: "设 x,y 满足 x≥0, y≥0, x+y≤3, 求 z=2x+y 的取值范围。",
            contentLatex: #"x\ge0,\ y\ge0,\ x+y\le3,\quad z=2x+y\in?"#,
            answer: "[0,6]",
            difficulty: 0.46,
            averageTime: 90,
            hints: ["求最小值与最大值", "顶点(0,0),(3,0),(0,3)", "范围是闭区间"],
            standardSteps: [
                lpStep(1, "顶点代入", #"z(0,0)=0,\ z(3,0)=6,\ z(0,3)=3"#),
                lpStep(2, "范围", #"z_{\min}=0,\ z_{\max}=6\Rightarrow z\in[0,6]"#)
            ],
            shortcutSteps: [
                lpStep(1, "最值定区间秒杀", #"z\in[z_{\min},z_{\max}]=[0,6]"#)
            ],
            keyInsight: "连续线性函数在连通可行域上的值域是[最小值,最大值]。",
            shortcutInsight: "只需算出两端点最值即得范围。",
            weapon: "顶点法求值域",
            timeRatio: 1.8,
            tags: ["线性规划", "范围", "必考"]
        ),

        lpProblem(
            id: "lp_009",
            type: .fillInBlank,
            tier: 5,
            formulaIds: ["linear_programming", "parameter"],
            content: "设 x,y 满足 x≥1, y≥1, x+y≤4。若 z=ax+y(a>0) 在点(3,1)处取得最大值, 求 a 的取值范围。",
            contentLatex: #"\begin{cases}x\ge1\\y\ge1\\x+y\le4\end{cases}\ z=ax+y(a>0)\text{在}(3,1)\text{最大}"#,
            answer: "a≥1",
            difficulty: 0.70,
            averageTime: 150,
            hints: ["z=ax+y斜率为-a", "斜边x+y=4斜率-1", "目标线更陡才会在(3,1)取最大"],
            standardSteps: [
                lpStep(1, "目标斜率", #"z=ax+y\Rightarrow y=-ax+z,\ \text{斜率}-a"#),
                lpStep(2, "关键边斜率", #"\text{含}(3,1)\text{的斜边}x+y=4\text{斜率}-1"#),
                lpStep(3, "最优在(3,1)条件", #"-a\le-1\Rightarrow a\ge1\ (\text{目标线不缓于斜边})"#),
                lpStep(4, "结论", #"a\ge1"#)
            ],
            shortcutSteps: [
                lpStep(1, "斜率比较秒杀", #"\text{最大在右下顶点}(3,1)\iff\text{目标线比斜边陡}\iff a\ge1"#)
            ],
            keyInsight: "含参目标的最优解位置由目标直线与边界斜率的相对陡缓决定。",
            shortcutInsight: "目标线斜率绝对值≥相邻边时, 最优落在该顶点。",
            weapon: "含参斜率比较",
            timeRatio: 2.2,
            tags: ["线性规划", "含参", "最值", "压轴", "核心"]
        ),

        lpProblem(
            id: "lp_010",
            type: .fillInBlank,
            tier: 5,
            formulaIds: ["linear_programming", "slope"],
            content: "设 x,y 满足 x≥1, y≥1, x+y≤4, 求 z=(y+1)/(x+1) 的最大值与最小值。",
            contentLatex: #"x\ge1,y\ge1,x+y\le4,\quad z=\frac{y+1}{x+1}"#,
            answer: "最大值2，最小值1/2",
            difficulty: 0.72,
            averageTime: 150,
            hints: ["z是(x,y)与定点(-1,-1)连线斜率", "顶点(1,1),(3,1),(1,3)", "比较斜率"],
            standardSteps: [
                lpStep(1, "几何意义", #"z=\frac{y-(-1)}{x-(-1)}=\text{点}(x,y)\text{与}(-1,-1)\text{连线斜率}"#),
                lpStep(2, "顶点斜率", #"(1,1):\tfrac{2}{2}=1,\ (3,1):\tfrac{2}{4}=\tfrac12,\ (1,3):\tfrac{4}{2}=2"#),
                lpStep(3, "结论", #"z_{\max}=2\,(1,3),\ z_{\min}=\frac12\,(3,1)"#)
            ],
            shortcutSteps: [
                lpStep(1, "定点连线斜率秒杀", #"\text{在顶点处对定点}(-1,-1)\text{的斜率取极值}:\ 2\text{与}\tfrac12"#)
            ],
            keyInsight: "形如(y+b)/(x+a)的目标是到定点(-a,-b)连线的斜率。",
            shortcutInsight: "只需在可行域顶点处计算与定点的斜率并比较。",
            weapon: "斜率型目标(定点)",
            timeRatio: 2.4,
            tags: ["线性规划", "斜率型", "最值", "压轴"]
        ),

        lpProblem(
            id: "lp_011",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["linear_programming", "distance"],
            content: "设 x,y 满足 x≥0, y≥0, 3x+4y≤12, 求可行域内的点到原点距离的最大值。",
            contentLatex: #"x\ge0,y\ge0,3x+4y\le12,\ \max\sqrt{x^2+y^2}"#,
            answer: "4",
            difficulty: 0.54,
            averageTime: 110,
            hints: ["凸区域内到定点最远点是顶点", "顶点(4,0),(0,3)", "比较距离"],
            standardSteps: [
                lpStep(1, "顶点", #"(0,0),(4,0),(0,3)"#),
                lpStep(2, "到原点距离", #"|(4,0)|=4,\ |(0,3)|=3,\ |(0,0)|=0"#),
                lpStep(3, "结论", #"\max=4,\ \text{在}(4,0)\text{取得}"#)
            ],
            shortcutSteps: [
                lpStep(1, "最远顶点秒杀", #"\text{凸多边形内到原点最远必是某顶点}\Rightarrow(4,0),\ d=4"#)
            ],
            keyInsight: "凸多边形区域内到某定点的最大距离在顶点处取得。",
            shortcutInsight: "只比较各顶点到原点的距离, 取最大。",
            weapon: "距离型最大(顶点)",
            timeRatio: 2.0,
            tags: ["线性规划", "距离型", "最值"]
        ),

        lpProblem(
            id: "lp_012",
            type: .calculation,
            tier: 4,
            formulaIds: ["linear_programming", "application"],
            content: "某饲料需营养A至少4单位、营养B至少5单位。甲料每袋含A1、B2; 乙料每袋含A2、B1。甲料20元/袋, 乙料30元/袋。求满足营养需求的最低成本。",
            contentLatex: #"\begin{cases}x+2y\ge4\\2x+y\ge5\\x,y\ge0\end{cases}\quad z=20x+30y_{\min}"#,
            answer: "70(元)，即甲2袋乙1袋",
            difficulty: 0.64,
            averageTime: 160,
            hints: ["设甲x袋乙y袋", "列营养约束", "目标成本z=20x+30y"],
            standardSteps: [
                lpStep(1, "建模", #"x+2y\ge4,\ 2x+y\ge5,\ x,y\ge0"#),
                lpStep(2, "求顶点", #"\text{两线交于}(2,1);\ \text{另有}(4,0),(0,5)"#),
                lpStep(3, "代入", #"z(2,1)=70,\ z(4,0)=80,\ z(0,5)=150"#),
                lpStep(4, "结论", #"\text{最低成本}70\text{元(甲2袋乙1袋)}"#)
            ],
            shortcutSteps: [
                lpStep(1, "营养满额交点秒杀", #"x+2y=4,2x+y=5\Rightarrow(2,1),\ z=70"#)
            ],
            keyInsight: "最低成本配料题是求最小值的线性规划应用。",
            shortcutInsight: "成本最低常在两营养约束同时取等的交点, 联立求解。",
            weapon: "线性规划建模(最小成本)",
            timeRatio: 1.8,
            tags: ["线性规划", "应用题", "最值", "核心"]
        ),

        lpProblem(
            id: "lp_013",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["linear_programming"],
            content: "设 x,y 满足 y≤x+1, y≤-x+5, y≥1, 求 z=x+3y 的最大值。",
            contentLatex: #"\begin{cases}y\le x+1\\y\le -x+5\\y\ge1\end{cases}\quad z=x+3y_{\max}"#,
            answer: "11",
            difficulty: 0.56,
            averageTime: 120,
            hints: ["三条直线围成三角形", "顶点(0,1),(4,1),(2,3)", "代入比较"],
            standardSteps: [
                lpStep(1, "求顶点", #"y=1\cap y=x+1\Rightarrow(0,1);\ y=1\cap y=-x+5\Rightarrow(4,1);\ \text{两斜线}\Rightarrow(2,3)"#),
                lpStep(2, "代入", #"z(0,1)=3,\ z(4,1)=7,\ z(2,3)=11"#),
                lpStep(3, "结论", #"z_{\max}=11,\ \text{在}(2,3)\text{取得}"#)
            ],
            shortcutSteps: [
                lpStep(1, "顶点法秒杀", #"\text{最高点}(2,3):\ z=2+9=11"#)
            ],
            keyInsight: "三条直线两两相交确定三角形可行域的三个顶点。",
            shortcutInsight: "目标含较大y系数, 倾向y最大的顶点(2,3)。",
            weapon: "顶点法",
            timeRatio: 2.0,
            tags: ["线性规划", "最值", "三角形区域"]
        ),

        lpProblem(
            id: "lp_014",
            type: .fillInBlank,
            tier: 5,
            formulaIds: ["linear_programming", "parameter"],
            content: "设 x,y 满足 x≥0, y≥0, x+y≤4。若目标函数 z=x+ay(a>0) 在线段 x+y=4(0≤x≤4)上每一点都取得最大值, 求 a。",
            contentLatex: #"x\ge0,y\ge0,x+y\le4,\ z=x+ay\text{在边}x+y=4\text{上恒最大}"#,
            answer: "1",
            difficulty: 0.66,
            averageTime: 130,
            hints: ["最优解为整条边⟺目标线与该边平行", "x+ay的方向与x+y一致", "系数成比例"],
            standardSteps: [
                lpStep(1, "最优为边的条件", #"\text{目标直线与边}x+y=4\text{平行}"#),
                lpStep(2, "系数成比例", #"\frac{1}{1}=\frac{a}{1}\Rightarrow a=1"#),
                lpStep(3, "结论", #"a=1"#)
            ],
            shortcutSteps: [
                lpStep(1, "平行条件秒杀", #"x+ay\parallel x+y\Rightarrow a=1"#)
            ],
            keyInsight: "最优解为一整条边⟺目标直线与该边重合(平行)。",
            shortcutInsight: "目标与边界系数对应成比例即平行, 直接解参数。",
            weapon: "最优解多解的平行条件",
            timeRatio: 2.2,
            tags: ["线性规划", "含参", "最优解不唯一", "压轴"]
        ),

        lpProblem(
            id: "lp_015",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["linear_programming"],
            content: "设 x,y 满足 x≥0, y≥0, x+2y≤8, 3x+2y≤12, 求 z=x+y 的最大值。",
            contentLatex: #"\begin{cases}x\ge0,y\ge0\\x+2y\le8\\3x+2y\le12\end{cases}\quad z=x+y_{\max}"#,
            answer: "5",
            difficulty: 0.56,
            averageTime: 120,
            hints: ["两约束线交点", "顶点(4,0),(2,3),(0,4)", "代入z=x+y"],
            standardSteps: [
                lpStep(1, "求交点", #"x+2y=8\text{与}3x+2y=12\Rightarrow2x=4,(2,3)"#),
                lpStep(2, "顶点集", #"(0,0),(4,0),(2,3),(0,4)"#),
                lpStep(3, "代入", #"z(4,0)=4,\ z(2,3)=5,\ z(0,4)=4"#),
                lpStep(4, "结论", #"z_{\max}=5,\ \text{在}(2,3)\text{取得}"#)
            ],
            shortcutSteps: [
                lpStep(1, "交点最优秒杀", #"\text{两约束交点}(2,3):\ z=2+3=5"#)
            ],
            keyInsight: "两条倾斜约束的交点常是最大值候选顶点。",
            shortcutInsight: "联立两个'≤'约束求交点并代入即可。",
            weapon: "顶点法",
            timeRatio: 2.0,
            tags: ["线性规划", "最值", "核心"]
        )
    ]

    // MARK: - 工厂方法
    private static func lpStep(_ order: Int, _ description: String, _ latex: String, _ annotation: String = "") -> SolutionStep {
        SolutionStep(order: order, description: description, latex: latex, annotation: annotation)
    }

    private static func lpProblem(
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
        commonMistakes: [String] = ["可行域边界开闭判断错", "斜率型/距离型当成线性直接顶点代入", "含参时未比较目标线与边界斜率"]
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
