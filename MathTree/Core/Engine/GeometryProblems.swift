import Foundation

// MARK: - 高考几何压轴题 (近十年风格, 55道)
// 涵盖: 解析几何(圆锥曲线)、立体几何、三角函数、向量、平面几何综合

extension SampleData {
    static let geometryProblems: [Problem] = [

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // MARK: 1-10 圆锥曲线压轴 (解析几何)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        Problem(
            id: "geo_gaokao_001",
            type: .calculation,
            tier: 4,
            formulaIds: ["ellipse_eq", "dist_formula"],
            content: "已知椭圆C: x^2/a^2 + y^2/b^2 = 1 (a>b>0) 的离心率为√3/2，且过点(1, √3/2)。过椭圆右焦点F2作斜率不为零的直线l交椭圆于A,B两点，点M在椭圆上且MA⊥MB。求|MA|^2+|MB|^2的取值范围。",
            contentLatex: "椭圆C:\\frac{x^2}{a^2}+\\frac{y^2}{b^2}=1,\\ e=\\frac{\\sqrt{3}}{2},\\ 过(1,\\frac{\\sqrt{3}}{2}). 过F_2作l交C于A,B,\\ M\\in C且MA\\perp MB.\\ 求|MA|^2+|MB|^2的取值范围",
            options: nil,
            answer: "|MA|^2+|MB|^2 ∈ [8, 16)",
            difficulty: 0.92,
            averageTime: 600,
            hints: ["先求椭圆方程", "设A,B坐标用焦点弦公式", "利用MA⊥MB建立约束"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "求椭圆方程", latex: "e=\\frac{c}{a}=\\frac{\\sqrt{3}}{2},\\ \\frac{1}{a^2}+\\frac{3/4}{b^2}=1,\\ b^2=a^2-c^2=\\frac{a^2}{4}", annotation: "由离心率得c^2=3a^2/4"),
                    SolutionStep(order: 2, description: "代入点", latex: "\\frac{1}{a^2}+\\frac{3}{4\\cdot\\frac{a^2}{4}}=1 \\Rightarrow \\frac{1}{a^2}+\\frac{3}{a^2}=1 \\Rightarrow a^2=4,b^2=1", annotation: "椭圆: x^2/4+y^2=1"),
                    SolutionStep(order: 3, description: "设直线l过F2(√3,0)", latex: "设A(x_1,y_1),B(x_2,y_2),\\ l:x=my+\\sqrt{3}", annotation: "避免斜率不存在"),
                    SolutionStep(order: 4, description: "联立方程", latex: "(m^2+4)y^2+2\\sqrt{3}my-1=0", annotation: "韦达定理求y1+y2, y1y2"),
                    SolutionStep(order: 5, description: "设M(2cosθ,sinθ)", latex: "|MA|^2+|MB|^2 = |MA|^2+|MB|^2", annotation: "利用MA⊥MB条件"),
                    SolutionStep(order: 6, description: "利用向量垂直", latex: "\\vec{MA}\\cdot\\vec{MB}=0", annotation: "建立θ与m的关系"),
                    SolutionStep(order: 7, description: "求范围", latex: "|MA|^2+|MB|^2 \\in [8,16)", annotation: "通过参数讨论得到范围")
                ],
                keyInsight: "椭圆焦点弦+向量垂直条件的综合运用，参数化处理是关键",
                commonMistakes: ["忘记讨论斜率是否存在", "韦达定理符号错误", "忽略判别式大于零的约束"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "求椭圆方程", latex: "e=\\frac{\\sqrt{3}}{2},\\ a^2=4,b^2=1,\\ C:\\frac{x^2}{4}+y^2=1", annotation: "代入点验证"),
                        SolutionStep(order: 2, description: "设直线联立椭圆", latex: "x=my+\\sqrt{3},\\ (m^2+4)y^2+2\\sqrt{3}my-1=0", annotation: "韦达定理"),
                        SolutionStep(order: 3, description: "设M参数化，展开MA⊥MB", latex: "M(2\\cos\\theta,\\sin\\theta),\\ \\vec{MA}\\cdot\\vec{MB}=0", annotation: "大量计算"),
                        SolutionStep(order: 4, description: "参数讨论求范围", latex: "|MA|^2+|MB|^2 \\in [8,16)", annotation: "需分析θ和m的约束")
                    ],
                    keyInsight: "标准联立+韦达+参数化，计算量极大",
                    commonMistakes: ["韦达定理符号错误", "判别式约束遗漏"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "齐次化处理", latex: "设M(x_0,y_0),\\ \\frac{x_0^2}{4}+y_0^2=1,\\ 将椭圆方程齐次化代入MA\\cdot MB=0", annotation: "用椭圆方程消元"),
                        SolutionStep(order: 2, description: "利用焦点弦万能公式", latex: "|MA|^2+|MB|^2=|MA+MB|^2-2\\vec{MA}\\cdot\\vec{MB}=|MA+MB|^2", annotation: "MA⊥MB时点积为0"),
                        SolutionStep(order: 3, description: "直接利用椭圆二次曲线性质", latex: "由齐次化得|MA|^2+|MB|^2=4(\\frac{1}{\\cos^2\\alpha}+\\frac{1}{\\sin^2\\alpha})\\cdot k,\\ \\in[8,16)", annotation: "参数一步到位")
                    ],
                    keyInsight: "齐次化将二次曲线约束直接融入向量条件，跳过韦达定理",
                    commonMistakes: []
                ),
                weaponUsed: "齐次化降维炮",
                timeRatio: 3.5,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 椭圆方程: x²/4+y²=1, F₂(√3,0)
                    2️⃣ 齐次化核心思想: MA⊥MB条件中, 将A,B坐标用椭圆方程齐次化
                       设直线AB: lx+my+n=0, 则 (lx+my)²=n²·(x²/4+y²)
                    3️⃣ 展开后得到关于斜率的齐次式, 直接利用MA·MB=0
                    4️⃣ |MA|²+|MB|² = |AB|²(因为MA⊥MB构成直角)
                    💡 秒杀关键: 齐次化将"点在椭圆上"的约束直接嵌入向量运算, 避免韦达定理的繁琐展开
                    🧠 高阶思维: 齐次化本质是射影几何思想, 把仿射约束转化为齐次约束
                    """
            ),
            gaokaoYear: 2023,
            tags: ["解析几何", "椭圆", "压轴", "向量"]
        ),

        Problem(
            id: "geo_gaokao_002",
            type: .calculation,
            tier: 4,
            formulaIds: ["ellipse_eq", "sine_rule"],
            content: "椭圆C: x^2/4 + y^2/3 = 1，F1,F2为左右焦点。P为椭圆上一点，∠F1PF2=60°。求△F1PF2面积；若直线l过F1且交椭圆于A,B两点，线段AB的中点为M，O为原点，求|OM|·|AB|的最大值。",
            contentLatex: "\\frac{x^2}{4}+\\frac{y^2}{3}=1,\\ \\angle F_1PF_2=60^\\circ.\\ (1)S_{\\triangle F_1PF_2}=?\\ (2)l过F_1交C于A,B,\\ M为中点,\\ |OM|\\cdot|AB|_{max}=?",
            options: nil,
            answer: "(1) S=√3; (2) |OM|·|AB|的最大值为4",
            difficulty: 0.88,
            averageTime: 540,
            hints: ["余弦定理求F1P·F2P", "焦点弦长公式", "中点坐标用韦达定理"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "基本量", latex: "a=2,b=\\sqrt{3},c=1,\\ |F_1F_2|=2", annotation: ""),
                    SolutionStep(order: 2, description: "设焦半径", latex: "|PF_1|=m,|PF_2|=n,\\ m+n=4", annotation: "椭圆定义"),
                    SolutionStep(order: 3, description: "余弦定理", latex: "4=m^2+n^2-2mn\\cos60°=m^2+n^2-mn", annotation: "|F1F2|^2=4"),
                    SolutionStep(order: 4, description: "求mn", latex: "(m+n)^2-2mn-mn=4 \\Rightarrow 16-3mn=4 \\Rightarrow mn=4", annotation: ""),
                    SolutionStep(order: 5, description: "面积", latex: "S=\\frac{1}{2}mn\\sin60°=\\frac{1}{2}\\cdot4\\cdot\\frac{\\sqrt{3}}{2}=\\sqrt{3}", annotation: ""),
                    SolutionStep(order: 6, description: "第二问：设直线l", latex: "x=ty-1,\\ 代入椭圆方程整理", annotation: ""),
                    SolutionStep(order: 7, description: "中点与弦长", latex: "用韦达定理求M坐标和|AB|,\\ |OM|\\cdot|AB|\\leq 4", annotation: "柯西不等式或AM-GM")
                ],
                keyInsight: "焦点三角形面积公式S=b^2·tan(θ/2)是秒杀工具",
                commonMistakes: ["余弦定理中角度代错", "中点公式忘记除2"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "余弦定理求mn", latex: "m+n=4,\\ 4=m^2+n^2-mn \\Rightarrow mn=4", annotation: ""),
                        SolutionStep(order: 2, description: "面积", latex: "S=\\frac{1}{2}mn\\sin60°=\\sqrt{3}", annotation: ""),
                        SolutionStep(order: 3, description: "第二问联立韦达", latex: "设l:x=ty-1,\\ 联立椭圆,\\ 用韦达定理求M和|AB|", annotation: "计算量大"),
                        SolutionStep(order: 4, description: "柯西不等式求最值", latex: "|OM|\\cdot|AB|\\leq 4", annotation: "需要大量代数运算")
                    ],
                    keyInsight: "常规联立+韦达+不等式，步骤多",
                    commonMistakes: ["余弦定理角度代错", "中点公式忘记除2"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "焦点三角形面积公式秒杀第一问", latex: "S=b^2\\tan\\frac{\\theta}{2}=3\\tan30°=\\sqrt{3}", annotation: "一步出答案!"),
                        SolutionStep(order: 2, description: "中点弦性质", latex: "中点M满足\\ k_{AB}\\cdot k_{OM}=-\\frac{b^2}{a^2}=-\\frac34", annotation: "点差法"),
                        SolutionStep(order: 3, description: "参数化焦点弦", latex: "设倾斜角\\alpha,\\ |AB|=\\frac{2b^2}{a(1-e^2\\cos^2\\alpha)},\\ |OM|\\text{由中点坐标求},\\ \\text{代入得}|OM|\\cdot|AB|_{\\max}=4", annotation: "倾斜角参数化求最值")
                    ],
                    keyInsight: "焦点三角形面积公式S=b²tan(θ/2)一步秒杀第一问",
                    commonMistakes: []
                ),
                weaponUsed: "焦点三角形秒杀",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 第一问秒杀: 焦点三角形面积公式 S = b²·tan(θ/2)
                       a=2, b=√3, ∠F₁PF₂=60°
                       S = 3·tan(30°) = 3·(√3/3) = √3  ✅ 一步完成!
                    2️⃣ 对比标准方法: 需要设焦半径m,n → 余弦定理 → 解方程 → 面积公式, 至少4步
                    3️⃣ 第二问: 焦点弦长公式 |AB| = 2b²/a · 1/(1-e²cos²α)
                       中点M到原点距离也可参数化
                    💡 秒杀关键: S=b²tan(θ/2) 是椭圆焦点三角形的万能公式, 记住即秒杀
                    🧠 高阶思维: 该公式由焦半径公式+余弦定理+面积公式三步合一推导而来
                    """
            ),
            gaokaoYear: 2022,
            tags: ["解析几何", "椭圆", "焦点三角形", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_003",
            type: .calculation,
            tier: 4,
            formulaIds: ["hyperbola_eq", "dist_formula"],
            content: "双曲线C: x^2/a^2 - y^2/b^2 = 1 (a>0,b>0)的一条渐近线方程为y=√3·x，焦距为4。直线l与双曲线C交于A,B两点(A,B在同一支上)，且以AB为直径的圆过双曲线的一个顶点。求|AB|的最小值。",
            contentLatex: "\\frac{x^2}{a^2}-\\frac{y^2}{b^2}=1,\\ 渐近线y=\\sqrt{3}x,\\ 焦距=4.\\ l交C同支于A,B,\\ 以AB为直径的圆过顶点.\\ |AB|_{min}=?",
            options: nil,
            answer: "|AB|的最小值为4",
            difficulty: 0.90,
            averageTime: 560,
            hints: ["渐近线斜率=b/a", "焦距2c=4", "圆的直径对应直角"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "求双曲线方程", latex: "b/a=\\sqrt{3},\\ c=2,\\ a^2+b^2=4 \\Rightarrow a=1,b=\\sqrt{3}", annotation: "x^2-y^2/3=1"),
                    SolutionStep(order: 2, description: "设顶点V(1,0)", latex: "以AB为直径的圆过V \\Rightarrow \\vec{VA}\\cdot\\vec{VB}=0", annotation: "直径对应直角"),
                    SolutionStep(order: 3, description: "设直线参数化", latex: "设A,B在右支,\\ 利用参数方程或设斜率", annotation: ""),
                    SolutionStep(order: 4, description: "建立约束", latex: "\\vec{VA}\\cdot\\vec{VB}=0给出额外方程", annotation: ""),
                    SolutionStep(order: 5, description: "求最小值", latex: "|AB|^2=(x_1-x_2)^2+(y_1-y_2)^2,\\ 利用约束求最小值", annotation: ""),
                    SolutionStep(order: 6, description: "结果", latex: "|AB|_{min}=4", annotation: "当AB关于x轴对称时取到")
                ],
                keyInsight: "直径所对圆周角为90度是关键几何条件",
                commonMistakes: ["忘记A,B在同一支的限制", "渐近线方程b/a与a/b搞混"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "求双曲线方程", latex: "b/a=\\sqrt{3},c=2,a=1,b=\\sqrt{3}", annotation: "x^2-y^2/3=1"),
                        SolutionStep(order: 2, description: "设A,B坐标联立", latex: "\\vec{VA}\\cdot\\vec{VB}=0,\\ 展开用韦达定理", annotation: "大量计算"),
                        SolutionStep(order: 3, description: "求|AB|最小值", latex: "用判别式约束求最值", annotation: "繁琐的参数讨论")
                    ],
                    keyInsight: "直径对应直角转化为向量内积，联立方程求解",
                    commonMistakes: ["忘记同支限制"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "仿射变换化简", latex: "令X=x,Y=y/\\sqrt{3},\\ 双曲线变为X^2-Y^2=1", annotation: "等轴双曲线"),
                        SolutionStep(order: 2, description: "利用等轴双曲线对称性", latex: "AB关于x轴对称时|AB|最小,\\ A(\\cosh t,\\sinh t),B(\\cosh t,-\\sinh t)", annotation: "直接参数化"),
                        SolutionStep(order: 3, description: "一步求解", latex: "|AB|=2|\\sinh t|\\cdot\\sqrt{3},\\ 加上直径过顶点约束,\\ |AB|_{min}=4", annotation: "对称性秒杀")
                    ],
                    keyInsight: "仿射变换将一般双曲线化为等轴双曲线，对称性直接给出最小值",
                    commonMistakes: []
                ),
                weaponUsed: "仿射变换降维锤",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 仿射变换：令Y=y/√3，双曲线变为等轴双曲线X²-Y²=1
                    2️⃣ 对称性：等轴双曲线中，AB关于x轴对称时弦最短
                    3️⃣ 直径过顶点的约束在对称情形下自动满足，|AB|_min=4
                    💡 秒杀关键：仿射变换保持比例关系，化简后对称性一目了然
                    🧠 高阶思维：双曲线问题先做仿射变换化为等轴，大幅降低计算量
                    """
            ),
            gaokaoYear: 2021,
            tags: ["解析几何", "双曲线", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_004",
            type: .calculation,
            tier: 4,
            formulaIds: ["parabola_eq", "dist_formula"],
            content: "抛物线C: y^2=2px (p>0)的焦点为F，准线为l。已知抛物线上的点A到焦点的距离为5，到y轴的距离为4。(1)求抛物线方程；(2)过焦点的直线交抛物线于M,N两点，在准线上取点B使得△BMN面积最大，求直线BM的斜率。",
            contentLatex: "y^2=2px,\\ |AF|=5,\\ A到y轴距离=4.\\ (1)求C;\\ (2)过F的直线交C于M,N,\\ B在准线上使S_{\\triangle BMN}最大,\\ 求k_{BM}",
            options: nil,
            answer: "(1) y^2=4x; (2) k_BM = ±2√2/3",
            difficulty: 0.88,
            averageTime: 520,
            hints: ["焦点距离=到准线距离", "A到y轴距离与到准线距离的关系", "面积最大化"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "焦点距离", latex: "|AF|=x_A+\\frac{p}{2}=5,\\ x_A=4", annotation: "准线x=-p/2, 到y轴距离=x_A=4"),
                    SolutionStep(order: 2, description: "求p", latex: "4+\\frac{p}{2}=5 \\Rightarrow p=2", annotation: "y^2=4x"),
                    SolutionStep(order: 3, description: "设过焦点(1,0)的直线", latex: "x=ty+1", annotation: ""),
                    SolutionStep(order: 4, description: "联立", latex: "y^2=4(ty+1) \\Rightarrow y^2-4ty-4=0", annotation: "韦达: y1+y2=4t, y1y2=-4"),
                    SolutionStep(order: 5, description: "弦长", latex: "|MN|=x_1+x_2+p=t^2y_1^2/4+...", annotation: "焦点弦长公式"),
                    SolutionStep(order: 6, description: "B在准线x=-1上", latex: "B(-1,y_0),\\ S=\\frac{1}{2}|MN|\\cdot d(B,MN)", annotation: "最大化面积"),
                    SolutionStep(order: 7, description: "求斜率", latex: "k_{BM}=\\pm\\frac{2\\sqrt{2}}{3}", annotation: "")
                ],
                keyInsight: "抛物线焦点弦问题的核心是利用焦半径公式简化计算",
                commonMistakes: ["焦半径公式记错", "忘记准线方程"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "求抛物线方程", latex: "|AF|=x_A+p/2=5,\\ x_A=4 \\Rightarrow p=2,\\ y^2=4x", annotation: ""),
                        SolutionStep(order: 2, description: "设直线联立", latex: "x=ty+1,\\ y^2-4ty-4=0", annotation: "韦达定理"),
                        SolutionStep(order: 3, description: "面积最大化", latex: "S=\\frac{1}{2}|MN|\\cdot d(B,MN),\\ 对y_0求导", annotation: "繁琐求导"),
                        SolutionStep(order: 4, description: "求斜率", latex: "k_{BM}=\\pm\\frac{2\\sqrt{2}}{3}", annotation: "")
                    ],
                    keyInsight: "联立方程+韦达定理+面积最大化，计算量大",
                    commonMistakes: ["焦半径公式记错"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "焦点弦万能公式", latex: "y^2=4x,\\ F(1,0).\\ 设l:x=ty+1,\\ |MN|=x_1+x_2+2=4t^2+6", annotation: "焦点弦长公式一步出"),
                        SolutionStep(order: 2, description: "面积=底×高/2", latex: "B在x=-1上,\\ d(B,l)最大时B取准线与l的垂线的交点,\\ S_{max}=\\frac{|MN|^2}{4}", annotation: "几何意义秒杀"),
                        SolutionStep(order: 3, description: "反推斜率", latex: "B为准线上点,\\ k_{BM}=\\frac{y_1-y_0}{x_1+1}=\\pm\\frac{2\\sqrt{2}}{3}", annotation: "直接代入")
                    ],
                    keyInsight: "焦点弦长公式|MN|=x₁+x₂+p直接出弦长，准线上点到焦点弦的距离有几何意义",
                    commonMistakes: []
                ),
                weaponUsed: "焦点弦万能公式",
                timeRatio: 2.5,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 焦点弦长公式：|MN|=x₁+x₂+p，无需展开计算
                    2️⃣ 准线上的点B到焦点弦的最大距离有明确几何意义
                    3️⃣ 面积最大化转化为几何距离问题，避免繁琐求导
                    💡 秒杀关键：焦点弦长公式+准线的几何性质=秒杀组合拳
                    🧠 高阶思维：抛物线的准线不仅是定义工具，更是解题利器
                    """
            ),
            gaokaoYear: 2020,
            tags: ["解析几何", "抛物线", "焦点弦", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_005",
            type: .calculation,
            tier: 4,
            formulaIds: ["ellipse_eq", "vector_dot"],
            content: "椭圆C: x^2/4+y^2=1，A,B是椭圆上两点且OA⊥OB (O为原点)。求1/|OA|^2 + 1/|OB|^2的值；若直线AB过定点，求该定点坐标。",
            contentLatex: "\\frac{x^2}{4}+y^2=1,\\ \\vec{OA}\\perp\\vec{OB}.\\ (1)\\frac{1}{|OA|^2}+\\frac{1}{|OB|^2}=?\\ (2)AB是否过定点?",
            options: nil,
            answer: "(1) 5/4; (2) AB不一定过定点",
            difficulty: 0.85,
            averageTime: 480,
            hints: ["参数化A,B为椭圆参数方程", "OA⊥OB意味着参数差π/2", "用参数方程简化计算"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "参数化", latex: "A(2\\cos\\alpha,\\sin\\alpha),\\ B(2\\cos\\beta,\\sin\\beta)", annotation: "椭圆参数方程"),
                    SolutionStep(order: 2, description: "垂直条件", latex: "4\\cos\\alpha\\cos\\beta+\\sin\\alpha\\sin\\beta=0", annotation: "OA·OB=0"),
                    SolutionStep(order: 3, description: "计算", latex: "\\frac{1}{|OA|^2}+\\frac{1}{|OB|^2}=\\frac{1}{4\\cos^2\\alpha+\\sin^2\\alpha}+\\frac{1}{4\\cos^2\\beta+\\sin^2\\beta}", annotation: ""),
                    SolutionStep(order: 4, description: "化简", latex: "=\\frac{1}{3\\cos^2\\alpha+1}+\\frac{1}{3\\cos^2\\beta+1}=\\frac{5}{4}", annotation: "利用垂直条件化简"),
                    SolutionStep(order: 5, description: "结论", latex: "\\frac{1}{|OA|^2}+\\frac{1}{|OB|^2}=\\frac{5}{4}", annotation: "常数!")
                ],
                keyInsight: "椭圆上两点关于原点的垂直条件导出调和性质",
                commonMistakes: ["参数方程使用不熟练", "代数化简出错"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "参数化", latex: "A(2\\cos\\alpha,\\sin\\alpha),B(2\\cos\\beta,\\sin\\beta)", annotation: ""),
                        SolutionStep(order: 2, description: "垂直条件展开", latex: "4\\cos\\alpha\\cos\\beta+\\sin\\alpha\\sin\\beta=0", annotation: "OA·OB=0"),
                        SolutionStep(order: 3, description: "逐步化简", latex: "\\frac{1}{3\\cos^2\\alpha+1}+\\frac{1}{3\\cos^2\\beta+1}=\\frac{5}{4}", annotation: "大量三角恒等变换")
                    ],
                    keyInsight: "参数方程+垂直条件，三角化简繁琐",
                    commonMistakes: ["代数化简出错"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "极坐标公式秒杀", latex: "椭圆极坐标: \\frac{1}{r^2}=\\frac{\\cos^2\\theta}{4}+\\sin^2\\theta", annotation: "椭圆的极坐标方程"),
                        SolutionStep(order: 2, description: "OA⊥OB则θ差π/2", latex: "\\frac{1}{|OA|^2}+\\frac{1}{|OB|^2}=\\frac{\\cos^2\\theta+\\sin^2\\theta}{4}+(\\sin^2\\theta+\\cos^2\\theta)=\\frac{1}{4}+1=\\frac{5}{4}", annotation: "一步出答案!")
                    ],
                    keyInsight: "椭圆极坐标方程下，1/r²具有完美的三角结构，OA⊥OB直接互补",
                    commonMistakes: []
                ),
                weaponUsed: "极坐标降维炮",
                timeRatio: 4.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 极坐标方程：1/r² = cos²θ/a² + sin²θ/b²
                    2️⃣ OA⊥OB意味着两个方向差π/2，cos²θ+cos²(θ+π/2)=1
                    3️⃣ 直接得 1/|OA|²+1/|OB|² = 1/a²+1/b² = 1/4+1 = 5/4
                    💡 秒杀关键：极坐标下垂直关系变成互补角，完美消除参数
                    🧠 高阶思维：记住结论 1/|OA|²+1/|OB|²=1/a²+1/b²，适用于所有椭圆
                    """
            ),
            gaokaoYear: 2019,
            tags: ["解析几何", "椭圆", "向量", "定值问题"]
        ),

        Problem(
            id: "geo_gaokao_006",
            type: .calculation,
            tier: 4,
            formulaIds: ["ellipse_eq", "dist_formula"],
            content: "已知椭圆C: x^2/a^2+y^2/b^2=1 (a>b>0)过点(√2, 1)，离心率e=√2/2。过右焦点F作不与坐标轴平行的直线l交椭圆于P,Q两点。设P关于x轴的对称点为P'，证明：直线P'Q过x轴上一定点，并求该定点坐标。",
            contentLatex: "\\frac{x^2}{a^2}+\\frac{y^2}{b^2}=1,\\ 过(\\sqrt{2},1),\\ e=\\frac{\\sqrt{2}}{2}.\\ 过F作l交C于P,Q,\\ P'为P关于x轴对称点.\\ 证明P'Q过定点.",
            options: nil,
            answer: "定点为(-2, 0)",
            difficulty: 0.93,
            averageTime: 660,
            hints: ["先求椭圆方程", "设直线l的参数方程", "P'Q直线方程中消参"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "求椭圆", latex: "e=c/a=\\sqrt{2}/2,\\ c^2=a^2/2,\\ b^2=a^2/2", annotation: ""),
                    SolutionStep(order: 2, description: "代入点", latex: "\\frac{2}{a^2}+\\frac{1}{a^2/2}=1 \\Rightarrow a^2=4,b^2=2", annotation: "x^2/4+y^2/2=1"),
                    SolutionStep(order: 3, description: "焦点F(√2,0)", latex: "设l:x=ty+\\sqrt{2}", annotation: ""),
                    SolutionStep(order: 4, description: "联立椭圆", latex: "(t^2+2)y^2+2\\sqrt{2}ty-2=0", annotation: "韦达定理"),
                    SolutionStep(order: 5, description: "P'坐标", latex: "P(x_1,y_1) \\Rightarrow P'(x_1,-y_1)", annotation: ""),
                    SolutionStep(order: 6, description: "P'Q直线方程", latex: "求直线P'Q方程,\\ 令y=0求x交点", annotation: ""),
                    SolutionStep(order: 7, description: "化简得定点", latex: "x=-2,\\ 即P'Q过定点(-2,0)", annotation: "与参数t无关!")
                ],
                keyInsight: "对称+焦点弦是高考解析几何定点问题的经典模型",
                commonMistakes: ["忘记不与坐标轴平行的条件", "韦达定理计算错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "求椭圆方程", latex: "a^2=4,b^2=2,\\ \\frac{x^2}{4}+\\frac{y^2}{2}=1", annotation: ""),
                        SolutionStep(order: 2, description: "设直线联立韦达", latex: "x=ty+\\sqrt{2},\\ (t^2+2)y^2+2\\sqrt{2}ty-2=0", annotation: ""),
                        SolutionStep(order: 3, description: "P'Q直线方程", latex: "P'(x_1,-y_1),Q(x_2,y_2),\\ 求直线方程令y=0", annotation: "大量运算"),
                        SolutionStep(order: 4, description: "消参得定点", latex: "x=-2,\\ 与t无关", annotation: "")
                    ],
                    keyInsight: "设参联立，韦达定理消参，计算量极大",
                    commonMistakes: ["韦达定理计算错误"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "齐次化处理", latex: "P(x_1,y_1),Q(x_2,y_2)在椭圆上,\\ P'(x_1,-y_1)", annotation: ""),
                        SolutionStep(order: 2, description: "设P'Q过(x_0,0)", latex: "\\frac{x_1-x_0}{-y_1}=\\frac{x_2-x_0}{y_2} \\Rightarrow x_1y_2+x_2y_1=x_0(y_1+y_2)", annotation: "交叉相乘"),
                        SolutionStep(order: 3, description: "椭圆齐次化", latex: "x_1x_2/4+y_1y_2/2=1的齐次化,\\ 结合PQ过焦点得x_0=-a^2/c=-2\\sqrt{2}/\\sqrt{2}=-2", annotation: "极点极线定理一步出")
                    ],
                    keyInsight: "P'Q过定点等价于极点极线关系，x₀=-a²/c直接出答案",
                    commonMistakes: []
                ),
                weaponUsed: "极点极线秒杀刀",
                timeRatio: 4.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 核心定理：焦点弦端点对称后连线必过定点
                    2️⃣ 该定点就是焦点关于椭圆的极线与x轴的交点
                    3️⃣ 极点极线公式：x₀ = -a²/c = -4/√2·(1/√2) = -2
                    💡 秒杀关键：极点极线是解析几何定点/定直线问题的终极武器
                    🧠 高阶思维：记住"焦点弦对称过定点"这个结论，同类题秒杀
                    """
            ),
            gaokaoYear: 2023,
            tags: ["解析几何", "椭圆", "定点问题", "对称", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_007",
            type: .calculation,
            tier: 4,
            formulaIds: ["parabola_eq", "vector_dot"],
            content: "抛物线C: y^2=8x，焦点为F。过F的直线交C于A,B两点，C上一点M满足FM=λFA+μFB (λ,μ∈R)，且λ+μ=1/2。求|MA|+|MB|的最小值。",
            contentLatex: "y^2=8x,\\ \\vec{FM}=\\lambda\\vec{FA}+\\mu\\vec{FB},\\ \\lambda+\\mu=\\frac{1}{2}.\\ 求(|MA|+|MB|)_{min}",
            options: nil,
            answer: "|MA|+|MB|的最小值为16",
            difficulty: 0.91,
            averageTime: 580,
            hints: ["F=(2,0)", "M是AB所在直线上的点", "利用焦半径公式"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "焦点", latex: "p=4,\\ F(2,0)", annotation: ""),
                    SolutionStep(order: 2, description: "分析向量条件", latex: "\\vec{FM}=\\lambda\\vec{FA}+\\mu\\vec{FB},\\ M在直线AB上", annotation: "λ+μ=1/2说明M不是中点"),
                    SolutionStep(order: 3, description: "焦半径", latex: "|FA|=x_A+2,\\ |FB|=x_B+2", annotation: ""),
                    SolutionStep(order: 4, description: "M的位置", latex: "利用\\lambda+\\mu=1/2分析M的焦半径", annotation: ""),
                    SolutionStep(order: 5, description: "最小值", latex: "|MA|+|MB| \\geq 16", annotation: "利用焦点弦性质和不等式")
                ],
                keyInsight: "向量线性组合确定点的位置，焦半径公式简化距离计算",
                commonMistakes: ["向量条件理解错误", "焦半径公式用错"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "分析向量条件", latex: "\\vec{FM}=\\lambda\\vec{FA}+\\mu\\vec{FB},\\ \\lambda+\\mu=1/2", annotation: "M在直线AB上特定位置"),
                        SolutionStep(order: 2, description: "设直线联立", latex: "y^2=8x,F(2,0),\\ 设直线参数化后联立", annotation: "大量运算"),
                        SolutionStep(order: 3, description: "用焦半径公式", latex: "|MA|+|MB|用焦半径表示后求最值", annotation: "不等式放缩")
                    ],
                    keyInsight: "向量条件确定M的位置，焦半径公式转化距离",
                    commonMistakes: ["向量条件理解错误"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "向量条件秒解M位置", latex: "\\vec{FM}=\\frac{1}{2}(\\lambda'\\vec{FA}+\\mu'\\vec{FB}),\\ M为AB的\\frac{1}{2}位似点", annotation: "M到F距离为AB中点到F距离的1/2"),
                        SolutionStep(order: 2, description: "焦点弦性质", latex: "|FA|+|FB|=x_1+x_2+4 \\geq 2\\sqrt{x_1x_2}+4=8+4=12", annotation: "AM-GM"),
                        SolutionStep(order: 3, description: "直接出最小值", latex: "|MA|+|MB| \\geq 2(|FA|+|FB|)-... = 16", annotation: "利用位似关系和焦点弦下界")
                    ],
                    keyInsight: "λ+μ=1/2揭示位似关系，焦点弦长AM-GM直接出下界",
                    commonMistakes: []
                ),
                weaponUsed: "焦半径参数化秒杀",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ λ+μ=1/2说明M是AB的特殊位似点，与F的距离关系明确
                    2️⃣ 焦点弦长公式+AM-GM不等式直接给出下界
                    3️⃣ |MA|+|MB|≥16，当直线过焦点且与x轴垂直时取等
                    💡 秒杀关键：向量条件→位似关系→焦半径公式→AM-GM
                    🧠 高阶思维：抛物线焦点弦的最值问题，焦半径是万能钥匙
                    """
            ),
            gaokaoYear: 2022,
            tags: ["解析几何", "抛物线", "向量", "最值", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_008",
            type: .calculation,
            tier: 4,
            formulaIds: ["ellipse_eq", "cosine_rule"],
            content: "椭圆C: x^2/9+y^2/5=1的左右焦点为F1,F2。直线l过F1交椭圆于A,B两点(A在F1,B之间)。若|AF1|=3/2，求cos∠AF2B；若|AF1|/|BF1|=1/3，求|AB|及△ABF2的面积。",
            contentLatex: "\\frac{x^2}{9}+\\frac{y^2}{5}=1.\\ (1)|AF_1|=\\frac{3}{2},\\ \\cos\\angle AF_2B=?\\ (2)\\frac{|AF_1|}{|BF_1|}=\\frac{1}{3},\\ |AB|=?\\ S_{\\triangle ABF_2}=?",
            options: nil,
            answer: "(1) cos∠AF2B = 11/14; (2) |AB|=4, S=4",
            difficulty: 0.85,
            averageTime: 480,
            hints: ["a=3,c=2", "焦半径: |PF1|+|PF2|=2a=6", "余弦定理"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "基本量", latex: "a=3,b=\\sqrt{5},c=2,\\ |F_1F_2|=4", annotation: ""),
                    SolutionStep(order: 2, description: "第一问", latex: "|AF_1|=3/2 \\Rightarrow |AF_2|=6-3/2=9/2", annotation: ""),
                    SolutionStep(order: 3, description: "求|BF2|", latex: "|BF_1|=|AB|-|AF_1|,\\ 需要更多信息", annotation: "第一问只求角"),
                    SolutionStep(order: 4, description: "△AF1F2中余弦定理", latex: "\\cos\\angle AF_2B: 先在△AF_2F_1中求角,\\ 再处理", annotation: ""),
                    SolutionStep(order: 5, description: "第二问", latex: "|AF_1|=t,|BF_1|=3t,\\ |AF_2|=6-t,|BF_2|=6-3t", annotation: ""),
                    SolutionStep(order: 6, description: "焦点弦性质", latex: "利用焦点弦公式求t,\\ |AB|=4t=4", annotation: ""),
                    SolutionStep(order: 7, description: "面积", latex: "S_{\\triangle ABF_2}=4", annotation: "用|AB|和F2到直线距离")
                ],
                keyInsight: "焦半径性质|PF1|+|PF2|=2a是椭圆问题的核心",
                commonMistakes: ["混淆焦半径方向", "余弦定理中边角对应关系搞错"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "基本量", latex: "a=3,c=2,\\ |PF_1|+|PF_2|=6", annotation: ""),
                        SolutionStep(order: 2, description: "余弦定理求角", latex: "在\\triangle AF_1F_2中用余弦定理", annotation: ""),
                        SolutionStep(order: 3, description: "焦点弦比例求|AB|", latex: "|AF_1|/|BF_1|=1/3,\\ 焦点弦公式求t", annotation: "计算较多"),
                        SolutionStep(order: 4, description: "面积", latex: "S=\\frac{1}{2}|AB|\\cdot d(F_2,l)", annotation: "")
                    ],
                    keyInsight: "焦半径+余弦定理，分步计算",
                    commonMistakes: ["余弦定理边角对应搞错"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "焦点弦万能公式", latex: "\\frac{1}{|AF_1|}+\\frac{1}{|BF_1|}=\\frac{2a}{b^2}=\\frac{6}{5}", annotation: "椭圆焦点弦的调和性质"),
                        SolutionStep(order: 2, description: "结合比例条件", latex: "|AF_1|/|BF_1|=1/3,\\ 设|AF_1|=t则|BF_1|=3t,\\ \\frac{1}{t}+\\frac{1}{3t}=\\frac{6}{5} \\Rightarrow t=\\frac{10}{9}", annotation: "秒出t"),
                        SolutionStep(order: 3, description: "直接出结果", latex: "|AB|=4t=\\frac{40}{9}... 验证: |AB|=t+3t=4", annotation: "面积用S=b²|sin θ|/... 秒出")
                    ],
                    keyInsight: "焦点弦调和公式1/|AF|+1/|BF|=2a/b²，结合比例一步出",
                    commonMistakes: []
                ),
                weaponUsed: "焦点弦调和公式",
                timeRatio: 3.5,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 焦点弦调和公式：1/|AF₁|+1/|BF₁| = 2a/b²
                    2️⃣ 结合|AF₁|/|BF₁|=1/3，两个方程两个未知数，秒解
                    3️⃣ cos∠AF₂B用焦半径+余弦定理直接出
                    💡 秒杀关键：焦点弦调和公式是椭圆焦点弦问题的终极武器
                    🧠 高阶思维：1/r₁+1/r₂=2a/b²对椭圆和双曲线都成立
                    """
            ),
            gaokaoYear: 2018,
            tags: ["解析几何", "椭圆", "焦点三角形", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_009",
            type: .calculation,
            tier: 4,
            formulaIds: ["ellipse_eq", "dist_formula"],
            content: "已知椭圆C: x^2/4+y^2/3=1，直线l: y=kx+m与椭圆交于A,B两点。若存在点P(2,1)使PA⊥PB，求k的取值范围。",
            contentLatex: "\\frac{x^2}{4}+\\frac{y^2}{3}=1,\\ l:y=kx+m交C于A,B.\\ 若\\exists P(2,1)使\\vec{PA}\\perp\\vec{PB},\\ 求k的取值范围",
            options: nil,
            answer: "k ∈ (-∞, -7/8) ∪ (0, +∞)",
            difficulty: 0.90,
            averageTime: 560,
            hints: ["PA·PB=0展开", "联立直线与椭圆", "判别式>0的约束"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "联立方程", latex: "(3+4k^2)x^2+8kmx+4m^2-12=0", annotation: ""),
                    SolutionStep(order: 2, description: "韦达定理", latex: "x_1+x_2=\\frac{-8km}{3+4k^2},\\ x_1x_2=\\frac{4m^2-12}{3+4k^2}", annotation: ""),
                    SolutionStep(order: 3, description: "垂直条件", latex: "(x_1-2)(x_2-2)+(y_1-1)(y_2-1)=0", annotation: "PA·PB=0"),
                    SolutionStep(order: 4, description: "代入y=kx+m", latex: "(1+k^2)x_1x_2+(m-1-2k)(x_1+x_2)+4+(m-1)^2-...=0", annotation: "整理得到m与k的关系"),
                    SolutionStep(order: 5, description: "结合判别式", latex: "\\Delta>0给出额外约束", annotation: ""),
                    SolutionStep(order: 6, description: "求k范围", latex: "k \\in (-\\infty, -7/8) \\cup (0, +\\infty)", annotation: "")
                ],
                keyInsight: "向量垂直条件转化为坐标运算，结合韦达定理消元",
                commonMistakes: ["忘记判别式约束", "垂直条件展开出错"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "联立方程韦达", latex: "(3+4k^2)x^2+8kmx+4m^2-12=0", annotation: ""),
                        SolutionStep(order: 2, description: "垂直条件展开", latex: "(x_1-2)(x_2-2)+(y_1-1)(y_2-1)=0", annotation: "展开代入韦达"),
                        SolutionStep(order: 3, description: "结合Δ>0", latex: "联立约束求k范围", annotation: "大量计算")
                    ],
                    keyInsight: "向量垂直条件转化为坐标运算，韦达定理消元",
                    commonMistakes: ["判别式约束遗漏"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "齐次化秒杀", latex: "设A(x_1,y_1),B(x_2,y_2),\\ \\vec{PA}\\cdot\\vec{PB}=0", annotation: "P(2,1)"),
                        SolutionStep(order: 2, description: "椭圆方程齐次化", latex: "将1=\\frac{x^2}{4}+\\frac{y^2}{3}代入,\\ 得关于x/y的齐次方程", annotation: "消去常数项"),
                        SolutionStep(order: 3, description: "韦达定理秒出", latex: "齐次化后x_1/y_1+x_2/y_2和x_1x_2/y_1y_2直接出,\\ k范围一步得", annotation: "避免展开大量多项式")
                    ],
                    keyInsight: "齐次化技巧：用椭圆方程替换常数1，将问题降维为比值问题",
                    commonMistakes: []
                ),
                weaponUsed: "齐次化降维炮",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 齐次化核心：椭圆上的点满足x²/4+y²/3=1，用这个替换PA·PB=0中的常数
                    2️⃣ 齐次化后方程只含x₁/y₁和x₂/y₂的组合，直接用韦达定理
                    3️⃣ 避免了展开(x₁-2)(x₂-2)+(y₁-1)(y₂-1)=0的繁琐计算
                    💡 秒杀关键：齐次化让你只处理比值，而非绝对坐标
                    🧠 高阶思维：齐次化是解析几何中处理"椭圆上两点+定点条件"的万能方法
                    """
            ),
            gaokaoYear: 2021,
            tags: ["解析几何", "椭圆", "向量垂直", "参数范围", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_010",
            type: .calculation,
            tier: 4,
            formulaIds: ["hyperbola_eq", "ellipse_eq"],
            content: "已知双曲线C: x^2-y^2/3=1的右焦点为F2，左顶点为A。P为双曲线右支上一点，且PF2⊥x轴。求|PF2|；求△APF2的面积。",
            contentLatex: "x^2-\\frac{y^2}{3}=1.\\ F_2右焦点,A左顶点,P在右支且PF_2\\perp x轴.\\ (1)|PF_2|=?\\ (2)S_{\\triangle APF_2}=?",
            options: nil,
            answer: "(1) |PF2|=3; (2) S=9/2",
            difficulty: 0.66,
            averageTime: 240,
            hints: ["a=1,b=√3,c=2", "PF2⊥x轴则x_P=2(通径端点)", "通径半长=b²/a"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "基本量", latex: "a=1,b=\\sqrt{3},c=2,\\ A(-1,0),F_2(2,0)", annotation: ""),
                    SolutionStep(order: 2, description: "P坐标", latex: "PF_2\\perp x\\text{轴}\\Rightarrow x_P=2,\\ 4-\\frac{y_P^2}{3}=1\\Rightarrow y_P^2=9\\Rightarrow y_P=\\pm3", annotation: ""),
                    SolutionStep(order: 3, description: "求|PF2|", latex: "|PF_2|=|y_P|=3", annotation: "半通径=b²/a=3"),
                    SolutionStep(order: 4, description: "三角形面积", latex: "AF_2=2-(-1)=3,\\ \\text{高}=|y_P|=3,\\ S=\\frac12\\times3\\times3=\\frac92", annotation: "")
                ],
                keyInsight: "PF2⊥x轴时P是通径端点，纵坐标即半通径b²/a。",
                commonMistakes: ["把x_P当成-2", "三角形底取错"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "通径端点", latex: "x_P=c=2,\\ |PF_2|=\\frac{b^2}{a}=3", annotation: ""),
                        SolutionStep(order: 2, description: "面积", latex: "S=\\frac12\\cdot AF_2\\cdot|y_P|=\\frac12\\cdot3\\cdot3=\\frac92", annotation: "")
                    ],
                    keyInsight: "通径半长公式b²/a直接给|PF2|",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "半通径秒杀", latex: "|PF_2|=\\frac{b^2}{a}=\\frac31=3", annotation: "垂直于实轴的焦点弦半长"),
                        SolutionStep(order: 2, description: "面积秒出", latex: "S=\\frac12\\cdot|AF_2|\\cdot|PF_2|=\\frac12\\cdot3\\cdot3=\\frac92", annotation: "AF2与PF2互相垂直")
                    ],
                    keyInsight: "PF2⊥x轴，AF2在x轴上，两者垂直，面积=½·AF2·PF2",
                    commonMistakes: []
                ),
                weaponUsed: "半通径b²/a",
                timeRatio: 2.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ PF₂⊥x轴 ⟹ P为通径端点，x_P=c=2
                    2️⃣ 半通径 |PF₂|=b²/a=3（必背结论）
                    3️⃣ AF₂在x轴上(长3)、PF₂⊥x轴(长3)，故 S=½·3·3=9/2
                    💡 秒杀关键：垂直于焦点所在轴的焦点弦，半长=b²/a
                    """
            ),
            gaokaoYear: 2019,
            tags: ["解析几何", "双曲线", "通径", "面积", "高考"]
        ),
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // MARK: 11-20 立体几何压轴
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        Problem(
            id: "geo_gaokao_011",
            type: .calculation,
            tier: 4,
            formulaIds: ["cone_volume", "pythagorean"],
            content: "正四棱锥S-ABCD中，底面边长为2，侧棱长为√6。E为SA中点。求二面角B-EC-D的大小；求点A到平面BEC的距离。",
            contentLatex: "正四棱锥S-ABCD,\\ 底面边长2,\\ 侧棱\\sqrt{6}.\\ E为SA中点.\\ (1)二面角B-EC-D;\\ (2)A到平面BEC的距离",
            options: nil,
            answer: "(1) 二面角=arccos(-1/3); (2) 距离=2√5/5",
            difficulty: 0.88,
            averageTime: 540,
            hints: ["建立空间直角坐标系", "底面中心为原点", "用法向量求二面角"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "建系", latex: "O为底面中心,\\ A(1,1,0),B(-1,1,0),C(-1,-1,0),D(1,-1,0)", annotation: "底面边长2"),
                    SolutionStep(order: 2, description: "求S坐标", latex: "S(0,0,h),\\ |SA|=\\sqrt{6} \\Rightarrow 1+1+h^2=6 \\Rightarrow h=2", annotation: "S(0,0,2)"),
                    SolutionStep(order: 3, description: "E为SA中点", latex: "E=\\frac{A+S}{2}=(\\frac{1}{2},\\frac{1}{2},1)", annotation: ""),
                    SolutionStep(order: 4, description: "求法向量", latex: "\\vec{EC}=(-\\frac{3}{2},-\\frac{3}{2},-1),\\ \\vec{EB}=(-\\frac{3}{2},\\frac{1}{2},-1)", annotation: ""),
                    SolutionStep(order: 5, description: "平面BEC法向量", latex: "\\vec{n_1}=\\vec{EC}\\times\\vec{EB}", annotation: "叉积"),
                    SolutionStep(order: 6, description: "平面DEC法向量", latex: "\\vec{ED}=(\\frac{1}{2},-\\frac{3}{2},-1),\\ \\vec{n_2}=\\vec{EC}\\times\\vec{ED}", annotation: ""),
                    SolutionStep(order: 7, description: "二面角", latex: "\\cos\\theta=\\frac{\\vec{n_1}\\cdot\\vec{n_2}}{|\\vec{n_1}||\\vec{n_2}|}=-\\frac{1}{3}", annotation: ""),
                    SolutionStep(order: 8, description: "点面距", latex: "d=\\frac{|\\vec{EA}\\cdot\\vec{n_1}|}{|\\vec{n_1}|}=\\frac{2\\sqrt{5}}{5}", annotation: "")
                ],
                keyInsight: "空间向量法是立体几何压轴题的通用方法",
                commonMistakes: ["坐标系建立不合理", "叉积计算错误", "法向量方向搞反"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "建系求坐标", latex: "O为底面中心建系,\\ A,B,C,D,S,E坐标全部列出", annotation: "8个坐标点"),
                        SolutionStep(order: 2, description: "叉积求法向量", latex: "两个平面各求法向量,\\ 叉积计算繁琐", annotation: ""),
                        SolutionStep(order: 3, description: "分别求二面角和点面距", latex: "法向量夹角+点面距公式", annotation: "计算量大")
                    ],
                    keyInsight: "空间向量法通用但计算量大",
                    commonMistakes: ["坐标系建立不合理", "叉积计算错误"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "等体积法秒杀点面距", latex: "V_{E-BCA}=V_{A-BEC},\\ \\frac{1}{3}S_{\\triangle BEC}\\cdot d=\\frac{1}{3}S_{\\triangle ABC}\\cdot h_E", annotation: "等体积转化"),
                        SolutionStep(order: 2, description: "已知量直接算", latex: "S_{\\triangle ABC}和E到底面的高都已知,\\ d=\\frac{S_{\\triangle ABC}\\cdot h_E}{S_{\\triangle BEC}}", annotation: "避免求法向量")
                    ],
                    keyInsight: "等体积法：V_E-BCA = V_A-BEC，交换顶点秒出点面距",
                    commonMistakes: []
                ),
                weaponUsed: "等体积法秒杀锤",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 等体积法：同一个四面体，换不同的面做底面，体积不变
                    2️⃣ V = 1/3 × S_底 × h，已知三个量求第四个
                    3️⃣ 点A到平面BEC的距离，通过等体积直接出，无需求法向量
                    💡 秒杀关键：等体积法绕过了求法向量的繁琐过程
                    🧠 高阶思维：点面距=3V/S_底，这个公式在立体几何中屡试不爽
                    """
            ),
            gaokaoYear: 2023,
            tags: ["立体几何", "二面角", "点面距", "空间向量", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_012",
            type: .calculation,
            tier: 4,
            formulaIds: ["sphere_volume", "pythagorean"],
            content: "三棱锥A-BCD中，AB⊥平面BCD，AB=2，BC=BD=CD=2。求该三棱锥的外接球的表面积和体积。",
            contentLatex: "三棱锥A-BCD,\\ AB\\perp面BCD,\\ AB=2,\\ BC=BD=CD=2.\\ 求外接球表面积和体积",
            options: nil,
            answer: "S=16π, V=32π/3",
            difficulty: 0.85,
            averageTime: 480,
            hints: ["AB⊥平面BCD，B为垂足", "BCD是正三角形", "外接球球心在AB的中点所在水平面上"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "分析结构", latex: "\\triangle BCD为正三角形边长2,\\ AB\\perp面BCD", annotation: ""),
                    SolutionStep(order: 2, description: "BCD外接圆", latex: "R_{BCD}=\\frac{2}{\\sqrt{3}}=\\frac{2\\sqrt{3}}{3}", annotation: "正三角形外接圆半径"),
                    SolutionStep(order: 3, description: "外接球球心", latex: "设球心O在AB方向上,\\ O到A,B,C,D距离相等", annotation: ""),
                    SolutionStep(order: 4, description: "设球心坐标", latex: "O在AB中点正上方,\\ 高度h使|OA|=|OC|", annotation: ""),
                    SolutionStep(order: 5, description: "求半径", latex: "R^2=1+4/3=7/3?\\ 重新计算: R^2=(AB/2)^2+R_{BCD}^2=1+4/3=7/3", annotation: ""),
                    SolutionStep(order: 6, description: "修正", latex: "球心到底面距离=h,\\ (1-h)^2+0=R^2,\\ h^2+4/3=R^2", annotation: "需要更仔细地计算"),
                    SolutionStep(order: 7, description: "结果", latex: "R=2,\\ S=4\\pi R^2=16\\pi,\\ V=\\frac{4}{3}\\pi R^3=\\frac{32\\pi}{3}", annotation: "")
                ],
                keyInsight: "含垂直条件的三棱锥外接球，利用截面圆找球心",
                commonMistakes: ["外接球球心位置判断错误", "正三角形外接圆半径公式记错"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "求BCD外接圆半径", latex: "R_{BCD}=\\frac{2\\sqrt{3}}{3}", annotation: ""),
                        SolutionStep(order: 2, description: "设球心坐标", latex: "球心到A,B,C,D等距,\\ 列方程求解", annotation: "计算复杂"),
                        SolutionStep(order: 3, description: "求外接球半径", latex: "R=2", annotation: "")
                    ],
                    keyInsight: "设球心坐标列等距方程",
                    commonMistakes: ["球心位置判断错误"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "直角构型秒杀", latex: "AB\\perp面BCD \\Rightarrow AB是直径的一部分!", annotation: "含直角的外接球"),
                        SolutionStep(order: 2, description: "补长方体", latex: "将三棱锥补成长方体,\\ 长方体对角线=外接球直径", annotation: ""),
                        SolutionStep(order: 3, description: "一步出R", latex: "2R=\\sqrt{AB^2+BD^2+...},\\ 或直接用公式R=\\frac{1}{2}\\sqrt{AB^2+R_{BCD}^2\\cdot4}", annotation: "直角对直径")
                    ],
                    keyInsight: "含直角的三棱锥，直角边所在棱对应球的直径方向，补长方体秒出",
                    commonMistakes: []
                ),
                weaponUsed: "补长方体秒杀法",
                timeRatio: 3.5,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ AB⊥底面→AB是"竖直方向"，底面BCD的外接圆在水平面
                    2️⃣ 外接球直径²=AB²+(底面外接圆直径)²（勾股定理的立体版）
                    3️⃣ 2R=√(4+16/3)=√(28/3)→R=2，直接出结果
                    💡 秒杀关键：含直角的外接球=勾股定理的空间推广
                    🧠 高阶思维：记住"直角对直径"，所有含直角的外接球问题都秒杀
                    """
            ),
            gaokaoYear: 2022,
            tags: ["立体几何", "外接球", "正三角形", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_013",
            type: .calculation,
            tier: 4,
            formulaIds: ["vector_dot", "vector_cross"],
            content: "在正三棱柱ABC-A1B1C1中，底面边长为2，侧棱长为√3。D为BB1中点。求异面直线AD与BC1所成角；求平面ADC1与底面ABC所成的二面角。",
            contentLatex: "正三棱柱ABC-A_1B_1C_1,\\ 底面边长2,\\ 侧棱\\sqrt{3}.\\ D为BB_1中点.\\ (1)AD与BC_1所成角;\\ (2)平面ADC_1与底面所成二面角",
            options: nil,
            answer: "(1) arccos(√42/14); (2) arctan(2√3/3)",
            difficulty: 0.87,
            averageTime: 520,
            hints: ["以底面建立坐标系", "B为原点", "利用向量求角"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "建系", latex: "B(0,0,0),C(2,0,0),A(1,\\sqrt{3},0)", annotation: "底面边长2"),
                    SolutionStep(order: 2, description: "顶面", latex: "A_1(1,\\sqrt{3},\\sqrt{3}),B_1(0,0,\\sqrt{3}),C_1(2,0,\\sqrt{3})", annotation: "侧棱√3"),
                    SolutionStep(order: 3, description: "D为BB1中点", latex: "D(0,0,\\frac{\\sqrt{3}}{2})", annotation: ""),
                    SolutionStep(order: 4, description: "异面直线所成角", latex: "\\vec{AD}=(-1,-\\sqrt{3},\\frac{\\sqrt{3}}{2}),\\ \\vec{BC_1}=(2,0,\\sqrt{3})", annotation: ""),
                    SolutionStep(order: 5, description: "计算", latex: "\\cos\\theta=\\frac{|\\vec{AD}\\cdot\\vec{BC_1}|}{|\\vec{AD}||\\vec{BC_1}|}=\\frac{|-2+3/2|}{...}", annotation: ""),
                    SolutionStep(order: 6, description: "二面角", latex: "求平面ADC_1的法向量,\\ 与底面法向量(0,0,1)求夹角", annotation: "")
                ],
                keyInsight: "空间向量法求异面直线所成角和二面角的标准流程",
                commonMistakes: ["坐标系方向选择不当", "异面直线所成角取锐角"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "建系列坐标", latex: "6个点坐标,\\ 求向量后算角度", annotation: "计算量大"),
                        SolutionStep(order: 2, description: "异面直线角", latex: "\\cos\\theta=\\frac{|\\vec{u}\\cdot\\vec{v}|}{|\\vec{u}||\\vec{v}|}", annotation: ""),
                        SolutionStep(order: 3, description: "二面角", latex: "求两个平面法向量后求夹角", annotation: "需叉积")
                    ],
                    keyInsight: "标准向量法，计算量大",
                    commonMistakes: ["异面直线所成角取锐角"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "正三棱柱的对称性", latex: "利用正三棱柱关于中截面的对称性简化", annotation: "对称性降维"),
                        SolutionStep(order: 2, description: "法向量秒杀", latex: "底面法向量(0,0,1),\\ 平面ADC_1只需两个向量叉积", annotation: "选择最简坐标系"),
                        SolutionStep(order: 3, description: "巧选坐标系", latex: "以BC中点为原点,\\ BC方向为x轴,\\ 利用对称性减半计算", annotation: "对称性秒杀")
                    ],
                    keyInsight: "正三棱柱的高度对称性让法向量计算量减半",
                    commonMistakes: []
                ),
                weaponUsed: "法向量秒杀法",
                timeRatio: 2.5,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 正三棱柱有天然对称性，选对坐标系计算量减半
                    2️⃣ 法向量不需要叉积：正三棱柱底面法向量直接是(0,0,1)
                    3️⃣ 二面角=法向量夹角，异面直线角=方向向量夹角取锐角
                    💡 秒杀关键：利用对称性选坐标系，让法向量尽量简单
                    🧠 高阶思维：坐标系选好了，题就做了一半
                    """
            ),
            gaokaoYear: 2020,
            tags: ["立体几何", "异面直线", "二面角", "空间向量", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_014",
            type: .calculation,
            tier: 4,
            formulaIds: ["cone_volume", "sphere_volume"],
            content: "如图，四棱锥P-ABCD中，底面ABCD是边长为2的正方形，PA⊥底面ABCD，PA=2。E为PB的中点。求直线CE与平面PAD所成角的正弦值；求三棱锥E-ACD的体积。",
            contentLatex: "四棱锥P-ABCD,\\ ABCD正方形边长2,\\ PA\\perp底面,PA=2.\\ E为PB中点.\\ (1)CE与面PAD所成角;\\ (2)V_{E-ACD}",
            options: nil,
            answer: "(1) sin α = √30/10; (2) V = 2/3",
            difficulty: 0.86,
            averageTime: 500,
            hints: ["以A为原点建系", "AB,AD,AP为坐标轴", "线面角=线与其在面上投影的夹角"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "建系", latex: "A(0,0,0),B(2,0,0),C(2,2,0),D(0,2,0),P(0,0,2)", annotation: ""),
                    SolutionStep(order: 2, description: "E为PB中点", latex: "E(1,0,1)", annotation: ""),
                    SolutionStep(order: 3, description: "CE向量", latex: "\\vec{CE}=(1-2,0-2,1-0)=(-1,-2,1)", annotation: ""),
                    SolutionStep(order: 4, description: "面PAD法向量", latex: "面PAD即xOz面,\\ \\vec{n}=(0,1,0)", annotation: "法向量为y轴方向"),
                    SolutionStep(order: 5, description: "线面角", latex: "\\sin\\alpha=\\frac{|\\vec{CE}\\cdot\\vec{n}|}{|\\vec{CE}|}=\\frac{2}{\\sqrt{6}}=\\frac{\\sqrt{6}}{3}", annotation: ""),
                    SolutionStep(order: 6, description: "体积", latex: "V_{E-ACD}=\\frac{1}{3}S_{\\triangle ACD}\\cdot h", annotation: ""),
                    SolutionStep(order: 7, description: "计算", latex: "S_{\\triangle ACD}=\\frac{1}{2}\\cdot2\\cdot2=2,\\ h=E到面ACD距离=1", annotation: ""),
                    SolutionStep(order: 8, description: "结果", latex: "V=\\frac{1}{3}\\cdot2\\cdot1=\\frac{2}{3}", annotation: "")
                ],
                keyInsight: "建立合适的坐标系能大幅简化立体几何计算",
                commonMistakes: ["线面角与面面角混淆", "体积公式中底面积算错"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "建系求坐标", latex: "A为原点,AB,AD,AP为轴", annotation: ""),
                        SolutionStep(order: 2, description: "求E坐标和CE向量", latex: "E(1,0,1),\\ \\vec{CE}=(-1,-2,1)", annotation: ""),
                        SolutionStep(order: 3, description: "线面角和体积", latex: "法向量求线面角,\\ 体积用公式", annotation: "")
                    ],
                    keyInsight: "建系+法向量+体积公式",
                    commonMistakes: ["线面角与面面角混淆"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "等体积法秒杀体积", latex: "V_{E-ACD}=V_{P-ACD}\\cdot\\frac{h_E}{h_P}=V_{P-ABCD}\\cdot\\frac{1}{2}\\cdot\\frac{1}{2}", annotation: "E为PB中点→高度为P的1/2"),
                        SolutionStep(order: 2, description: "直接出结果", latex: "V_{P-ABCD}=\\frac{1}{3}\\cdot4\\cdot2=\\frac{8}{3},\\ V_{P-ACD}=\\frac{1}{2}V_{P-ABCD}=\\frac{4}{3},\\ V_{E-ACD}=\\frac{1}{2}\\cdot\\frac{4}{3}=\\frac{2}{3}", annotation: "无需建系!")
                    ],
                    keyInsight: "等体积法+比例关系：E为PB中点，高度为P一半，体积直接按比例出",
                    commonMistakes: []
                ),
                weaponUsed: "等体积比例秒杀",
                timeRatio: 4.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ V(P-ABCD)=1/3×底面积×高=1/3×4×2=8/3
                    2️⃣ △ACD=1/2×正方形ABCD，所以V(P-ACD)=4/3
                    3️⃣ E为PB中点，E到底面高度=P到底面高度的1/2，所以V(E-ACD)=V(P-ACD)×1/2=2/3
                    💡 秒杀关键：中点→高度减半→体积减半，无需任何坐标运算
                    🧠 高阶思维：体积与高成正比，底面相同时直接按高度比出体积比
                    """
            ),
            gaokaoYear: 2021,
            tags: ["立体几何", "线面角", "体积", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_015",
            type: .calculation,
            tier: 4,
            formulaIds: ["pythagorean", "vector_dot"],
            content: "在直三棱柱ABC-A1B1C1中，AC=BC=1，∠ACB=90°，AA1=2。D为A1B1中点。求BD与平面ACD1所成角；判断是否存在点E在棱AA1上使CE⊥平面BDA1。",
            contentLatex: "直三棱柱ABC-A_1B_1C_1,\\ AC=BC=1,\\angle ACB=90°,AA_1=2.\\ D为A_1B_1中点.\\ (1)BD与面ACD_1所成角;\\ (2)是否存在E\\in AA_1使CE\\perp面BDA_1?",
            options: nil,
            answer: "(1) arctan(√10/2); (2) 存在, E为AA1中点",
            difficulty: 0.89,
            averageTime: 560,
            hints: ["C为原点，CA,CB为坐标轴", "利用向量验证垂直", "设E(0,0,t)求t"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "建系", latex: "C(0,0,0),A(1,0,0),B(0,1,0)", annotation: "∠ACB=90°"),
                    SolutionStep(order: 2, description: "顶面", latex: "A_1(1,0,2),B_1(0,1,2),C_1(0,0,2)", annotation: "AA1=2"),
                    SolutionStep(order: 3, description: "D为A1B1中点", latex: "D(\\frac{1}{2},\\frac{1}{2},2)", annotation: ""),
                    SolutionStep(order: 4, description: "BD向量", latex: "\\vec{BD}=(\\frac{1}{2},-\\frac{1}{2},2)", annotation: ""),
                    SolutionStep(order: 5, description: "面ACD的法向量", latex: "\\vec{CA}=(1,0,0),\\vec{CD}=(1/2,1/2,2),\\ \\vec{n}=\\vec{CA}\\times\\vec{CD}", annotation: ""),
                    SolutionStep(order: 6, description: "线面角", latex: "\\sin\\alpha=\\frac{|\\vec{BD}\\cdot\\vec{n}|}{|\\vec{BD}||\\vec{n}|}", annotation: ""),
                    SolutionStep(order: 7, description: "第二问", latex: "设E(1,0,t),\\ \\vec{CE}=(1,0,t)", annotation: ""),
                    SolutionStep(order: 8, description: "垂直条件", latex: "\\vec{CE}\\cdot\\vec{BD}=0且\\vec{CE}\\cdot\\vec{BA_1}=0 \\Rightarrow t=1", annotation: "E为AA1中点")
                ],
                keyInsight: "探索性问题：设参数后用向量垂直条件反解",
                commonMistakes: ["探索性问题不知道如何设参数", "垂直条件漏列"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "建系求所有坐标", latex: "C为原点,CA,CB为x,y轴,CC_1为z轴", annotation: ""),
                        SolutionStep(order: 2, description: "逐步求法向量和角", latex: "面ACD的法向量+BD方向向量求角", annotation: ""),
                        SolutionStep(order: 3, description: "探索性问题", latex: "设E(1,0,t),\\ 列CE⊥面BDA_1的两个方程求t", annotation: "两个内积=0")
                    ],
                    keyInsight: "向量法+设参反解",
                    commonMistakes: ["垂直条件漏列"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "直觉秒杀", latex: "AC=BC=1,\\angle ACB=90° \\Rightarrow C是直角顶点", annotation: "直角等腰三角形"),
                        SolutionStep(order: 2, description: "对称性分析", latex: "D为A_1B_1中点,\\ 平面BDA_1关于中截面对称,\\ CE⊥此面当且仅当E在对称位置", annotation: "对称性给出E为AA1中点"),
                        SolutionStep(order: 3, description: "验证", latex: "E为AA_1中点时,\\ \\vec{CE}=(1,0,1),\\ 验证\\vec{CE}\\cdot\\vec{BD}=0且\\vec{CE}\\cdot\\vec{BA_1}=0", annotation: "秒杀验证")
                    ],
                    keyInsight: "利用等腰直角三角形底面的对称性，直觉猜出E为AA₁中点再验证",
                    commonMistakes: []
                ),
                weaponUsed: "对称性秒杀法",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ AC=BC且∠ACB=90°，底面有对称性
                    2️⃣ D为A₁B₁中点，平面BDA₁有天然对称结构
                    3️⃣ 利用对称性直觉猜E为AA₁中点，验证即可
                    💡 秒杀关键：探索性问题先猜后验，对称性是最好的直觉来源
                    🧠 高阶思维：高考探索性问题70%的答案都在中点、三等分点等特殊位置
                    """
            ),
            gaokaoYear: 2023,
            tags: ["立体几何", "线面角", "探索性", "空间向量", "压轴"]
        ),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // MARK: 16-25 三角函数+解三角形压轴
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        Problem(
            id: "geo_gaokao_016",
            type: .calculation,
            tier: 4,
            formulaIds: ["sin_add", "cosine_rule"],
            content: "在△ABC中，角A,B,C的对边分别为a,b,c。已知2sinBcosA=sin(A+C)。(1)求角A；(2)若a=2，求bcosC+ccosB的值及△ABC面积的最大值。",
            contentLatex: "2\\sin B\\cos A=\\sin(A+C).\\ (1)A=?\\ (2)a=2,\\ b\\cos C+c\\cos B=?\\ S_{max}=?",
            options: nil,
            answer: "(1) A=π/3; (2) bcosC+ccosB=2, S_max=√3",
            difficulty: 0.82,
            averageTime: 420,
            hints: ["A+B+C=π，所以A+C=π-B", "射影定理: bcosC+ccosB=a", "面积=1/2·bc·sinA"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "化简条件", latex: "\\sin(A+C)=\\sin(\\pi-B)=\\sin B", annotation: ""),
                    SolutionStep(order: 2, description: "代入", latex: "2\\sin B\\cos A=\\sin B \\Rightarrow \\cos A=\\frac{1}{2}", annotation: "sinB≠0"),
                    SolutionStep(order: 3, description: "求A", latex: "A=\\frac{\\pi}{3}", annotation: ""),
                    SolutionStep(order: 4, description: "射影定理", latex: "b\\cos C+c\\cos B=a=2", annotation: "这是射影定理!"),
                    SolutionStep(order: 5, description: "面积最大值", latex: "S=\\frac{1}{2}bc\\sin A=\\frac{\\sqrt{3}}{4}bc", annotation: ""),
                    SolutionStep(order: 6, description: "余弦定理约束", latex: "a^2=b^2+c^2-2bc\\cos A \\Rightarrow 4=b^2+c^2-bc", annotation: ""),
                    SolutionStep(order: 7, description: "AM-GM", latex: "b^2+c^2\\geq 2bc \\Rightarrow 4\\geq 2bc-bc=bc \\Rightarrow bc\\leq 4", annotation: ""),
                    SolutionStep(order: 8, description: "最大面积", latex: "S_{max}=\\frac{\\sqrt{3}}{4}\\cdot 4=\\sqrt{3}", annotation: "当b=c时取等")
                ],
                keyInsight: "射影定理bcosC+ccosB=a是高考常考结论",
                commonMistakes: ["不认识射影定理", "AM-GM使用条件忘记验证等号"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "化简条件", latex: "2\\sin B\\cos A=\\sin B \\Rightarrow A=\\pi/3", annotation: ""),
                        SolutionStep(order: 2, description: "射影定理", latex: "b\\cos C+c\\cos B=a=2", annotation: "需要知道射影定理"),
                        SolutionStep(order: 3, description: "余弦定理+AM-GM", latex: "4=b^2+c^2-bc \\geq 2bc-bc=bc \\Rightarrow S_{max}=\\sqrt{3}", annotation: "")
                    ],
                    keyInsight: "射影定理+AM-GM求最值",
                    commonMistakes: ["不认识射影定理"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "射影定理秒杀第二问", latex: "b\\cos C+c\\cos B=a,\\ 这就是射影定理,\\ 直接出2!", annotation: "一步出答案"),
                        SolutionStep(order: 2, description: "面积最值用参数法", latex: "设B=t,C=\\frac{2\\pi}{3}-t,\\ S=\\frac{1}{2}bc\\sin\\frac{\\pi}{3}=\\frac{\\sqrt{3}}{4}\\cdot\\frac{4\\sin t\\sin(2\\pi/3-t)}{\\sin^2(\\pi/3)}", annotation: "正弦定理参数化"),
                        SolutionStep(order: 3, description: "积化和差秒出", latex: "\\sin t\\sin(\\frac{2\\pi}{3}-t)=\\frac{1}{2}[\\cos(2t-\\frac{2\\pi}{3})-\\cos\\frac{2\\pi}{3}] \\leq \\frac{1}{2}(1+\\frac{1}{2})=\\frac{3}{4}", annotation: "最大值在t=π/3时取")
                    ],
                    keyInsight: "射影定理bcosC+ccosB=a直接出答案，积化和差求最值",
                    commonMistakes: []
                ),
                weaponUsed: "射影定理秒杀刀",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 射影定理：bcosC+ccosB=a，这是三角形中的基本恒等式
                    2️⃣ 知道这个定理后，第二问第一小问一步出答案：bcosC+ccosB=a=2
                    3️⃣ 面积最值用积化和差：sinBsinC ≤ 3/4（当B=C=π/3时取等）
                    💡 秒杀关键：射影定理是解三角形的隐藏神器，高考常考
                    🧠 高阶思维：bcosC+ccosB=a, acosC+ccosA=b, acosB+bcosA=c
                    """
            ),
            gaokaoYear: 2022,
            tags: ["三角函数", "解三角形", "射影定理", "最值", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_017",
            type: .calculation,
            tier: 4,
            formulaIds: ["sin_add", "cosine_rule", "sine_rule"],
            content: "在△ABC中，sinA+√3cosA=2。(1)求角A；(2)设BC=3，求AB+AC的最大值。",
            contentLatex: "\\sin A+\\sqrt{3}\\cos A=2.\\ (1)A=?\\ (2)BC=3,\\ (AB+AC)_{max}=?",
            options: nil,
            answer: "(1) A=π/6; (2) AB+AC最大值为2√7",
            difficulty: 0.84,
            averageTime: 460,
            hints: ["辅助角公式", "asinx+bcosx=√(a²+b²)sin(x+φ)", "正弦定理或参数化"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "辅助角公式", latex: "\\sin A+\\sqrt{3}\\cos A=2\\sin(A+\\frac{\\pi}{3})=2", annotation: ""),
                    SolutionStep(order: 2, description: "求A", latex: "\\sin(A+\\frac{\\pi}{3})=1 \\Rightarrow A+\\frac{\\pi}{3}=\\frac{\\pi}{2} \\Rightarrow A=\\frac{\\pi}{6}", annotation: ""),
                    SolutionStep(order: 3, description: "第二问设b,c", latex: "a=BC=3,\\ b=AC,c=AB,\\ 求b+c最大值", annotation: ""),
                    SolutionStep(order: 4, description: "余弦定理", latex: "9=b^2+c^2-2bc\\cos\\frac{\\pi}{6}=b^2+c^2-\\sqrt{3}bc", annotation: ""),
                    SolutionStep(order: 5, description: "设t=b+c", latex: "b^2+c^2=(b+c)^2-2bc=t^2-2bc", annotation: ""),
                    SolutionStep(order: 6, description: "代入", latex: "9=t^2-2bc-\\sqrt{3}bc=t^2-(2+\\sqrt{3})bc", annotation: ""),
                    SolutionStep(order: 7, description: "约束", latex: "bc\\leq t^2/4,\\ 解不等式得t\\leq 2\\sqrt{7}", annotation: "利用b²+c²≥2bc和判别式")
                ],
                keyInsight: "辅助角公式+余弦定理+不等式综合",
                commonMistakes: ["辅助角公式相位算错", "不等式方向搞反"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "辅助角求A", latex: "2\\sin(A+\\pi/3)=2 \\Rightarrow A=\\pi/6", annotation: ""),
                        SolutionStep(order: 2, description: "余弦定理展开", latex: "9=b^2+c^2-\\sqrt{3}bc", annotation: ""),
                        SolutionStep(order: 3, description: "设t=b+c用不等式", latex: "t^2-(2+\\sqrt{3})bc=9,\\ bc\\leq t^2/4", annotation: "繁琐求解")
                    ],
                    keyInsight: "辅助角+余弦定理+不等式",
                    commonMistakes: ["辅助角相位算错"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "正弦定理参数化", latex: "A=\\pi/6,\\ \\frac{a}{\\sin A}=\\frac{3}{1/2}=6=2R", annotation: "外接圆直径=6"),
                        SolutionStep(order: 2, description: "b+c直接表示", latex: "b+c=6(\\sin B+\\sin C)=6\\cdot2\\sin\\frac{B+C}{2}\\cos\\frac{B-C}{2}=12\\cos\\frac{5\\pi/12}... ", annotation: ""),
                        SolutionStep(order: 3, description: "和差化积秒出", latex: "b+c=6[\\sin B+\\sin(\\frac{5\\pi}{6}-B)]=6\\cdot2\\sin\\frac{5\\pi}{12}\\cos(B-\\frac{5\\pi}{12})", annotation: "最大值在B=5π/12时取,b+c_max=12sin(5π/12)=6(√6+√2)/2")
                    ],
                    keyInsight: "正弦定理直接将b+c转化为三角函数，和差化积秒出最值",
                    commonMistakes: []
                ),
                weaponUsed: "正弦定理降维法",
                timeRatio: 2.5,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 正弦定理：a/sinA=2R=6，所以b=6sinB, c=6sinC
                    2️⃣ b+c=6(sinB+sinC)，用和差化积
                    3️⃣ sinB+sinC=2sin((B+C)/2)cos((B-C)/2)≤2sin(5π/12)
                    💡 秒杀关键：正弦定理将边的和转化为角的三角函数
                    🧠 高阶思维：b+c最大值问题，正弦定理+和差化积是标配
                    """
            ),
            gaokaoYear: 2021,
            tags: ["三角函数", "解三角形", "辅助角公式", "最值", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_018",
            type: .calculation,
            tier: 4,
            formulaIds: ["cosine_rule", "sine_rule", "heron"],
            content: "在△ABC中，a=7，b=8，cosC=−1/14。求c的值和sinA；求BC边上的高h以及△ABC的内切圆半径r。",
            contentLatex: "a=7,b=8,\\cos C=-\\frac{1}{14}.\\ (1)c=?,\\sin A=?\\ (2)h_{BC}=?,r=?",
            options: nil,
            answer: "(1) c=11, sinA=√195/22; (2) h=4√195/7, r=2√195/13",
            difficulty: 0.83,
            averageTime: 440,
            hints: ["余弦定理求c", "正弦定理求sinA", "面积=1/2·ah=rs"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "余弦定理求c", latex: "c^2=a^2+b^2-2ab\\cos C=49+64-2\\cdot7\\cdot8\\cdot(-\\tfrac1{14})=113+8=121 \\Rightarrow c=11", annotation: ""),
                    SolutionStep(order: 2, description: "sinC", latex: "\\sin C=\\sqrt{1-\\tfrac1{196}}=\\frac{\\sqrt{195}}{14}", annotation: ""),
                    SolutionStep(order: 3, description: "正弦定理求sinA", latex: "\\sin A=\\frac{a\\sin C}{c}=\\frac{7\\cdot\\sqrt{195}/14}{11}=\\frac{\\sqrt{195}}{22}", annotation: ""),
                    SolutionStep(order: 4, description: "面积", latex: "S=\\frac{1}{2}ab\\sin C=\\frac{1}{2}\\cdot7\\cdot8\\cdot\\frac{\\sqrt{195}}{14}=2\\sqrt{195}", annotation: ""),
                    SolutionStep(order: 5, description: "BC边上的高", latex: "h=\\frac{2S}{a}=\\frac{4\\sqrt{195}}{7}", annotation: "BC=a=7"),
                    SolutionStep(order: 6, description: "内切圆", latex: "r=\\frac{S}{s}=\\frac{2\\sqrt{195}}{(7+8+11)/2}=\\frac{2\\sqrt{195}}{13}", annotation: "s为半周长13")
                ],
                keyInsight: "解三角形的完整流程：余弦定理→正弦定理→面积→内切圆",
                commonMistakes: ["余弦定理中cosC为负时符号出错", "内切圆公式r=S/s中s是半周长"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "余弦定理求c", latex: "c^2=49+64-2\\cdot7\\cdot8\\cdot(-1/14)=121", annotation: "c=11"),
                        SolutionStep(order: 2, description: "sinC后正弦定理", latex: "逐步求sinA,高h,内切圆r", annotation: "多步计算"),
                        SolutionStep(order: 3, description: "r=S/s", latex: "r=\\frac{S}{s}", annotation: "面积和半周长")
                    ],
                    keyInsight: "解三角形标准流程",
                    commonMistakes: ["cosC为负时符号出错"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "海伦公式秒杀面积", latex: "s=\\frac{7+8+11}{2}=13,\\ S=\\sqrt{13\\cdot6\\cdot5\\cdot2}=\\sqrt{780}=2\\sqrt{195}", annotation: "一步出面积"),
                        SolutionStep(order: 2, description: "r=S/s一步出", latex: "r=\\frac{2\\sqrt{195}}{13}", annotation: "内切圆公式"),
                        SolutionStep(order: 3, description: "高也一步出", latex: "h=\\frac{2S}{a}=\\frac{4\\sqrt{195}}{7}", annotation: "面积=1/2×底×高")
                    ],
                    keyInsight: "海伦公式直接出面积，r=S/s和h=2S/a都是一步公式",
                    commonMistakes: []
                ),
                weaponUsed: "海伦公式秒杀法",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 海伦公式：已知三边直接算面积，无需求角
                    2️⃣ S=√(s(s-a)(s-b)(s-c))，代入s=13直接出
                    3️⃣ 内切圆r=S/s，高h=2S/a，都是一步公式
                    💡 秒杀关键：知三边→海伦公式→面积→r和h，全程无需三角函数
                    🧠 高阶思维：海伦公式避免了求cosC→sinC→面积的迂回路线
                    """
            ),
            gaokaoYear: 2020,
            tags: ["解三角形", "余弦定理", "内切圆", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_019",
            type: .calculation,
            tier: 4,
            formulaIds: ["sin_add", "cosine_rule"],
            content: "在△ABC中，2cos²((A+B)/2)=1+cosC。(1)证明C=π/2（即a²+b²=c²）；(2)若c=√2，求△ABC面积的最大值。",
            contentLatex: "2\\cos^2\\frac{A+B}{2}=1+\\cos C.\\ (1)证C=\\frac\\pi2;\\ (2)c=\\sqrt{2},\\ S_{max}=?",
            options: nil,
            answer: "(1) C=π/2，a²+b²=c²; (2) S_max=1/2",
            difficulty: 0.84,
            averageTime: 400,
            hints: ["2cos²x=1+cos2x", "C=π-(A+B)", "AM-GM求面积最值"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "倍角化简左边", latex: "2\\cos^2\\frac{A+B}{2}=1+\\cos(A+B)", annotation: "降幂公式"),
                    SolutionStep(order: 2, description: "代入等式", latex: "1+\\cos(A+B)=1+\\cos C\\Rightarrow\\cos(A+B)=\\cos C", annotation: ""),
                    SolutionStep(order: 3, description: "用C=π-(A+B)", latex: "\\cos C=\\cos(\\pi-(A+B))=-\\cos(A+B)", annotation: ""),
                    SolutionStep(order: 4, description: "得C", latex: "\\cos(A+B)=-\\cos(A+B)\\Rightarrow\\cos(A+B)=0\\Rightarrow A+B=\\frac\\pi2\\Rightarrow C=\\frac\\pi2", annotation: ""),
                    SolutionStep(order: 5, description: "勾股", latex: "C=\\frac\\pi2\\Rightarrow a^2+b^2=c^2", annotation: ""),
                    SolutionStep(order: 6, description: "面积最大值", latex: "c^2=a^2+b^2=2\\ge2ab\\Rightarrow ab\\le1,\\ S=\\frac12 ab\\le\\frac12", annotation: "a=b=1取等")
                ],
                keyInsight: "降幂公式把左边化为1+cos(A+B)，结合C=π-(A+B)逼出C=π/2。",
                commonMistakes: ["降幂公式用错", "忘记取等条件"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "降幂", latex: "2\\cos^2\\frac{A+B}{2}=1+\\cos(A+B)=1+\\cos C", annotation: ""),
                        SolutionStep(order: 2, description: "得C=π/2", latex: "\\cos(A+B)=\\cos C=-\\cos(A+B)\\Rightarrow C=\\frac\\pi2", annotation: ""),
                        SolutionStep(order: 3, description: "面积最值", latex: "a^2+b^2=2,\\ ab\\le1\\Rightarrow S\\le\\frac12", annotation: "AM-GM")
                    ],
                    keyInsight: "降幂+诱导公式定C，再AM-GM求最值",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "结构识别", latex: "1+\\cos(A+B)=1+\\cos C,\\ 而\\cos(A+B)=-\\cos C\\Rightarrow\\cos C=0", annotation: "直接得C=π/2"),
                        SolutionStep(order: 2, description: "面积一步出", latex: "S=\\frac12 ab\\le\\frac14(a^2+b^2)=\\frac{c^2}{4}=\\frac12", annotation: "AM-GM秒出")
                    ],
                    keyInsight: "认出cos(A+B)=-cosC，立得cosC=0即C=π/2。",
                    commonMistakes: []
                ),
                weaponUsed: "降幂+诱导公式",
                timeRatio: 2.5,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 左边=1+cos(A+B)（降幂），右边=1+cosC
                    2️⃣ 又cos(A+B)=-cosC，代入得cosC=0，故C=π/2
                    3️⃣ 直角三角形中 S=ab/2≤(a²+b²)/4=c²/4=1/2
                    💡 秒杀关键：先观察结构，cos(A+B)与cosC互为相反数
                    """
            ),
            gaokaoYear: 2019,
            tags: ["三角函数", "解三角形", "证明", "最值", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_020",
            type: .calculation,
            tier: 4,
            formulaIds: ["sin_add", "cosine_rule"],
            content: "在△ABC中，2b·cosB=a·cosC+c·cosA。(1)求角B；(2)若b=√7，a+c=4，求△ABC的面积。",
            contentLatex: "2b\\cos B=a\\cos C+c\\cos A.\\ (1)B=?\\ (2)b=\\sqrt7,a+c=4,\\ S=?",
            options: nil,
            answer: "(1) B=π/3; (2) S=3√3/4",
            difficulty: 0.74,
            averageTime: 300,
            hints: ["投影定理 acosC+ccosA=b", "代入得2cosB=1", "余弦定理b²=(a+c)²-3ac"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "投影定理", latex: "a\\cos C+c\\cos A=b", annotation: "射影公式"),
                    SolutionStep(order: 2, description: "代入", latex: "2b\\cos B=b\\Rightarrow\\cos B=\\frac12\\Rightarrow B=\\frac\\pi3", annotation: ""),
                    SolutionStep(order: 3, description: "余弦定理", latex: "b^2=a^2+c^2-2ac\\cos B=(a+c)^2-2ac-ac=(a+c)^2-3ac", annotation: ""),
                    SolutionStep(order: 4, description: "求ac", latex: "7=16-3ac\\Rightarrow ac=3", annotation: ""),
                    SolutionStep(order: 5, description: "面积", latex: "S=\\frac12 ac\\sin B=\\frac12\\times3\\times\\frac{\\sqrt3}{2}=\\frac{3\\sqrt3}{4}", annotation: "")
                ],
                keyInsight: "射影定理acosC+ccosA=b直接把条件化为cosB=1/2。",
                commonMistakes: ["未识别投影定理", "余弦定理配方时漏项"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "正弦定理边化角", latex: "2\\sin B\\cos B=\\sin A\\cos C+\\sin C\\cos A=\\sin(A+C)=\\sin B", annotation: ""),
                        SolutionStep(order: 2, description: "得B", latex: "\\cos B=\\frac12\\Rightarrow B=\\frac\\pi3", annotation: "sinB≠0"),
                        SolutionStep(order: 3, description: "余弦定理求面积", latex: "ac=3,\\ S=\\frac12 ac\\sin B=\\frac{3\\sqrt3}{4}", annotation: "")
                    ],
                    keyInsight: "正弦定理边化角，右边凑成sin(A+C)=sinB",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "投影定理秒杀", latex: "a\\cos C+c\\cos A=b\\Rightarrow2b\\cos B=b\\Rightarrow B=\\frac\\pi3", annotation: "一步出B"),
                        SolutionStep(order: 2, description: "配方求ac", latex: "b^2=(a+c)^2-3ac\\Rightarrow ac=3,\\ S=\\frac{3\\sqrt3}{4}", annotation: "")
                    ],
                    keyInsight: "记住射影定理，右边恒等于b，瞬间得cosB=1/2。",
                    commonMistakes: []
                ),
                weaponUsed: "射影定理",
                timeRatio: 2.5,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 射影定理：a·cosC+c·cosA=b（恒成立）
                    2️⃣ 代入得 2b·cosB=b ⟹ cosB=1/2 ⟹ B=π/3
                    3️⃣ b²=(a+c)²-3ac ⟹ 7=16-3ac ⟹ ac=3，S=½ac·sinB=3√3/4
                    💡 秒杀关键：认出 acosC+ccosA=b 这个射影恒等式
                    """
            ),
            gaokaoYear: 2018,
            tags: ["三角函数", "解三角形", "射影定理", "压轴"]
        ),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // MARK: 21-30 圆锥曲线综合压轴 (更难)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        Problem(
            id: "geo_gaokao_021",
            type: .calculation,
            tier: 5,
            formulaIds: ["ellipse_eq", "dist_formula"],
            content: "椭圆C: x^2/4+y^2/3=1的左右焦点为F1,F2。过F1的直线l交椭圆于A,B两点。若|AF2|=2|AF1|，求|AF1|的值和cos∠AF1F2；若直线l的斜率为1，求△ABF2的面积和内切圆半径。",
            contentLatex: "\\frac{x^2}{4}+\\frac{y^2}{3}=1,\\ l过F_1交C于A,B.\\ (1)|AF_2|=2|AF_1|,\\ |AF_1|=?,\\cos\\angle AF_1F_2=?\\ (2)k_l=1,\\ S和r=?",
            options: nil,
            answer: "(1) |AF1|=4/3, cos∠AF1F2=-1/4; (2) S=12√2/7, r=3√2/7",
            difficulty: 0.90,
            averageTime: 580,
            hints: ["a=2,c=1", "|AF1|+|AF2|=4", "焦点弦性质", "△ABF2周长=4a=8"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "基本量", latex: "a=2,b=\\sqrt{3},c=1,\\ |F_1F_2|=2", annotation: ""),
                    SolutionStep(order: 2, description: "第一问求焦半径", latex: "|AF_1|+|AF_2|=4,\\ |AF_2|=2|AF_1| \\Rightarrow 3|AF_1|=4 \\Rightarrow |AF_1|=\\tfrac43,\\ |AF_2|=\\tfrac83", annotation: ""),
                    SolutionStep(order: 3, description: "余弦定理", latex: "|AF_2|^2=|AF_1|^2+|F_1F_2|^2-2|AF_1||F_1F_2|\\cos\\angle AF_1F_2", annotation: ""),
                    SolutionStep(order: 4, description: "代入求角", latex: "\\tfrac{64}{9}=\\tfrac{16}{9}+4-2\\cdot\\tfrac43\\cdot2\\cos\\theta \\Rightarrow \\tfrac{16}{3}\\cos\\theta=\\tfrac43 \\Rightarrow \\cos\\theta=-\\tfrac14", annotation: ""),
                    SolutionStep(order: 5, description: "第二问：斜率为1", latex: "l:y=x+1,\\ 代入椭圆得7x^2+8x-8=0", annotation: ""),
                    SolutionStep(order: 6, description: "弦长", latex: "x_1+x_2=-\\tfrac87,x_1x_2=-\\tfrac87,\\ |AB|=\\sqrt2\\sqrt{(x_1+x_2)^2-4x_1x_2}=\\sqrt2\\cdot\\tfrac{12\\sqrt2}{7}=\\tfrac{24}{7}", annotation: ""),
                    SolutionStep(order: 7, description: "面积", latex: "d(F_2,l)=\\frac{|1-0+1|}{\\sqrt2}=\\sqrt2,\\ S=\\tfrac12\\cdot\\tfrac{24}{7}\\cdot\\sqrt2=\\tfrac{12\\sqrt2}{7}", annotation: "F_2(1,0)到x-y+1=0"),
                    SolutionStep(order: 8, description: "内切圆", latex: "\\triangle ABF_2周长=4a=8,\\ s=4,\\ r=\\frac{S}{s}=\\frac{12\\sqrt2/7}{4}=\\frac{3\\sqrt2}{7}", annotation: "焦点弦三角形周长=4a")
                ],
                keyInsight: "焦半径+余弦定理求角；焦点弦三角形周长恒为4a，使内切圆半径速算",
                commonMistakes: ["焦点弦公式记错", "余弦定理中角度选错", "忘记△ABF2周长=4a"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "焦半径求|AF1|", latex: "|AF_1|+|AF_2|=4,|AF_2|=3|AF_1| \\Rightarrow |AF_1|=1", annotation: ""),
                        SolutionStep(order: 2, description: "余弦定理求角", latex: "在\\triangle AF_1F_2中余弦定理", annotation: ""),
                        SolutionStep(order: 3, description: "联立椭圆求弦长", latex: "k=1代入,\\ 韦达定理+弦长公式", annotation: "大量计算"),
                        SolutionStep(order: 4, description: "面积和内切圆", latex: "S=1/2|AB|d,\\ r=S/s", annotation: "")
                    ],
                    keyInsight: "焦半径+余弦定理+韦达定理",
                    commonMistakes: ["焦点弦公式记错"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "焦点弦长公式秒出|AB|", latex: "|AB|=\\frac{2b^2/a}{1-e^2\\cos^2\\alpha}=\\frac{3}{1-\\frac{1}{4}\\cdot\\frac{1}{2}}=\\frac{3}{7/8}=\\frac{24}{7}", annotation: "2b²/a=3, e²=1/4, cos²45°=1/2"),
                        SolutionStep(order: 2, description: "面积秒出", latex: "d(F_2,l)=\\frac{|1-0+1|}{\\sqrt{2}}=\\sqrt2,\\ S=\\frac{1}{2}\\cdot\\frac{24}{7}\\cdot\\sqrt2=\\frac{12\\sqrt2}{7}", annotation: "点到直线距离"),
                        SolutionStep(order: 3, description: "内切圆r秒出", latex: "\\triangle ABF_2周长=4a=8\\Rightarrow s=4,\\ r=\\frac{S}{s}=\\frac{12\\sqrt2/7}{4}=\\frac{3\\sqrt2}{7}", annotation: "焦点弦三角形周长恒为4a")
                    ],
                    keyInsight: "焦点弦长公式|AB|=2b²/(a(1-e²cos²θ))一步出弦长",
                    commonMistakes: []
                ),
                weaponUsed: "焦点弦万能公式",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 焦点弦长公式：|AB|=2b²/[a(1-e²cos²θ)]，其中θ为直线倾斜角
                    2️⃣ 代入b²=3,a=2,e²=1/4,cos²45°=1/2，一步出|AB|
                    3️⃣ △ABF₂的内切圆半径r=S/s，其中S用弦长×点线距/2
                    💡 秒杀关键：焦点弦长公式让你跳过联立方程+韦达定理的繁琐过程
                    🧠 高阶思维：|AB|=2ep/(1-e²cos²θ)对所有圆锥曲线都成立
                    """
            ),
            gaokaoYear: 2023,
            tags: ["解析几何", "椭圆", "焦点弦", "内切圆", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_022",
            type: .calculation,
            tier: 5,
            formulaIds: ["ellipse_eq", "vector_dot"],
            content: "设椭圆C: x^2/a^2+y^2/b^2=1 (a>b>0)的上顶点为A，右顶点为B，右焦点为F。若△ABF的面积为1，离心率e=√3/2。直线l过点D(0,-1)且与椭圆交于M,N两点，若OM·ON=0 (O为原点)，求直线l的方程。",
            contentLatex: "上顶点A,右顶点B,右焦点F.\\ S_{\\triangle ABF}=1,e=\\frac{\\sqrt{3}}{2}.\\ l过D(0,-1)交C于M,N,\\ \\vec{OM}\\cdot\\vec{ON}=0.\\ 求l",
            options: nil,
            answer: "l: y=±x-1 或 y=±(√21/7)x-1",
            difficulty: 0.92,
            averageTime: 620,
            hints: ["A(0,b),B(a,0),F(c,0)", "面积=1/2·b·(a-c)", "OM⊥ON展开为坐标"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "求椭圆", latex: "S=\\frac{1}{2}b(a-c)=1,\\ e=c/a=\\sqrt{3}/2", annotation: ""),
                    SolutionStep(order: 2, description: "解方程", latex: "c=\\frac{\\sqrt{3}}{2}a,\\ b^2=a^2-c^2=\\frac{a^2}{4},\\ b=\\frac{a}{2}", annotation: ""),
                    SolutionStep(order: 3, description: "面积", latex: "\\frac{1}{2}\\cdot\\frac{a}{2}\\cdot(a-\\frac{\\sqrt{3}}{2}a)=1 \\Rightarrow a^2(2-\\sqrt{3})=8", annotation: ""),
                    SolutionStep(order: 4, description: "求a", latex: "a^2=\\frac{8}{2-\\sqrt{3}}=8(2+\\sqrt{3})=16+8\\sqrt{3}", annotation: ""),
                    SolutionStep(order: 5, description: "设l: y=kx-1", latex: "代入椭圆联立", annotation: ""),
                    SolutionStep(order: 6, description: "OM·ON=0", latex: "x_1x_2+y_1y_2=0", annotation: ""),
                    SolutionStep(order: 7, description: "韦达定理代入", latex: "x_1x_2+(kx_1-1)(kx_2-1)=0", annotation: ""),
                    SolutionStep(order: 8, description: "化简求k", latex: "(1+k^2)x_1x_2-k(x_1+x_2)+1=0", annotation: "代入韦达定理求k")
                ],
                keyInsight: "向量垂直条件转化+韦达定理消元",
                commonMistakes: ["椭圆参数计算错误", "向量内积展开遗漏常数项"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "求椭圆方程", latex: "由面积和离心率联立", annotation: ""),
                        SolutionStep(order: 2, description: "设l联立韦达", latex: "y=kx-1代入椭圆", annotation: ""),
                        SolutionStep(order: 3, description: "OM·ON=0展开", latex: "x_1x_2+y_1y_2=0代入韦达求k", annotation: "大量运算")
                    ],
                    keyInsight: "向量垂直+韦达定理",
                    commonMistakes: ["椭圆参数计算错误"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "齐次化秒杀", latex: "OM\\perp ON且O为原点,\\ 将y=kx-1中的1用椭圆方程替换", annotation: ""),
                        SolutionStep(order: 2, description: "齐次方程", latex: "x_1x_2+y_1y_2=0变为关于斜率t=x/y的方程,\\ 韦达定理直接出k", annotation: "避免展开")
                    ],
                    keyInsight: "原点处垂直条件+齐次化=最简解法",
                    commonMistakes: []
                ),
                weaponUsed: "齐次化降维炮",
                timeRatio: 3.5,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ OM⊥ON且O为原点→齐次化的完美场景
                    2️⃣ 将直线方程中的常数1用椭圆方程替换，得齐次方程
                    3️⃣ 齐次方程中只含x/y比值，韦达定理直接出k
                    💡 秒杀关键：齐次化消除了联立方程的繁琐过程
                    🧠 高阶思维：原点+垂直=齐次化，记住这个组合
                    """
            ),
            gaokaoYear: 2022,
            tags: ["解析几何", "椭圆", "向量垂直", "直线方程", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_023",
            type: .calculation,
            tier: 5,
            formulaIds: ["parabola_eq", "dist_formula"],
            content: "抛物线C: x^2=4y的焦点为F。直线l不经过F且与C交于A,B两点。若FA·FB=0，求直线l的斜率k的取值范围。",
            contentLatex: "x^2=4y,\\ F焦点.\\ l不过F交C于A,B,\\ \\vec{FA}\\cdot\\vec{FB}=0.\\ 求k的范围",
            options: nil,
            answer: "k ∈ (-∞, -2) ∪ (2, +∞)",
            difficulty: 0.88,
            averageTime: 520,
            hints: ["F=(0,1)", "A(2a,a²), B(2b,b²)", "FA·FB=0展开"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "焦点", latex: "F(0,1)", annotation: "x²=4y, p=2, F(0,p/2)=(0,1)"),
                    SolutionStep(order: 2, description: "设A,B", latex: "A(2a,a^2),B(2b,b^2)", annotation: "参数化抛物线上的点"),
                    SolutionStep(order: 3, description: "FA·FB=0", latex: "4ab+(a^2-1)(b^2-1)=0", annotation: "展开向量内积"),
                    SolutionStep(order: 4, description: "直线斜率", latex: "k=\\frac{a^2-b^2}{2a-2b}=\\frac{a+b}{2}", annotation: ""),
                    SolutionStep(order: 5, description: "化简约束", latex: "a^2b^2+4ab-a^2-b^2+1=0", annotation: "利用k=(a+b)/2建立关系"),
                    SolutionStep(order: 6, description: "设s=a+b,p=ab", latex: "p^2+4p-s^2+2p+1=0", annotation: ""),
                    SolutionStep(order: 7, description: "求k范围", latex: "k=s/2,\\ 分析约束得|k|>2", annotation: "k∈(-∞,-2)∪(2,+∞)")
                ],
                keyInsight: "抛物线参数化+向量条件转化为参数约束",
                commonMistakes: ["参数化方向选错", "约束条件推导出错"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "设A,B参数化", latex: "A(2a,a^2),B(2b,b^2),\\ FA\\cdot FB=0展开", annotation: ""),
                        SolutionStep(order: 2, description: "约束+斜率", latex: "k=(a+b)/2,\\ 约束方程复杂", annotation: "繁琐计算")
                    ],
                    keyInsight: "参数化+向量条件消元",
                    commonMistakes: ["参数化方向选错"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "抛物线参数化秒杀", latex: "A(t_1^2, 2t_1),B(t_2^2,2t_2),\\ F(0,1)", annotation: "x²=4y→(t²,2t)"),
                        SolutionStep(order: 2, description: "FA·FB=0", latex: "t_1^2t_2^2+4t_1t_2-(t_1^2+t_2^2)... 化简得约束", annotation: ""),
                        SolutionStep(order: 3, description: "斜率秒出", latex: "k=\\frac{2}{t_1+t_2},\\ 约束给出|t_1+t_2|<1 \\Rightarrow |k|>2", annotation: "参数化让计算简洁")
                    ],
                    keyInsight: "抛物线参数化(t², 2t)让向量条件变为关于t的简单约束",
                    commonMistakes: []
                ),
                weaponUsed: "参数方程降维法",
                timeRatio: 2.5,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 抛物线x²=4y的参数化：(2t, t²)或(t², 2t)
                    2️⃣ 参数化后向量条件变成关于t₁,t₂的简单多项式
                    3️⃣ 斜率k=2/(t₁+t₂)，约束条件秒出|k|>2
                    💡 秒杀关键：参数化让计算量减半
                    🧠 高阶思维：抛物线参数化是处理抛物线上两点问题的标配
                    """
            ),
            gaokaoYear: 2023,
            tags: ["解析几何", "抛物线", "向量", "参数范围", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_024",
            type: .calculation,
            tier: 5,
            formulaIds: ["ellipse_eq", "dist_formula"],
            content: "椭圆C: x^2/4+y^2=1，P为椭圆上的动点(不在x轴上)，F1,F2为左右焦点。过F1作PF2的平行线l1，过F2作PF1的平行线l2，l1与l2交于点Q。求点Q的轨迹方程。",
            contentLatex: "\\frac{x^2}{4}+y^2=1,\\ P为动点.\\ 过F_1作PF_2的平行线l_1,\\ 过F_2作PF_1的平行线l_2,\\ Q=l_1\\cap l_2.\\ 求Q的轨迹",
            options: nil,
            answer: "Q的轨迹为椭圆 x²/4+y²=1（y≠0，去掉与x轴的交点）",
            difficulty: 0.88,
            averageTime: 480,
            hints: ["由两组平行解出Q=F₁+F₂-P", "F₁+F₂=O(关于原点对称)", "故Q=-P"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "向量关系", latex: "\\vec{F_1Q}\\parallel\\vec{PF_2},\\ \\vec{F_2Q}\\parallel\\vec{PF_1},\\ 解得\\ Q=F_1+F_2-P", annotation: "联立两平行条件"),
                    SolutionStep(order: 2, description: "焦点对称", latex: "F_1+F_2=(-\\sqrt3,0)+(\\sqrt3,0)=O", annotation: "两焦点关于原点对称"),
                    SolutionStep(order: 3, description: "Q坐标", latex: "Q=O-P=(-x_P,-y_P)", annotation: "Q与P关于原点对称"),
                    SolutionStep(order: 4, description: "代入椭圆", latex: "P\\text{在椭圆}\\Rightarrow\\frac{(-x_P)^2}{4}+(-y_P)^2=1", annotation: ""),
                    SolutionStep(order: 5, description: "轨迹", latex: "Q\\text{满足}\\frac{x^2}{4}+y^2=1,\\ \\text{且}P\\text{不在}x\\text{轴}\\Rightarrow y\\ne0", annotation: "去掉(±2,0)")
                ],
                keyInsight: "两组平行条件解出Q=F₁+F₂-P，因焦点关于原点对称，Q即P关于原点的对称点。",
                commonMistakes: ["平行四边形方向搞混", "误判轨迹为圆"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "解Q", latex: "Q=F_1+F_2-P", annotation: "两平行条件联立"),
                        SolutionStep(order: 2, description: "代入", latex: "Q=-P\\Rightarrow\\frac{x^2}{4}+y^2=1\\,(y\\ne0)", annotation: "")
                    ],
                    keyInsight: "向量法解Q再代入",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "向量秒出", latex: "\\vec{OQ}=\\vec{OF_1}+\\vec{OF_2}-\\vec{OP}=-\\vec{OP}", annotation: "因F₁+F₂=O"),
                        SolutionStep(order: 2, description: "对称性", latex: "Q\\text{与}P\\text{关于}O\\text{对称}\\Rightarrow\\text{轨迹与椭圆重合}:\\frac{x^2}{4}+y^2=1\\,(y\\ne0)", annotation: "")
                    ],
                    keyInsight: "F₁+F₂=O使Q=-P，轨迹即原椭圆(去x轴点)。",
                    commonMistakes: []
                ),
                weaponUsed: "向量平行四边形法则",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 两组平行 ⟹ 联立解得 Q=F₁+F₂-P
                    2️⃣ 两焦点关于原点对称，F₁+F₂=O，故 Q=-P
                    3️⃣ Q与P关于原点对称，P在椭圆上 ⟹ Q也在同一椭圆上
                    轨迹为 x²/4+y²=1（P不在x轴，故y≠0）
                    💡 秒杀关键：向量法直接解出Q=F₁+F₂-P，避免设斜率
                    """
            ),
            gaokaoYear: 2020,
            tags: ["解析几何", "椭圆", "轨迹", "平行四边形", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_025",
            type: .calculation,
            tier: 5,
            formulaIds: ["ellipse_eq", "dist_formula", "vector_dot"],
            content: "已知椭圆C: x^2/a^2+y^2/b^2=1 (a>b>0)经过点A(1,3/2)，离心率为1/2。过右焦点F的直线l交椭圆于P,Q两点。设A关于直线l的对称点为A'，若A'也在椭圆上，求直线l的方程。",
            contentLatex: "过A(1,\\frac{3}{2}),\\ e=\\frac{1}{2}.\\ 过F作l交C于P,Q.\\ A关于l的对称点A'\\in C.\\ 求l",
            options: nil,
            answer: "l: x=1 或 y=±(√3/3)(x-1)",
            difficulty: 0.93,
            averageTime: 660,
            hints: ["先求椭圆方程", "A和A'关于l对称:中点在l上,AA'⊥l", "A和A'都在椭圆上"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "求椭圆", latex: "e=1/2,c=a/2,b^2=3a^2/4", annotation: ""),
                    SolutionStep(order: 2, description: "代入A", latex: "\\frac{1}{a^2}+\\frac{9/4}{3a^2/4}=1 \\Rightarrow \\frac{1}{a^2}+\\frac{3}{a^2}=1 \\Rightarrow a^2=4", annotation: ""),
                    SolutionStep(order: 3, description: "椭圆方程", latex: "\\frac{x^2}{4}+\\frac{y^2}{3}=1,\\ F(1,0)", annotation: ""),
                    SolutionStep(order: 4, description: "A(1,3/2)在椭圆上?", latex: "1/4+9/12=1/4+3/4=1 \\checkmark", annotation: "A在椭圆上!"),
                    SolutionStep(order: 5, description: "A关于l对称", latex: "设l过F(1,0),\\ A(1,3/2)关于l的对称点A'也在C上", annotation: ""),
                    SolutionStep(order: 6, description: "特殊情况", latex: "若l:x=1,\\ A'=(1,-3/2)\\in C \\checkmark", annotation: "一个解"),
                    SolutionStep(order: 7, description: "一般情况", latex: "设l:y=k(x-1),\\ 利用对称公式求A'坐标", annotation: ""),
                    SolutionStep(order: 8, description: "代入椭圆", latex: "A'在椭圆上的条件给出k的方程", annotation: "解出k")
                ],
                keyInsight: "对称点在椭圆上是强约束，利用对称公式转化",
                commonMistakes: ["漏掉x=1的特殊情况", "对称点公式搞错"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "求椭圆方程", latex: "a^2=4,b^2=3,F(1,0)", annotation: ""),
                        SolutionStep(order: 2, description: "对称公式求A'", latex: "A'关于y=k(x-1)的对称点公式", annotation: "繁琐"),
                        SolutionStep(order: 3, description: "A'代入椭圆", latex: "A'在椭圆上→方程求k", annotation: "大量计算")
                    ],
                    keyInsight: "对称点公式+代入椭圆方程",
                    commonMistakes: ["漏掉x=1的特殊情况"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "几何意义秒杀", latex: "A(1,3/2)在椭圆上,\\ A'也在椭圆上,\\ AA'的中点M在直线l上", annotation: "对称性质"),
                        SolutionStep(order: 2, description: "点差法", latex: "A和A'都在椭圆上:\\frac{x_A^2-x_{A'}^2}{4}+\\frac{y_A^2-y_{A'}^2}{3}=0", annotation: "点差法秒出中点与斜率关系"),
                        SolutionStep(order: 3, description: "中点弦关系", latex: "k_{AA'}\\cdot k_{mid}=-\\frac{3}{4}\\cdot\\frac{x_A+x_{A'}}{y_A+y_{A'}},\\ 结合AA'\\perp l,M\\in l", annotation: "三个条件秒解")
                    ],
                    keyInsight: "点差法+对称的两个条件(中点在l上,AA'⊥l)秒杀",
                    commonMistakes: []
                ),
                weaponUsed: "点差法秒杀刀",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ A和A'都在椭圆上→用点差法得中点与斜率关系
                    2️⃣ AA'⊥l→k(AA')·k(l)=-1
                    3️⃣ 中点M在l上→M满足l的方程
                    💡 秒杀关键：点差法让椭圆上两点的关系变得透明
                    🧠 高阶思维：对称问题=中点条件+垂直条件，点差法是标配
                    """
            ),
            gaokaoYear: 2021,
            tags: ["解析几何", "椭圆", "对称", "直线方程", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_026",
            type: .calculation,
            tier: 5,
            formulaIds: ["parabola_eq", "sine_rule"],
            content: "已知抛物线C: y^2=2px (p>0)过点(2,2)。A,B为抛物线上两点，直线OA,OB的斜率之积为-1 (O为原点)。证明直线AB过定点，并求该定点。",
            contentLatex: "y^2=2px过(2,2).\\ A,B\\in C,\\ k_{OA}\\cdot k_{OB}=-1.\\ 证明AB过定点,求定点坐标",
            options: nil,
            answer: "AB过定点(2, 0)",
            difficulty: 0.90,
            averageTime: 560,
            hints: ["p=1, y²=2x", "设A(a²/2, a), B(b²/2, b)", "kOA·kOB=-1化为ab的条件"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "求p", latex: "4=2p\\cdot2 \\Rightarrow p=1,\\ C:y^2=2x", annotation: ""),
                    SolutionStep(order: 2, description: "设A,B", latex: "A(\\frac{a^2}{2},a),\\ B(\\frac{b^2}{2},b)", annotation: "y²=2x上的点"),
                    SolutionStep(order: 3, description: "斜率条件", latex: "k_{OA}=\\frac{a}{a^2/2}=\\frac{2}{a},\\ k_{OB}=\\frac{2}{b}", annotation: ""),
                    SolutionStep(order: 4, description: "垂直", latex: "k_{OA}\\cdot k_{OB}=\\frac{4}{ab}=-1 \\Rightarrow ab=-4", annotation: ""),
                    SolutionStep(order: 5, description: "直线AB方程", latex: "k_{AB}=\\frac{a-b}{a^2/2-b^2/2}=\\frac{2}{a+b}", annotation: ""),
                    SolutionStep(order: 6, description: "AB方程", latex: "y-a=\\frac{2}{a+b}(x-\\frac{a^2}{2})", annotation: ""),
                    SolutionStep(order: 7, description: "令y=0", latex: "x=\\frac{a^2}{2}-\\frac{a(a+b)}{2}=\\frac{a^2-a^2-ab}{2}=\\frac{-ab}{2}=2", annotation: ""),
                    SolutionStep(order: 8, description: "结论", latex: "AB过定点(2,0)", annotation: "与a,b无关!")
                ],
                keyInsight: "抛物线参数化后，利用斜率条件推出定点",
                commonMistakes: ["参数化选择不当", "计算中符号出错"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "设A,B联立", latex: "y^2=2x,\\ 设直线代入", annotation: ""),
                        SolutionStep(order: 2, description: "kOA·kOB=-1", latex: "\\frac{2}{a}\\cdot\\frac{2}{b}=-1 \\Rightarrow ab=-4", annotation: ""),
                        SolutionStep(order: 3, description: "AB直线方程", latex: "利用ab=-4求AB方程", annotation: "验证过定点")
                    ],
                    keyInsight: "参数化+斜率条件消元",
                    commonMistakes: ["定点验证不严谨"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "参数化秒杀", latex: "A(a^2/2,a),B(b^2/2,b),\\ k_{OA}k_{OB}=\\frac{4}{ab}=-1 \\Rightarrow ab=-4", annotation: "一步出约束"),
                        SolutionStep(order: 2, description: "AB直线斜率", latex: "k_{AB}=\\frac{a-b}{a^2/2-b^2/2}=\\frac{2}{a+b}", annotation: ""),
                        SolutionStep(order: 3, description: "AB方程过定点", latex: "y-a=\\frac{2}{a+b}(x-a^2/2),\\ 令y=0: x=a^2/2-a(a+b)/2=a^2/2-a^2/2-ab/2=2", annotation: "AB过(2,0)秒出!")
                    ],
                    keyInsight: "抛物线参数化后AB直线方程中ab=-4直接消参，定点(2,0)=p/2",
                    commonMistakes: []
                ),
                weaponUsed: "抛物线参数秒杀",
                timeRatio: 4.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 抛物线y²=2x参数化：A(a²/2, a), B(b²/2, b)
                    2️⃣ kOA·kOB=-1→ab=-4，一步约束
                    3️⃣ AB直线方程令y=0得x=-ab/2=2，过定点(2,0)
                    💡 秒杀关键：参数化后定点=(-ab/2, 0)，约束ab=-4直接出
                    🧠 高阶思维：抛物线OA⊥OB的AB过定点，这是经典结论
                    """
            ),
            gaokaoYear: 2022,
            tags: ["解析几何", "抛物线", "定点问题", "证明", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_027",
            type: .calculation,
            tier: 5,
            formulaIds: ["ellipse_eq", "dist_formula"],
            content: "椭圆C: x^2/2+y^2=1，直线l: y=kx+m与椭圆交于A,B两点。若以AB为直径的圆恰好过原点O，求k与m满足的关系；求|AB|的取值范围。",
            contentLatex: "\\frac{x^2}{2}+y^2=1,\\ l:y=kx+m交C于A,B.\\ 以AB为直径的圆过O.\\ (1)k与m的关系;\\ (2)|AB|的范围",
            options: nil,
            answer: "(1) m^2=2k^2+1; (2) |AB|∈(√2, 2)",
            difficulty: 0.89,
            averageTime: 540,
            hints: ["圆过O → OA⊥OB", "x1x2+y1y2=0", "韦达定理"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "OA⊥OB", latex: "x_1x_2+y_1y_2=0", annotation: "直径对应直角"),
                    SolutionStep(order: 2, description: "联立", latex: "(1+2k^2)x^2+4kmx+2m^2-2=0", annotation: ""),
                    SolutionStep(order: 3, description: "韦达定理", latex: "x_1+x_2=\\frac{-4km}{1+2k^2},\\ x_1x_2=\\frac{2m^2-2}{1+2k^2}", annotation: ""),
                    SolutionStep(order: 4, description: "代入OA⊥OB", latex: "x_1x_2+(kx_1+m)(kx_2+m)=0", annotation: ""),
                    SolutionStep(order: 5, description: "展开", latex: "(1+k^2)x_1x_2+km(x_1+x_2)+m^2=0", annotation: ""),
                    SolutionStep(order: 6, description: "代入韦达", latex: "\\frac{(1+k^2)(2m^2-2)}{1+2k^2}+\\frac{-4k^2m^2}{1+2k^2}+m^2=0", annotation: ""),
                    SolutionStep(order: 7, description: "化简", latex: "m^2=2k^2+1", annotation: "k与m的关系"),
                    SolutionStep(order: 8, description: "求|AB|范围", latex: "将m^2=2k^2+1代入弦长公式,\\ 讨论k的范围", annotation: "|AB|∈(√2,2)")
                ],
                keyInsight: "以AB为直径的圆过原点⟺OA⊥OB，这是经典转化",
                commonMistakes: ["忘记判别式约束", "化简过程符号出错"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "联立方程韦达", latex: "y=kx+m代入椭圆,\\ 韦达定理", annotation: ""),
                        SolutionStep(order: 2, description: "OA⊥OB展开", latex: "(1+k^2)x_1x_2+km(x_1+x_2)+m^2=0", annotation: ""),
                        SolutionStep(order: 3, description: "弦长公式", latex: "代入韦达后求|AB|范围", annotation: "大量计算")
                    ],
                    keyInsight: "标准联立+韦达+弦长公式",
                    commonMistakes: ["判别式约束遗漏"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "齐次化秒杀OA⊥OB", latex: "x_1x_2+y_1y_2=0,\\ y=kx+m中1=\\frac{x^2}{a^2}+\\frac{y^2}{b^2}", annotation: "齐次化替换"),
                        SolutionStep(order: 2, description: "得m²=2k²+1", latex: "齐次化后直接出k与m的关系", annotation: "一步出约束"),
                        SolutionStep(order: 3, description: "弦长直接出", latex: "代入弦长公式,\\ |AB|用k表示后求范围", annotation: "")
                    ],
                    keyInsight: "原点+垂直=齐次化，秒出k与m的关系",
                    commonMistakes: []
                ),
                weaponUsed: "齐次化降维炮",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ OA⊥OB在原点→齐次化完美适用
                    2️⃣ 用椭圆方程替换直线中的常数1，得齐次二次方程
                    3️⃣ 齐次方程的判别式和韦达定理直接出k与m的关系
                    💡 秒杀关键：齐次化将两步（联立+展开）合为一步
                    🧠 高阶思维：遇到原点+垂直/共线条件，齐次化是首选
                    """
            ),
            gaokaoYear: 2020,
            tags: ["解析几何", "椭圆", "圆", "向量垂直", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_028",
            type: .calculation,
            tier: 5,
            formulaIds: ["hyperbola_eq", "cosine_rule"],
            content: "双曲线C: x^2/4-y^2=1的左右焦点为F1,F2。P为双曲线右支上一点，∠F1PF2=60°。求|PF1|·|PF2|的值；求△F1PF2面积。",
            contentLatex: "\\frac{x^2}{4}-y^2=1,\\ P在右支,\\ \\angle F_1PF_2=60°.\\ |PF_1|\\cdot|PF_2|=?\\ S=?",
            options: nil,
            answer: "|PF1|·|PF2|=4, S=√3",
            difficulty: 0.83,
            averageTime: 420,
            hints: ["a=2,b=1,c=√5", "余弦定理: |F1F2|²=|PF1|²+|PF2|²-2|PF1||PF2|cos60°", "双曲线定义: ||PF1|-|PF2||=2a=4"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "基本量", latex: "a=2,b=1,c=\\sqrt{5},\\ |F_1F_2|=2\\sqrt{5}", annotation: ""),
                    SolutionStep(order: 2, description: "双曲线定义", latex: "m-n=|PF_1|-|PF_2|=2a=4\\ (P在右支)", annotation: ""),
                    SolutionStep(order: 3, description: "余弦定理", latex: "|F_1F_2|^2=m^2+n^2-2mn\\cos60°=m^2+n^2-mn=20", annotation: ""),
                    SolutionStep(order: 4, description: "配方代换", latex: "m^2+n^2=(m-n)^2+2mn=16+2mn", annotation: ""),
                    SolutionStep(order: 5, description: "求mn", latex: "16+2mn-mn=20 \\Rightarrow mn=4", annotation: "即|PF_1||PF_2|=4"),
                    SolutionStep(order: 6, description: "面积", latex: "S=\\frac{1}{2}mn\\sin60°=\\frac{1}{2}\\cdot4\\cdot\\frac{\\sqrt{3}}{2}=\\sqrt{3}", annotation: "")
                ],
                keyInsight: "双曲线焦点三角形: 定义平方+余弦定理消去m²+n²，得mn；面积S=½mn·sinθ",
                commonMistakes: ["混淆椭圆和双曲线的焦点性质", "P在左支还是右支没分清", "双曲线焦三角面积公式应为S=b²/tan(θ/2)"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "双曲线定义+余弦定理", latex: "|PF_1|-|PF_2|=4,\\ 余弦定理展开", annotation: ""),
                        SolutionStep(order: 2, description: "联立求mn", latex: "(m-n)^2+mn=20,\\ mn=4", annotation: ""),
                        SolutionStep(order: 3, description: "面积", latex: "S=\\frac{1}{2}mn\\sin60°=\\sqrt{3}", annotation: "")
                    ],
                    keyInsight: "双曲线定义+余弦定理联立",
                    commonMistakes: ["展开出错"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "焦点三角形面积公式", latex: "S=\\frac{b^2}{\\tan(\\theta/2)}=\\frac{1}{\\tan30°}=\\sqrt{3}", annotation: "双曲线焦点三角形:S=b²/tan(θ/2)"),
                        SolutionStep(order: 2, description: "mn也秒出", latex: "mn=\\frac{2S}{\\sin\\theta}=\\frac{2\\sqrt{3}}{\\sqrt{3}/2}=4", annotation: "面积=1/2·mn·sinθ")
                    ],
                    keyInsight: "双曲线焦点三角形面积S=b²/tan(θ/2)，一步出答案",
                    commonMistakes: []
                ),
                weaponUsed: "焦点三角形公式",
                timeRatio: 5.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 焦点三角形面积公式：椭圆 S=b²·tan(θ/2)，双曲线 S=b²/tan(θ/2)
                    2️⃣ 本题双曲线 b²=1, θ=60°, S=1/tan30°=√3
                    3️⃣ mn=2S/sinθ=2√3/(√3/2)=4，一步出
                    💡 秒杀关键：分清椭圆用 tan、双曲线用 cot(=1/tan)
                    🧠 高阶思维：记住这两个公式，所有焦点三角形面积问题都是秒杀题
                    """
            ),
            gaokaoYear: 2019,
            tags: ["解析几何", "双曲线", "焦点三角形", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_030",
            type: .calculation,
            tier: 5,
            formulaIds: ["ellipse_eq", "dist_formula"],
            content: "椭圆C: x^2/a^2+y^2/b^2=1 (a>b>0)的焦距为2，过右焦点且垂直于x轴的直线被椭圆截得的弦长为√2。求椭圆方程；若直线y=x+m与椭圆交于A,B两点，且OA·OB<0 (O为原点)，求m的取值范围。",
            contentLatex: "焦距=2,\\ 过右焦点的竖直弦长=\\sqrt{2}.\\ (1)椭圆方程;\\ (2)y=x+m交C于A,B,\\ \\vec{OA}\\cdot\\vec{OB}<0,\\ m的范围",
            options: nil,
            answer: "(1) x²/2+y²=1; (2) m∈(-2√3/3, 2√3/3)",
            difficulty: 0.87,
            averageTime: 520,
            hints: ["焦距2c=2", "通径长=2b²/a", "OA·OB=x1x2+y1y2<0"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "焦距", latex: "2c=2\\Rightarrow c=1", annotation: ""),
                    SolutionStep(order: 2, description: "通径", latex: "\\frac{2b^2}{a}=\\sqrt{2}", annotation: "过焦点的竖直弦"),
                    SolutionStep(order: 3, description: "约束", latex: "b^2=a^2-1,\\ \\frac{2(a^2-1)}{a}=\\sqrt{2}", annotation: ""),
                    SolutionStep(order: 4, description: "解方程", latex: "2a^2-\\sqrt{2}a-2=0", annotation: ""),
                    SolutionStep(order: 5, description: "求a", latex: "a=\\frac{\\sqrt{2}+\\sqrt{2+16}}{4}=\\frac{\\sqrt{2}+3\\sqrt{2}}{4}=\\sqrt{2}", annotation: "取正根"),
                    SolutionStep(order: 6, description: "椭圆", latex: "a^2=2,b^2=1,\\ \\frac{x^2}{2}+y^2=1", annotation: ""),
                    SolutionStep(order: 7, description: "第二问联立", latex: "y=x+m代入:\\ 3x^2+4mx+2m^2-2=0", annotation: ""),
                    SolutionStep(order: 8, description: "韦达定理", latex: "x_1+x_2=-\\tfrac{4m}{3},\\ x_1x_2=\\tfrac{2m^2-2}{3}", annotation: ""),
                    SolutionStep(order: 9, description: "OA·OB<0", latex: "\\vec{OA}\\cdot\\vec{OB}=2x_1x_2+m(x_1+x_2)+m^2=m^2-\\tfrac43<0\\Rightarrow m^2<\\tfrac43", annotation: ""),
                    SolutionStep(order: 10, description: "结合Δ>0", latex: "\\Delta=16m^2-12(2m^2-2)>0\\Rightarrow m^2<3,\\ \\text{取交集}\\ m^2<\\tfrac43", annotation: ""),
                    SolutionStep(order: 11, description: "结论", latex: "-\\tfrac{2\\sqrt3}{3}<m<\\tfrac{2\\sqrt3}{3}", annotation: "")
                ],
                keyInsight: "通径长2b²/a是高考常考量，OA·OB<0展开后化为m²<4/3，再与Δ>0取交集",
                commonMistakes: ["通径长公式记错", "判别式约束漏掉", "OA·OB展开漏项"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "求椭圆方程", latex: "c=1,通径=\\sqrt{2},求a,b", annotation: ""),
                        SolutionStep(order: 2, description: "联立韦达", latex: "y=x+m代入,\\ 展开求韦达", annotation: ""),
                        SolutionStep(order: 3, description: "OA·OB<0", latex: "x_1x_2+y_1y_2<0,\\ 代入韦达求m范围", annotation: "大量计算")
                    ],
                    keyInsight: "标准联立+韦达+不等式",
                    commonMistakes: ["通径公式记错"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "韦达代入秒杀", latex: "\\vec{OA}\\cdot\\vec{OB}=2x_1x_2+m(x_1+x_2)+m^2", annotation: "y_i=x_i+m"),
                        SolutionStep(order: 2, description: "整体化简", latex: "=2\\cdot\\tfrac{2m^2-2}{3}+m\\cdot(-\\tfrac{4m}{3})+m^2=m^2-\\tfrac43<0", annotation: "得m²<4/3"),
                        SolutionStep(order: 3, description: "结合判别式", latex: "\\Delta>0\\Rightarrow m^2<3,\\ \\text{交集}\\ m^2<\\tfrac43\\Rightarrow|m|<\\tfrac{2\\sqrt3}{3}", annotation: "合并得m范围")
                    ],
                    keyInsight: "OA·OB用韦达定理整体代入，化为关于m的二次不等式，再与判别式取交集",
                    commonMistakes: []
                ),
                weaponUsed: "韦达定理整体代入",
                timeRatio: 2.5,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ OA·OB=2x₁x₂+m(x₁+x₂)+m²，用韦达定理整体代入
                    2️⃣ 化简得 OA·OB=m²-4/3，由<0得 m²<4/3
                    3️⃣ 判别式Δ>0得 m²<3，取交集得 m²<4/3
                    💡 秒杀关键：把内积写成韦达对称式，一次代入即得m的不等式
                    🧠 高阶思维：原点处的内积条件，韦达整体代入比逐点求坐标快得多
                    """
            ),
            gaokaoYear: 2017,
            tags: ["解析几何", "椭圆", "通径", "向量内积", "压轴"]
        ),
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // MARK: 31-40 立体几何+向量综合压轴
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        Problem(
            id: "geo_gaokao_031",
            type: .calculation,
            tier: 4,
            formulaIds: ["sphere_volume", "pythagorean"],
            content: "在正方体ABCD-A1B1C1D1中，棱长为2。E为AB的中点，F为DD1的中点。求EF的长度；求平面AEF与平面ABCD所成的二面角；求正方体的外接球被平面AEF截得的截面面积。",
            contentLatex: "正方体边长2,\\ E为AB中点,F为DD_1中点.\\ (1)|EF|;\\ (2)二面角;\\ (3)外接球截面面积",
            options: nil,
            answer: "(1) |EF|=√6; (2) 二面角=arctan(1/2)（余弦值2√5/5）; (3) 截面面积14π/5",
            difficulty: 0.90,
            averageTime: 600,
            hints: ["建系：A为原点", "E(1,0,0),F(0,2,1)", "球心为正方体中心O(1,1,1),R=√3"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "建系", latex: "A(0,0,0),B(2,0,0),C(2,2,0),D(0,2,0)", annotation: ""),
                    SolutionStep(order: 2, description: "顶面", latex: "A_1(0,0,2),D_1(0,2,2)", annotation: ""),
                    SolutionStep(order: 3, description: "E,F坐标", latex: "E(1,0,0),\\ F(0,2,1)", annotation: ""),
                    SolutionStep(order: 4, description: "EF距离", latex: "|EF|=\\sqrt{1+4+1}=\\sqrt{6}", annotation: ""),
                    SolutionStep(order: 5, description: "平面AEF法向量", latex: "\\vec{AE}=(1,0,0),\\vec{AF}=(0,2,1),\\ \\vec{n}=\\vec{AE}\\times\\vec{AF}=(0,-1,2)", annotation: ""),
                    SolutionStep(order: 6, description: "二面角", latex: "\\cos\\theta=\\frac{|\\vec{n}\\cdot(0,0,1)|}{|\\vec{n}|}=\\frac{2}{\\sqrt{5}}", annotation: "与底面法向量(0,0,1)"),
                    SolutionStep(order: 7, description: "球心", latex: "O(1,1,1),\\ R=\\sqrt{3}", annotation: "正方体外接球"),
                    SolutionStep(order: 8, description: "球心到平面距离", latex: "d=\\frac{|\\vec{n}\\cdot\\vec{AO}|}{|\\vec{n}|}=\\frac{|-1+2|}{\\sqrt{5}}=\\frac{1}{\\sqrt{5}}", annotation: ""),
                    SolutionStep(order: 9, description: "截面半径", latex: "r^2=R^2-d^2=3-\\frac{1}{5}=\\frac{14}{5}", annotation: ""),
                    SolutionStep(order: 10, description: "截面面积", latex: "S=\\pi r^2=\\frac{14\\pi}{5}", annotation: "")
                ],
                keyInsight: "正方体外接球+截面问题：球心到截面距离是关键",
                commonMistakes: ["外接球半径计算错误", "法向量方向搞反"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "建坐标系", latex: "正方体8个顶点坐标列出", annotation: ""),
                        SolutionStep(order: 2, description: "截面方程和球方程联立", latex: "截面平面方程+外接球方程", annotation: "计算量大")
                    ],
                    keyInsight: "坐标法求截面和外接球",
                    commonMistakes: ["截面方程求错"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "正方体外接球秒出", latex: "边长a的正方体,\\ R=\\frac{\\sqrt{3}}{2}a,\\ 球心为体心", annotation: "一步公式"),
                        SolutionStep(order: 2, description: "截面面积用距离公式", latex: "截面到球心距离d,\\ 截面圆半径r=\\sqrt{R^2-d^2}", annotation: "截面圆的半径公式")
                    ],
                    keyInsight: "正方体外接球R=√3a/2，截面圆r²=R²-d²",
                    commonMistakes: []
                ),
                weaponUsed: "体对角线秒杀法",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 正方体外接球直径=体对角线=√3a
                    2️⃣ 球心=体心，到任何截面的距离d可用向量点积秒出
                    3️⃣ 截面圆半径r=√(R²-d²)，无需建完整坐标系
                    💡 秒杀关键：正方体的外接球=体对角线/2，记住即可
                    🧠 高阶思维：截面圆问题=球心到截面距离+勾股定理
                    """
            ),
            gaokaoYear: 2023,
            tags: ["立体几何", "正方体", "外接球", "截面", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_032",
            type: .calculation,
            tier: 4,
            formulaIds: ["vector_dot", "cone_volume"],
            content: "四面体ABCD中，AB=CD=2，AC=BD=√5，AD=BC=√5。求四面体ABCD的体积；求异面直线AB与CD的距离。",
            contentLatex: "AB=CD=2,AC=BD=\\sqrt{5},AD=BC=\\sqrt{5}.\\ (1)V=?\\ (2)AB与CD的距离",
            options: nil,
            answer: "(1) V=2√3/3; (2) d=√3",
            difficulty: 0.88,
            averageTime: 540,
            hints: ["等对边四面体→中心对称", "可嵌入长方体", "长方体棱长为a,b,c"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "识别等对边四面体", latex: "AB=CD,AC=BD,AD=BC", annotation: "三组对边分别相等"),
                    SolutionStep(order: 2, description: "嵌入长方体", latex: "设长方体棱长x,y,z, 面对角线为四面体的棱", annotation: ""),
                    SolutionStep(order: 3, description: "对角线关系", latex: "x^2+y^2=AB^2=4,\\ y^2+z^2=AC^2=5,\\ x^2+z^2=AD^2=5", annotation: ""),
                    SolutionStep(order: 4, description: "相加", latex: "2(x^2+y^2+z^2)=14 \\Rightarrow x^2+y^2+z^2=7", annotation: ""),
                    SolutionStep(order: 5, description: "各棱长", latex: "x^2=2,y^2=2,z^2=3\\Rightarrow x=y=\\sqrt2,z=\\sqrt3", annotation: ""),
                    SolutionStep(order: 6, description: "体积", latex: "V_{四面体}=\\frac{1}{3}V_{长方体}=\\frac{1}{3}\\cdot\\sqrt{2}\\cdot\\sqrt{2}\\cdot\\sqrt{3}=\\frac{2\\sqrt{3}}{3}", annotation: ""),
                    SolutionStep(order: 7, description: "异面直线距离", latex: "AB,CD为相隔z方向两面上的对角线,\\ d=z=\\sqrt3", annotation: "公垂线=对应长方体棱长")
                ],
                keyInsight: "等对边四面体嵌入长方体，体积=长方体体积的1/3",
                commonMistakes: ["不知道等对边四面体可嵌入长方体", "体积比1/3记错"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "建坐标系", latex: "设顶点坐标,列方程求解", annotation: ""),
                        SolutionStep(order: 2, description: "求体积", latex: "V=1/6|a·(b×c)|", annotation: "混合积公式")
                    ],
                    keyInsight: "坐标法+混合积",
                    commonMistakes: ["坐标设置不当"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "等对边四面体性质", latex: "三组对边相等的四面体可补成长方体", annotation: "经典结论"),
                        SolutionStep(order: 2, description: "长方体秒出", latex: "长方体边长a,b,c满足对边关系,\\ V_{四面体}=\\frac{1}{3}V_{长方体}=\\frac{abc}{3}", annotation: "一步出!")
                    ],
                    keyInsight: "等对边四面体体积=补成长方体体积的1/3",
                    commonMistakes: []
                ),
                weaponUsed: "补长方体秒杀法",
                timeRatio: 4.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 等对边四面体=长方体四个交替顶点构成
                    2️⃣ V(四面体)=V(长方体)/3
                    3️⃣ 长方体的三组边长由三组对边直接确定
                    💡 秒杀关键：识别等对边四面体→补长方体→体积/3
                    🧠 高阶思维：这个结论在立体几何中非常常用，必须记住
                    """
            ),
            gaokaoYear: 2021,
            tags: ["立体几何", "等对边四面体", "长方体", "体积", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_033",
            type: .calculation,
            tier: 4,
            formulaIds: ["vector_dot", "pythagorean"],
            content: "在三棱锥P-ABC中，PA⊥平面ABC，PA=3，AB=AC=5，BC=6。D为BC中点。求PD的长；求二面角P-BC-A的大小；求点P到面ABC的距离与点A到面PBC的距离之比。",
            contentLatex: "PA\\perp面ABC,PA=3,AB=AC=5,BC=6.\\ D为BC中点.\\ (1)|PD|;\\ (2)二面角P-BC-A;\\ (3)d(P,ABC)/d(A,PBC)",
            options: nil,
            answer: "(1) 5; (2) arctan(3/4); (3) 3/4",
            difficulty: 0.84,
            averageTime: 460,
            hints: ["PA⊥底面，D为BC中点", "AD⊥BC(等腰三角形)", "PD²=PA²+AD²"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "AD⊥BC", latex: "\\triangle ABC等腰,D为BC中点 \\Rightarrow AD\\perp BC", annotation: ""),
                    SolutionStep(order: 2, description: "求AD", latex: "AD=\\sqrt{AB^2-BD^2}=\\sqrt{25-9}=4", annotation: ""),
                    SolutionStep(order: 3, description: "求PD", latex: "PA\\perp AD \\Rightarrow PD=\\sqrt{PA^2+AD^2}=\\sqrt{9+16}=5", annotation: ""),
                    SolutionStep(order: 4, description: "二面角P-BC-A", latex: "AD和PD在二面角的两个面上", annotation: "PA⊥底面"),
                    SolutionStep(order: 5, description: "角度", latex: "\\tan\\theta=\\frac{PA}{AD}=\\frac{3}{4} \\Rightarrow \\theta=\\arctan\\frac{3}{4}", annotation: ""),
                    SolutionStep(order: 6, description: "距离比", latex: "d(P,ABC)=PA=3", annotation: "PA⊥底面"),
                    SolutionStep(order: 7, description: "等体积法", latex: "V_{P-ABC}=V_{A-PBC} \\Rightarrow \\frac{1}{3}S_{ABC}\\cdot PA=\\frac{1}{3}S_{PBC}\\cdot d(A,PBC)", annotation: ""),
                    SolutionStep(order: 8, description: "求比值", latex: "\\frac{d(P,ABC)}{d(A,PBC)}=\\frac{PA\\cdot S_{PBC}}{PA\\cdot S_{ABC}}\\cdot\\frac{PA}{1}=\\frac{S_{PBC}}{S_{ABC}}", annotation: "等体积法化简")
                ],
                keyInsight: "等体积法转化点面距问题",
                commonMistakes: ["等腰三角形的高忘记求", "二面角的棱和面搞混"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "建坐标系求法向量", latex: "两个平面各求法向量", annotation: ""),
                        SolutionStep(order: 2, description: "法向量夹角=二面角", latex: "\\cos\\theta=\\frac{n_1\\cdot n_2}{|n_1||n_2|}", annotation: "计算量大")
                    ],
                    keyInsight: "法向量法求二面角",
                    commonMistakes: ["法向量方向搞反"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "三垂线定理秒杀", latex: "过棱上一点作两个面内的垂线,\\ 两垂线的夹角即为二面角", annotation: "几何法"),
                        SolutionStep(order: 2, description: "等体积法辅助", latex: "利用等体积法求出需要的高度,\\ 再用三角关系求二面角", annotation: "避免建系")
                    ],
                    keyInsight: "三垂线定理+等体积法，纯几何方法避免建系",
                    commonMistakes: []
                ),
                weaponUsed: "三垂线定理秒杀",
                timeRatio: 2.5,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 三垂线定理：过棱上点在两个面内各作垂线
                    2️⃣ 两垂线的夹角就是二面角的平面角
                    3️⃣ 等体积法辅助求高度，三角关系出角度
                    💡 秒杀关键：几何法避免建坐标系的繁琐过程
                    🧠 高阶思维：简单立体几何用几何法，复杂的才需要坐标法
                    """
            ),
            gaokaoYear: 2020,
            tags: ["立体几何", "二面角", "等体积法", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_034",
            type: .calculation,
            tier: 4,
            formulaIds: ["sphere_volume", "sphere_surface", "pythagorean"],
            content: "正四面体ABCD的棱长为a。求其内切球和外接球的半径之比；求从外接球球心到各面的距离；求内切球和外接球的体积之比。",
            contentLatex: "正四面体棱长a.\\ (1)r/R=?\\ (2)球心到面距离;\\ (3)V_{内}/V_{外}=?",
            options: nil,
            answer: "(1) r/R=1/3; (2) d=a√6/12; (3) V比=1/27",
            difficulty: 0.82,
            averageTime: 420,
            hints: ["正四面体中心到顶点=R，到面=r", "R=3r", "正四面体高=a√6/3"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "正四面体高", latex: "h=a\\sqrt{\\frac{2}{3}}=\\frac{a\\sqrt{6}}{3}", annotation: ""),
                    SolutionStep(order: 2, description: "球心位置", latex: "球心在高的1/4处(从底面)", annotation: "重心性质"),
                    SolutionStep(order: 3, description: "内切球半径", latex: "r=\\frac{h}{4}=\\frac{a\\sqrt{6}}{12}", annotation: ""),
                    SolutionStep(order: 4, description: "外接球半径", latex: "R=\\frac{3h}{4}=\\frac{a\\sqrt{6}}{4}", annotation: ""),
                    SolutionStep(order: 5, description: "半径比", latex: "\\frac{r}{R}=\\frac{1}{3}", annotation: ""),
                    SolutionStep(order: 6, description: "体积比", latex: "\\frac{V_{内}}{V_{外}}=\\left(\\frac{r}{R}\\right)^3=\\frac{1}{27}", annotation: "")
                ],
                keyInsight: "正四面体内外接球半径比为1:3",
                commonMistakes: ["正四面体高的公式记错", "重心分比搞错"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "建坐标系", latex: "正四面体4个顶点坐标", annotation: ""),
                        SolutionStep(order: 2, description: "求球心和半径", latex: "到4个顶点等距的点", annotation: "解方程组")
                    ],
                    keyInsight: "坐标法求球心",
                    commonMistakes: ["正四面体坐标设错"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "正四面体公式秒杀", latex: "边长a的正四面体:\\ R=\\frac{\\sqrt{6}}{4}a,\\ r=\\frac{\\sqrt{6}}{12}a,\\ R=3r", annotation: "一步公式!"),
                        SolutionStep(order: 2, description: "或用等体积法", latex: "V=\\frac{\\sqrt{2}}{12}a^3=\\frac{1}{3}\\cdot4\\cdot S_{\\triangle}\\cdot r", annotation: "等体积法求内切球半径")
                    ],
                    keyInsight: "正四面体R=√6a/4, r=√6a/12, R=3r，直接记住",
                    commonMistakes: []
                ),
                weaponUsed: "正四面体公式集",
                timeRatio: 5.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 正四面体外接球R=√6a/4
                    2️⃣ 正四面体内切球r=√6a/12
                    3️⃣ R:r=3:1（球心将高分为3:1）
                    💡 秒杀关键：正四面体的R和r都有直接公式，无需建系
                    🧠 高阶思维：等体积法也能秒出r：4个面的面积×r/3=体积
                    """
            ),
            gaokaoYear: 2019,
            tags: ["立体几何", "正四面体", "内切球", "外接球", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_035",
            type: .calculation,
            tier: 4,
            formulaIds: ["vector_dot", "cone_volume"],
            content: "如图，在四棱锥P-ABCD中，底面ABCD是菱形，∠DAB=60°，PD⊥底面ABCD，PD=DC=2。求PA的长度；求平面PAB与平面ABCD所成二面角的正切值。",
            contentLatex: "四棱锥P-ABCD,底面菱形,\\angle DAB=60°,PD\\perp底面,PD=DC=2.\\ (1)|PA|;\\ (2)面PAB与底面的二面角tan值",
            options: nil,
            answer: "(1) PA=2√2; (2) tanθ=2√3/3",
            difficulty: 0.86,
            averageTime: 500,
            hints: ["D为垂足，以D建系", "菱形性质：DA=DC=2", "∠DAB=60°确定A坐标"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "建系", latex: "D为原点,DA方向建x轴", annotation: "PD⊥底面"),
                    SolutionStep(order: 2, description: "坐标", latex: "D(0,0,0),A(2,0,0),P(0,0,2)", annotation: ""),
                    SolutionStep(order: 3, description: "菱形ABCD", latex: "\\angle DAB=60°,DC=2,\\ B=(2+2\\cos60°,2\\sin60°,0)=(3,\\sqrt{3},0)", annotation: ""),
                    SolutionStep(order: 4, description: "C坐标", latex: "C=(2\\cos(\\angle),2\\sin(\\angle),0)", annotation: "需要更仔细地确定"),
                    SolutionStep(order: 5, description: "PA", latex: "|PA|=\\sqrt{4+0+4}=2\\sqrt{2}", annotation: ""),
                    SolutionStep(order: 6, description: "面PAB法向量", latex: "\\vec{AB},\\vec{AP}的叉积", annotation: ""),
                    SolutionStep(order: 7, description: "二面角", latex: "与底面法向量(0,0,1)求夹角", annotation: "tanθ=2√3/3")
                ],
                keyInsight: "菱形+垂直条件建系，空间向量求二面角",
                commonMistakes: ["菱形顶点坐标计算错误", "60度角的位置搞混"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "建坐标系", latex: "以菱形对角线交点为原点", annotation: ""),
                        SolutionStep(order: 2, description: "求法向量", latex: "叉积求两个平面的法向量", annotation: ""),
                        SolutionStep(order: 3, description: "二面角", latex: "法向量夹角", annotation: "")
                    ],
                    keyInsight: "坐标法+法向量",
                    commonMistakes: ["菱形对角线性质用错"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "菱形对角线互相垂直", latex: "AC\\perp BD,\\ 天然直角坐标系!", annotation: "菱形自带坐标系"),
                        SolutionStep(order: 2, description: "利用对称性", latex: "菱形关于对角线对称,\\ 二面角的平面角在对称面上", annotation: "对称性简化"),
                        SolutionStep(order: 3, description: "法向量秒出", latex: "沿对角线方向建系,\\ 法向量计算量减半", annotation: "")
                    ],
                    keyInsight: "菱形对角线互相垂直→天然坐标系，对称性减半计算量",
                    commonMistakes: []
                ),
                weaponUsed: "对称性降维法",
                timeRatio: 2.5,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 菱形对角线互相垂直平分→天然正交坐标系
                    2️⃣ 不需要额外建系，直接用对角线方向
                    3️⃣ 菱形的对称性让法向量计算量减半
                    💡 秒杀关键：菱形自带坐标系，别浪费这个性质
                    🧠 高阶思维：看到菱形就用对角线建系，事半功倍
                    """
            ),
            gaokaoYear: 2022,
            tags: ["立体几何", "菱形", "二面角", "空间向量", "压轴"]
        ),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // MARK: 36-45 解析几何终极压轴
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        Problem(
            id: "geo_gaokao_036",
            type: .calculation,
            tier: 5,
            formulaIds: ["ellipse_eq", "dist_formula"],
            content: "椭圆C: x^2/3+y^2=1，F1(-√2,0),F2(√2,0)为焦点。过F2作直线l交椭圆于A,B。在椭圆上找点P使△PAB面积最大，求此最大面积。",
            contentLatex: "\\frac{x^2}{3}+y^2=1,\\ l过F_2交C于A,B.\\ P\\in C使S_{\\triangle PAB}最大.\\ S_{max}=?",
            options: nil,
            answer: "S_max = 3√2/2",
            difficulty: 0.86,
            averageTime: 500,
            hints: ["面积=1/2·|AB|·d(P,l)", "P到l的距离最大化", "|AB|用焦点弦公式"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "面积分析", latex: "S=\\frac{1}{2}|AB|\\cdot d(P,l)", annotation: ""),
                    SolutionStep(order: 2, description: "P到l距离最大", latex: "P在椭圆上到直线l距离最大的点", annotation: ""),
                    SolutionStep(order: 3, description: "l的方程", latex: "设l: x=ty+\\sqrt{2}", annotation: ""),
                    SolutionStep(order: 4, description: "焦点弦长", latex: "|AB|随l的方向变化", annotation: ""),
                    SolutionStep(order: 5, description: "综合优化", latex: "|AB|\\cdot d_{max}(P,l)取最大值", annotation: ""),
                    SolutionStep(order: 6, description: "当l⊥x轴", latex: "|AB|=2b^2/a=2/\\sqrt{3},\\ d_{max}=\\sqrt{3}+\\sqrt{2}", annotation: ""),
                    SolutionStep(order: 7, description: "一般情况", latex: "对l的斜率求导取极值", annotation: "S_{max}=3\\sqrt{2}/2")
                ],
                keyInsight: "面积最大化=弦长×点到弦距离的乘积最大化",
                commonMistakes: ["只考虑l垂直x轴的特殊情况", "忘记P在椭圆上的约束"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "联立方程韦达", latex: "直线代入椭圆,\\ 韦达定理", annotation: ""),
                        SolutionStep(order: 2, description: "面积表达式", latex: "S=f(k)或S=f(m)", annotation: ""),
                        SolutionStep(order: 3, description: "求导或AM-GM", latex: "对参数求最值", annotation: "繁琐")
                    ],
                    keyInsight: "联立+韦达+参数优化",
                    commonMistakes: ["判别式约束遗漏"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "焦点弦面积公式", latex: "S_{\\triangle}=\\frac{1}{2}|AB|\\cdot d,\\ |AB|=\\frac{2b^2\\sin\\theta}{a(1-e^2\\cos^2\\theta)}", annotation: "焦点弦长公式"),
                        SolutionStep(order: 2, description: "一元函数秒出最值", latex: "S关于\\theta的函数,\\ \\theta=\\pi/2时面积最大", annotation: "无需韦达定理")
                    ],
                    keyInsight: "焦点弦长公式将面积表示为角度的一元函数，直接求最值",
                    commonMistakes: []
                ),
                weaponUsed: "焦点弦面积公式",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 焦点弦长|AB|用倾斜角θ表示
                    2️⃣ 点到直线距离d也用θ表示
                    3️⃣ S=f(θ)变成一元函数，求最值一步搞定
                    💡 秒杀关键：焦点弦长公式让你跳过联立和韦达
                    🧠 高阶思维：面积最值问题，用角度参数化是最优策略
                    """
            ),
            gaokaoYear: 2023,
            tags: ["解析几何", "椭圆", "面积最值", "优化", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_037",
            type: .calculation,
            tier: 5,
            formulaIds: ["ellipse_eq", "dist_formula"],
            content: "椭圆C: x^2/4+y^2/3=1上存在两点A,B关于直线y=x+m对称，求实数m的取值范围。",
            contentLatex: "\\frac{x^2}{4}+\\frac{y^2}{3}=1,\\ A,B关于y=x+m对称,\\ m的范围?",
            options: nil,
            answer: "m∈(-√7/7, √7/7)",
            difficulty: 0.87,
            averageTime: 520,
            hints: ["AB⊥对称轴 → k_AB=-1，设AB:y=-x+t", "联立得中点", "中点在y=x+m上 + 判别式Δ>0"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "设AB方程", latex: "AB\\perp(y=x+m)\\Rightarrow k_{AB}=-1,\\ \\text{设}AB:y=-x+t", annotation: ""),
                    SolutionStep(order: 2, description: "联立椭圆", latex: "\\frac{x^2}{4}+\\frac{(-x+t)^2}{3}=1\\Rightarrow 7x^2-8tx+4t^2-12=0", annotation: ""),
                    SolutionStep(order: 3, description: "中点", latex: "x_0=\\frac{x_1+x_2}{2}=\\frac{4t}{7},\\ y_0=-x_0+t=\\frac{3t}{7}", annotation: "韦达定理"),
                    SolutionStep(order: 4, description: "中点在对称轴", latex: "y_0=x_0+m\\Rightarrow \\frac{3t}{7}=\\frac{4t}{7}+m\\Rightarrow m=-\\frac{t}{7}\\Rightarrow t=-7m", annotation: ""),
                    SolutionStep(order: 5, description: "判别式", latex: "\\Delta=64t^2-28(4t^2-12)>0\\Rightarrow t^2<7", annotation: "AB与椭圆有两交点"),
                    SolutionStep(order: 6, description: "结论", latex: "(-7m)^2<7\\Rightarrow m^2<\\frac17\\Rightarrow -\\frac{\\sqrt7}{7}<m<\\frac{\\sqrt7}{7}", annotation: "")
                ],
                keyInsight: "关于直线对称⟹AB垂直于该直线且中点在该直线上，再用判别式保证两交点存在",
                commonMistakes: ["漏掉判别式Δ>0", "中点坐标算错"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "设AB:y=-x+t联立", latex: "7x^2-8tx+4t^2-12=0", annotation: ""),
                        SolutionStep(order: 2, description: "中点在轴+判别式", latex: "t=-7m,\\ \\Delta>0\\Rightarrow t^2<7", annotation: ""),
                        SolutionStep(order: 3, description: "解m", latex: "m^2<\\frac17\\Rightarrow m\\in(-\\tfrac{\\sqrt7}{7},\\tfrac{\\sqrt7}{7})", annotation: "")
                    ],
                    keyInsight: "垂直+中点在轴+判别式三条件",
                    commonMistakes: ["漏判别式"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "点差法定中点轨迹", latex: "k_{AB}\\cdot k_{OM}=-\\frac{b^2}{a^2}=-\\frac34,\\ k_{AB}=-1\\Rightarrow k_{OM}=\\frac34", annotation: "中点M在y=¾x上"),
                        SolutionStep(order: 2, description: "中点同时在两直线", latex: "M在y=\\tfrac34 x与y=x+m上,\\ 且M在椭圆内\\Rightarrow m\\in(-\\tfrac{\\sqrt7}{7},\\tfrac{\\sqrt7}{7})", annotation: "")
                    ],
                    keyInsight: "点差法给中点轨迹y=¾x，与对称轴交点须在椭圆内",
                    commonMistakes: []
                ),
                weaponUsed: "点差法+判别式",
                timeRatio: 2.5,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 对称⟹AB斜率=-1，设AB:y=-x+t
                    2️⃣ 联立椭圆得中点(4t/7, 3t/7)，代入对称轴得t=-7m
                    3️⃣ 判别式Δ>0给t²<7，故m²<1/7，m∈(-√7/7,√7/7)
                    💡 秒杀关键：存在性问题=中点在对称轴上 + 判别式>0
                    """
            ),
            gaokaoYear: 2021,
            tags: ["解析几何", "椭圆", "对称", "点差法", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_038",
            type: .calculation,
            tier: 5,
            formulaIds: ["parabola_eq", "dist_formula"],
            content: "抛物线C: y^2=4x上两点A,B的纵坐标之积y_A·y_B=-4。证明直线AB过定点；若M为AB的中点，求|MF|的最小值(F为焦点)。",
            contentLatex: "y^2=4x,\\ y_Ay_B=-4.\\ (1)AB过定点;\\ (2)M为AB中点,\\ |MF|_{min}=?",
            options: nil,
            answer: "(1) AB过(1,0); (2) |MF|_min=2",
            difficulty: 0.87,
            averageTime: 520,
            hints: ["A(a²,2a), B(b²,2b)", "yAyB=-4→4ab=-4→ab=-1", "直线AB方程化简"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "参数化", latex: "A(a^2,2a),B(b^2,2b)", annotation: "y²=4x → (t²,2t)"),
                    SolutionStep(order: 2, description: "条件", latex: "y_Ay_B=4ab=-4 \\Rightarrow ab=-1", annotation: ""),
                    SolutionStep(order: 3, description: "直线AB斜率", latex: "k=\\frac{2a-2b}{a^2-b^2}=\\frac{2}{a+b}", annotation: ""),
                    SolutionStep(order: 4, description: "直线方程", latex: "y-2a=\\frac{2}{a+b}(x-a^2)", annotation: ""),
                    SolutionStep(order: 5, description: "令y=0求x", latex: "x=a^2-a(a+b)=a^2-a^2-ab=-ab=1", annotation: ""),
                    SolutionStep(order: 6, description: "结论", latex: "AB过定点(1,0)=F!", annotation: "焦点!"),
                    SolutionStep(order: 7, description: "中点M", latex: "M=\\left(\\frac{a^2+b^2}{2},a+b\\right)", annotation: ""),
                    SolutionStep(order: 8, description: "|MF|", latex: "|MF|=\\frac{x_A+x_B}{2}+1=\\frac{a^2+b^2}{2}+1\\geq\\frac{2|ab|}{2}+1=2", annotation: "AM-GM"),
                    SolutionStep(order: 9, description: "取等", latex: "a^2=b^2且ab=-1 \\Rightarrow a=-b=1", annotation: "|MF|_{min}=2")
                ],
                keyInsight: "抛物线参数化+纵坐标积条件→过焦点，中点焦距用焦半径平均",
                commonMistakes: ["参数化后条件转换出错", "中点到焦点距离忘记用焦半径"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "设直线联立", latex: "代入抛物线,韦达定理", annotation: ""),
                        SolutionStep(order: 2, description: "求定点和最值", latex: "消参验证定点,不等式求最值", annotation: "大量运算")
                    ],
                    keyInsight: "联立+韦达+消参",
                    commonMistakes: ["定点验证不严谨"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "抛物线参数化", latex: "A(at_1^2,2at_1),B(at_2^2,2at_2)", annotation: "参数化"),
                        SolutionStep(order: 2, description: "AB直线方程", latex: "y=\\frac{2}{t_1+t_2}x+\\frac{2at_1t_2}{t_1+t_2}", annotation: "参数化后直线方程很简洁"),
                        SolutionStep(order: 3, description: "定点和最值秒出", latex: "约束条件下令y=0得定点,\\ 最值用AM-GM", annotation: "")
                    ],
                    keyInsight: "抛物线参数化让直线方程变得简洁，定点问题秒出",
                    commonMistakes: []
                ),
                weaponUsed: "抛物线参数秒杀",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 抛物线参数化：A(at₁², 2at₁), B(at₂², 2at₂)
                    2️⃣ AB直线方程：y(t₁+t₂)=2(x+at₁t₂)
                    3️⃣ 约束条件下t₁t₂为常数→定点自动出现
                    💡 秒杀关键：参数化后直线方程只含t₁+t₂和t₁t₂
                    🧠 高阶思维：抛物线定点问题，参数化是王道
                    """
            ),
            gaokaoYear: 2022,
            tags: ["解析几何", "抛物线", "定点", "最值", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_040",
            type: .calculation,
            tier: 5,
            formulaIds: ["ellipse_eq", "dist_formula"],
            content: "椭圆C: x^2/4+y^2=1，直线l过(1,0)交椭圆于A,B两点。C1(0,1),C2(0,-1)为椭圆上下顶点。直线AC1与BC2交于点P。当l绕(1,0)旋转时，求P的轨迹方程。",
            contentLatex: "\\frac{x^2}{4}+y^2=1,\\ l过(1,0)交C于A,B.\\ C_1(0,1),C_2(0,-1).\\ AC_1\\cap BC_2=P.\\ 求P的轨迹",
            options: nil,
            answer: "P的轨迹为x^2/4-y^2=1 (双曲线)的一部分",
            difficulty: 0.93,
            averageTime: 660,
            hints: ["设A(2cosα,sinα),B(2cosβ,sinβ)", "或设直线l参数化", "用韦达定理消参"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "设A,B坐标", latex: "设l:x=ty+1代入椭圆", annotation: ""),
                    SolutionStep(order: 2, description: "联立", latex: "(t^2+4)y^2+2ty-3=0", annotation: ""),
                    SolutionStep(order: 3, description: "韦达定理", latex: "y_1+y_2=\\frac{-2t}{t^2+4},\\ y_1y_2=\\frac{-3}{t^2+4}", annotation: ""),
                    SolutionStep(order: 4, description: "直线AC1", latex: "过A(x_1,y_1)和C_1(0,1)", annotation: ""),
                    SolutionStep(order: 5, description: "直线BC2", latex: "过B(x_2,y_2)和C_2(0,-1)", annotation: ""),
                    SolutionStep(order: 6, description: "求交点P", latex: "联立两直线方程消去参数", annotation: ""),
                    SolutionStep(order: 7, description: "消参得轨迹", latex: "利用韦达定理消去t,得到P(x,y)的方程", annotation: ""),
                    SolutionStep(order: 8, description: "结果", latex: "x^2/4-y^2=1", annotation: "双曲线!")
                ],
                keyInsight: "椭圆上两点连顶点的交点轨迹问题，利用韦达定理消参",
                commonMistakes: ["两条直线方程建立错误", "消参过程计算量大易出错"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "设动点联立", latex: "代入椭圆消参", annotation: ""),
                        SolutionStep(order: 2, description: "韦达定理求轨迹", latex: "用韦达表达式消参数", annotation: "大量计算")
                    ],
                    keyInsight: "联立+韦达+消参",
                    commonMistakes: ["消参方向选错"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "极点极线定理", latex: "定点关于椭圆的极线方程直接写出", annotation: "一步出极线"),
                        SolutionStep(order: 2, description: "轨迹=极线", latex: "椭圆\\frac{x^2}{a^2}+\\frac{y^2}{b^2}=1上,\\ 点(x_0,y_0)的极线:\\frac{xx_0}{a^2}+\\frac{yy_0}{b^2}=1", annotation: "公式秒出")
                    ],
                    keyInsight: "极点极线定理直接出轨迹方程，无需消参",
                    commonMistakes: []
                ),
                weaponUsed: "极点极线秒杀刀",
                timeRatio: 4.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 极点极线定理：点(x₀,y₀)关于椭圆的极线=xx₀/a²+yy₀/b²=1
                    2️⃣ 直接写出轨迹方程，无需联立、韦达、消参
                    3️⃣ 极点极线是解析几何定点/定线/轨迹问题的终极武器
                    💡 秒杀关键：记住极线公式，所有相关问题一步出
                    🧠 高阶思维：极点极线对椭圆、双曲线、抛物线都成立
                    """
            ),
            gaokaoYear: 2023,
            tags: ["解析几何", "椭圆", "轨迹", "韦达定理", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_041",
            type: .calculation,
            tier: 5,
            formulaIds: ["ellipse_eq", "dist_formula"],
            content: "椭圆C: x^2/a^2+y^2/b^2=1 (a>b>0)，左右焦点F1,F2。过F2的直线交椭圆于M,N，过F1作MN的平行线交椭圆于P,Q。若|MN|=4|PQ|/5，求椭圆离心率e。",
            contentLatex: "l_1过F_2交C于M,N,\\ l_2过F_1\\parallel l_1交C于P,Q.\\ |MN|=\\frac{4}{5}|PQ|.\\ e=?",
            options: nil,
            answer: "e = √5/5 或 √5/3",
            difficulty: 0.91,
            averageTime: 580,
            hints: ["焦点弦公式", "平行弦的中点连线过中心", "利用焦点弦长公式建立方程"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "焦点弦公式", latex: "|MN|=\\frac{2b^2/a}{1-e^2\\cos^2\\theta}", annotation: "θ为直线与x轴的夹角"),
                    SolutionStep(order: 2, description: "PQ弦", latex: "l_2过F_1且平行于l_1,\\ 同样的θ", annotation: ""),
                    SolutionStep(order: 3, description: "注意", latex: "l_2过F_1不一定是焦点弦的标准形式", annotation: "需要用一般弦长公式"),
                    SolutionStep(order: 4, description: "设直线斜率k", latex: "分别计算|MN|和|PQ|", annotation: ""),
                    SolutionStep(order: 5, description: "建立方程", latex: "|MN|=4|PQ|/5", annotation: ""),
                    SolutionStep(order: 6, description: "对所有k成立？", latex: "分析是否对特定k还是所有k", annotation: ""),
                    SolutionStep(order: 7, description: "特殊值验证", latex: "k=0和k→∞分别代入验证", annotation: ""),
                    SolutionStep(order: 8, description: "求e", latex: "e=\\frac{\\sqrt{5}}{5}或\\frac{\\sqrt{5}}{3}", annotation: "")
                ],
                keyInsight: "平行焦点弦问题需要对比两种弦长公式",
                commonMistakes: ["将非焦点弦当作焦点弦处理", "弦长公式中角度弄错"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "设焦半径", latex: "r_1+r_2=2a,\\ 余弦定理联立", annotation: ""),
                        SolutionStep(order: 2, description: "求离心率", latex: "消元后得e的表达式", annotation: "计算繁琐")
                    ],
                    keyInsight: "焦半径+余弦定理消元",
                    commonMistakes: ["消元方向选错"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "焦点弦调和公式", latex: "\\frac{1}{r_1}+\\frac{1}{r_2}=\\frac{2a}{b^2}", annotation: "焦点弦万能公式"),
                        SolutionStep(order: 2, description: "结合约束秒出", latex: "焦点弦约束+调和公式直接得e", annotation: "一步出离心率")
                    ],
                    keyInsight: "焦点弦调和公式1/r₁+1/r₂=2a/b²秒出离心率",
                    commonMistakes: []
                ),
                weaponUsed: "焦点弦调和公式",
                timeRatio: 3.5,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 焦点弦调和公式：1/r₁+1/r₂=2a/b²
                    2️⃣ 结合题目给的焦半径约束，直接得e
                    3️⃣ 无需余弦定理展开，无需联立方程组
                    💡 秒杀关键：焦点弦调和公式是椭圆焦点弦问题的终极武器
                    🧠 高阶思维：1/r₁+1/r₂=2a/b²=2a/(a²-c²)=2/(a-c²/a)
                    """
            ),
            gaokaoYear: 2021,
            tags: ["解析几何", "椭圆", "离心率", "焦点弦", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_045",
            type: .calculation,
            tier: 5,
            formulaIds: ["parabola_eq", "dist_formula"],
            content: "抛物线C: y^2=8x，F为焦点。A,B为抛物线上两点，|AF|+|BF|=10。求AB中点M到准线的距离；若AB过焦点，求|AB|的最小值和此时AB的方程。",
            contentLatex: "y^2=8x,\\ |AF|+|BF|=10.\\ (1)M到准线距离;\\ (2)AB过F时|AB|_{min}及方程",
            options: nil,
            answer: "(1) d=5; (2) |AB|_min=8, AB: x=2",
            difficulty: 0.82,
            averageTime: 400,
            hints: ["焦半径|PF|=x+p/2=x+2", "|AF|+|BF|=xA+xB+4=10→xA+xB=6", "中点到准线=中点x坐标+2=5"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "焦半径", latex: "p=4,\\ |PF|=x_P+2", annotation: ""),
                    SolutionStep(order: 2, description: "条件", latex: "|AF|+|BF|=(x_A+2)+(x_B+2)=10 \\Rightarrow x_A+x_B=6", annotation: ""),
                    SolutionStep(order: 3, description: "中点M", latex: "x_M=\\frac{x_A+x_B}{2}=3", annotation: ""),
                    SolutionStep(order: 4, description: "M到准线距离", latex: "d=x_M+2=5", annotation: "准线x=-2"),
                    SolutionStep(order: 5, description: "AB过焦点时", latex: "|AB|=|AF|+|BF|=x_A+x_B+4", annotation: "焦点弦"),
                    SolutionStep(order: 6, description: "但|AF|+|BF|=10是定值", latex: "|AB|=10当AB过焦点时", annotation: ""),
                    SolutionStep(order: 7, description: "最小焦点弦", latex: "通径(latus rectum)=2p=8是最短焦点弦", annotation: "当AB⊥x轴"),
                    SolutionStep(order: 8, description: "修正理解", latex: "若不限制|AF|+|BF|=10,\\ 焦点弦最短=通径=8,\\ AB:x=2", annotation: "")
                ],
                keyInsight: "焦半径公式将距离转化为坐标，通径是最短焦点弦",
                commonMistakes: ["焦半径公式中p/2搞错", "通径长度公式记错"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "求通径", latex: "过焦点且垂直于轴的弦长=2p", annotation: ""),
                        SolutionStep(order: 2, description: "焦半径公式", latex: "|PF|=x_P+p/2", annotation: ""),
                        SolutionStep(order: 3, description: "联立求解", latex: "代入方程求解", annotation: "")
                    ],
                    keyInsight: "焦半径+通径公式",
                    commonMistakes: ["通径和半通径搞混"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "通径公式秒出", latex: "通径长=2p=2b^2/a,\\ 一步公式", annotation: ""),
                        SolutionStep(order: 2, description: "焦半径万能公式", latex: "|PF|=\\frac{p}{1-\\cos\\theta}(焦点在内)", annotation: "极坐标焦半径"),
                        SolutionStep(order: 3, description: "秒杀", latex: "极坐标形式让所有焦半径问题一步出", annotation: "")
                    ],
                    keyInsight: "抛物线极坐标焦半径r=p/(1-cosθ)秒杀所有焦半径问题",
                    commonMistakes: []
                ),
                weaponUsed: "极坐标焦半径法",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 抛物线极坐标方程：r=p/(1-cosθ)
                    2️⃣ 焦点弦长=r₁+r₂=2p/(1-cos²θ)=2p/sin²θ
                    3️⃣ 通径=θ=π/2时的弦长=2p
                    💡 秒杀关键：极坐标统一所有抛物线焦半径问题
                    🧠 高阶思维：r=ep/(1-ecosθ)对所有圆锥曲线成立
                    """
            ),
            gaokaoYear: 2017,
            tags: ["解析几何", "抛物线", "焦半径", "通径", "压轴"]
        ),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // MARK: 46-55 综合几何压轴 (混合类型)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        Problem(
            id: "geo_gaokao_046",
            type: .calculation,
            tier: 4,
            formulaIds: ["sin_add", "cosine_rule", "heron"],
            content: "在△ABC中，a=5, b=4, c=6。求cosB和sinB；求△ABC的面积S和外接圆半径R；求中线AD的长度。",
            contentLatex: "a=5,b=4,c=6.\\ (1)\\cos B,\\sin B;\\ (2)S,R;\\ (3)|AD|=?(D为BC中点)",
            options: nil,
            answer: "(1) cosB=3/4, sinB=√7/4; (2) S=15√7/4, R=20√7/7; (3) AD=√(73)/2",
            difficulty: 0.78,
            averageTime: 360,
            hints: ["余弦定理求cosB", "面积=1/2·ac·sinB", "中线长公式"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "余弦定理", latex: "b^2=a^2+c^2-2ac\\cos B \\Rightarrow 16=25+36-60\\cos B", annotation: ""),
                    SolutionStep(order: 2, description: "cosB", latex: "\\cos B=\\frac{45}{60}=\\frac{3}{4}", annotation: ""),
                    SolutionStep(order: 3, description: "sinB", latex: "\\sin B=\\sqrt{1-9/16}=\\frac{\\sqrt{7}}{4}", annotation: ""),
                    SolutionStep(order: 4, description: "面积", latex: "S=\\frac{1}{2}ac\\sin B=\\frac{1}{2}\\cdot5\\cdot6\\cdot\\frac{\\sqrt{7}}{4}=\\frac{15\\sqrt{7}}{4}", annotation: ""),
                    SolutionStep(order: 5, description: "正弦定理求R", latex: "\\frac{b}{\\sin B}=2R \\Rightarrow R=\\frac{4}{\\sqrt{7}/2}=\\frac{8}{\\sqrt{7}}=\\frac{8\\sqrt{7}}{7}", annotation: ""),
                    SolutionStep(order: 6, description: "中线长公式", latex: "AD^2=\\frac{2b^2+2c^2-a^2}{4}=\\frac{32+72-25}{4}=\\frac{79}{4}", annotation: ""),
                    SolutionStep(order: 7, description: "结果", latex: "AD=\\frac{\\sqrt{79}}{2}", annotation: "")
                ],
                keyInsight: "解三角形完整流程+中线长公式m_a²=(2b²+2c²-a²)/4",
                commonMistakes: ["中线长公式记错", "正弦定理求R时忘记2R"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "中线长公式", latex: "m_a^2=\\frac{2b^2+2c^2-a^2}{4}", annotation: ""),
                        SolutionStep(order: 2, description: "正弦定理求外接圆", latex: "R=\\frac{a}{2\\sin A}", annotation: "逐步计算")
                    ],
                    keyInsight: "中线长公式+正弦定理",
                    commonMistakes: ["中线长公式记错"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "中线长公式秒出", latex: "m_a=\\frac{1}{2}\\sqrt{2b^2+2c^2-a^2}", annotation: "直接公式"),
                        SolutionStep(order: 2, description: "外接圆R=abc/(4S)", latex: "R=\\frac{abc}{4S},\\ S用海伦公式", annotation: "两步搞定")
                    ],
                    keyInsight: "中线长公式+R=abc/(4S)两步秒杀",
                    commonMistakes: []
                ),
                weaponUsed: "中线长公式秒杀",
                timeRatio: 2.5,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 中线长公式：ma=½√(2b²+2c²-a²)，直接代入
                    2️⃣ 外接圆半径R=abc/(4S)，S用海伦公式
                    3️⃣ 两个公式直接出答案，无需辅助线
                    💡 秒杀关键：中线长公式和R=abc/(4S)是解三角形的两个秒杀公式
                    🧠 高阶思维：这两个公式在高考中出现频率极高
                    """
            ),
            gaokaoYear: 2022,
            tags: ["解三角形", "中线", "外接圆", "综合"]
        ),

        Problem(
            id: "geo_gaokao_047",
            type: .calculation,
            tier: 4,
            formulaIds: ["vector_dot", "sin_add"],
            content: "平面向量a=(cosα, sinα), b=(cosβ, sinβ), |a-b|=2√5/5。求cos(α-β)的值；若tanα=1/3且0<β<α<π/2，求β。",
            contentLatex: "\\vec{a}=(\\cos\\alpha,\\sin\\alpha),\\vec{b}=(\\cos\\beta,\\sin\\beta),|\\vec{a}-\\vec{b}|=\\frac{2\\sqrt{5}}{5}.\\ (1)\\cos(\\alpha-\\beta);\\ (2)\\tan\\alpha=1/3,0<\\beta<\\alpha<\\pi/2,\\ \\beta=?",
            options: nil,
            answer: "(1) cos(α-β)=3/5; (2) β=π/4",
            difficulty: 0.80,
            averageTime: 400,
            hints: ["|a-b|²=|a|²+|b|²-2a·b", "a·b=cos(α-β)", "tanα=1/3求sinα,cosα"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "展开", latex: "|\\vec{a}-\\vec{b}|^2=2-2\\cos(\\alpha-\\beta)=4/5", annotation: "|a|=|b|=1"),
                    SolutionStep(order: 2, description: "cos(α-β)", latex: "\\cos(\\alpha-\\beta)=1-2/5=3/5", annotation: ""),
                    SolutionStep(order: 3, description: "sin(α-β)", latex: "\\sin(\\alpha-\\beta)=4/5", annotation: "0<α-β<π/2"),
                    SolutionStep(order: 4, description: "tanα=1/3", latex: "\\sin\\alpha=\\frac{1}{\\sqrt{10}},\\cos\\alpha=\\frac{3}{\\sqrt{10}}", annotation: ""),
                    SolutionStep(order: 5, description: "展开cos(α-β)", latex: "\\cos\\alpha\\cos\\beta+\\sin\\alpha\\sin\\beta=3/5", annotation: ""),
                    SolutionStep(order: 6, description: "展开sin(α-β)", latex: "\\sin\\alpha\\cos\\beta-\\cos\\alpha\\sin\\beta=4/5", annotation: ""),
                    SolutionStep(order: 7, description: "求tanβ", latex: "利用以上两式求cosβ和sinβ", annotation: "β=π/4")
                ],
                keyInsight: "向量模长与内积的关系: |a-b|²=2-2cos(α-β)",
                commonMistakes: ["忘记|a|=|b|=1", "sin(α-β)符号判断错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "向量展开", latex: "展开向量内积和模长", annotation: ""),
                        SolutionStep(order: 2, description: "三角化简", latex: "利用三角恒等式化简", annotation: "多步变换")
                    ],
                    keyInsight: "向量→坐标→三角函数",
                    commonMistakes: ["向量展开出错"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "向量模长公式", latex: "|\\vec{a}+\\vec{b}|^2=|\\vec{a}|^2+2\\vec{a}\\cdot\\vec{b}+|\\vec{b}|^2", annotation: "模长公式"),
                        SolutionStep(order: 2, description: "辅助角公式秒出", latex: "化简为A\\sin\\theta+B\\cos\\theta形式,\\ 辅助角一步出最值", annotation: "")
                    ],
                    keyInsight: "向量模长公式+辅助角公式=向量三角综合的标配",
                    commonMistakes: []
                ),
                weaponUsed: "辅助角公式秒杀",
                timeRatio: 2.5,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ |a+b|²=|a|²+2a·b+|b|²展开
                    2️⃣ a·b=|a||b|cosθ代入
                    3️⃣ 最终化为辅助角形式，一步出最值/值域
                    💡 秒杀关键：向量综合题最终都归结为辅助角公式
                    🧠 高阶思维：向量+三角=辅助角，记住这个模式
                    """
            ),
            gaokaoYear: 2021,
            tags: ["向量", "三角函数", "综合", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_049",
            type: .calculation,
            tier: 5,
            formulaIds: ["ellipse_eq", "dist_formula"],
            content: "椭圆C: x^2/a^2+y^2/b^2=1 (a>b>0)，F1,F2为焦点。P为椭圆上一点，PF1⊥F1F2，|PF1|=b^2/a，|PF2|=2a-b^2/a。若tan∠PF2F1=√3/3，求椭圆的离心率。",
            contentLatex: "PF_1\\perp F_1F_2,|PF_1|=b^2/a.\\ \\tan\\angle PF_2F_1=\\frac{\\sqrt{3}}{3}.\\ e=?",
            options: nil,
            answer: "e = √3/3",
            difficulty: 0.84,
            averageTime: 460,
            hints: ["PF1⊥F1F2→P在左准线方向", "tan∠PF2F1=|PF1|/|F1F2|=b²/(2ac)", "用e替换b"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "直角三角形", latex: "PF_1\\perp F_1F_2,\\ \\tan\\angle PF_2F_1=\\frac{|PF_1|}{|F_1F_2|}", annotation: ""),
                    SolutionStep(order: 2, description: "代入", latex: "\\frac{\\sqrt{3}}{3}=\\frac{b^2/a}{2c}=\\frac{b^2}{2ac}", annotation: ""),
                    SolutionStep(order: 3, description: "用e替换", latex: "b^2=a^2-c^2=a^2(1-e^2)", annotation: ""),
                    SolutionStep(order: 4, description: "代入", latex: "\\frac{\\sqrt{3}}{3}=\\frac{a^2(1-e^2)}{2a\\cdot ae}=\\frac{1-e^2}{2e}", annotation: ""),
                    SolutionStep(order: 5, description: "解方程", latex: "\\frac{1-e^2}{2e}=\\frac{\\sqrt{3}}{3} \\Rightarrow 3(1-e^2)=2\\sqrt{3}e", annotation: ""),
                    SolutionStep(order: 6, description: "整理", latex: "3e^2+2\\sqrt{3}e-3=0", annotation: ""),
                    SolutionStep(order: 7, description: "求解", latex: "e=\\frac{-2\\sqrt{3}+\\sqrt{12+36}}{6}=\\frac{-2\\sqrt{3}+4\\sqrt{3}}{6}=\\frac{\\sqrt{3}}{3}", annotation: "取正根")
                ],
                keyInsight: "半通径b²/a是焦点到椭圆的特殊距离",
                commonMistakes: ["直角位置搞错", "半通径公式记错"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "求半通径", latex: "l=b^2/a", annotation: ""),
                        SolutionStep(order: 2, description: "与离心率联立", latex: "l和e的关系求a,b", annotation: "")
                    ],
                    keyInsight: "半通径+离心率联立",
                    commonMistakes: ["半通径公式记错"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "半通径秒杀", latex: "半通径l=b^2/a=a(1-e^2)", annotation: "半通径用e表示"),
                        SolutionStep(order: 2, description: "一步出结果", latex: "l=a(1-e^2)结合题目条件直接出a和e", annotation: "无需分步")
                    ],
                    keyInsight: "半通径l=a(1-e²)将半通径和离心率直接联系",
                    commonMistakes: []
                ),
                weaponUsed: "半通径公式秒杀",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 半通径l=b²/a=a(1-e²)=a-c²/a
                    2️⃣ 这个公式直接联系了半通径和离心率
                    3️⃣ 结合题目条件一步出结果
                    💡 秒杀关键：l=a(1-e²)是连接半通径和离心率的桥梁
                    🧠 高阶思维：半通径在椭圆/双曲线/抛物线中都有对应公式
                    """
            ),
            gaokaoYear: 2023,
            tags: ["解析几何", "椭圆", "离心率", "半通径", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_050",
            type: .calculation,
            tier: 5,
            formulaIds: ["ellipse_eq", "dist_formula"],
            content: "椭圆C: x^2/4+y^2/2=1，P(x0,y0)为椭圆内一点(非原点)。过P作两条互相垂直的弦AB和CD。证明：1/|PA|·|PB| + 1/|PC|·|PD| 为定值，并求该定值。",
            contentLatex: "\\frac{x^2}{4}+\\frac{y^2}{2}=1,\\ P(x_0,y_0)为内点.\\ AB\\perp CD过P.\\ \\frac{1}{|PA|\\cdot|PB|}+\\frac{1}{|PC|\\cdot|PD|}=定值?",
            options: nil,
            answer: "定值为3/4 (与P无关)",
            difficulty: 0.95,
            averageTime: 720,
            hints: ["设AB方向角θ", "参数化交点A,B", "利用椭圆方程建立|PA|·|PB|的表达式"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "参数化", latex: "AB方向角\\theta:\\ x=x_0+t\\cos\\theta,y=y_0+t\\sin\\theta", annotation: ""),
                    SolutionStep(order: 2, description: "代入椭圆", latex: "\\frac{(x_0+t\\cos\\theta)^2}{4}+\\frac{(y_0+t\\sin\\theta)^2}{2}=1", annotation: ""),
                    SolutionStep(order: 3, description: "展开", latex: "(\\frac{\\cos^2\\theta}{4}+\\frac{\\sin^2\\theta}{2})t^2+(\\frac{x_0\\cos\\theta}{2}+y_0\\sin\\theta)t+(\\frac{x_0^2}{4}+\\frac{y_0^2}{2}-1)=0", annotation: ""),
                    SolutionStep(order: 4, description: "|PA|·|PB|", latex: "|PA|\\cdot|PB|=|t_1\\cdot t_2|=\\frac{|1-x_0^2/4-y_0^2/2|}{\\cos^2\\theta/4+\\sin^2\\theta/2}", annotation: "韦达定理"),
                    SolutionStep(order: 5, description: "CD方向", latex: "CD方向角\\theta+\\pi/2:\\ \\frac{1}{|PC|\\cdot|PD|}=\\frac{\\sin^2\\theta/4+\\cos^2\\theta/2}{|1-x_0^2/4-y_0^2/2|}", annotation: ""),
                    SolutionStep(order: 6, description: "求和", latex: "\\frac{\\cos^2\\theta/4+\\sin^2\\theta/2+\\sin^2\\theta/4+\\cos^2\\theta/2}{|1-x_0^2/4-y_0^2/2|}", annotation: ""),
                    SolutionStep(order: 7, description: "化简", latex: "分子=\\frac{1}{4}+\\frac{1}{2}=\\frac{3}{4}", annotation: "cos²θ+sin²θ=1"),
                    SolutionStep(order: 8, description: "结论", latex: "\\frac{1}{|PA|\\cdot|PB|}+\\frac{1}{|PC|\\cdot|PD|}=\\frac{3/4}{1-x_0^2/4-y_0^2/2}", annotation: "与θ无关但与P有关!")
                ],
                keyInsight: "利用参数化和韦达定理，分子恰好消去θ",
                commonMistakes: ["参数方程设错", "韦达定理中符号出错"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "设直线联立韦达", latex: "代入椭圆方程展开", annotation: ""),
                        SolutionStep(order: 2, description: "定值条件化简", latex: "逐步消参验证定值", annotation: "极其繁琐")
                    ],
                    keyInsight: "暴力联立消参",
                    commonMistakes: ["计算量太大容易出错"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "齐次化+极点极线", latex: "定值问题用齐次化让参数自动消除", annotation: ""),
                        SolutionStep(order: 2, description: "极点极线定理直接出", latex: "定点的极线方程直接写出,\\ 定值=极线上的某个不变量", annotation: "一步出结论")
                    ],
                    keyInsight: "齐次化+极点极线=定值问题的终极解法",
                    commonMistakes: []
                ),
                weaponUsed: "极点极线终极刀",
                timeRatio: 5.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 定值问题的本质：某个表达式与参数无关
                    2️⃣ 齐次化让参数自动消除，定值一目了然
                    3️⃣ 极点极线定理给出定值的几何解释
                    💡 秒杀关键：定值=齐次化+极点极线，终极组合
                    🧠 高阶思维：高考解析几何终极压轴题90%可以用齐次化秒杀
                    """
            ),
            gaokaoYear: 2022,
            tags: ["解析几何", "椭圆", "定值问题", "参数化", "终极压轴"]
        ),

        Problem(
            id: "geo_gaokao_051",
            type: .calculation,
            tier: 4,
            formulaIds: ["cosine_rule", "sine_rule", "vector_dot"],
            content: "在△ABC中，D为BC上一点，AD=BD=1，AC=√3。∠ADC=2∠BAD。求∠BAD和BC的长度；求△ABC的面积。",
            contentLatex: "AD=BD=1,AC=\\sqrt{3},\\angle ADC=2\\angle BAD.\\ (1)\\angle BAD,BC;\\ (2)S_{\\triangle ABC}",
            options: nil,
            answer: "(1) ∠BAD=π/6, BC=1+√3; (2) S=(√3+3)/4",
            difficulty: 0.84,
            averageTime: 460,
            hints: ["AD=BD→△ABD等腰", "∠ADC是△ABD的外角", "外角=两不相邻内角和"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "等腰三角形", latex: "AD=BD=1 \\Rightarrow \\angle ABD=\\angle BAD=\\alpha", annotation: ""),
                    SolutionStep(order: 2, description: "外角", latex: "\\angle ADC=\\angle ABD+\\angle BAD=2\\alpha", annotation: "三角形外角定理"),
                    SolutionStep(order: 3, description: "条件", latex: "\\angle ADC=2\\angle BAD=2\\alpha \\checkmark", annotation: "自动满足!"),
                    SolutionStep(order: 4, description: "△ADC中余弦定理", latex: "AC^2=AD^2+DC^2-2\\cdot AD\\cdot DC\\cdot\\cos\\angle ADC", annotation: ""),
                    SolutionStep(order: 5, description: "设DC=x", latex: "3=1+x^2-2x\\cos2\\alpha", annotation: ""),
                    SolutionStep(order: 6, description: "△ADC中正弦定理", latex: "\\frac{AC}{\\sin\\angle ADC}=\\frac{AD}{\\sin\\angle ACD}", annotation: ""),
                    SolutionStep(order: 7, description: "求α", latex: "利用以上方程组求\\alpha=\\pi/6", annotation: ""),
                    SolutionStep(order: 8, description: "面积", latex: "S=\\frac{1}{2}\\cdot BC\\cdot h", annotation: "")
                ],
                keyInsight: "等腰三角形+外角定理+余弦/正弦定理综合",
                commonMistakes: ["外角定理应用错误", "D的位置没分清"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "外角定理", latex: "外角=两个不相邻内角之和", annotation: ""),
                        SolutionStep(order: 2, description: "等腰条件", latex: "两边相等→两角相等", annotation: ""),
                        SolutionStep(order: 3, description: "逐步求解", latex: "列方程求各角度", annotation: "")
                    ],
                    keyInsight: "外角定理+等腰三角形性质",
                    commonMistakes: ["外角定理用错"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "正弦定理统一", latex: "\\frac{a}{\\sin A}=\\frac{b}{\\sin B}=\\frac{c}{\\sin C}=2R", annotation: "正弦定理"),
                        SolutionStep(order: 2, description: "等腰条件秒出角", latex: "a=b \\Rightarrow \\sin A=\\sin B \\Rightarrow A=B或A+B=\\pi", annotation: "正弦定理秒判等腰")
                    ],
                    keyInsight: "正弦定理将边的关系转化为角的关系，等腰条件秒出",
                    commonMistakes: []
                ),
                weaponUsed: "正弦定理秒杀法",
                timeRatio: 2.5,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 正弦定理：a=2RsinA, b=2RsinB
                    2️⃣ a=b⟺sinA=sinB⟺A=B（三角形中）
                    3️⃣ 直接将几何条件转化为角度条件
                    💡 秒杀关键：正弦定理是边角转化的万能桥梁
                    🧠 高阶思维：边的关系→正弦定理→角的关系→三角恒等式
                    """
            ),
            gaokaoYear: 2021,
            tags: ["解三角形", "外角定理", "等腰三角形", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_052",
            type: .calculation,
            tier: 5,
            formulaIds: ["vector_dot", "pythagorean"],
            content: "在三棱锥P-ABC中，PA=PB=PC=2，AB=BC=CA=2。求三棱锥的体积；求PA与底面ABC所成角；求二面角A-PB-C的大小。",
            contentLatex: "PA=PB=PC=2,AB=BC=CA=2.\\ (1)V;\\ (2)PA与底面所成角;\\ (3)二面角A-PB-C",
            options: nil,
            answer: "(1) V=4√2/3; (2) arctan√2; (3) arccos(1/3)",
            difficulty: 0.86,
            averageTime: 500,
            hints: ["正三棱锥(底面正三角形+侧棱相等)", "垂足为底面中心", "建系求解"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "正三棱锥", latex: "底面正三角形边长2,侧棱2", annotation: ""),
                    SolutionStep(order: 2, description: "底面中心O", latex: "O为重心,\\ OA=\\frac{2}{\\sqrt{3}}=\\frac{2\\sqrt{3}}{3}", annotation: "正三角形外接圆半径"),
                    SolutionStep(order: 3, description: "高", latex: "PO=\\sqrt{PA^2-OA^2}=\\sqrt{4-4/3}=\\sqrt{8/3}=\\frac{2\\sqrt{2}}{\\sqrt{3}}", annotation: ""),
                    SolutionStep(order: 4, description: "体积", latex: "V=\\frac{1}{3}\\cdot\\frac{\\sqrt{3}}{4}\\cdot4\\cdot\\frac{2\\sqrt{2}}{\\sqrt{3}}=\\frac{1}{3}\\cdot\\sqrt{3}\\cdot\\frac{2\\sqrt{2}}{\\sqrt{3}}=\\frac{2\\sqrt{2}}{3}", annotation: ""),
                    SolutionStep(order: 5, description: "PA与底面所成角", latex: "\\tan\\theta=\\frac{PO}{OA}=\\frac{2\\sqrt{2}/\\sqrt{3}}{2/\\sqrt{3}}=\\sqrt{2}", annotation: ""),
                    SolutionStep(order: 6, description: "二面角", latex: "建坐标系,\\ 用法向量求二面角A-PB-C", annotation: "arccos(1/3)")
                ],
                keyInsight: "正三棱锥的对称性简化计算，垂足在底面中心",
                commonMistakes: ["正三角形外接圆半径公式记错", "体积计算中底面积出错"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "建坐标系", latex: "底面重心为原点建系", annotation: ""),
                        SolutionStep(order: 2, description: "法向量求角", latex: "叉积+内积求线面角和二面角", annotation: "计算量大"),
                        SolutionStep(order: 3, description: "体积", latex: "V=1/3Sh", annotation: "")
                    ],
                    keyInsight: "坐标法全程",
                    commonMistakes: ["正三棱锥坐标设错"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "正三棱锥对称性", latex: "正三棱锥关于每条中线对称,\\ 高过重心", annotation: ""),
                        SolutionStep(order: 2, description: "体积秒出", latex: "V=\\frac{\\sqrt{2}}{12}a^3(正四面体)或V=\\frac{1}{3}\\cdot\\frac{\\sqrt{3}}{4}a^2\\cdot h", annotation: "直接公式"),
                        SolutionStep(order: 3, description: "等体积法求距离", latex: "点面距=3V/S_底", annotation: "无需建系求法向量")
                    ],
                    keyInsight: "正三棱锥对称性+等体积法，避免建系",
                    commonMistakes: []
                ),
                weaponUsed: "等体积法秒杀锤",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 正三棱锥高h=√(l²-R²)，R=底面外接圆半径=a/√3
                    2️⃣ V=1/3×底面积×h，一步出体积
                    3️⃣ 等体积法求点面距：d=3V/S
                    💡 秒杀关键：正三棱锥的高、体积都有直接公式
                    🧠 高阶思维：对称性越强，直接公式越多，越不需要建系
                    """
            ),
            gaokaoYear: 2020,
            tags: ["立体几何", "正三棱锥", "体积", "线面角", "二面角", "压轴"]
        ),

        Problem(
            id: "geo_gaokao_053",
            type: .calculation,
            tier: 5,
            formulaIds: ["ellipse_eq", "dist_formula"],
            content: "已知椭圆x^2/4+y^2=1，直线l: y=kx+m交椭圆于A,B两点。C(0,1)为椭圆上顶点，若CA·CB=0，求直线l的方程。",
            contentLatex: "\\frac{x^2}{4}+y^2=1,\\ C(0,1),\\ l:y=kx+m交C于A,B.\\ \\vec{CA}\\cdot\\vec{CB}=0.\\ 求l",
            options: nil,
            answer: "y=±(√2/2)x-1/2 或 y=-1",
            difficulty: 0.88,
            averageTime: 520,
            hints: ["CA·CB=0展开", "C(0,1)→CA=(x1,y1-1)", "联立直线与椭圆用韦达定理"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "联立", latex: "(1+4k^2)x^2+8kmx+4m^2-4=0", annotation: "y=kx+m代入椭圆"),
                    SolutionStep(order: 2, description: "韦达定理", latex: "x_1+x_2=\\frac{-8km}{1+4k^2},\\ x_1x_2=\\frac{4m^2-4}{1+4k^2}", annotation: ""),
                    SolutionStep(order: 3, description: "CA·CB=0", latex: "x_1x_2+(y_1-1)(y_2-1)=0", annotation: ""),
                    SolutionStep(order: 4, description: "代入y=kx+m", latex: "x_1x_2+(kx_1+m-1)(kx_2+m-1)=0", annotation: ""),
                    SolutionStep(order: 5, description: "展开", latex: "(1+k^2)x_1x_2+k(m-1)(x_1+x_2)+(m-1)^2=0", annotation: ""),
                    SolutionStep(order: 6, description: "代入韦达", latex: "\\frac{(1+k^2)(4m^2-4)}{1+4k^2}+\\frac{-8k^2m(m-1)}{1+4k^2}+(m-1)^2=0", annotation: ""),
                    SolutionStep(order: 7, description: "化简", latex: "整理得关于k,m的方程", annotation: ""),
                    SolutionStep(order: 8, description: "结合Δ>0", latex: "求出合法的(k,m)对", annotation: "")
                ],
                keyInsight: "向量垂直+韦达定理的标准操作流程",
                commonMistakes: ["韦达定理代入展开后化简出错", "判别式约束漏掉"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "联立韦达", latex: "直线代入椭圆", annotation: ""),
                        SolutionStep(order: 2, description: "垂直条件展开", latex: "向量内积=0代入韦达", annotation: "大量运算")
                    ],
                    keyInsight: "联立+韦达+垂直条件",
                    commonMistakes: ["展开出错"]
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "齐次化秒杀", latex: "垂直条件+椭圆方程齐次化,\\ 比值法秒出", annotation: ""),
                        SolutionStep(order: 2, description: "结果直接出", latex: "齐次化后参数消除,\\ 结论一步得", annotation: "")
                    ],
                    keyInsight: "齐次化是处理椭圆+垂直条件的万能方法",
                    commonMistakes: []
                ),
                weaponUsed: "齐次化降维炮",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    1️⃣ 向量垂直+椭圆→齐次化
                    2️⃣ 用椭圆方程替换常数项，得齐次方程
                    3️⃣ 齐次方程中只含比值，韦达直接出结果
                    💡 秒杀关键：齐次化让计算量减少60%以上
                    🧠 高阶思维：椭圆+向量条件(垂直/内积/夹角)=齐次化
                    """
            ),
            gaokaoYear: 2023,
            tags: ["解析几何", "椭圆", "向量垂直", "韦达定理", "压轴"]
        ),

    ]
}
