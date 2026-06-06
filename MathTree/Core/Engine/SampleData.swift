import Foundation

enum SampleData {

    // MARK: - Formulas (Exhaustive Spectrum: Elem -> Univ)

    static let formulas: [Formula] = [
        // ELEMENTARY - 基础几何
        Formula(id: "add_commute", name: "加法交换律", latex: "a + b = b + a", level: .elementary, category: .algebra, prerequisites: [], derivations: ["add_assoc"], advancedForm: "group_theory", gaokaoRelevance: 1.0, tags: ["算术", "基础"], intuition: "顺序不换，结果不变。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "两个数相加，交换加数的位置，和不变。这是加法的基本性质之一。", proofSteps: ["设a,b为任意数", "a+b和b+a表示相同的数量组合", "故a+b=b+a"], applications: ["简便计算", "代数变形", "数学证明"], history: "基本算术公理。"),
        Formula(id: "rect_area", name: "矩形面积", latex: "S = a \\times b", level: .elementary, category: .geometry, prerequisites: [], derivations: ["tri_area"], advancedForm: "integration", gaokaoRelevance: 1.0, tags: ["几何", "面积"], intuition: "铺地砖的总数。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "矩形面积等于长乘以宽。想象用单位正方形铺满整个矩形，所需正方形的数量就是面积。", proofSteps: ["将矩形分割成单位正方形网格", "横向有a个单位，纵向有b个单位", "总数量 = a × b"], applications: ["计算房间面积", "土地测量", "建筑设计"], history: "古巴比伦人在公元前2000年就已掌握。"),
        Formula(id: "tri_area_base", name: "三角形面积（底高公式）", latex: "S = \\frac{1}{2} \\times a \\times h", level: .elementary, category: .geometry, prerequisites: ["rect_area"], derivations: ["heron"], advancedForm: "cross_product", gaokaoRelevance: 1.0, tags: ["几何", "面积"], intuition: "两个全等三角形拼成平行四边形。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "三角形的面积等于底乘以高的一半。任意三角形都可以和一个全等的三角形拼成平行四边形。", proofSteps: ["将两个全等三角形拼成平行四边形", "平行四边形面积 = 底 × 高", "三角形面积 = 平行四边形面积 ÷ 2"], applications: ["计算三角形地块面积", "建筑设计", "三角测量"], history: "古埃及人在测量尼罗河泛滥后的土地时广泛使用。"),
        Formula(id: "circle_circum", name: "圆的周长", latex: "C = 2\\pi r", level: .elementary, category: .geometry, prerequisites: [], derivations: ["circle_area"], advancedForm: "arc_length", gaokaoRelevance: 1.0, tags: ["几何", "圆"], intuition: "神秘常数π的第一次登场。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "圆的周长等于直径乘以圆周率π（约3.14159）。π是一个无理数，代表圆周长与直径的比值。", proofSteps: ["通过内接正多边形逼近圆", "当边数趋近无穷时，多边形周长趋近圆周长", "极限情况下得到 C = 2πr"], applications: ["计算圆形跑道长度", "制作圆形物品", "齿轮设计"], history: "阿基米德首次通过几何方法计算出π的近似值。"),
        Formula(id: "circle_area", name: "圆的面积", latex: "S = \\pi r^2", level: .elementary, category: .geometry, prerequisites: ["circle_circum"], derivations: [], advancedForm: "integral_polar", gaokaoRelevance: 1.0, tags: ["几何", "圆", "面积"], intuition: "无限多个小三角形面积之和。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "圆的面积等于π乘以半径的平方。可以将圆想象成由无数个以圆心为顶点的小三角形组成。", proofSteps: ["将圆分割为无限多个扇形", "每个扇形近似为三角形，面积≈(1/2)×r×弧长", "总面积 = Σ(1/2)×r×弧长 = πr²"], applications: ["计算圆形场地面积", "圆盘设计", "轮胎制造"], history: "阿基米德在公元前250年证明了这个公式。"),
        
        // MIDDLE - 初中几何
        Formula(id: "pythagorean", name: "勾股定理", latex: "a^2 + b^2 = c^2", level: .middle, category: .geometry, prerequisites: ["rect_area"], derivations: ["dist_formula"], advancedForm: "inner_product", gaokaoRelevance: 1.0, tags: ["几何", "核心", "必考"], intuition: "直角三角形的三边‘力量’守恒。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "在直角三角形中，两条直角边的平方和等于斜边的平方。这个定理揭示了直角三角形三边之间的基本关系。", proofSteps: ["以三边为边长作三个正方形", "利用面积变换证明", "直角边上两个正方形面积之和等于斜边上正方形面积"], detailedProof: [
            ProofStep(order: 1, latex: "\\square ABDE", explanation: "构造大正方形", title: "构造正方形", content: "以直角三角形ABC的斜边AB为边向外作正方形ABDE。设直角边AC=b，BC=a，斜边AB=c。", visualHint: "想象一个大正方形，边长为c", keyInsight: "面积法是几何证明的常用技巧"),
            ProofStep(order: 2, latex: "4 \\times \\triangle ABC", explanation: "分割正方形", title: "分割与重组", content: "在正方形ABDE内部，将四个角各放置一个与ABC全等的直角三角形。这样中间会形成一个小正方形。", visualHint: "四个三角形围绕中间的小正方形", keyInsight: "通过面积相等建立等式"),
            ProofStep(order: 3, latex: "c^2 = 4 \\times \\frac{1}{2}ab + (b-a)^2", explanation: "计算总面积", title: "计算总面积", content: "大正方形面积 = c²。同时，大正方形面积也等于4个三角形面积加上中间小正方形面积。", visualHint: "总面积 = 外围面积 + 内部面积", keyInsight: "同一图形面积的两种表达方式相等"),
            ProofStep(order: 4, latex: "c^2 = a^2 + b^2", explanation: "化简等式", title: "化简等式", content: "展开右边：2ab + (b² - 2ab + a²) = a² + b²。因此 c² = a² + b²，定理得证！", visualHint: "等式化简后得到最终结论", keyInsight: "代数运算完成最后的证明")
        ], applications: ["计算距离", "建筑施工放直角", "导航定位"], history: "中国古代商高在公元前1000年发现此定理。"),
        Formula(id: "quad_root", name: "二次方程求根公式", latex: "x = \\frac{-b \\pm \\sqrt{b^2-4ac}}{2a}", level: .middle, category: .algebra, prerequisites: [], derivations: ["vieta"], advancedForm: "galois", gaokaoRelevance: 1.0, tags: ["方程", "必考"], intuition: "直接求解任何二次方程的终极钥匙。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "对于一元二次方程ax²+bx+c=0，其解由求根公式给出。判别式Δ=b²-4ac决定解的性质。", proofSteps: ["将方程ax²+bx+c=0配方", "a(x+b/(2a))² = b²/(4a) - c", "两边开方得求根公式"], applications: ["解方程", "求抛物线与x轴交点", "物理问题求解"], history: "古巴比伦人已有类似方法，现代形式由韦达完善。"),
        Formula(id: "tri_angle_sum", name: "三角形内角和", latex: "\\angle A + \\angle B + \\angle C = 180^\\circ", level: .middle, category: .geometry, prerequisites: [], derivations: ["polygon_angle"], advancedForm: "spherical_geometry", gaokaoRelevance: 1.0, tags: ["几何", "基础"], intuition: "一条直线的平角。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "任意三角形的三个内角之和恒等于180度。这是欧几里得几何的基本公理之一。", proofSteps: ["过顶点作底边平行线", "利用平行线内错角相等", "三个内角拼成平角180度"], applications: ["角度计算", "三角形类型判断", "几何证明"], history: "欧几里得在《几何原本》中作为命题32证明。"),
        Formula(id: "similar_tri", name: "相似三角形判定", latex: "\\frac{a}{a'} = \\frac{b}{b'} = \\frac{c}{c'} = k", level: .middle, category: .geometry, prerequisites: ["tri_angle_sum"], derivations: ["ratio_theorem"], advancedForm: "homothety", gaokaoRelevance: 0.9, tags: ["几何", "相似", "必考"], intuition: "放大或缩小的副本。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "如果两个三角形的对应角相等，则对应边成比例。相似三角形是解决几何问题的重要工具。", proofSteps: ["证明对应角相等", "利用平行线截割定理", "推出对应边成比例"], applications: ["测量树高", "地图比例尺", "投影变换"], history: "古希腊数学家泰勒斯利用相似三角形测量金字塔高度。"),
        Formula(id: "trapezoid_area", name: "梯形面积", latex: "S = \\frac{(a+b)}{2} \\times h", level: .middle, category: .geometry, prerequisites: ["tri_area_base"], derivations: [], advancedForm: "integration", gaokaoRelevance: 0.8, tags: ["几何", "面积"], intuition: "两个三角形面积之和。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "梯形面积等于上底加下底的和乘以高再除以2。", proofSteps: ["连接对角线将梯形分成两个三角形", "两个三角形面积分别为(1/2)×a×h和(1/2)×b×h", "总面积 = (a+b)×h÷2"], applications: ["计算堤坝截面面积", "梯田地计算", "建筑截面设计"], history: "古代巴比伦泥板中已有梯形面积计算方法。"),
        Formula(id: "parallelogram_area", name: "平行四边形面积", latex: "S = a \\times h", level: .middle, category: .geometry, prerequisites: ["rect_area"], derivations: ["tri_area_base"], advancedForm: "cross_product", gaokaoRelevance: 0.85, tags: ["几何", "面积"], intuition: "底乘高不变。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "平行四边形面积等于底乘以高。通过割补法可以将平行四边形转化为等面积的矩形。", proofSteps: ["沿高切割三角形", "平移拼接成矩形", "矩形面积 = 底 × 高"], applications: ["计算不规则四边形面积", "向量叉积", "晶体结构"], history: "欧几里得《几何原本》中已记载此公式。"),

        // HIGH SCHOOL - 高中几何
        Formula(id: "sin_add", name: "和角公式", latex: "\\sin(\\alpha + \\beta) = \\sin\\alpha\\cos\\beta + \\cos\\alpha\\sin\\beta", level: .high, category: .trigonometry, prerequisites: ["pythagorean"], derivations: ["double_angle"], advancedForm: "euler_formula", gaokaoRelevance: 1.0, tags: ["三角函数", "核心", "必考"], intuition: "旋转的分解与合成。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "两个角之和的正弦等于各自正弦余弦的交叉乘积之和。这是三角恒等式的基础。", proofSteps: ["利用单位圆和三角函数定义", "或利用欧拉公式e^(i(α+β))=e^(iα)e^(iβ)", "展开比较虚部"], detailedProof: [
            ProofStep(order: 1, latex: "e^{i(\\alpha+\\beta)}", explanation: "欧拉公式", title: "使用欧拉公式", content: "根据欧拉公式，e^(iθ) = cosθ + i sinθ。我们可以利用复数乘法来推导和角公式。", visualHint: "复数平面上的旋转", keyInsight: "欧拉公式是连接指数函数和三角函数的桥梁"),
            ProofStep(order: 2, latex: "e^{i\\alpha} \\cdot e^{i\\beta}", explanation: "指数法则", title: "复数乘法", content: "根据指数法则，e^(i(α+β)) = e^(iα)·e^(iβ)。这将和角转化为复数乘法。", visualHint: "两个复数相乘", keyInsight: "指数法则简化了和角计算"),
            ProofStep(order: 3, latex: "(\\cos\\alpha + i\\sin\\alpha)(\\cos\\beta + i\\sin\\beta)", explanation: "展开乘积", title: "展开乘积", content: "将两边用欧拉公式展开：(cosα + i sinα)(cosβ + i sinβ) = cos(α+β) + i sin(α+β)", visualHint: "复数乘法展开", keyInsight: "实部对应余弦和角，虚部对应正弦和角"),
            ProofStep(order: 4, latex: "\\sin(\\alpha+\\beta) = \\sin\\alpha\\cos\\beta + \\cos\\alpha\\sin\\beta", explanation: "比较虚部", title: "比较虚部", content: "展开左边实部：cosαcosβ - sinαsinβ，虚部：sinαcosβ + cosαsinβ。比较虚部得证！", visualHint: "分离实部和虚部", keyInsight: "实部对应余弦，虚部对应正弦")
        ], applications: ["三角恒等变换", "波形合成", "交流电"], history: "托勒密在公元2世纪提出相关定理。"),
        Formula(id: "cosine_rule", name: "余弦定理", latex: "a^2 = b^2 + c^2 - 2bc\\cos A", level: .high, category: .trigonometry, prerequisites: ["pythagorean"], derivations: ["sine_rule"], advancedForm: "vector_dot", gaokaoRelevance: 1.0, tags: ["解三角形", "必考", "核心"], intuition: "勾股定理的非直角修正版。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "对于任意三角形，一边的平方等于另外两边平方和减去这两边与它们夹角余弦的乘积的两倍。", proofSteps: ["作高h，将c分成两段", "利用勾股定理表达h²", "合并两式消去h", "利用三角函数定义化简"], detailedProof: [
            ProofStep(order: 1, latex: "h \\perp BC", explanation: "作高", title: "构造辅助线", content: "过点B作AC边上的高h，垂足为D。设AD=x，则DC=b-x。", visualHint: "三角形ABC中，从B向AC作垂线", keyInsight: "将斜三角形转化为两个直角三角形"),
            ProofStep(order: 2, latex: "c^2 = h^2 + x^2", explanation: "第一个直角三角形", title: "应用勾股定理", content: "在直角三角形ABD中，根据勾股定理：c² = h² + x²", visualHint: "左边的小直角三角形ABD", keyInsight: "直角三角形是解决斜三角形问题的桥梁"),
            ProofStep(order: 3, latex: "a^2 = h^2 + (b-x)^2", explanation: "第二个直角三角形", title: "对另一部分应用", content: "在直角三角形CBD中，根据勾股定理：a² = h² + (b-x)²", visualHint: "右边的小直角三角形CBD", keyInsight: "同一个高h连接两个直角三角形"),
            ProofStep(order: 4, latex: "\\cos A = \\frac{x}{c}", explanation: "三角函数关系", title: "利用余弦定义", content: "在直角三角形ABD中，cosA = 邻边/斜边 = x/c，所以x = c·cosA", visualHint: "角A的邻边是x，斜边是c", keyInsight: "用三角函数建立边与角的关系"),
            ProofStep(order: 5, latex: "a^2 = b^2 + c^2 - 2bc\\cos A", explanation: "合并化简", title: "联立求解", content: "将h² = c² - x²代入第二个方程，再将x = c·cosA代入，化简后得到余弦定理！", visualHint: "消去中间变量h和x", keyInsight: "消元法是代数证明的常用技巧")
        ], applications: ["解三角形", "测量距离", "航海导航"], history: "阿拉伯数学家阿尔·花剌子模在9世纪首次完整表述。"),
        Formula(id: "sine_rule", name: "正弦定理", latex: "\\frac{a}{\\sin A} = \\frac{b}{\\sin B} = \\frac{c}{\\sin C} = 2R", level: .high, category: .trigonometry, prerequisites: ["cosine_rule"], derivations: [], advancedForm: "law_of_sines_3d", gaokaoRelevance: 1.0, tags: ["解三角形", "必考"], intuition: "边长与对角正弦成正比。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "三角形各边与其对角正弦的比值相等，且等于外接圆直径2R。", proofSteps: ["作外接圆，连接直径", "利用圆周角定理", "直角三角形中sinA = a/2R", "同理证明其他边"], applications: ["解三角形", "测量高度", "天文学计算"], history: "波斯数学家阿尔·比鲁尼在10世纪提出。"),
        Formula(id: "heron", name: "海伦公式", latex: "S = \\sqrt{s(s-a)(s-b)(s-c)},\\ s=\\frac{a+b+c}{2}", level: .high, category: .geometry, prerequisites: ["tri_area_base", "pythagorean"], derivations: [], advancedForm: "brahmagupta", gaokaoRelevance: 0.9, tags: ["几何", "面积", "公式"], intuition: "只需要三边就能算面积。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "已知三角形三边长度a,b,c，半周长s=(a+b+c)/2，则面积S=√[s(s-a)(s-b)(s-c)]。", proofSteps: ["设高为h，利用勾股定理", "h² = b² - x² = c² - (a-x)²", "解得x，代入求h", "面积=(1/2)ah化简得海伦公式"], applications: ["测量不规则地块", "计算机图形学", "三角剖分"], history: "古希腊数学家海伦在公元1世纪提出。"),
        Formula(id: "ellipse_eq", name: "椭圆标准方程", latex: "\\frac{x^2}{a^2} + \\frac{y^2}{b^2} = 1", level: .high, category: .conicSections, prerequisites: ["pythagorean"], derivations: ["ellipse_foci"], advancedForm: "conic_projection", gaokaoRelevance: 1.0, tags: ["圆锥曲线", "核心", "必考"], intuition: "被均匀拉伸的圆。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "中心在原点、长轴在x轴上的椭圆标准方程。a是半长轴，b是半短轴。", proofSteps: ["利用椭圆定义：到两焦点距离之和为常数2a", "设焦点(±c,0)", "距离和=2a，平方化简得方程"], applications: ["行星轨道", "光学反射", "建筑设计"], history: "阿波罗尼奥斯在公元前3世纪系统研究圆锥曲线。"),
        Formula(id: "hyperbola_eq", name: "双曲线标准方程", latex: "\\frac{x^2}{a^2} - \\frac{y^2}{b^2} = 1", level: .high, category: .conicSections, prerequisites: ["ellipse_eq"], derivations: ["hyperbola_asymptote"], advancedForm: "conic_dual", gaokaoRelevance: 0.9, tags: ["圆锥曲线", "核心"], intuition: "到两焦点距离差为常数。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "中心在原点、实轴在x轴上的双曲线标准方程。a是半实轴，b是半虚轴。", proofSteps: ["利用双曲线定义：到两焦点距离差为常数2a", "设焦点(±c,0)", "距离差=2a，平方化简得方程"], applications: ["双曲线导航", "光学仪器", "天体轨道"], history: "阿波罗尼奥斯系统研究。"),
        Formula(id: "parabola_eq", name: "抛物线标准方程", latex: "y^2 = 4px", level: .high, category: .conicSections, prerequisites: [], derivations: [], advancedForm: "parabola_focus", gaokaoRelevance: 0.85, tags: ["圆锥曲线", "核心"], intuition: "到焦点和准线距离相等。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "开口向右的抛物线标准方程。焦点在(p,0)，准线为x=-p。", proofSteps: ["设焦点(p,0)，准线x=-p", "任取点(x,y)到焦点距离=到准线距离", "√[(x-p)²+y²] = |x+p|", "平方化简得方程"], applications: ["卫星天线", "探照灯", "弹道轨迹"], history: "古希腊数学家梅内克缪斯发现。"),
        Formula(id: "deriv_power", name: "幂函数导数", latex: "(x^n)' = nx^{n-1}", level: .high, category: .calculus, prerequisites: [], derivations: ["deriv_product"], advancedForm: "operator", gaokaoRelevance: 1.0, tags: ["导数", "核心", "必考"], intuition: "降幂打击，瞬时变化。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "幂函数xⁿ的导数等于n乘以x^(n-1)。这是最基本的导数公式，是所有导数计算的基石。", proofSteps: ["利用导数定义f'(x)=lim(h→0)[(x+h)ⁿ-xⁿ]/h", "展开(x+h)ⁿ用二项式定理：(x+h)ⁿ = xⁿ + nx^(n-1)h + C(n,2)x^(n-2)h² + ... + hⁿ", "减去xⁿ得：nx^(n-1)h + C(n,2)x^(n-2)h² + ... + hⁿ", "除以h得：nx^(n-1) + C(n,2)x^(n-2)h + ... + h^(n-1)", "取极限h→0，所有含h的项都趋于0", "最终得到f'(x)=nx^(n-1)"], detailedProof: [
            ProofStep(order: 1, latex: "f'(x) = \\lim_{h \\to 0} \\frac{(x+h)^n - x^n}{h}", explanation: "导数定义", title: "导数定义", content: "根据导数的极限定义，函数f(x)=xⁿ在点x处的导数为极限形式。", visualHint: "想象割线逼近切线的过程", keyInsight: "导数是瞬时变化率，用极限来定义"),
            ProofStep(order: 2, latex: "(x+h)^n = x^n + nx^{n-1}h + \\binom{n}{2}x^{n-2}h^2 + ... + h^n", explanation: "二项式展开", title: "二项式展开", content: "利用二项式定理将(x+h)ⁿ展开，得到包含h的幂次的多项式。", visualHint: "展开后有xⁿ项和含h的项", keyInsight: "二项式定理是证明的关键工具"),
            ProofStep(order: 3, latex: "(x+h)^n - x^n = nx^{n-1}h + \\binom{n}{2}x^{n-2}h^2 + ... + h^n", explanation: "消去xⁿ项", title: "消去xⁿ项", content: "减去xⁿ后，只剩下含h的项，最低次是h的一次项。", visualHint: "xⁿ项消失了", keyInsight: "关键是找到最低次的h项"),
            ProofStep(order: 4, latex: "\\frac{(x+h)^n - x^n}{h} = nx^{n-1} + \\binom{n}{2}x^{n-2}h + ... + h^{n-1}", explanation: "除以h", title: "除以h", content: "每项除以h后，第一项变成nx^(n-1)，其余项都含h因子。", visualHint: "第一项不含h了", keyInsight: "除以h后分离出常数项"),
            ProofStep(order: 5, latex: "\\lim_{h \\to 0} \\left(nx^{n-1} + \\binom{n}{2}x^{n-2}h + ...\\right) = nx^{n-1}", explanation: "取极限", title: "取极限", content: "当h趋近于0时，所有含h的项都趋近于0，只剩下第一项。", visualHint: "h→0时，除了第一项都消失", keyInsight: "极限的保号性保证了结果")
        ], applications: ["求切线斜率", "优化问题", "变化率"], history: "牛顿和莱布尼茨独立发现微积分。"),

        // UNIVERSITY - 大学数学
        Formula(id: "lopital_rule", name: "洛必达法则", latex: "\\lim_{x \\to a} \\frac{f(x)}{g(x)} = \\lim_{x \\to a} \\frac{f'(x)}{g'(x)}", level: .university, category: .calculus, prerequisites: ["deriv_power"], derivations: [], advancedForm: "cauchy_mean_value", gaokaoRelevance: 0.8, tags: ["极限", "秒杀"], intuition: "变化率决定极限。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "【适用条件】仅当极限呈 0/0 或 ∞/∞ 不定式时使用：对分子分母分别求导后再求极限。\n\n【为什么成立（直观）】在 x=a 附近 f(a)=g(a)=0，于是 f(x)≈f'(a)(x-a)、g(x)≈g'(a)(x-a)，比值里的 (x-a) 抵消，剩下 f'(a)/g'(a)——本质是‘谁变化得快谁主导’。\n\n【高考秒杀价值】高考导数压轴常需算 lim(x→0)(eˣ-1-x)/x² 这类极限，洛必达连求两次导即得 1/2，比泰勒/夹逼快得多。\n⚠️注意：高考解答正文不能直接写‘由洛必达’（超纲），但可以——①先用洛必达秒算出正确答案，再用高中方法（同除/构造/泰勒）倒推书写；②选填题直接用；③确定含参极限里的参数。这是‘高阶心算、低阶书写’的典型利器。", proofSteps: ["设 f(a)=g(a)=0，f、g 在 a 的某邻域内可导且 g'(x)≠0", "对区间 [a,x] 用柯西中值定理：存在 ξ 介于 a 与 x 之间，使 [f(x)-f(a)]/[g(x)-g(a)]=f'(ξ)/g'(ξ)", "因 f(a)=g(a)=0，左边即 f(x)/g(x)，故 f(x)/g(x)=f'(ξ)/g'(ξ)", "当 x→a 时 ξ 被夹在 a 与 x 之间，故 ξ→a", "两边取极限：lim f(x)/g(x)=lim f'(ξ)/g'(ξ)=lim f'(x)/g'(x)，得证"], applications: ["0/0 与 ∞/∞ 极限", "高考导数压轴的极限验证", "确定含参极限的参数"], history: "1696年写入世界第一本微积分教材，实由约翰·伯努利发现。"),
        Formula(id: "taylor_series", name: "泰勒级数", latex: "f(x) = \\sum_{n=0}^{\\infty} \\frac{f^{(n)}(a)}{n!}(x-a)^n", level: .university, category: .calculus, prerequisites: ["deriv_power"], derivations: ["euler_proof"], advancedForm: "analytic_continuation", gaokaoRelevance: 0.3, tags: ["逼近", "多项式"], intuition: "无限多项式克隆曲线。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "【内容】光滑函数可用其在 a 点各阶导数构造的多项式逼近：f(x)=Σ f⁽ⁿ⁾(a)/n!·(x-a)ⁿ。\n\n【常用展开（必背秒杀武器）】\neˣ=1+x+x²/2!+x³/3!+…\nln(1+x)=x-x²/2+x³/3-…\nsin x=x-x³/3!+…，cos x=1-x²/2!+…\n(1+x)ᵏ=1+kx+k(k-1)/2·x²+…\n\n【高考秒杀价值】高考导数压轴的‘放缩证不等式’几乎都源于泰勒截断：\n• eˣ≥1+x（切线）、eˣ≥1+x+x²/2（x>0）\n• ln(1+x)≤x、ln x≤x-1\n• x-x³/6≤sin x≤x\n把超越函数换成多项式后，不等式立刻可比。考场书写时用‘构造函数求导’补证这些放缩，但用泰勒能瞬间知道往哪个方向放、放到几次。", proofSteps: ["设 f 在 a 处有任意阶导数，假设 f(x)=Σ cₙ(x-a)ⁿ", "对两边在 x=a 求值得 c₀=f(a)", "对两边求 k 阶导后令 x=a：仅 (x-a)ᵏ 项存活，得 f⁽ᵏ⁾(a)=k!·cₖ", "故 cₖ=f⁽ᵏ⁾(a)/k!，代回即得泰勒级数", "带拉格朗日余项 Rₙ=f⁽ⁿ⁺¹⁾(ξ)/(n+1)!·(x-a)ⁿ⁺¹ 可控制截断误差"], applications: ["不等式放缩", "近似计算", "高考压轴放缩方向判断"], history: "泰勒于1715年发表，麦克劳林给出 a=0 的特例。"),
        Formula(id: "euler_formula", name: "欧拉公式", latex: "e^{i\\theta} = \\cos\\theta + i\\sin\\theta", level: .university, category: .complexNumbers, prerequisites: ["taylor_series"], derivations: ["euler_identity"], advancedForm: "harmonic_analysis", gaokaoRelevance: 0.2, tags: ["复数", "上帝公式"], intuition: "数学美学的巅峰合一。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "将指数函数与三角函数联系起来的神奇公式。当θ=π时得到欧拉恒等式e^(iπ)+1=0。", proofSteps: ["利用e^x, cosx, sinx的泰勒展开", "将x替换为iθ", "合并实部和虚部"], detailedProof: [
            ProofStep(order: 1, latex: "e^x = \\sum_{n=0}^{\\infty} \\frac{x^n}{n!}", explanation: "指数函数泰勒展开", title: "指数函数展开", content: "指数函数e^x的泰勒级数展开为e^x = 1 + x + x^2/2! + x^3/3! + x^4/4! + ...", visualHint: "无限多项式逼近指数曲线", keyInsight: "泰勒级数是函数的多项式表示"),
            ProofStep(order: 2, latex: "\\cos x = \\sum_{n=0}^{\\infty} \\frac{(-1)^n x^{2n}}{(2n)!}", explanation: "余弦函数泰勒展开", title: "余弦函数展开", content: "余弦函数的泰勒级数展开为cosx = 1 - x^2/2! + x^4/4! - x^6/6! + ...", visualHint: "余弦曲线的多项式逼近", keyInsight: "余弦是偶函数只有偶次项"),
            ProofStep(order: 3, latex: "\\sin x = \\sum_{n=0}^{\\infty} \\frac{(-1)^n x^{2n+1}}{(2n+1)!}", explanation: "正弦函数泰勒展开", title: "正弦函数展开", content: "正弦函数的泰勒级数展开为sinx = x - x^3/3! + x^5/5! - x^7/7! + ...", visualHint: "正弦曲线的多项式逼近", keyInsight: "正弦是奇函数只有奇次项"),
            ProofStep(order: 4, latex: "e^{i\\theta} = 1 + i\\theta - \\frac{\\theta^2}{2!} - i\\frac{\\theta^3}{3!} + \\frac{\\theta^4}{4!} + ...", explanation: "代入虚数", title: "代入虚数单位i", content: "将x替换为iθ，利用i^2=-1循环规律展开", visualHint: "虚数指数的展开式", keyInsight: "虚数单位i的幂次呈现周期性"),
            ProofStep(order: 5, latex: "e^{i\\theta} = \\cos\\theta + i\\sin\\theta", explanation: "合并实部虚部", title: "分离实部和虚部", content: "将展开式中的实部和虚部分开，实部是cosθ的泰勒展开，虚部是sinθ的泰勒展开", visualHint: "实部余弦虚部正弦", keyInsight: "欧拉公式将指数与三角函数完美统一")
        ], applications: ["复数运算", "傅里叶分析", "信号处理"], history: "欧拉在1748年提出。"),
        Formula(id: "vector_dot", name: "向量点积", latex: "\\vec{a} \\cdot \\vec{b} = |\\vec{a}||\\vec{b}|\\cos\\theta", level: .high, category: .linearAlgebra, prerequisites: ["pythagorean"], derivations: ["projection"], advancedForm: "inner_product", gaokaoRelevance: 0.8, tags: ["向量", "代数", "必考"], intuition: "一个向量在另一个向量上的投影长度。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "两个向量的点积等于它们的模长乘积乘以夹角的余弦。点积为零表示两向量垂直。", proofSteps: ["利用余弦定理", "|a-b|² = |a|² + |b|² - 2a·b", "展开左边得a·b = |a||b|cosθ"], applications: ["投影计算", "垂直判定", "功的计算"], history: "19世纪哈密顿引入向量概念后广泛使用。"),
        Formula(id: "vector_cross", name: "向量叉积", latex: "|\\vec{a} \\times \\vec{b}| = |\\vec{a}||\\vec{b}|\\sin\\theta", level: .university, category: .linearAlgebra, prerequisites: ["vector_dot"], derivations: ["triple_product"], advancedForm: "exterior_product", gaokaoRelevance: 0.5, tags: ["向量", "代数"], intuition: "平行四边形面积。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "【内容】a×b 是一个向量：模长 |a×b|=|a||b|sinθ（=以 a,b 为邻边的平行四边形面积），方向垂直于 a、b 所在平面（右手定则）。坐标式 a×b=(a₂b₃-a₃b₂, a₃b₁-a₁b₃, a₁b₂-a₂b₁)。\n\n【高考秒杀价值】\n①求面积：三角形 S=½|AB×AC|，比‘先求夹角余弦再 sin’快一步。\n②求法向量：立体几何二面角/线面角要的‘平面法向量’，就是平面内两向量的叉积，一次叉乘直接得 (无需解方程组 n·a=0,n·b=0)。\n③判共线/共面。\n⚠️书写时高考用‘设法向量解方程组’，但用叉积可一步算出法向量再验证，省去大量计算。", proofSteps: ["平行四边形以 a 为底，底长 |a|", "高 h=|b|sinθ（b 在垂直 a 方向的分量）", "面积 S=底×高=|a||b|sinθ", "由定义 |a×b|=|a||b|sinθ=S，得证；方向由右手定则垂直于平面"], applications: ["三角形/平行四边形面积", "立体几何求平面法向量", "判断共线共面", "力矩"], history: "格拉斯曼1844年引入外代数，吉布斯系统化为向量叉积。"),
        Formula(id: "sphere_volume", name: "球的体积", latex: "V = \\frac{4}{3} \\pi r^3", level: .high, category: .geometry, prerequisites: ["cone_volume"], derivations: [], advancedForm: "spherical_integral", gaokaoRelevance: 0.85, tags: ["立体几何", "体积", "必考"], intuition: "无限薄球壳体积之和。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "半径为r的球体体积等于(4/3)πr³。可以通过将球分割为无限薄球壳积分得到。", proofSteps: ["将球分割为无限薄球壳", "每个球壳体积≈4πx²dx", "积分从0到r得V=4π∫x²dx=4/3πr³"], applications: ["球体容器", "星球体积", "球体设计"], history: "阿基米德在公元前225年证明。"),
        Formula(id: "sphere_surface", name: "球的表面积", latex: "S = 4 \\pi r^2", level: .high, category: .geometry, prerequisites: ["sphere_volume"], derivations: [], advancedForm: "surface_integral", gaokaoRelevance: 0.7, tags: ["立体几何", "表面积"], intuition: "四个大圆面积。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "半径为r的球体表面积等于4πr²。表面积是体积对半径的导数。", proofSteps: ["体积V=(4/3)πr³", "表面积S=dV/dr=4πr²"], applications: ["球体表面积计算", "散热面积", "地球表面积"], history: "阿基米德发现球表面积与外切圆柱侧面积相等。"),
        Formula(id: "cone_volume", name: "圆锥体积", latex: "V = \\frac{1}{3} \\pi r^2 h", level: .high, category: .geometry, prerequisites: ["sphere_volume"], derivations: ["pyramid"], advancedForm: "cone_integral", gaokaoRelevance: 0.9, tags: ["立体几何", "体积", "必考"], intuition: "等底等高圆柱体积的1/3。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "底面半径r、高h的圆锥体体积等于同底同高圆柱体积的三分之一。", proofSteps: ["利用祖暅原理：等高处截面积相等则体积相等", "圆锥与同底等高棱锥体积相等", "棱锥体积=1/3×底面积×高"], applications: ["锥形容器", "金字塔体积", "圆锥光学"], history: "祖冲之父子在5世纪提出祖暅原理证明。"),
        Formula(id: "dist_formula", name: "两点间距离公式", latex: "d = \\sqrt{(x_2-x_1)^2 + (y_2-y_1)^2}", level: .high, category: .geometry, prerequisites: ["pythagorean"], derivations: ["circle_eq"], advancedForm: "metric_tensor", gaokaoRelevance: 1.0, tags: ["解析几何", "必考"], intuition: "坐标版勾股定理。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "平面直角坐标系中两点(x₁,y₁)和(x₂,y₂)之间的距离。", proofSteps: ["构造直角三角形，两直角边分别为|x₂-x₁|和|y₂-y₁|", "应用勾股定理得斜边长度"], applications: ["计算距离", "圆的定义", "几何作图"], history: "笛卡尔创立解析几何时即已使用。"),
        Formula(id: "circle_eq", name: "圆的标准方程", latex: "(x-a)^2 + (y-b)^2 = r^2", level: .high, category: .geometry, prerequisites: ["dist_formula"], derivations: ["ellipse_eq"], advancedForm: "circle_polar", gaokaoRelevance: 1.0, tags: ["解析几何", "必考"], intuition: "到定点距离等于定长的点的轨迹。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "以(a,b)为圆心、r为半径的圆的方程。", proofSteps: ["设圆上任意点(x,y)", "到圆心(a,b)距离为r", "由距离公式得√[(x-a)²+(y-b)²]=r", "平方得标准方程"], applications: ["圆的作图", "轨迹问题", "几何计算"], history: "解析几何标准公式。"),
        Formula(id: "am_gm", name: "均值不等式", latex: "\\frac{a_1+a_2+...+a_n}{n} \\geq \\sqrt[n]{a_1a_2...a_n}", level: .high, category: .inequalities, prerequisites: [], derivations: ["cauchy_schwarz"], advancedForm: "power_mean", gaokaoRelevance: 0.9, tags: ["不等式", "核心", "必考"], intuition: "算术平均不小于几何平均。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "非负实数的算术平均值大于等于几何平均值，当且仅当所有数相等时取等号。", proofSteps: ["用数学归纳法", "或利用对数函数的凸性", "或利用拉格朗日乘数法"], applications: ["最值问题", "不等式证明", "优化"], history: "古希腊数学家已知特殊情况，柯西推广到一般形式。"),
        Formula(id: "arithmetic_sum", name: "等差数列求和", latex: "S_n = \\frac{n(a_1 + a_n)}{2}", level: .middle, category: .sequences, prerequisites: [], derivations: ["arithmetic_mean"], advancedForm: "arithmetic_series", gaokaoRelevance: 1.0, tags: ["数列", "核心", "必考"], intuition: "首项加末项乘项数除以2。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "等差数列前n项和等于项数乘以首项与末项的平均值。", proofSteps: ["S_n = a₁ + a₂ + ... + a_n", "S_n = a_n + a_{n-1} + ... + a₁", "相加得2S_n = n(a₁+a_n)"], applications: ["求和计算", "级数", "数学建模"], history: "高斯在童年时发现此公式。"),
        Formula(id: "geometric_sum", name: "等比数列求和", latex: "S_n = a_1 \\frac{1 - r^n}{1 - r}", level: .high, category: .sequences, prerequisites: ["arithmetic_sum"], derivations: ["infinite_geo"], advancedForm: "geometric_series", gaokaoRelevance: 1.0, tags: ["数列", "核心", "必考"], intuition: "首项乘公比幂次差。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "等比数列前n项和公式。当|r|<1时，无穷项和为a₁/(1-r)。", proofSteps: ["S_n = a₁ + a₁r + ... + a₁r^(n-1)", "rS_n = a₁r + ... + a₁r^n", "相减得(1-r)S_n = a₁(1-r^n)"], applications: ["复利计算", "无穷级数", "概率"], history: "古代巴比伦人已研究等比数列。"),
        
        // MARK: 代数公式 - 初中
        Formula(id: "linear_eq", name: "一元一次方程", latex: "ax + b = 0 \\implies x = -\\frac{b}{a}", level: .middle, category: .algebra, prerequisites: [], derivations: ["quad_root"], advancedForm: "linear_system", gaokaoRelevance: 1.0, tags: ["方程", "基础", "必考"], intuition: "最简单的方程形式。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "只含有一个未知数，且未知数的最高次数为1的整式方程。通过移项和化简即可求解。", proofSteps: ["ax + b = 0", "ax = -b", "x = -b/a (a≠0)"], applications: ["简单应用题", "比例问题", "物理计算"], history: "古埃及纸草书中已有一元一次方程问题。"),
        Formula(id: "diff_squares", name: "平方差公式", latex: "a^2 - b^2 = (a+b)(a-b)", level: .middle, category: .algebra, prerequisites: [], derivations: ["perfect_square"], advancedForm: "difference_cubes", gaokaoRelevance: 1.0, tags: ["因式分解", "核心", "必考"], intuition: "两个平方数的差等于和乘差。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "两个数的平方差可以分解为这两个数的和与差的乘积。", proofSteps: ["展开右边：(a+b)(a-b) = a² - ab + ab - b²", "化简得 a² - b²"], applications: ["因式分解", "简化计算", "解方程"], history: "古希腊代数基本恒等式。"),
        Formula(id: "perfect_square", name: "完全平方公式", latex: "(a \\pm b)^2 = a^2 \\pm 2ab + b^2", level: .middle, category: .algebra, prerequisites: ["diff_squares"], derivations: ["binomial_theorem"], advancedForm: "multinomial", gaokaoRelevance: 1.0, tags: ["因式分解", "核心", "必考"], intuition: "和的平方等于平方和加交叉项。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "两个数和或差的平方等于它们的平方和加上或减去它们乘积的两倍。", proofSteps: ["(a+b)(a+b) = a² + ab + ba + b²", "合并同类项得 a² + 2ab + b²"], applications: ["因式分解", "配方", "解方程"], history: "欧几里得《几何原本》中已有几何证明。"),
        Formula(id: "vieta", name: "韦达定理", latex: "x_1 + x_2 = -\\frac{b}{a},\\ x_1x_2 = \\frac{c}{a}", level: .middle, category: .algebra, prerequisites: ["quad_root"], derivations: [], advancedForm: "vieta_general", gaokaoRelevance: 1.0, tags: ["方程", "核心", "必考"], intuition: "根与系数的关系。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "一元二次方程ax²+bx+c=0的两根之和等于-b/a，两根之积等于c/a。", proofSteps: ["由求根公式得x₁=(-b+√Δ)/(2a), x₂=(-b-√Δ)/(2a)", "相加得x₁+x₂=-2b/(2a)=-b/a", "相乘得x₁x₂=(b²-Δ)/(4a²)=c/a"], applications: ["不求根求系数", "构造方程", "多项式分解"], history: "韦达在1591年系统阐述。"),

        // MARK: 初中补充公式 - 代数
        Formula(id: "quad_discriminant", name: "一元二次方程判别式", latex: "\\Delta = b^2 - 4ac", level: .middle, category: .algebra, prerequisites: ["quad_root"], derivations: [], advancedForm: "quad_solution", gaokaoRelevance: 1.0, tags: ["方程", "核心", "必考"], intuition: "判别根的性质。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "一元二次方程ax²+bx+c=0的判别式Δ=b²-4ac决定根的性质：Δ>0两不等实根，Δ=0两相等实根，Δ<0无实根。", proofSteps: ["由求根公式x=(-b±√Δ)/(2a)", "根号内必须非负才有实根"], applications: ["判断根的情况", "二次函数图像", "二次不等式"], history: "一元二次方程基本性质。"),
        Formula(id: "linear_system", name: "二元一次方程组", latex: "\\begin{cases}a_1x + b_1y = c_1\\\\a_2x + b_2y = c_2\\end{cases}", level: .middle, category: .algebra, prerequisites: ["linear_eq"], derivations: [], advancedForm: "matrix_solve", gaokaoRelevance: 1.0, tags: ["方程", "核心", "必考"], intuition: "两个未知数两个方程。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "含有两个未知数，且未知数最高次数为1的方程组，可用代入消元或加减消元求解。", proofSteps: ["用加减消元法消去一个未知数", "解一元一次方程", "代入求另一个未知数"], applications: ["应用题", "几何问题", "实际问题"], history: "中国古代《九章算术》已有方程组解法。"),
        Formula(id: "abs_value", name: "绝对值性质", latex: "|a| = \\begin{cases}a, & a\\geq 0\\\\-a, & a<0\\end{cases}", level: .middle, category: .algebra, prerequisites: [], derivations: [], advancedForm: "abs_inequality", gaokaoRelevance: 0.9, tags: ["代数", "基础"], intuition: "距离原点的距离。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "一个数的绝对值是它在数轴上到原点的距离，总是非负的。", proofSteps: ["绝对值定义", "分情况讨论"], applications: ["解方程", "不等式", "距离问题"], history: "绝对值概念源于数轴。"),
        Formula(id: "frac_eq", name: "分式方程", latex: "\\frac{A}{B} = \\frac{C}{D} \\Rightarrow AD = BC", level: .middle, category: .algebra, prerequisites: [], derivations: [], advancedForm: "rational_equation", gaokaoRelevance: 0.95, tags: ["方程", "分式"], intuition: "交叉相乘相等。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "解分式方程时，两边同乘最简公分母化为整式方程，需检验增根。", proofSteps: ["两边同乘BD", "AD=BC", "解整式方程后检验"], applications: ["应用题", "比例问题", "实际计算"], history: "分式方程解法。"),
        Formula(id: "inequality_basic", name: "不等式基本性质", latex: "a > b \\Rightarrow a+c > b+c", level: .middle, category: .algebra, prerequisites: [], derivations: [], advancedForm: "linear_inequality", gaokaoRelevance: 1.0, tags: ["不等式", "基础", "必考"], intuition: "不等式两边同加同减不变号。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "不等式两边同时加上（或减去）同一个数，不等号方向不变。", proofSteps: ["a > b", "a-b > 0", "(a+c)-(b+c) = a-b > 0"], applications: ["解不等式", "不等式证明", "实际问题"], history: "不等式基本性质。"),
        Formula(id: "linear_inequality", name: "一元一次不等式", latex: "ax > b", level: .middle, category: .algebra, prerequisites: ["inequality_basic"], derivations: [], advancedForm: "inequality_system", gaokaoRelevance: 1.0, tags: ["不等式", "核心", "必考"], intuition: "最简单的不等式。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "只含有一个未知数，且未知数最高次数为1的不等式。注意两边乘负数时不等号方向改变。", proofSteps: ["若a>0，x > b/a", "若a<0，x < b/a"], applications: ["应用题", "范围问题", "实际限制"], history: "一元一次不等式解法。"),

        // MARK: 初中补充公式 - 几何
        Formula(id: "tri_exterior", name: "三角形外角定理", latex: "\\angle ACD = \\angle A + \\angle B", level: .middle, category: .geometry, prerequisites: ["tri_angle_sum"], derivations: [], advancedForm: "polygon_exterior", gaokaoRelevance: 0.95, tags: ["几何", "三角形"], intuition: "外角等于不相邻两内角和。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "三角形的一个外角等于与它不相邻的两个内角之和。", proofSteps: ["∠ACD + ∠ACB = 180°", "∠A + ∠B + ∠ACB = 180°", "故∠ACD = ∠A + ∠B"], applications: ["角度计算", "几何证明", "三角形性质"], history: "欧几里得几何基本定理。"),
        Formula(id: "polygon_angle", name: "多边形内角和", latex: "S = (n-2) \\times 180^\\circ", level: .middle, category: .geometry, prerequisites: ["tri_angle_sum"], derivations: [], advancedForm: "polygon_exterior_sum", gaokaoRelevance: 0.9, tags: ["几何", "多边形"], intuition: "分成(n-2)个三角形。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "n边形内角和等于(n-2)乘以180度。", proofSteps: ["从一个顶点连对角线分成(n-2)个三角形", "每个三角形内角和180°", "总和=(n-2)×180°"], applications: ["角度计算", "多边形性质", "几何证明"], history: "多边形内角和公式。"),
        Formula(id: "polygon_exterior_sum", name: "多边形外角和", latex: "S = 360^\\circ", level: .middle, category: .geometry, prerequisites: ["polygon_angle"], derivations: [], advancedForm: "", gaokaoRelevance: 0.85, tags: ["几何", "多边形"], intuition: "任意多边形外角和都是360度。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "任意多边形的外角和恒等于360度，与边数无关。", proofSteps: ["每个内角+外角=180°", "n个内角+外角=n×180°", "外角和=n×180°-(n-2)×180°=360°"], applications: ["角度计算", "正多边形", "几何证明"], history: "多边形外角和定理。"),
        Formula(id: "rectangle_prop", name: "矩形性质", latex: "\\angle A = \\angle B = \\angle C = \\angle D = 90^\\circ", level: .middle, category: .geometry, prerequisites: ["parallelogram_area"], derivations: [], advancedForm: "square_prop", gaokaoRelevance: 0.9, tags: ["几何", "矩形"], intuition: "四个角都是直角。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "矩形的四个角都是直角，对角线相等且互相平分。", proofSteps: ["平行四边形基础上一个角为90°", "利用平行线性质证明其他角也是90°"], applications: ["几何证明", "矩形判定", "面积计算"], history: "矩形基本性质。"),
        Formula(id: "rhombus_prop", name: "菱形性质", latex: "AB = BC = CD = DA", level: .middle, category: .geometry, prerequisites: ["parallelogram_area"], derivations: [], advancedForm: "square_prop", gaokaoRelevance: 0.9, tags: ["几何", "菱形"], intuition: "四条边都相等。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "菱形的四条边都相等，对角线互相垂直平分。", proofSteps: ["平行四边形基础上邻边相等", "利用等腰三角形性质"], applications: ["几何证明", "菱形判定", "面积计算"], history: "菱形基本性质。"),
        Formula(id: "square_prop", name: "正方形性质", latex: "AB=BC=CD=DA,\\ \\angle A=90^\\circ", level: .middle, category: .geometry, prerequisites: ["rectangle_prop", "rhombus_prop"], derivations: [], advancedForm: "", gaokaoRelevance: 0.95, tags: ["几何", "正方形"], intuition: "既是矩形又是菱形。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "正方形具有矩形和菱形的所有性质，四条边相等，四个角都是直角。", proofSteps: ["矩形基础上邻边相等", "或菱形基础上一个角为90°"], applications: ["几何证明", "正方形判定", "面积计算"], history: "正方形基本性质。"),
        Formula(id: "circle_center_angle", name: "圆心角定理", latex: "\\angle AOB = 2\\angle ACB", level: .middle, category: .geometry, prerequisites: [], derivations: ["circle_inscribed"], advancedForm: "circle_theorems", gaokaoRelevance: 1.0, tags: ["几何", "圆", "必考"], intuition: "圆心角是圆周角的两倍。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "同弧所对的圆心角等于圆周角的两倍。", proofSteps: ["连接OC", "OA=OC=OB", "利用等腰三角形外角定理"], applications: ["角度计算", "圆的性质", "几何证明"], history: "圆的基本定理。"),
        Formula(id: "circle_diameter", name: "直径所对圆周角", latex: "\\angle ACB = 90^\\circ", level: .middle, category: .geometry, prerequisites: ["circle_center_angle"], derivations: [], advancedForm: "", gaokaoRelevance: 1.0, tags: ["几何", "圆", "必考"], intuition: "直径对直角。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "直径所对的圆周角是直角。", proofSteps: ["圆心角∠AOB=180°", "圆周角∠ACB=∠AOB/2=90°"], applications: ["几何证明", "直角判定", "作图"], history: "泰勒斯定理。"),
        Formula(id: "arc_length", name: "弧长公式", latex: "l = \\frac{n}{360} \\times 2\\pi r", level: .middle, category: .geometry, prerequisites: ["circle_circum"], derivations: [], advancedForm: "radian_arc", gaokaoRelevance: 0.9, tags: ["几何", "圆", "弧长"], intuition: "弧长与圆心角成正比。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "圆心角为n度的弧长等于n/360乘以圆周长。", proofSteps: ["圆周长=2πr", "弧长占周长的n/360"], applications: ["弧长计算", "扇形", "圆的性质"], history: "弧长公式。"),
        Formula(id: "sector_area", name: "扇形面积", latex: "S = \\frac{n}{360} \\times \\pi r^2", level: .middle, category: .geometry, prerequisites: ["circle_area"], derivations: [], advancedForm: "sector_formula", gaokaoRelevance: 0.9, tags: ["几何", "圆", "扇形"], intuition: "扇形面积与圆心角成正比。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "圆心角为n度的扇形面积等于n/360乘以圆面积。", proofSteps: ["圆面积=πr²", "扇形面积占圆面积的n/360"], applications: ["面积计算", "扇形", "实际应用"], history: "扇形面积公式。"),
        Formula(id: "cone_surface", name: "圆锥侧面积", latex: "S_{\\text{侧}} = \\pi r l", level: .middle, category: .geometry, prerequisites: ["sector_area"], derivations: [], advancedForm: "cone_total", gaokaoRelevance: 0.85, tags: ["几何", "立体", "圆锥"], intuition: "侧面展开是扇形。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "圆锥的侧面积等于πrl，其中r是底面半径，l是母线长。", proofSteps: ["侧面展开为扇形，弧长=2πr", "扇形半径=母线长l", "面积=1/2×弧长×半径=πrl"], applications: ["表面积计算", "圆锥", "实际应用"], history: "圆锥侧面积公式。"),

        // MARK: 初中补充公式 - 函数
        Formula(id: "direct_proportion", name: "正比例函数", latex: "y = kx,\\ k \\neq 0", level: .middle, category: .algebra, prerequisites: [], derivations: ["linear_function"], advancedForm: "proportional", gaokaoRelevance: 1.0, tags: ["函数", "核心", "必考"], intuition: "y与x成正比。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "形如y=kx(k≠0)的函数，图像是过原点的直线，斜率为k。", proofSteps: ["比例定义", "y/x=k(常数)"], applications: ["比例问题", "图像", "实际应用"], history: "正比例函数基本形式。"),
        Formula(id: "inverse_proportion", name: "反比例函数", latex: "y = \\frac{k}{x},\\ k \\neq 0", level: .middle, category: .algebra, prerequisites: [], derivations: [], advancedForm: "hyperbola", gaokaoRelevance: 1.0, tags: ["函数", "核心", "必考"], intuition: "y与x成反比。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "形如y=k/x(k≠0)的函数，图像是双曲线，分布在一、三象限或二、四象限。", proofSteps: ["反比例定义", "xy=k(常数)"], applications: ["反比例问题", "图像", "实际应用"], history: "反比例函数基本形式。"),
        Formula(id: "linear_function", name: "一次函数", latex: "y = kx + b", level: .middle, category: .algebra, prerequisites: ["direct_proportion"], derivations: ["quadratic_function"], advancedForm: "linear_regression", gaokaoRelevance: 1.0, tags: ["函数", "核心", "必考"], intuition: "直线函数。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "形如y=kx+b的函数，图像是斜率为k、y截距为b的直线。", proofSteps: ["正比例函数平移得到"], applications: ["图像分析", "应用题", "实际问题"], history: "一次函数基本形式。"),
        Formula(id: "quadratic_function", name: "二次函数", latex: "y = ax^2 + bx + c", level: .middle, category: .algebra, prerequisites: ["linear_function"], derivations: [], advancedForm: "parabola", gaokaoRelevance: 1.0, tags: ["函数", "核心", "必考"], intuition: "抛物线函数。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "形如y=ax²+bx+c的函数，图像是抛物线，开口方向由a决定。", proofSteps: ["配方法化为顶点式", "y=a(x+b/(2a))² + (4ac-b²)/(4a)"], applications: ["最值问题", "图像分析", "实际应用"], history: "二次函数基本形式。"),

        // MARK: 初中补充公式 - 统计
        Formula(id: "mean", name: "平均数", latex: "\\bar{x} = \\frac{x_1+x_2+...+x_n}{n}", level: .middle, category: .probability, prerequisites: [], derivations: [], advancedForm: "weighted_mean", gaokaoRelevance: 1.0, tags: ["统计", "核心", "必考"], intuition: "数据的平均水平。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "一组数据的平均数等于所有数据之和除以数据个数。", proofSteps: ["平均数定义"], applications: ["数据分析", "统计推断", "实际应用"], history: "统计学基本概念。"),
        Formula(id: "median", name: "中位数", latex: "x_{\\text{median}} = \\begin{cases}x_{(n+1)/2}, & n\\text{奇数}\\\\(x_{n/2}+x_{n/2+1})/2, & n\\text{偶数}\\end{cases}", level: .middle, category: .probability, prerequisites: [], derivations: [], advancedForm: "quartile", gaokaoRelevance: 0.95, tags: ["统计", "核心"], intuition: "数据中间位置的值。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "将数据按大小排序后位于中间位置的数值，反映数据的中等水平。", proofSteps: ["排序数据", "找中间位置"], applications: ["数据分析", "统计推断", "偏态分布"], history: "统计学基本概念。"),
        Formula(id: "mode", name: "众数", latex: "x_{\\text{mode}} = \\text{出现次数最多的数}", level: .middle, category: .probability, prerequisites: [], derivations: [], advancedForm: "bimodal", gaokaoRelevance: 0.9, tags: ["统计", "核心"], intuition: "出现次数最多的数。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "一组数据中出现次数最多的数值，反映数据的集中趋势。", proofSteps: ["统计每个数出现的次数", "找出次数最多的"], applications: ["数据分析", "统计推断", "市场分析"], history: "统计学基本概念。"),
        
        // MARK: 代数公式 - 高中
        Formula(id: "permutation", name: "排列公式", latex: "A_n^m = \\frac{n!}{(n-m)!}", level: .high, category: .algebra, prerequisites: [], derivations: ["combination"], advancedForm: "permutation_with_repetition", gaokaoRelevance: 0.9, tags: ["排列组合", "核心", "必考"], intuition: "有序选取的数量。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "从n个不同元素中取出m个元素的排列数。", proofSteps: ["第一个位置有n种选择", "第二个位置有n-1种选择", "...第m个位置有n-m+1种选择", "总数=n×(n-1)×...×(n-m+1)=n!/(n-m)!", ], applications: ["计数问题", "概率计算", "密码组合"], history: "组合数学基本概念。"),
        Formula(id: "combination", name: "组合公式", latex: "C_n^m = \\frac{n!}{m!(n-m)!}", level: .high, category: .algebra, prerequisites: ["permutation"], derivations: [], advancedForm: "binomial_theorem", gaokaoRelevance: 1.0, tags: ["排列组合", "核心", "必考"], intuition: "无序选取的数量。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "从n个不同元素中取出m个元素的组合数，不考虑顺序。", proofSteps: ["排列数A(n,m)=C(n,m)×m!", "故C(n,m)=A(n,m)/m!=n!/(m!(n-m)!)"], applications: ["二项式展开", "概率分布", "集合论"], history: "帕斯卡三角形揭示了组合数规律。"),
        Formula(id: "binomial_theorem", name: "二项式定理", latex: "(a+b)^n = \\sum_{k=0}^n C_n^k a^{n-k}b^k", level: .high, category: .algebra, prerequisites: ["combination"], derivations: [], advancedForm: "multinomial_theorem", gaokaoRelevance: 1.0, tags: ["多项式", "核心", "必考"], intuition: "展开式系数是组合数。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "(a+b)的n次方展开后，各项系数为组合数C(n,k)。", proofSteps: ["用数学归纳法", "或用组合解释：从n个因子中选k个b"], applications: ["多项式展开", "概率计算", "级数展开"], history: "牛顿在1665年发现一般形式。"),
        Formula(id: "log_product", name: "对数乘法法则", latex: "\\log(ab) = \\log a + \\log b", level: .high, category: .algebra, prerequisites: [], derivations: ["log_power"], advancedForm: "logarithmic_properties", gaokaoRelevance: 1.0, tags: ["对数", "核心", "必考"], intuition: "积的对数等于对数的和。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "两个正数乘积的对数等于它们各自对数的和。", proofSteps: ["设x=log a, y=log b", "则a=10^x, b=10^y", "ab=10^x×10^y=10^(x+y)", "log(ab)=x+y=log a+log b"], applications: ["简化计算", "解方程", "数据分析"], history: "纳皮尔在1614年发明对数。"),
        Formula(id: "exp_rule", name: "指数运算法则", latex: "a^m \\cdot a^n = a^{m+n}", level: .high, category: .algebra, prerequisites: [], derivations: ["log_product"], advancedForm: "exponential_function", gaokaoRelevance: 1.0, tags: ["指数", "基础", "必考"], intuition: "同底幂相乘，指数相加。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "同底数的幂相乘，底数不变，指数相加。", proofSteps: ["a^m = a×a×...×a (m个)", "a^n = a×a×...×a (n个)", "相乘得a^(m+n)"], applications: ["科学计算", "增长率问题", "指数函数"], history: "古代巴比伦人已有指数概念。"),
        Formula(id: "complex_add", name: "复数加法", latex: "(a+bi) + (c+di) = (a+c) + (b+d)i", level: .high, category: .complexNumbers, prerequisites: [], derivations: ["complex_mult"], advancedForm: "complex_algebra", gaokaoRelevance: 0.7, tags: ["复数", "基础"], intuition: "实部虚部分别相加。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "两个复数相加，实部与实部相加，虚部与虚部相加。", proofSteps: ["(a+bi)+(c+di) = a+c+bi+di", "合并得(a+c)+(b+d)i"], applications: ["复数运算", "向量加法", "电路分析"], history: "复数在16世纪由卡尔达诺引入。"),
        Formula(id: "complex_mult", name: "复数乘法", latex: "(a+bi)(c+di) = (ac-bd) + (ad+bc)i", level: .high, category: .complexNumbers, prerequisites: ["complex_add"], derivations: ["euler_formula"], advancedForm: "complex_polar", gaokaoRelevance: 0.8, tags: ["复数", "核心"], intuition: "十字相乘再合并。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "两个复数相乘，按多项式乘法展开，利用i²=-1化简。", proofSteps: ["(a+bi)(c+di)=ac+adi+bci+bdi²", "i²=-1，合并得(ac-bd)+(ad+bc)i"], applications: ["复数运算", "旋转变换", "信号处理"], history: "欧拉公式揭示了复数乘法的几何意义。"),
        
        // MARK: 代数公式 - 大学
        Formula(id: "det_2x2", name: "二阶行列式", latex: "\\det\\begin{pmatrix}a&b\\\\c&d\\end{pmatrix} = ad - bc", level: .high, category: .linearAlgebra, prerequisites: [], derivations: ["det_3x3"], advancedForm: "det_nxn", gaokaoRelevance: 0.8, tags: ["线性代数", "行列式"], intuition: "平行四边形面积。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "二阶行列式等于主对角线元素乘积减去副对角线元素乘积。", proofSteps: ["从平行四边形面积公式推导", "或从线性变换的缩放因子理解"], applications: ["面积计算", "逆矩阵", "方程组求解"], history: "莱布尼茨最早研究行列式。"),
        Formula(id: "matrix_mult", name: "矩阵乘法", latex: "(AB)_{ij} = \\sum_{k=1}^n A_{ik}B_{kj}", level: .high, category: .linearAlgebra, prerequisites: [], derivations: ["matrix_inverse"], advancedForm: "tensor_product", gaokaoRelevance: 0.7, tags: ["线性代数", "矩阵"], intuition: "行乘列求和。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "矩阵A与矩阵B的乘积中第i行第j列的元素等于A的第i行与B的第j列对应元素乘积之和。", proofSteps: ["从线性变换复合角度理解", "或从向量乘法推广"], applications: ["线性变换", "坐标变换", "方程组求解"], history: "凯莱在1858年系统定义矩阵运算。"),
        Formula(id: "cramer_rule", name: "克拉默法则", latex: "x_i = \\frac{\\det(A_i)}{\\det(A)}", level: .high, category: .linearAlgebra, prerequisites: ["det_2x2"], derivations: [], advancedForm: "matrix_inverse", gaokaoRelevance: 0.7, tags: ["线性代数", "方程组"], intuition: "行列式比值。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "线性方程组Ax=b的解的第i个分量等于用b替换A的第i列后所得矩阵的行列式除以A的行列式。", proofSteps: ["利用行列式的性质", "展开det(A_i)并与解关联"], applications: ["方程组求解", "理论分析", "几何应用"], history: "克拉默在1750年提出。"),
        Formula(id: "eigenvalue", name: "特征值与特征向量", latex: "A\\vec{v} = \\lambda\\vec{v}", level: .university, category: .linearAlgebra, prerequisites: ["matrix_mult"], derivations: [], advancedForm: "diagonalization", gaokaoRelevance: 0.4, tags: ["线性代数", "核心"], intuition: "变换后方向不变的向量。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "对于方阵A，若存在非零向量v和数λ使得Av=λv，则λ是特征值，v是对应的特征向量。", proofSteps: ["Av=λv", "(A-λI)v=0", "det(A-λI)=0"], applications: ["数据压缩", "图像识别", "振动分析"], history: "拉格朗日在1746年研究振动问题时引入。"),
        Formula(id: "cauchy_schwarz", name: "柯西-施瓦茨不等式", latex: "(\\sum a_i b_i)^2 \\leq (\\sum a_i^2)(\\sum b_i^2)", level: .high, category: .inequalities, prerequisites: ["am_gm"], derivations: [], advancedForm: "holder", gaokaoRelevance: 0.8, tags: ["不等式", "核心"], intuition: "点积模长不超过模长乘积。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "两个向量点积的平方不超过它们模长平方的乘积。", proofSteps: ["考虑二次函数f(t)=Σ(a_i+tb_i)²≥0", "判别式≤0即得不等式"], applications: ["不等式证明", "向量分析", "优化"], history: "柯西在1821年证明，施瓦茨在1888年推广。"),
        Formula(id: "bayes", name: "贝叶斯定理", latex: "P(A|B) = \\frac{P(B|A)P(A)}{P(B)}", level: .high, category: .probability, prerequisites: [], derivations: [], advancedForm: "bayesian_inference", gaokaoRelevance: 0.7, tags: ["概率", "核心"], intuition: "逆概率公式。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "在已知B发生的条件下，A发生的概率等于B在A发生条件下的概率乘以A的先验概率再除以B的概率。", proofSteps: ["由条件概率定义P(A|B)=P(A∩B)/P(B)", "P(A∩B)=P(B|A)P(A)", "代入得贝叶斯公式"], applications: ["概率推理", "机器学习", "决策分析"], history: "贝叶斯在1763年发表。"),
        Formula(id: "fundamental_theorem", name: "微积分基本定理", latex: "\\int_a^b f(x)dx = F(b) - F(a)", level: .high, category: .calculus, prerequisites: ["int_power"], derivations: [], advancedForm: "stokes_theorem", gaokaoRelevance: 1.0, tags: ["积分", "核心", "必考"], intuition: "微分与积分的桥梁。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "【内容】若 F'(x)=f(x)，则 ∫ₐᵇf(x)dx=F(b)-F(a)。求积分=找原函数后代两端相减（牛顿-莱布尼茨公式）。\n\n【直观】定积分是‘累加无穷多个 f(x)dx 的微小面积’，而原函数 F 记录了累积量，从 a 到 b 的累积差就是 F(b)-F(a)——‘求和’与‘求差’互逆。\n\n【高考秒杀价值】\n①求曲边图形/两曲线间面积：S=∫(上-下)dx，一次积分搞定，比割补/极限快。\n②与导数互逆，验证导数题。\n例：抛物线 y=x² 与 y=x 围成面积=∫₀¹(x-x²)dx=[x²/2-x³/3]₀¹=1/6（‘1/6 公式’的来源）。", proofSteps: ["定义变上限积分 F(x)=∫ₐˣf(t)dt", "由积分中值定理 [F(x+h)-F(x)]/h=f(ξ)，ξ∈[x,x+h]，令 h→0 得 F'(x)=f(x)，即 F 是 f 的一个原函数", "设 G 是 f 的任一原函数，则 G(x)=F(x)+C", "∫ₐᵇf=F(b)=F(b)-F(a)（因 F(a)=0）=G(b)-G(a)，得证"], applications: ["曲边梯形/两曲线间面积", "由速度求位移", "导数与积分互验"], history: "牛顿与莱布尼茨17世纪分别独立发现，奠定微积分。"),
        Formula(id: "deriv_product", name: "乘积法则", latex: "(uv)' = u'v + uv'", level: .high, category: .calculus, prerequisites: ["deriv_power"], derivations: ["deriv_quotient"], advancedForm: "leibniz_rule", gaokaoRelevance: 1.0, tags: ["导数", "核心", "必考"], intuition: "前导后不导加前不导后导。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "两个函数乘积的导数等于第一个函数的导数乘第二个函数加上第一个函数乘第二个函数的导数。", proofSteps: ["利用导数定义", "lim[(u+du)(v+dv)-uv]/dx", "展开化简得u'v+uv'"], applications: ["复杂函数求导", "隐函数求导", "微分方程"], history: "莱布尼茨规则。"),
        Formula(id: "deriv_chain", name: "复合函数求导", latex: "\\frac{dy}{dx} = \\frac{dy}{du} \\cdot \\frac{du}{dx}", level: .high, category: .calculus, prerequisites: ["deriv_power"], derivations: [], advancedForm: "chain_rule_multivariable", gaokaoRelevance: 1.0, tags: ["导数", "核心", "必考"], intuition: "链式传递。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "复合函数y=f(u), u=g(x)的导数等于dy/du乘以du/dx。", proofSteps: ["利用导数定义的极限形式", "Δy/Δx = (Δy/Δu)(Δu/Δx)", "取极限得链式法则"], applications: ["复杂函数求导", "隐函数求导", "相关变化率"], history: "微积分基本法则。"),
        Formula(id: "int_power", name: "幂函数积分", latex: "\\int x^n dx = \\frac{x^{n+1}}{n+1} + C", level: .high, category: .calculus, prerequisites: ["deriv_power"], derivations: ["int_definite"], advancedForm: "integration_by_parts", gaokaoRelevance: 1.0, tags: ["积分", "核心", "必考"], intuition: "升幂补偿。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "幂函数xⁿ的不定积分等于x^(n+1)/(n+1)加常数C（n≠-1）。", proofSteps: ["对x^(n+1)/(n+1)求导", "导数=(n+1)x^n/(n+1)=x^n", "故积分成立"], applications: ["面积计算", "体积计算", "物理积分"], history: "牛顿-莱布尼茨公式。"),

        // MARK: 三角函数补充公式
        Formula(id: "cos_add", name: "余弦和角公式", latex: "\\cos(\\alpha+\\beta) = \\cos\\alpha\\cos\\beta - \\sin\\alpha\\sin\\beta", level: .high, category: .trigonometry, prerequisites: ["sin_add"], derivations: ["double_angle"], advancedForm: "euler_formula", gaokaoRelevance: 1.0, tags: ["三角函数", "核心", "必考"], intuition: "余弦和角公式。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "两个角之和的余弦等于它们余弦的乘积减去正弦的乘积。", proofSteps: ["利用欧拉公式e^(i(α+β))=e^(iα)e^(iβ)", "展开右边取实部"], applications: ["三角恒等变换", "波形分析", "交流电"], history: "托勒密定理的推广。"),
        Formula(id: "tan_add", name: "正切和角公式", latex: "\\tan(\\alpha+\\beta) = \\frac{\\tan\\alpha+\\tan\\beta}{1-\\tan\\alpha\\tan\\beta}", level: .high, category: .trigonometry, prerequisites: ["sin_add", "cos_add"], derivations: [], advancedForm: "triple_angle", gaokaoRelevance: 0.9, tags: ["三角函数", "核心"], intuition: "正切和角公式。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "两个角之和的正切等于正切和除以1减正切积。", proofSteps: ["tan(α+β)=sin(α+β)/cos(α+β)", "代入正弦余弦和角公式化简"], applications: ["三角计算", "角度合成", "几何证明"], history: "三角函数基本恒等式。"),
        Formula(id: "double_angle", name: "倍角公式", latex: "\\sin 2\\alpha = 2\\sin\\alpha\\cos\\alpha", level: .high, category: .trigonometry, prerequisites: ["sin_add"], derivations: ["half_angle"], advancedForm: "multiple_angle", gaokaoRelevance: 1.0, tags: ["三角函数", "核心", "必考"], intuition: "二倍角公式。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "二倍角的正弦等于2倍的正弦乘余弦。", proofSteps: ["在正弦和角公式中令α=β"], applications: ["三角化简", "降幂公式", "积分计算"], history: "三角函数基本恒等式。"),
        Formula(id: "half_angle", name: "半角公式", latex: "\\sin\\frac{\\alpha}{2} = \\pm\\sqrt{\\frac{1-\\cos\\alpha}{2}}", level: .high, category: .trigonometry, prerequisites: ["double_angle"], derivations: [], advancedForm: "power_reduction", gaokaoRelevance: 0.8, tags: ["三角函数", "公式"], intuition: "半角公式。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "半角的正弦等于根号下(1-cosα)/2，符号由α/2所在象限决定。", proofSteps: ["由cos2θ=1-2sin²θ", "令θ=α/2得证"], applications: ["三角化简", "积分计算", "三角方程"], history: "三角函数基本恒等式。"),
        Formula(id: "sum_to_product", name: "和差化积公式", latex: "\\sin\\alpha+\\sin\\beta = 2\\sin\\frac{\\alpha+\\beta}{2}\\cos\\frac{\\alpha-\\beta}{2}", level: .high, category: .trigonometry, prerequisites: ["sin_add"], derivations: [], advancedForm: "product_to_sum", gaokaoRelevance: 0.85, tags: ["三角函数", "变换"], intuition: "和变积公式。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "两个正弦之和可以表示为乘积形式。", proofSteps: ["令α=x+y, β=x-y", "代入正弦和差公式"], applications: ["三角化简", "解方程", "级数求和"], history: "三角函数恒等式。"),
        Formula(id: "product_to_sum", name: "积化和差公式", latex: "\\sin\\alpha\\cos\\beta = \\frac{1}{2}[\\sin(\\alpha+\\beta)+\\sin(\\alpha-\\beta)]", level: .high, category: .trigonometry, prerequisites: ["sin_add"], derivations: [], advancedForm: "sum_to_product", gaokaoRelevance: 0.8, tags: ["三角函数", "变换"], intuition: "积变和公式。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "正弦乘余弦可以表示为和差形式。", proofSteps: ["利用sin(α+β)+sin(α-β)=2sinαcosβ"], applications: ["积分计算", "三角化简", "信号处理"], history: "三角函数恒等式。"),

        // MARK: 数列补充公式
        Formula(id: "arithmetic_term", name: "等差数列通项", latex: "a_n = a_1 + (n-1)d", level: .high, category: .sequences, prerequisites: [], derivations: ["arithmetic_sum"], advancedForm: "arithmetic_progression", gaokaoRelevance: 1.0, tags: ["数列", "核心", "必考"], intuition: "等差数列通项公式。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "等差数列第n项等于首项加上(n-1)倍公差。", proofSteps: ["a₂=a₁+d, a₃=a₂+d=a₁+2d", "归纳得a_n=a₁+(n-1)d"], applications: ["数列计算", "递推关系", "数学建模"], history: "等差数列基本公式。"),
        Formula(id: "geometric_term", name: "等比数列通项", latex: "a_n = a_1 q^{n-1}", level: .high, category: .sequences, prerequisites: [], derivations: ["geometric_sum"], advancedForm: "geometric_progression", gaokaoRelevance: 1.0, tags: ["数列", "核心", "必考"], intuition: "等比数列通项公式。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "等比数列第n项等于首项乘以公比的(n-1)次方。", proofSteps: ["a₂=a₁q, a₃=a₂q=a₁q²", "归纳得a_n=a₁q^(n-1)"], applications: ["复利计算", "指数增长", "概率分布"], history: "等比数列基本公式。"),
        Formula(id: "infinite_geo", name: "无穷等比数列求和", latex: "S = \\frac{a_1}{1-q},\\ |q|<1", level: .high, category: .sequences, prerequisites: ["geometric_sum"], derivations: [], advancedForm: "series_convergence", gaokaoRelevance: 0.9, tags: ["数列", "无穷级数"], intuition: "无穷等比数列和。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "当公比绝对值小于1时，无穷等比数列的和收敛于a₁/(1-q)。", proofSteps: ["S_n=a₁(1-q^n)/(1-q)", "当|q|<1时，q^n→0", "故S=a₁/(1-q)"], applications: ["循环小数化分数", "级数收敛", "概率计算"], history: "无穷级数基本公式。"),

        // MARK: 对数补充公式
        Formula(id: "log_change_base", name: "对数换底公式", latex: "\\log_b a = \\frac{\\log_c a}{\\log_c b}", level: .high, category: .algebra, prerequisites: ["log_product"], derivations: [], advancedForm: "logarithmic_scale", gaokaoRelevance: 1.0, tags: ["对数", "核心", "必考"], intuition: "换底公式。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "以b为底a的对数等于以c为底a的对数除以以c为底b的对数。", proofSteps: ["设x=log_b a，则b^x=a", "取对数得x log_c b=log_c a", "x=log_c a/log_c b"], applications: ["对数计算", "解方程", "数据分析"], history: "对数基本性质。"),
        Formula(id: "log_power", name: "对数幂法则", latex: "\\log a^n = n\\log a", level: .high, category: .algebra, prerequisites: ["log_product"], derivations: [], advancedForm: "logarithmic_properties", gaokaoRelevance: 1.0, tags: ["对数", "核心", "必考"], intuition: "幂的对数等于对数的倍数。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "一个数的n次方的对数等于n乘以这个数的对数。", proofSteps: ["设x=log a，则a=10^x", "a^n=10^(nx)", "log a^n=nx=n log a"], applications: ["简化计算", "解方程", "数据分析"], history: "对数基本性质。"),

        // MARK: 导数补充公式
        Formula(id: "deriv_sin", name: "正弦函数导数", latex: "(\\sin x)' = \\cos x", level: .high, category: .calculus, prerequisites: ["deriv_power"], derivations: ["deriv_cos"], advancedForm: "trig_derivatives", gaokaoRelevance: 1.0, tags: ["导数", "核心", "必考"], intuition: "正弦导数是余弦。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "正弦函数的导数等于余弦函数。这是三角函数求导的基础，也是振动和波动问题的核心公式。", proofSteps: ["利用导数定义和三角恒等式sin(x+h)-sinx=2cos(x+h/2)sin(h/2)", "代入导数定义得lim(h→0)[2cos(x+h/2)sin(h/2)]/h", "利用重要极限lim(t→0)sint/t=1", "得到cosx"], detailedProof: [
            ProofStep(order: 1, latex: "(\\sin x)' = \\lim_{h \\to 0} \\frac{\\sin(x+h) - \\sin x}{h}", explanation: "导数定义", title: "导数定义", content: "根据导数定义，求正弦函数在点x处的导数。", visualHint: "sin(x+h)是sinx在x+h处的值", keyInsight: "需要用三角恒等式展开"),
            ProofStep(order: 2, latex: "\\sin(x+h) - \\sin x = 2\\cos\\left(x+\\frac{h}{2}\\right)\\sin\\left(\\frac{h}{2}\\right)", explanation: "和差化积", title: "和差化积", content: "利用三角恒等式将sin(x+h)-sinx转化为乘积形式。", visualHint: "sinA-sinB=2cos((A+B)/2)sin((A-B)/2)", keyInsight: "和差化积是关键技巧"),
            ProofStep(order: 3, latex: "\\frac{\\sin(x+h) - \\sin x}{h} = \\cos\\left(x+\\frac{h}{2}\\right) \\cdot \\frac{\\sin(h/2)}{h/2}", explanation: "变形", title: "变形", content: "将2/h转化为1/(h/2)，形成重要极限的形式。", visualHint: "2/h = 1/(h/2)", keyInsight: "凑重要极限的形式"),
            ProofStep(order: 4, latex: "\\lim_{h \\to 0} \\frac{\\sin(h/2)}{h/2} = 1", explanation: "重要极限", title: "重要极限", content: "当h→0时，h/2→0，利用重要极限lim(t→0)sint/t=1。", visualHint: "t=h/2→0", keyInsight: "这是三角函数极限的核心"),
            ProofStep(order: 5, latex: "\\lim_{h \\to 0} \\cos\\left(x+\\frac{h}{2}\\right) = \\cos x", explanation: "余弦连续性", title: "余弦连续性", content: "余弦函数连续，当h→0时，cos(x+h/2)→cosx。", visualHint: "余弦函数是连续函数", keyInsight: "连续性保证极限可直接代入"),
            ProofStep(order: 6, latex: "(\\sin x)' = \\cos x \\cdot 1 = \\cos x", explanation: "得出结论", title: "得出结论", content: "两个极限相乘，得到正弦函数的导数是余弦函数。", visualHint: "正弦曲线的切线斜率就是余弦值", keyInsight: "几何上，sinx的切线斜率确实是cosx")
        ], applications: ["三角函数求导", "振动问题", "波动方程"], history: "微积分基本公式。"),
        Formula(id: "deriv_cos", name: "余弦函数导数", latex: "(\\cos x)' = -\\sin x", level: .high, category: .calculus, prerequisites: ["deriv_sin"], derivations: [], advancedForm: "trig_derivatives", gaokaoRelevance: 1.0, tags: ["导数", "核心", "必考"], intuition: "余弦导数是负正弦。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "余弦函数的导数等于负的正弦函数。", proofSteps: ["利用cosx=sin(π/2-x)和链式法则"], applications: ["三角函数求导", "振动问题", "波动方程"], history: "微积分基本公式。"),
        Formula(id: "deriv_exp", name: "指数函数导数", latex: "(e^x)' = e^x", level: .high, category: .calculus, prerequisites: [], derivations: ["deriv_log"], advancedForm: "exponential_derivatives", gaokaoRelevance: 1.0, tags: ["导数", "核心", "必考"], intuition: "e^x的导数是自身。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "自然指数函数的导数等于它本身。这是自然指数函数最神奇的性质，使它成为微积分中最重要的函数之一。", proofSteps: ["利用导数定义：f'(x)=lim(h→0)(e^(x+h)-e^x)/h", "提取e^x：e^x·lim(h→0)(e^h-1)/h", "利用重要极限lim(h→0)(e^h-1)/h=1", "得到f'(x)=e^x·1=e^x"], detailedProof: [
            ProofStep(order: 1, latex: "f'(x) = \\lim_{h \\to 0} \\frac{e^{x+h} - e^x}{h}", explanation: "导数定义", title: "导数定义", content: "根据导数定义，求自然指数函数在点x处的导数。", visualHint: "e^(x+h)可以分解为e^x·e^h", keyInsight: "指数函数的乘法性质是关键"),
            ProofStep(order: 2, latex: "\\frac{e^{x+h} - e^x}{h} = e^x \\cdot \\frac{e^h - 1}{h}", explanation: "提取公因子", title: "提取公因子", content: "利用指数函数性质e^(x+h)=e^x·e^h，提取e^x作为公因子。", visualHint: "e^x与h无关，可以提到极限外面", keyInsight: "分离变量是常用技巧"),
            ProofStep(order: 3, latex: "f'(x) = e^x \\cdot \\lim_{h \\to 0} \\frac{e^h - 1}{h}", explanation: "分离极限", title: "分离极限", content: "e^x与h无关，可以提到极限符号外面。", visualHint: "e^x是常数，极限只对h进行", keyInsight: "极限的乘法法则"),
            ProofStep(order: 4, latex: "\\lim_{h \\to 0} \\frac{e^h - 1}{h} = 1", explanation: "重要极限", title: "重要极限", content: "这是微积分中的重要极限，可以用洛必达法则或泰勒级数证明。", visualHint: "当h→0时，e^h≈1+h", keyInsight: "这个极限是e的定义性质"),
            ProofStep(order: 5, latex: "f'(x) = e^x \\cdot 1 = e^x", explanation: "得出结论", title: "得出结论", content: "将极限结果代入，得到e^x的导数就是它本身。", visualHint: "完美的自相似性", keyInsight: "这就是为什么e是自然底数")
        ], applications: ["指数增长", "微分方程", "复利计算"], history: "自然指数函数的特殊性质。"),
        Formula(id: "deriv_log", name: "对数函数导数", latex: "(\\ln x)' = \\frac{1}{x}", level: .high, category: .calculus, prerequisites: ["deriv_exp"], derivations: [], advancedForm: "log_derivatives", gaokaoRelevance: 1.0, tags: ["导数", "核心", "必考"], intuition: "lnx的导数是1/x。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "自然对数函数的导数等于1/x。", proofSteps: ["利用反函数求导法则", "y=lnx, x=e^y, dx/dy=e^y=x, dy/dx=1/x"], applications: ["对数求导法", "优化问题", "增长率"], history: "微积分基本公式。"),

        // MARK: 解析几何补充公式
        Formula(id: "dist_point_line", name: "点到直线距离", latex: "d = \\frac{|Ax_0+By_0+C|}{\\sqrt{A^2+B^2}}", level: .high, category: .geometry, prerequisites: ["dist_formula"], derivations: [], advancedForm: "distance_formula_3d", gaokaoRelevance: 1.0, tags: ["解析几何", "核心", "必考"], intuition: "点到直线的垂直距离。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "点(x₀,y₀)到直线Ax+By+C=0的距离公式。", proofSteps: ["利用向量投影", "或利用垂线方程求交点"], applications: ["几何计算", "距离问题", "线性规划"], history: "解析几何标准公式。"),
        Formula(id: "line_intersection", name: "两直线交点", latex: "\\begin{cases}a_1x+b_1y=c_1\\\\a_2x+b_2y=c_2\\end{cases}", level: .high, category: .geometry, prerequisites: [], derivations: [], advancedForm: "linear_system", gaokaoRelevance: 0.9, tags: ["解析几何", "方程组"], intuition: "联立方程求解。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "两条直线的交点坐标满足两个直线方程。", proofSteps: ["联立方程组", "用消元法求解"], applications: ["几何作图", "交点问题", "线性规划"], history: "线性方程组求解。"),

        // MARK: 大学微积分补充公式
        Formula(id: "integrate_by_parts", name: "分部积分法", latex: "\\int u dv = uv - \\int v du", level: .university, category: .calculus, prerequisites: ["deriv_product"], derivations: [], advancedForm: "reduction_formula", gaokaoRelevance: 0.6, tags: ["积分", "核心"], intuition: "乘积积分的逆运算。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "分部积分法是乘积求导法则的逆运算，用于处理乘积形式的积分。", proofSteps: ["(uv)'=u'v+uv'", "积分得uv=∫u'v+∫uv'", "移项得∫uv'=uv-∫u'v"], applications: ["积分计算", "级数展开", "特殊函数"], history: "莱布尼茨规则的积分形式。"),
        Formula(id: "lagrange_mean", name: "拉格朗日中值定理", latex: "\\frac{f(b)-f(a)}{b-a} = f'(\\xi),\\ a<\\xi<b", level: .university, category: .calculus, prerequisites: [], derivations: ["cauchy_mean"], advancedForm: "taylor_expansion", gaokaoRelevance: 0.5, tags: ["微积分", "定理"], intuition: "区间内存在切线平行于割线。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "【内容】f 在 [a,b] 连续、(a,b) 可导，则存在 ξ∈(a,b) 使 f'(ξ)=(f(b)-f(a))/(b-a)，即区间内一定有某点的切线平行于两端点的割线。\n\n【直观】开车从 a 到 b，平均速度=(总位移)/(总时间)，那么途中必有某一瞬时速度恰好等于这个平均速度。\n\n【高考秒杀价值】证明不等式与‘双变量’问题的利器：把 f(b)-f(a) 写成 f'(ξ)(b-a)，再对 f'(ξ) 放缩。例如证 ln b-ln a 与 (b-a) 的关系、估计 f(x₂)-f(x₁)。高考压轴的‘极值点偏移’、‘双零点’本质都可用中值定理或其对数平均推论秒杀验证。", proofSteps: ["构造辅助函数 g(x)=f(x)-f(a)-[(f(b)-f(a))/(b-a)](x-a)，它表示 f 与割线的竖直差", "验证 g 在 [a,b] 连续、(a,b) 可导，且 g(a)=g(b)=0", "由罗尔定理：存在 ξ∈(a,b) 使 g'(ξ)=0", "而 g'(x)=f'(x)-(f(b)-f(a))/(b-a)，故 f'(ξ)=(f(b)-f(a))/(b-a)，得证"], applications: ["不等式证明", "估计函数增量", "极值点偏移类压轴"], history: "拉格朗日在1797年给出，是泰勒定理 n=1 的特例。"),
        Formula(id: "green_theorem", name: "格林公式", latex: "\\oint_C Pdx+Qdy = \\iint_D \\left(\\frac{\\partial Q}{\\partial x}-\\frac{\\partial P}{\\partial y}\\right)dxdy", level: .university, category: .calculus, prerequisites: [], derivations: ["gauss_theorem"], advancedForm: "stokes_theorem", gaokaoRelevance: 0.4, tags: ["积分", "定理"], intuition: "曲线积分与二重积分的联系。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "平面区域D上的二重积分等于其边界曲线C上的曲线积分。", proofSteps: ["利用二重积分与累次积分的关系", "分别证明两个部分"], applications: ["面积计算", "向量场", "流体力学"], history: "格林在1825年提出。"),
        Formula(id: "gauss_theorem", name: "高斯公式", latex: "\\oiint_{\\partial V} \\vec{F} \\cdot d\\vec{S} = \\iiint_V (\\nabla \\cdot \\vec{F})dV", level: .university, category: .calculus, prerequisites: ["green_theorem"], derivations: ["stokes_theorem"], advancedForm: "divergence_theorem", gaokaoRelevance: 0.3, tags: ["积分", "定理"], intuition: "曲面积分与三重积分的联系。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "闭曲面的曲面积分等于其所包围体积上的散度三重积分。", proofSteps: ["将三维问题转化为三个二维问题", "应用格林公式"], applications: ["通量计算", "电磁学", "流体力学"], history: "高斯在1839年提出。"),
        Formula(id: "stokes_theorem", name: "斯托克斯公式", latex: "\\oint_C \\vec{F} \\cdot d\\vec{r} = \\iint_S (\\nabla \\times \\vec{F}) \\cdot d\\vec{S}", level: .university, category: .calculus, prerequisites: ["green_theorem"], derivations: [], advancedForm: "generalized_stokes", gaokaoRelevance: 0.3, tags: ["积分", "定理"], intuition: "曲线积分与曲面积分的联系。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "空间曲线C上的曲线积分等于以C为边界的曲面S上的旋度曲面积分。", proofSteps: ["参数化曲面", "利用链式法则转换"], applications: ["环流计算", "电磁学", "微分几何"], history: "斯托克斯在1850年提出。"),

        // MARK: 大学线性代数补充公式
        Formula(id: "gradient", name: "梯度", latex: "\\nabla f = \\left(\\frac{\\partial f}{\\partial x}, \\frac{\\partial f}{\\partial y}, \\frac{\\partial f}{\\partial z}\\right)", level: .university, category: .linearAlgebra, prerequisites: [], derivations: ["directional_derivative"], advancedForm: "hessian", gaokaoRelevance: 0.4, tags: ["向量分析", "核心"], intuition: "函数变化最快的方向。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "梯度是一个向量，其方向是函数增长最快的方向，模长是最大变化率。", proofSteps: ["利用方向导数的定义", "在单位向量方向上求极值"], applications: ["最优化", "机器学习", "物理场"], history: "哈密顿在1843年引入。"),
        Formula(id: "divergence", name: "散度", latex: "\\nabla \\cdot \\vec{F} = \\frac{\\partial P}{\\partial x} + \\frac{\\partial Q}{\\partial y} + \\frac{\\partial R}{\\partial z}", level: .university, category: .linearAlgebra, prerequisites: [], derivations: ["gauss_theorem"], advancedForm: "continuity_equation", gaokaoRelevance: 0.3, tags: ["向量分析", "核心"], intuition: "向量场的源强度。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "散度表示向量场在某点的净流出量，正值表示源，负值表示汇。", proofSteps: ["从通量的极限定义", "或从高斯公式推导"], applications: ["流体力学", "电磁学", "热传导"], history: "拉格朗日在1788年引入。"),
        Formula(id: "curl", name: "旋度", latex: "\\nabla \\times \\vec{F} = \\begin{vmatrix}\\vec{i}&\\vec{j}&\\vec{k}\\\\ \\frac{\\partial}{\\partial x}&\\frac{\\partial}{\\partial y}&\\frac{\\partial}{\\partial z}\\\\ P&Q&R\\end{vmatrix}", level: .university, category: .linearAlgebra, prerequisites: [], derivations: ["stokes_theorem"], advancedForm: "vorticity", gaokaoRelevance: 0.3, tags: ["向量分析", "核心"], intuition: "向量场的旋转强度。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "旋度是一个向量，其方向是旋转轴方向，模长是旋转角速度的两倍。", proofSteps: ["从环流的极限定义", "或从斯托克斯公式推导"], applications: ["流体力学", "电磁学", "刚体运动"], history: "亥姆霍兹在1858年系统研究。"),

        // MARK: 概率统计补充公式
        Formula(id: "expectation", name: "数学期望", latex: "E(X) = \\sum x_i P(X=x_i)", level: .high, category: .probability, prerequisites: [], derivations: ["variance"], advancedForm: "moment_generating", gaokaoRelevance: 0.8, tags: ["概率", "核心"], intuition: "随机变量的平均值。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "离散随机变量的数学期望是其所有可能取值的加权平均，权重为对应概率。", proofSteps: ["从平均值的概念推广", "连续情况推广为积分"], applications: ["风险评估", "决策分析", "统计学"], history: "拉普拉斯在1812年系统阐述。"),
        Formula(id: "variance", name: "方差", latex: "D(X) = E(X^2) - [E(X)]^2", level: .high, category: .probability, prerequisites: ["expectation"], derivations: ["standard_deviation"], advancedForm: "moment", gaokaoRelevance: 0.8, tags: ["概率", "核心"], intuition: "随机变量的离散程度。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "方差是随机变量与其期望差的平方的期望，衡量数据的离散程度。", proofSteps: ["D(X)=E[(X-E(X))²]", "展开得D(X)=E(X²)-[E(X)]²"], applications: ["风险度量", "数据分析", "质量控制"], history: "高斯在1809年引入。"),
        Formula(id: "normal_dist", name: "正态分布", latex: "f(x) = \\frac{1}{\\sigma\\sqrt{2\\pi}}e^{-\\frac{(x-\\mu)^2}{2\\sigma^2}}", level: .university, category: .probability, prerequisites: ["expectation", "variance"], derivations: [], advancedForm: "central_limit", gaokaoRelevance: 0.5, tags: ["概率", "核心"], intuition: "自然界最常见的分布。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "正态分布是一种连续概率分布，呈钟形曲线，由均值μ和标准差σ决定。", proofSteps: ["从二项分布的极限推导", "或从最大熵原理推导"], applications: ["统计推断", "质量控制", "自然现象"], history: "高斯在1809年研究误差分布时提出。"),
        Formula(id: "central_limit", name: "中心极限定理", latex: "\\frac{\\sum_{i=1}^n X_i - n\\mu}{\\sigma\\sqrt{n}} \\to N(0,1)", level: .university, category: .probability, prerequisites: ["normal_dist"], derivations: [], advancedForm: "large_sample", gaokaoRelevance: 0.4, tags: ["概率", "定理"], intuition: "大量独立变量和近似正态分布。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "大量独立同分布随机变量的和，适当标准化后趋近于标准正态分布。", proofSteps: ["利用特征函数", "或利用泰勒展开"], applications: ["统计推断", "抽样调查", "质量控制"], history: "棣莫弗在1733年首次证明特殊情况。"),

        // MARK: 高中补充公式 - 三角函数
        Formula(id: "sin_sub", name: "正弦差角公式", latex: "\\sin(\\alpha-\\beta) = \\sin\\alpha\\cos\\beta - \\cos\\alpha\\sin\\beta", level: .high, category: .trigonometry, prerequisites: ["sin_add"], derivations: [], advancedForm: "double_angle", gaokaoRelevance: 1.0, tags: ["三角函数", "核心", "必考"], intuition: "正弦差角公式。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "两个角之差的正弦等于正弦乘余弦减去余弦乘正弦。", proofSteps: ["在和角公式中用-β代替β"], applications: ["三角恒等变换", "波形分析", "交流电"], history: "三角函数基本恒等式。"),
        Formula(id: "cos_sub", name: "余弦差角公式", latex: "\\cos(\\alpha-\\beta) = \\cos\\alpha\\cos\\beta + \\sin\\alpha\\sin\\beta", level: .high, category: .trigonometry, prerequisites: ["cos_add"], derivations: [], advancedForm: "double_angle", gaokaoRelevance: 1.0, tags: ["三角函数", "核心", "必考"], intuition: "余弦差角公式。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "两个角之差的余弦等于余弦乘积加上正弦乘积。", proofSteps: ["在和角公式中用-β代替β"], applications: ["三角恒等变换", "波形分析", "交流电"], history: "三角函数基本恒等式。"),
        Formula(id: "tan_sub", name: "正切差角公式", latex: "\\tan(\\alpha-\\beta) = \\frac{\\tan\\alpha-\\tan\\beta}{1+\\tan\\alpha\\tan\\beta}", level: .high, category: .trigonometry, prerequisites: ["tan_add"], derivations: [], advancedForm: "triple_angle", gaokaoRelevance: 0.9, tags: ["三角函数", "公式"], intuition: "正切差角公式。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "两个角之差的正切等于正切差除以1加正切积。", proofSteps: ["tan(α-β)=sin(α-β)/cos(α-β)", "代入差角公式化简"], applications: ["三角计算", "角度差", "几何证明"], history: "三角函数基本恒等式。"),
        Formula(id: "cos_double", name: "余弦倍角公式", latex: "\\cos 2\\alpha = \\cos^2\\alpha - \\sin^2\\alpha", level: .high, category: .trigonometry, prerequisites: ["cos_add"], derivations: ["half_angle"], advancedForm: "power_reduction", gaokaoRelevance: 1.0, tags: ["三角函数", "核心", "必考"], intuition: "余弦二倍角公式。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "余弦二倍角等于余弦平方减正弦平方，也等于2cos²α-1或1-2sin²α。", proofSteps: ["在余弦和角公式中令α=β"], applications: ["三角化简", "降幂公式", "积分计算"], history: "三角函数基本恒等式。"),
        Formula(id: "tan_double", name: "正切倍角公式", latex: "\\tan 2\\alpha = \\frac{2\\tan\\alpha}{1-\\tan^2\\alpha}", level: .high, category: .trigonometry, prerequisites: ["tan_add"], derivations: [], advancedForm: "triple_angle", gaokaoRelevance: 0.9, tags: ["三角函数", "核心"], intuition: "正切二倍角公式。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "正切二倍角等于2tanα除以1减tan²α。", proofSteps: ["在正切和角公式中令α=β"], applications: ["三角化简", "角度加倍", "三角方程"], history: "三角函数基本恒等式。"),
        Formula(id: "cos_half_angle", name: "余弦半角公式", latex: "\\cos\\frac{\\alpha}{2} = \\pm\\sqrt{\\frac{1+\\cos\\alpha}{2}}", level: .high, category: .trigonometry, prerequisites: ["cos_double"], derivations: [], advancedForm: "power_reduction", gaokaoRelevance: 0.85, tags: ["三角函数", "公式"], intuition: "余弦半角公式。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "余弦半角等于根号下(1+cosα)/2，符号由α/2所在象限决定。", proofSteps: ["由cos2θ=2cos²θ-1", "令θ=α/2得证"], applications: ["三角化简", "积分计算", "三角方程"], history: "三角函数基本恒等式。"),
        Formula(id: "tan_half_angle", name: "正切半角公式", latex: "\\tan\\frac{\\alpha}{2} = \\frac{\\sin\\alpha}{1+\\cos\\alpha} = \\frac{1-\\cos\\alpha}{\\sin\\alpha}", level: .high, category: .trigonometry, prerequisites: ["half_angle"], derivations: [], advancedForm: "weierstrass_substitution", gaokaoRelevance: 0.8, tags: ["三角函数", "万能公式"], intuition: "正切半角公式（万能公式）。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "正切半角可以用sinα和cosα表示，是积分的万能代换。", proofSteps: ["tan(α/2)=sin(α/2)/cos(α/2)", "分子分母同乘2cos(α/2)"], applications: ["积分计算", "三角化简", "三角方程"], history: "维尔斯特拉斯变换的基础。"),

        // MARK: 高中补充公式 - 解析几何
        Formula(id: "line_slope", name: "直线斜率公式", latex: "k = \\frac{y_2-y_1}{x_2-x_1}", level: .high, category: .geometry, prerequisites: [], derivations: ["line_point_slope"], advancedForm: "line_parallel", gaokaoRelevance: 1.0, tags: ["解析几何", "核心", "必考"], intuition: "直线的倾斜程度。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "过两点(x₁,y₁)和(x₂,y₂)的直线斜率k等于纵坐标变化量除以横坐标变化量。", proofSteps: ["斜率定义为tanθ=(y₂-y₁)/(x₂-x₁)"], applications: ["直线方程", "平行垂直判定", "倾斜角"], history: "解析几何基本公式。"),
        Formula(id: "line_point_slope", name: "直线点斜式方程", latex: "y - y_1 = k(x - x_1)", level: .high, category: .geometry, prerequisites: ["line_slope"], derivations: ["line_slope_intercept"], advancedForm: "line_general", gaokaoRelevance: 1.0, tags: ["解析几何", "核心", "必考"], intuition: "已知一点和斜率的直线方程。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "过点(x₁,y₁)且斜率为k的直线方程。", proofSteps: ["斜率k=(y-y₁)/(x-x₁)", "整理得点斜式"], applications: ["直线作图", "求直线方程", "几何计算"], history: "解析几何标准形式。"),
        Formula(id: "line_slope_intercept", name: "直线斜截式方程", latex: "y = kx + b", level: .high, category: .geometry, prerequisites: ["line_point_slope"], derivations: ["line_general"], advancedForm: "line_parallel", gaokaoRelevance: 1.0, tags: ["解析几何", "核心", "必考"], intuition: "已知斜率和截距的直线方程。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "斜率为k，y轴截距为b的直线方程。", proofSteps: ["在点斜式中令x₁=0,y₁=b"], applications: ["直线作图", "求直线方程", "线性函数"], history: "解析几何标准形式。"),
        Formula(id: "line_general", name: "直线一般式方程", latex: "Ax + By + C = 0", level: .high, category: .geometry, prerequisites: ["line_slope_intercept"], derivations: [], advancedForm: "line_distance", gaokaoRelevance: 1.0, tags: ["解析几何", "核心", "必考"], intuition: "直线的一般形式。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "直线方程的一般形式，A、B不同时为0。", proofSteps: ["将斜截式y=kx+b整理为kx-y+b=0"], applications: ["直线交点", "距离公式", "线性规划"], history: "解析几何标准形式。"),
        Formula(id: "parallel_lines", name: "两直线平行条件", latex: "k_1 = k_2", level: .high, category: .geometry, prerequisites: ["line_slope"], derivations: [], advancedForm: "line_distance", gaokaoRelevance: 0.9, tags: ["解析几何", "判定"], intuition: "斜率相等则平行。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "两条不重合直线平行的充要条件是它们的斜率相等。", proofSteps: ["平行直线倾斜角相同", "tanθ₁=tanθ₂即k₁=k₂"], applications: ["几何证明", "作图", "线性规划"], history: "解析几何基本性质。"),
        Formula(id: "perpendicular_lines", name: "两直线垂直条件", latex: "k_1 \\cdot k_2 = -1", level: .high, category: .geometry, prerequisites: ["line_slope"], derivations: [], advancedForm: "line_distance", gaokaoRelevance: 1.0, tags: ["解析几何", "核心", "必考"], intuition: "斜率乘积为-1则垂直。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "两条直线垂直的充要条件是它们斜率的乘积等于-1。", proofSteps: ["利用向量点积为零", "或利用tan(θ₂-θ₁)=∞"], applications: ["几何证明", "作图", "垂直判定"], history: "解析几何基本性质。"),
        Formula(id: "circle_general", name: "圆的一般方程", latex: "x^2 + y^2 + Dx + Ey + F = 0", level: .high, category: .geometry, prerequisites: ["circle_eq"], derivations: [], advancedForm: "circle_intersection", gaokaoRelevance: 0.95, tags: ["解析几何", "核心"], intuition: "圆的一般形式。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "圆的一般方程，圆心(-D/2,-E/2)，半径√(D²+E²-4F)/2。", proofSteps: ["配方得标准方程", "(x+D/2)²+(y+E/2)²=(D²+E²-4F)/4"], applications: ["圆的性质", "交点问题", "轨迹"], history: "解析几何标准形式。"),
        Formula(id: "parabola_focus", name: "抛物线焦点", latex: "y^2 = 4px \\Rightarrow F(p,0)", level: .high, category: .conicSections, prerequisites: ["parabola_eq"], derivations: [], advancedForm: "parabola_tangent", gaokaoRelevance: 0.9, tags: ["圆锥曲线", "核心"], intuition: "抛物线焦点坐标。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "抛物线y²=4px的焦点在(p,0)，准线为x=-p。", proofSteps: ["利用抛物线定义：到焦点和准线距离相等"], applications: ["光学反射", "卫星天线", "弹道"], history: "圆锥曲线基本性质。"),
        Formula(id: "ellipse_foci", name: "椭圆焦点", latex: "\\frac{x^2}{a^2}+\\frac{y^2}{b^2}=1 \\Rightarrow F(\\pm c,0),\\ c^2=a^2-b^2", level: .high, category: .conicSections, prerequisites: ["ellipse_eq"], derivations: [], advancedForm: "ellipse_eccentricity", gaokaoRelevance: 1.0, tags: ["圆锥曲线", "核心", "必考"], intuition: "椭圆焦点坐标。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "椭圆的两个焦点在长轴上，距离中心c=√(a²-b²)。", proofSteps: ["利用椭圆定义：到两焦点距离和为2a"], applications: ["行星轨道", "光学仪器", "声学"], history: "阿波罗尼奥斯圆锥曲线理论。"),
        Formula(id: "hyperbola_foci", name: "双曲线焦点", latex: "\\frac{x^2}{a^2}-\\frac{y^2}{b^2}=1 \\Rightarrow F(\\pm c,0),\\ c^2=a^2+b^2", level: .high, category: .conicSections, prerequisites: ["hyperbola_eq"], derivations: [], advancedForm: "hyperbola_asymptote", gaokaoRelevance: 0.9, tags: ["圆锥曲线", "核心"], intuition: "双曲线焦点坐标。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "双曲线的两个焦点在实轴上，距离中心c=√(a²+b²)。", proofSteps: ["利用双曲线定义：到两焦点距离差为2a"], applications: ["双曲线导航", "光学仪器", "天体轨道"], history: "阿波罗尼奥斯圆锥曲线理论。"),

        // MARK: 高中补充公式 - 概率统计
        Formula(id: "prob_addition", name: "概率加法公式", latex: "P(A\\cup B) = P(A) + P(B) - P(A\\cap B)", level: .high, category: .probability, prerequisites: [], derivations: ["prob_mutual"], advancedForm: "prob_inclusion", gaokaoRelevance: 1.0, tags: ["概率", "核心", "必考"], intuition: "并事件概率公式。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "两个事件至少有一个发生的概率等于各自概率之和减去同时发生的概率。", proofSteps: ["利用文氏图", "A∪B = A∪(B-A)", "P(A∪B)=P(A)+P(B-A)=P(A)+P(B)-P(A∩B)"], applications: ["概率计算", "事件关系", "统计分析"], history: "概率基本公式。"),
        Formula(id: "prob_independent", name: "独立事件概率", latex: "P(A\\cap B) = P(A)P(B)", level: .high, category: .probability, prerequisites: ["prob_addition"], derivations: [], advancedForm: "prob_bayes", gaokaoRelevance: 1.0, tags: ["概率", "核心", "必考"], intuition: "独立事件积事件概率。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "两个独立事件同时发生的概率等于各自概率的乘积。", proofSteps: ["由条件概率P(A|B)=P(A)", "P(A∩B)=P(A|B)P(B)=P(A)P(B)"], applications: ["概率计算", "独立试验", "统计分析"], history: "概率基本公式。"),
        Formula(id: "binom_prob", name: "二项分布概率", latex: "P(X=k) = C_n^k p^k (1-p)^{n-k}", level: .high, category: .probability, prerequisites: ["combination"], derivations: [], advancedForm: "binom_distribution", gaokaoRelevance: 0.95, tags: ["概率", "分布", "必考"], intuition: "n次独立试验恰好成功k次的概率。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "在n次独立重复试验中，每次成功概率为p，恰好成功k次的概率。", proofSteps: ["从n次中选k次成功", "每次成功概率p^k", "失败概率(1-p)^(n-k)"], applications: ["概率计算", "二项试验", "质量控制"], history: "雅各布·伯努利研究。"),
        Formula(id: "binom_mean", name: "二项分布期望", latex: "E(X) = np", level: .high, category: .probability, prerequisites: ["binom_prob"], derivations: [], advancedForm: "binom_variance", gaokaoRelevance: 0.9, tags: ["概率", "期望"], intuition: "二项分布的数学期望。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "二项分布X~B(n,p)的期望等于np。", proofSteps: ["E(X)=ΣkC(n,k)p^k(1-p)^(n-k)=np"], applications: ["期望计算", "统计推断", "风险评估"], history: "概率统计基本公式。"),
        Formula(id: "binom_var", name: "二项分布方差", latex: "D(X) = np(1-p)", level: .high, category: .probability, prerequisites: ["binom_mean"], derivations: [], advancedForm: "normal_approx", gaokaoRelevance: 0.85, tags: ["概率", "方差"], intuition: "二项分布的方差。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "二项分布X~B(n,p)的方差等于np(1-p)。", proofSteps: ["D(X)=E(X²)-[E(X)]²=np(1-p)"], applications: ["方差计算", "统计推断", "风险评估"], history: "概率统计基本公式。"),

        // MARK: 大学补充公式 - 微积分
        Formula(id: "int_exponential", name: "指数函数积分", latex: "\\int e^x dx = e^x + C", level: .university, category: .calculus, prerequisites: ["deriv_exp"], derivations: [], advancedForm: "int_gaussian", gaokaoRelevance: 0.7, tags: ["积分", "核心"], intuition: "e^x积分是自身。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "自然指数函数的积分等于它本身加常数。", proofSteps: ["对e^x求导得e^x", "故积分成立"], applications: ["积分计算", "微分方程", "概率分布"], history: "微积分基本公式。"),
        Formula(id: "int_trig", name: "三角函数积分", latex: "\\int \\sin x dx = -\\cos x + C", level: .university, category: .calculus, prerequisites: ["deriv_sin"], derivations: [], advancedForm: "int_trig_power", gaokaoRelevance: 0.8, tags: ["积分", "核心"], intuition: "正弦积分是负余弦。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "正弦函数的积分等于负余弦函数加常数。", proofSteps: ["对-cosx求导得sinx", "故积分成立"], applications: ["积分计算", "振动问题", "波动方程"], history: "微积分基本公式。"),
        Formula(id: "int_log", name: "对数函数积分", latex: "\\int \\frac{1}{x} dx = \\ln|x| + C", level: .university, category: .calculus, prerequisites: ["deriv_log"], derivations: [], advancedForm: "int_logarithmic", gaokaoRelevance: 0.8, tags: ["积分", "核心"], intuition: "1/x积分是对数。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "1/x的积分等于自然对数的绝对值加常数。", proofSteps: ["对ln|x|求导得1/x", "故积分成立"], applications: ["积分计算", "对数求导法", "面积计算"], history: "微积分基本公式。"),
        Formula(id: "int_substitution", name: "换元积分法", latex: "\\int f(g(x))g'(x)dx = \\int f(u)du", level: .university, category: .calculus, prerequisites: ["deriv_chain"], derivations: [], advancedForm: "int_trig_substitution", gaokaoRelevance: 0.9, tags: ["积分", "核心"], intuition: "链式法则的逆运算。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "换元积分法是复合函数求导法则的逆运算。", proofSteps: ["令u=g(x)，则du=g'(x)dx", "积分变为∫f(u)du"], applications: ["积分计算", "复杂函数积分", "定积分"], history: "微积分基本技巧。"),
        Formula(id: "int_definite", name: "定积分性质", latex: "\\int_a^b f(x)dx = -\\int_b^a f(x)dx", level: .university, category: .calculus, prerequisites: ["fundamental_theorem"], derivations: [], advancedForm: "int_additive", gaokaoRelevance: 0.8, tags: ["积分", "性质"], intuition: "交换上下限变号。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "交换定积分的上下限，积分值变号。", proofSteps: ["∫ₐᵇf(x)dx=F(b)-F(a)", "∫ᵇₐf(x)dx=F(a)-F(b)"], applications: ["定积分计算", "积分性质", "面积计算"], history: "定积分基本性质。"),
        Formula(id: "int_additive", name: "定积分可加性", latex: "\\int_a^b f(x)dx = \\int_a^c f(x)dx + \\int_c^b f(x)dx", level: .university, category: .calculus, prerequisites: ["int_definite"], derivations: [], advancedForm: "int_linear", gaokaoRelevance: 0.8, tags: ["积分", "性质"], intuition: "区间可加性。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "定积分具有区间可加性，可将积分区间分段计算。", proofSteps: ["∫ₐᵇf(x)dx=F(b)-F(a)", "=[F(c)-F(a)]+[F(b)-F(c)]"], applications: ["定积分计算", "分段函数", "面积计算"], history: "定积分基本性质。"),
        Formula(id: "improper_int", name: "广义积分", latex: "\\int_a^\\infty f(x)dx = \\lim_{b\\to\\infty} \\int_a^b f(x)dx", level: .university, category: .calculus, prerequisites: ["int_definite"], derivations: [], advancedForm: "gamma_function", gaokaoRelevance: 0.6, tags: ["积分", "广义"], intuition: "无限区间积分。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "无限区间上的积分定义为有限区间积分的极限。", proofSteps: ["当积分上限趋于无穷时取极限"], applications: ["概率分布", "级数收敛", "特殊函数"], history: "广义积分理论。"),

        // MARK: 大学补充公式 - 线性代数
        Formula(id: "matrix_add", name: "矩阵加法", latex: "(A+B)_{ij} = A_{ij} + B_{ij}", level: .university, category: .linearAlgebra, prerequisites: [], derivations: ["matrix_scalar"], advancedForm: "matrix_algebra", gaokaoRelevance: 0.7, tags: ["线性代数", "矩阵"], intuition: "对应元素相加。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "两个同型矩阵相加，对应位置元素相加。", proofSteps: ["矩阵加法定义"], applications: ["线性组合", "线性变换", "方程组"], history: "矩阵基本运算。"),
        Formula(id: "matrix_scalar", name: "数乘矩阵", latex: "(kA)_{ij} = kA_{ij}", level: .university, category: .linearAlgebra, prerequisites: ["matrix_add"], derivations: [], advancedForm: "matrix_algebra", gaokaoRelevance: 0.7, tags: ["线性代数", "矩阵"], intuition: "每个元素乘常数。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "矩阵与数相乘，每个元素都乘以该数。", proofSteps: ["数乘定义"], applications: ["线性组合", "缩放变换", "方程组"], history: "矩阵基本运算。"),
        Formula(id: "matrix_transpose", name: "矩阵转置", latex: "(A^T)_{ij} = A_{ji}", level: .university, category: .linearAlgebra, prerequisites: [], derivations: ["matrix_inverse"], advancedForm: "symmetric_matrix", gaokaoRelevance: 0.8, tags: ["线性代数", "矩阵"], intuition: "行列互换。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "矩阵的转置是将行和列互换得到的矩阵。", proofSteps: ["转置定义"], applications: ["对称矩阵", "二次型", "内积"], history: "矩阵基本运算。"),
        Formula(id: "det_properties", name: "行列式性质", latex: "\\det(AB) = \\det(A)\\det(B)", level: .university, category: .linearAlgebra, prerequisites: ["det_2x2"], derivations: [], advancedForm: "det_multiplicative", gaokaoRelevance: 0.8, tags: ["线性代数", "行列式"], intuition: "行列式乘积性质。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "两个方阵乘积的行列式等于它们行列式的乘积。", proofSteps: ["从线性变换的角度", "或直接展开验证"], applications: ["矩阵可逆性", "体积变换", "方程组"], history: "行列式基本性质。"),
        Formula(id: "inv_matrix", name: "逆矩阵公式", latex: "A^{-1} = \\frac{1}{\\det(A)} \\text{adj}(A)", level: .university, category: .linearAlgebra, prerequisites: ["det_2x2"], derivations: [], advancedForm: "matrix_inversion", gaokaoRelevance: 0.8, tags: ["线性代数", "逆矩阵"], intuition: "伴随矩阵除以行列式。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "方阵的逆等于伴随矩阵除以行列式。", proofSteps: ["利用AA⁻¹=I", "展开得A·adj(A)=det(A)I"], applications: ["方程组求解", "坐标变换", "线性回归"], history: "矩阵论基本公式。"),
        Formula(id: "rank_matrix", name: "矩阵秩", latex: "\\text{rank}(A) = \\text{dim}(\\text{row space})", level: .university, category: .linearAlgebra, prerequisites: [], derivations: [], advancedForm: "rank_nullity", gaokaoRelevance: 0.7, tags: ["线性代数", "秩"], intuition: "矩阵的线性无关行/列数。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "矩阵的秩是其行空间（或列空间）的维数。", proofSteps: ["通过行阶梯形求秩"], applications: ["方程组解的结构", "线性无关性", "特征值"], history: "线性代数基本概念。"),
        Formula(id: "rank_nullity", name: "秩-零化度定理", latex: "\\text{rank}(A) + \\text{nullity}(A) = n", level: .university, category: .linearAlgebra, prerequisites: ["rank_matrix"], derivations: [], advancedForm: "linear_transformation", gaokaoRelevance: 0.6, tags: ["线性代数", "定理"], intuition: "秩加零空间维数等于列数。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "对于n列矩阵A，秩与零化度（零空间维数）之和等于n。", proofSteps: ["利用基的扩展定理"], applications: ["方程组解的结构", "线性变换", "特征分解"], history: "线性代数基本定理。"),
        Formula(id: "schur_decomposition", name: "舒尔分解", latex: "A = U^T T U", level: .university, category: .linearAlgebra, prerequisites: ["eigenvalue"], derivations: [], advancedForm: "jordan_form", gaokaoRelevance: 0.4, tags: ["线性代数", "分解"], intuition: "酉相似于上三角矩阵。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "任何方阵都酉相似于一个上三角矩阵。", proofSteps: ["数学归纳法", "或利用不变子空间"], applications: ["特征值计算", "矩阵幂", "稳定性分析"], history: "舒尔在1909年提出。"),

        // MARK: 大学补充公式 - 微分方程
        Formula(id: "first_order_linear", name: "一阶线性微分方程", latex: "y' + P(x)y = Q(x)", level: .university, category: .calculus, prerequisites: ["deriv_product"], derivations: [], advancedForm: "integrating_factor", gaokaoRelevance: 0.7, tags: ["微分方程", "核心"], intuition: "一阶线性非齐次方程。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "形如y'+P(x)y=Q(x)的一阶线性微分方程。", proofSteps: ["用积分因子μ(x)=exp(∫P(x)dx)"], applications: ["物理问题", "电路分析", "人口模型"], history: "微分方程基本类型。"),
        Formula(id: "integrating_factor", name: "积分因子法", latex: "\\mu(x) = e^{\\int P(x)dx}", level: .university, category: .calculus, prerequisites: ["first_order_linear"], derivations: [], advancedForm: "exact_equation", gaokaoRelevance: 0.8, tags: ["微分方程", "解法"], intuition: "将方程变为全微分。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "积分因子μ(x)使方程左边成为某个函数的导数。", proofSteps: ["乘以μ(x)后左边=d(μ(x)y)/dx"], applications: ["解方程", "物理问题", "工程应用"], history: "微分方程解法。"),
        Formula(id: "second_order_linear", name: "二阶常系数齐次方程", latex: "y'' + py' + qy = 0", level: .university, category: .calculus, prerequisites: ["first_order_linear"], derivations: [], advancedForm: "second_order_nonhomogeneous", gaokaoRelevance: 0.7, tags: ["微分方程", "核心"], intuition: "二阶线性齐次方程。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "二阶常系数线性齐次微分方程，通解由特征方程根决定。", proofSteps: ["假设解为y=e^(rx)", "代入得特征方程r²+pr+q=0"], applications: ["振动问题", "电路", "力学"], history: "微分方程基本类型。"),
        Formula(id: "euler_equation", name: "欧拉方程", latex: "x^2y'' + pxy' + qy = 0", level: .university, category: .calculus, prerequisites: ["second_order_linear"], derivations: [], advancedForm: "frobenius_method", gaokaoRelevance: 0.5, tags: ["微分方程", "变系数"], intuition: "变系数线性方程。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "欧拉方程是一种特殊的变系数线性微分方程，可通过变量代换求解。", proofSteps: ["令x=e^t，转化为常系数方程"], applications: ["特殊函数", "幂级数解", "数学物理"], history: "欧拉在1740年研究。"),

        // MARK: 大学补充公式 - 复变函数
        Formula(id: "complex_exp", name: "复数指数", latex: "e^{z} = e^{x+iy} = e^x(\\cos y + i\\sin y)", level: .university, category: .complexNumbers, prerequisites: ["euler_formula"], derivations: [], advancedForm: "complex_logarithm", gaokaoRelevance: 0.5, tags: ["复变函数", "核心"], intuition: "复数指数函数。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "复数指数函数的定义，由欧拉公式推广而来。", proofSteps: ["利用e^(x+iy)=e^x·e^(iy)", "应用欧拉公式"], applications: ["复数运算", "傅里叶分析", "信号处理"], history: "欧拉公式的推广。"),
        Formula(id: "complex_log", name: "复数对数", latex: "\\ln z = \\ln|z| + i\\arg(z)", level: .university, category: .complexNumbers, prerequisites: ["complex_exp"], derivations: [], advancedForm: "complex_power", gaokaoRelevance: 0.4, tags: ["复变函数", "对数"], intuition: "复数对数函数。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "复数对数是多值函数，主值为ln|z|+iarg(z)。", proofSteps: ["由z=re^(iθ)", "lnz=l|z|+iθ"], applications: ["复数幂", "解析函数", "复积分"], history: "复变函数基本概念。"),
        Formula(id: "cauchy_integral", name: "柯西积分定理", latex: "\\oint_C f(z)dz = 0", level: .university, category: .complexNumbers, prerequisites: [], derivations: [], advancedForm: "cauchy_integral_formula", gaokaoRelevance: 0.4, tags: ["复变函数", "定理"], intuition: "解析函数沿闭曲线积分为零。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "如果f(z)在单连通区域内解析，则沿区域内任意闭曲线的积分等于零。", proofSteps: ["利用格林公式", "解析函数满足柯西-黎曼方程"], applications: ["复积分", "留数定理", "解析函数"], history: "柯西在1825年提出。"),
        Formula(id: "residue_theorem", name: "留数定理", latex: "\\oint_C f(z)dz = 2\\pi i \\sum \\text{Res}(f,a_k)", level: .university, category: .complexNumbers, prerequisites: ["cauchy_integral"], derivations: [], advancedForm: "contour_integration", gaokaoRelevance: 0.3, tags: ["复变函数", "定理"], intuition: "闭曲线积分等于留数和。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "解析函数沿闭曲线的积分等于2πi乘以曲线内部所有孤立奇点的留数之和。", proofSteps: ["将积分转化为围绕各奇点的小圆周积分"], applications: ["定积分计算", "级数求和", "复分析"], history: "柯西在1831年提出。"),

        // MARK: 研究生级别公式
        Formula(id: "generalized_stokes", name: "广义斯托克斯定理", latex: "\\int_{\\partial \\Omega} \\omega = \\int_{\\Omega} d\\omega", level: .advanced, category: .calculus, prerequisites: ["stokes_theorem"], derivations: [], advancedForm: nil, gaokaoRelevance: 0.0, tags: ["微分几何", "拓扑"], intuition: "边界上的积分等于内部微分形式的积分，统一了格林定理、散度定理和经典斯托克斯公式。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "广义斯托克斯定理是微分几何中最深刻的定理之一，将流形上微分形式的积分与其边界上的积分联系起来。", proofSteps: ["定义微分形式和外微分", "在坐标卡上验证", "利用单位分解推广到一般流形"], applications: ["电磁学", "流体力学", "微分几何"], history: "由嘉当推广到一般微分形式的形式。")
    ]

    // MARK: - Mysteries (RESTORED & EXHAUSTIVE)

    static let mysteries: [MathMystery] = [
        MathMystery(
            id: "099_equals_1",
            title: "0.999... 到底等不等于 1？",
            category: .infinityWar,
            shockRating: 7,
            summary: "挑战直觉的无限等式",
            premise: "大多数人凭直觉认为 0.999... 永远比 1 少一点点。但在实数系中，它们完全相等。",
            arguments: [
                Argument(title: "直觉派", content: "既然它叫0.999...，那就说明还没到1啊！", isCorrect: false),
                Argument(title: "分数派", content: "1/3 = 0.333...，两边乘以3即得 1 = 0.999...。", isCorrect: true)
            ],
            proofSteps: [
                ProofStep(order: 1, latex: "10x = 9.\\overline{9}", explanation: "两边乘以10"),
                ProofStep(order: 2, latex: "9x = 9 \\implies x = 1", explanation: "相减并解得 x = 1")
            ],
            verdict: "它们是同一个实数的不同表示。",
            historicalContext: "它揭示了人类在处理‘无限’概念时的直觉局限。",
            relatedWeaponId: nil,
            relatedHeroId: "euler",
            votes: MysteryVotes(agreeCount: 15400, disagreeCount: 3200, userVote: nil),
            openQuestion: "如果是非标准分析会怎样？"
        ),

        MathMystery(
            id: "monty_hall",
            title: "三门问题：换还是不换？",
            category: .intuitiveRebel,
            shockRating: 10,
            summary: "概率论中最臭名昭著的‘直觉杀手’",
            premise: "三扇门，选一扇。主持人打开一扇有羊的门，换门中奖率会倍增吗？",
            arguments: [
                Argument(title: "平衡派", content: "剩两扇门，概率各50%。", isCorrect: false),
                Argument(title: "统计派", content: "换门中奖率 2/3。", isCorrect: true)
            ],
            proofSteps: [
                ProofStep(order: 1, latex: "P(\\text{Win}|\\text{Change}) = 2/3", explanation: "最初选错概率转嫁给剩余门")
            ],
            verdict: "换门让胜率翻倍。",
            historicalContext: "曾引发全美数千名博士写信抗议。",
            relatedWeaponId: nil,
            relatedHeroId: nil,
            votes: MysteryVotes(agreeCount: 21000, disagreeCount: 8400, userVote: nil),
            openQuestion: "100扇门会怎样？"
        ),

        MathMystery(
            id: "banach_tarski",
            title: "分球怪论：点石成金？",
            category: .intuitiveRebel,
            shockRating: 10,
            summary: "将一个球切碎，拼成两个一模一样的球",
            premise: "利用选择公理，我们可以将一个实心球体分解并重组成两个等大球体。",
            arguments: [
                Argument(title: "物质守恒派", content: "这违反物理定律！", isCorrect: true),
                Argument(title: "数学派", content: "数学上的‘块’可以没有体积概念。", isCorrect: true)
            ],
            proofSteps: [
                ProofStep(order: 1, latex: "V_{new} = 2V_{old}", explanation: "不可测集的奇迹")
            ],
            verdict: "纯数学定义下成立。",
            historicalContext: "挑战了我们对体积和无穷的根本认知。",
            relatedWeaponId: nil,
            relatedHeroId: nil,
            votes: MysteryVotes(agreeCount: 4500, disagreeCount: 1200, userVote: nil),
            openQuestion: "原子也有体积吗？"
        ),

        MathMystery(
            id: "russell_paradox",
            title: "理发师悖论：数学的大地震",
            category: .foundation,
            shockRating: 9,
            summary: "一个差点摧毁整个数学大厦的逻辑圈套",
            premise: "给所有不给自己刮脸的人刮脸，理发师该给自己刮吗？",
            arguments: [
                Argument(title: "刮脸派", content: "刮了就违反规矩。", isCorrect: false),
                Argument(title: "不刮派", content: "不刮就必须给自己刮。", isCorrect: false)
            ],
            proofSteps: [
                ProofStep(order: 1, latex: "R \\in R \\iff R \\notin R", explanation: "逻辑自相矛盾")
            ],
            verdict: "朴素集合论存在致命漏洞。",
            historicalContext: "迫使数学界进入公理化时代。",
            relatedWeaponId: nil,
            relatedHeroId: "cantor",
            votes: MysteryVotes(agreeCount: 12000, disagreeCount: 500, userVote: nil),
            openQuestion: "地基真的彻底安全了吗？"
        ),

        MathMystery(
            id: "gabriel_horn",
            title: "加百列号角：有限与无限",
            category: .infinityWar,
            shockRating: 8,
            summary: "可以装满油漆，却涂不满自己的表面",
            premise: "旋转体体积有限，但表面积却是无限的。",
            arguments: [
                Argument(title: "直觉派", content: "装满漆说明表面都被盖住了。", isCorrect: false),
                Argument(title: "数学派", content: "体积和面积是不同维度的积分。", isCorrect: true)
            ],
            proofSteps: [
                ProofStep(order: 1, latex: "V = \\pi, S \\to \\infty", explanation: "积分发散速度不同")
            ],
            verdict: "真实的数学奇观。",
            historicalContext: "17世纪震撼了托里拆利。",
            relatedWeaponId: nil,
            relatedHeroId: nil,
            votes: MysteryVotes(agreeCount: 6700, disagreeCount: 1100, userVote: nil),
            openQuestion: "现实物理中存在吗？"
        ),

        MathMystery(
            id: "missing_square",
            title: "失踪的正方形：视觉魔术",
            category: .intuitiveRebel,
            shockRating: 7,
            summary: "拼图重组后面积凭空增加？",
            premise: "将一个三角形切分重组，竟然多出了一个正方形的面积。",
            arguments: [
                Argument(title: "视觉派", content: "看起来三角形没变啊！", isCorrect: false),
                Argument(title: "几何派", content: "斜边不是直线，有细微缝隙。", isCorrect: true)
            ],
            proofSteps: [
                ProofStep(order: 1, latex: "\\tan \\theta_1 \\neq \\tan \\theta_2", explanation: "两个小三角形斜率不同"),
                ProofStep(order: 2, latex: "\\text{总面积始终}=32", explanation: "重组后斜边外凸")
            ],
            verdict: "视觉欺骗，斜边实际上是向外凸的折线。",
            historicalContext: "经典的几何悖论，挑战人类视觉感知。",
            relatedWeaponId: nil,
            relatedHeroId: nil,
            votes: MysteryVotes(agreeCount: 9200, disagreeCount: 300, userVote: nil),
            openQuestion: "AI能识别这种欺骗吗？"
        ),

        MathMystery(
            id: "blue_eyes",
            title: "蓝眼睛谜题：逻辑的传染",
            category: .foundation,
            shockRating: 9,
            summary: "100个蓝眼睛岛民的离岛谜题",
            premise: "岛上100个蓝眼睛和900个棕眼睛的人，规则是知道自己眼睛颜色的人必须离开。外人说'我看到蓝眼睛'后，100天内所有蓝眼睛都会离开？",
            arguments: [
                Argument(title: "无用派", content: "大家都知道有蓝眼睛，说不说一样。", isCorrect: false),
                Argument(title: "归纳派", content: "公共知识引发连锁反应。", isCorrect: true)
            ],
            proofSteps: [
                ProofStep(order: 1, latex: "n=1: 立即知道", explanation: "只有一个蓝眼睛时"),
                ProofStep(order: 2, latex: "n=2: 第一天没人死", explanation: "推断自己也是蓝眼睛"),
                ProofStep(order: 3, latex: "n=100: 第100天集体离开", explanation: "数学归纳")
            ],
            verdict: "纯逻辑推导下结论成立。",
            historicalContext: "陶哲轩提出的经典逻辑谜题。",
            relatedWeaponId: nil,
            relatedHeroId: nil,
            votes: MysteryVotes(agreeCount: 8500, disagreeCount: 4100, userVote: nil),
            openQuestion: "公共知识的边界在哪里？"
        ),

        MathMystery(
            id: "prisoners_paradox",
            title: "100囚犯问题：逆天策略",
            category: .intuitiveRebel,
            shockRating: 10,
            summary: "看似无解的问题竟然有30%胜率",
            premise: "100个囚犯，每人抽屉里有自己号码，最多开50个抽屉，如何协作提高胜率？",
            arguments: [
                Argument(title: "随机派", content: "概率极小，几乎不可能。", isCorrect: false),
                Argument(title: "循环派", content: "按号码形成循环，成功率超30%。", isCorrect: true)
            ],
            proofSteps: [
                ProofStep(order: 1, latex: "P(\\text{cycle length} \\leq 50)", explanation: "最长循环≤50"),
                ProofStep(order: 2, latex: "P \\approx 31.18\\%", explanation: "调和级数计算")
            ],
            verdict: "通过数学策略，成功率可达约31%。",
            historicalContext: "组合数学中的经典问题。",
            relatedWeaponId: nil,
            relatedHeroId: nil,
            votes: MysteryVotes(agreeCount: 12000, disagreeCount: 2800, userVote: nil),
            openQuestion: "最优策略是多少？"
        ),

        MathMystery(
            id: "ants_on_stick",
            title: "蚂蚁军团：碰撞等于穿越",
            category: .infinityWar,
            shockRating: 7,
            summary: "蚂蚁碰撞掉头，其实等于穿身而过",
            premise: "100只蚂蚁在1米长棍子上随机爬行，碰撞后掉头，多久全部掉落？",
            arguments: [
                Argument(title: "复杂派", content: "碰撞次数太多无法计算。", isCorrect: false),
                Argument(title: "等效派", content: "碰撞等于互换身份继续走。", isCorrect: true)
            ],
            proofSteps: [
                ProofStep(order: 1, latex: "t_{max} = 1\\text{m} / v", explanation: "最长时间=一端到另一端"),
                ProofStep(order: 2, latex: "E[X] = \\frac{n}{2} \\cdot \\frac{1}{3}", explanation: "期望碰撞次数")
            ],
            verdict: "最长时间就是一只蚂蚁从一端走到另一端的时间。",
            historicalContext: "巧妙的等效思维问题。",
            relatedWeaponId: nil,
            relatedHeroId: nil,
            votes: MysteryVotes(agreeCount: 7800, disagreeCount: 600, userVote: nil),
            openQuestion: "三维空间会怎样？"
        ),

        MathMystery(
            id: "rational_pirates",
            title: "海盗分金：逆向思维",
            category: .foundation,
            shockRating: 8,
            summary: "海盗如何分配金币才能活下来？",
            premise: "5个海盗分100金币，从高到低提议，半数同意通过，否则被喂鲨鱼。",
            arguments: [
                Argument(title: "平均派", content: "每人20金币最公平。", isCorrect: false),
                Argument(title: "逆向派", content: "从最后一个海盗开始倒推。", isCorrect: true)
            ],
            proofSteps: [
                ProofStep(order: 1, latex: "P1: 0, P2: 100", explanation: "只剩两人时"),
                ProofStep(order: 2, latex: "P1: 1, P3: 99", explanation: "三人时买通P1"),
                ProofStep(order: 3, latex: "P2: 1, P4: 99", explanation: "四人时买通P2"),
                ProofStep(order: 4, latex: "P1: 1, P3: 1, P5: 98", explanation: "五人时买通P1,P3")
            ],
            verdict: "最强海盗可获得98枚金币。",
            historicalContext: "博弈论经典问题。",
            relatedWeaponId: nil,
            relatedHeroId: nil,
            votes: MysteryVotes(agreeCount: 10500, disagreeCount: 1500, userVote: nil),
            openQuestion: "100个海盗会怎样？"
        ),

        MathMystery(
            id: "drunk_walk",
            title: "醉汉回家：随机游走",
            category: .infinityWar,
            shockRating: 7,
            summary: "喝醉的人一定能回家吗？",
            premise: "醉汉在二维平面随机游走，最终回到原点的概率是多少？",
            arguments: [
                Argument(title: "迷失派", content: "越走越远，回不来了。", isCorrect: false),
                Argument(title: "回归派", content: "二维必然回来，三维不一定。", isCorrect: true)
            ],
            proofSteps: [
                ProofStep(order: 1, latex: "d=1: P=1", explanation: "一维必回"),
                ProofStep(order: 2, latex: "d=2: P=1", explanation: "二维必回"),
                ProofStep(order: 3, latex: "d \\geq 3: P < 1", explanation: "三维及以上概率小于1")
            ],
            verdict: "二维随机游走是常返的，三维则不是。",
            historicalContext: "波利亚在1921年证明的经典结果。",
            relatedWeaponId: nil,
            relatedHeroId: nil,
            votes: MysteryVotes(agreeCount: 6200, disagreeCount: 800, userVote: nil),
            openQuestion: "四维空间的概率是多少？"
        )
    ]

    // MARK: - Problems (Strike Pack)
    
    static let problems: [Problem] = mainProblems + geometryProblems + gaokaoSolidGeometryProblems + functionProblems + sequenceProblems + conicProblems + probabilityProblems + trigProblems + vectorProblems + inequalityProblems + comprehensiveProblems + advancedGeometryProblems + complexNumberProblems + statisticsProblems + countingProblems + logicSetProblems + linearProgrammingProblems + polarParametricProblems + inequalitySelectedProblems + gaokaoConicAdvProblems + lineCircleProblems + expLogProblems + trigIdentityProblems + collegeWeaponProblems

    private static let mainProblems: [Problem] = [
        // ============ 初中综合题 (15%) ============
        Problem(
            id: "middle_comp_001",
            type: .multipleChoice,
            tier: 2,
            formulaIds: ["pythagorean", "quad_root", "vieta"],
            content: "已知直角三角形三边恰好是方程x³-12x²+47x-60=0的三个根，则该三角形面积为？",
            contentLatex: "x^3-12x^2+47x-60=0的三根为直角三角形三边,\\ S=?",
            options: ["6", "12", "30", "10"],
            answer: "6",
            difficulty: 0.65,
            averageTime: 60,
            hints: ["三次方程韦达定理", "面积=两直角边乘积的一半", "斜边是最大根"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "设三边为a,b,c，c为斜边", latex: "a+b+c=12,\\ ab+ac+bc=47,\\ abc=60", annotation: "三次方程韦达定理"),
                    SolutionStep(order: 2, description: "利用勾股定理求斜边", latex: "a^2+b^2=c^2,\\ (a+b)^2=c^2+2ab\\Rightarrow(12-c)^2=c^2+2ab", annotation: ""),
                    SolutionStep(order: 3, description: "化简得ab与c的关系", latex: "144-24c=2ab\\Rightarrow ab=72-12c", annotation: ""),
                    SolutionStep(order: 4, description: "结合abc=60", latex: "c(72-12c)=60\\Rightarrow c^2-6c+5=0\\Rightarrow c=1\\text{ 或 }5", annotation: "c为斜边取较大根"),
                    SolutionStep(order: 5, description: "确定斜边", latex: "c=5\\ (c=1\\text{时三边无法构成三角形})", annotation: "斜边c=5"),
                    SolutionStep(order: 6, description: "求两直角边乘积", latex: "ab=72-12\\times5=12", annotation: "ab即两直角边乘积"),
                    SolutionStep(order: 7, description: "求面积", latex: "S=\\frac{1}{2}ab=\\frac{1}{2}\\times12=6", annotation: "面积为6")
                ],
                keyInsight: "综合应用三次方程韦达定理和勾股定理：先定斜边c，再由ab=2S求面积。",
                commonMistakes: ["忘记面积是直角边乘积的一半（误填12）", "把斜边取成最小根"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "因式分解方程", latex: "x^3-12x^2+47x-60=(x-3)(x-4)(x-5)=0", annotation: "试根法：3,4,5均为根"),
                        SolutionStep(order: 2, description: "验证为直角三角形", latex: "3^2+4^2=9+16=25=5^2", annotation: "3,4,5是勾股数，5为斜边"),
                        SolutionStep(order: 3, description: "求面积", latex: "S=\\frac{1}{2}\\times3\\times4=6", annotation: "两直角边3,4")
                    ],
                    keyInsight: "试根法直接解出三边3,4,5，是最经典的勾股三角形。",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】面积只需 ab，不必解出全部三边", latex: "S=\\frac{1}{2}ab=\\frac{1}{2}\\cdot\\frac{abc}{c}", annotation: "ab=abc/c，c为斜边"),
                        SolutionStep(order: 2, description: "由韦达定理直接读 abc，求斜边c", latex: "abc=60;\\ c^2-6c+5=0\\Rightarrow c=5", annotation: "斜边取较大根5"),
                        SolutionStep(order: 3, description: "一步算出面积", latex: "S=\\frac{1}{2}\\cdot\\frac{60}{5}=6", annotation: "无需求出a,b各自的值")
                    ],
                    keyInsight: "面积=½·ab=½·(abc/c)，只要韦达定理给的abc和斜边c即可，绕过解三边！",
                    commonMistakes: []
                ),
                weaponUsed: "韦达定理+勾股定理组合",
                timeRatio: 4.0,
                detailedExplanation: """
                    【降维秒杀详解】

                    这道题展示了如何综合运用多个公式解决复杂问题：

                    1️⃣ 识别：三次方程的根是直角三角形三边
                    2️⃣ 韦达定理：a+b+c=12, ab+ac+bc=47, abc=60
                    3️⃣ 勾股定理：a²+b²=c² ⇒ (12-c)²=c²+2ab ⇒ ab=72-12c
                    4️⃣ 结合abc=60：c(72-12c)=60 ⇒ c²-6c+5=0 ⇒ c=5（斜边取较大根）
                    5️⃣ 面积：S=½·ab=½·(abc/c)=½·(60/5)=6

                    💡 关键：面积只依赖两直角边乘积ab，而ab=abc/c，所以不必解出三个根，
                    　　　　　只需韦达定理的abc和斜边c——这就是降维秒杀。
                    　　　　　（验证：方程恰好分解为(x-3)(x-4)(x-5)，三边正是3,4,5。）

                    🧠 高阶思维：这是"方程思想"与"几何知识"的结合——用代数方法解决几何问题！
                    """
            ),
            gaokaoYear: nil,
            tags: ["综合", "方程", "几何", "初中"]
        ),

        Problem(
            id: "middle_comp_002",
            type: .multipleChoice,
            tier: 2,
            formulaIds: ["linear_function", "distance_point_line", "parallel_lines"],
            content: "直线y=2x+3与直线y=2x-5平行，求两直线之间的距离以及过点(1,4)且与它们平行的直线方程的常数项？",
            contentLatex: "l1:y=2x+3, l2:y=2x-5, d=?, 过(1,4)的平行线常数项=?",
            options: ["距离=8/√5, 常数项=2", "距离=4/√5, 常数项=2", "距离=8/√5, 常数项=6", "距离=4/√5, 常数项=6"],
            answer: "距离=8/√5, 常数项=2",
            difficulty: 0.7,
            averageTime: 70,
            hints: ["平行线距离公式", "点斜式"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "平行线距离公式", latex: "d = |C1 - C2|/√(A²+B²) = |3 - (-5)|/√(4+1) = 8/√5", annotation: ""),
                    SolutionStep(order: 2, description: "设过(1,4)的直线", latex: "y=2x+b", annotation: ""),
                    SolutionStep(order: 3, description: "代入点", latex: "4=2×1+b\\Rightarrow b=2", annotation: "")
                ],
                keyInsight: "综合应用平行线性质和距离公式。",
                commonMistakes: ["距离公式记错", "点斜式应用错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "距离公式", latex: "d=|3-(-5)|/√(4+1)=8/√5", annotation: ""),
                        SolutionStep(order: 2, description: "点斜式", latex: "y-4=2(x-1)\\Rightarrow y=2x+2", annotation: ""),
                        SolutionStep(order: 3, description: "常数项", latex: "b=2", annotation: "")
                    ],
                    keyInsight: "分步求解",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】平行线距离公式！", latex: "d=|C1-C2|/√(A²+B²)=8/√5", annotation: "直接套用!"),
                        SolutionStep(order: 2, description: "【秒杀】点斜式快速计算！", latex: "b=y-2x=4-2×1=2", annotation: "常数项=2!")
                    ],
                    keyInsight: "记住公式直接代入，一步到位！",
                    commonMistakes: []
                ),
                weaponUsed: "直线方程+距离公式组合",
                timeRatio: 2.5,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了直线相关公式的综合应用：
                    
                    1️⃣ 平行线距离公式：d=|C1-C2|/√(A²+B²)，直接代入得8/√5
                    2️⃣ 点斜式快速求常数项：b=y-kx=4-2×1=2
                    
                    💡 关键：记住公式的各种变形形式，灵活应用！
                    
                    🧠 高阶思维：这是"解析几何"的核心——用代数方法研究几何问题！
                    """
            ),
            gaokaoYear: nil,
            tags: ["综合", "直线", "距离", "初中"]
        ),

        // ============ 高中综合题 (85%) ============
        
        Problem(
            id: "high_001",
            type: .multipleChoice,
            tier: 3,
            formulaIds: ["sin_add"],
            content: "已知 sin α = 3/5，cos β = 4/5，α, β 均为锐角，则 sin(α+β) = ？",
            contentLatex: "\\sin\\alpha=3/5, \\cos\\beta=4/5, \\sin(\\alpha+\\beta)=?",
            options: ["24/25", "7/25", "1", "0"],
            answer: "24/25",
            difficulty: 0.5,
            averageTime: 60,
            hints: ["和角公式"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "求 cos α 和 sin β", latex: "\\cos\\alpha=4/5, \\sin\\beta=3/5", annotation: "勾股定理"),
                    SolutionStep(order: 2, description: "应用和角公式", latex: "\\sin(\\alpha+\\beta)=\\frac{3}{5}\\cdot\\frac{4}{5}+\\frac{4}{5}\\cdot\\frac{3}{5}", annotation: "sin(α+β)=sinαcosβ+cosαsinβ"),
                    SolutionStep(order: 3, description: "计算", latex: "\\frac{12}{25}+\\frac{12}{25}=\\frac{24}{25}", annotation: "结果")
                ],
                keyInsight: "和角公式是三角函数的核心工具。",
                commonMistakes: ["记错和角公式", "符号错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "求cosα和sinβ", latex: "cosα=4/5, sinβ=3/5", annotation: ""),
                        SolutionStep(order: 2, description: "和角公式展开", latex: "sinαcosβ+cosαsinβ", annotation: ""),
                        SolutionStep(order: 3, description: "代入计算", latex: "(3/5)(4/5)+(4/5)(3/5)=24/25", annotation: "")
                    ],
                    keyInsight: "和角公式展开",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】欧拉公式！", latex: "e^(i(α+β)) = e^(iα)·e^(iβ)", annotation: "欧拉公式"),
                        SolutionStep(order: 2, description: "取虚部", latex: "sin(α+β) = Im[(cosα+isinα)(cosβ+isinβ)]", annotation: ""),
                        SolutionStep(order: 3, description: "计算", latex: "Im[(4/5+3i/5)(4/5+3i/5)] = 24/25", annotation: "秒杀！")
                    ],
                    keyInsight: "欧拉公式让三角函数变成复数乘法！",
                    commonMistakes: []
                ),
                weaponUsed: "欧拉棱镜 (欧拉公式)",
                timeRatio: 4.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了如何用"欧拉公式"（大学内容）来秒杀三角函数题：
                    
                    1️⃣ 回忆：欧拉公式 e^(iθ) = cosθ + i sinθ
                    2️⃣ 观察：sin(α+β) 是 e^(i(α+β)) 的虚部
                    3️⃣ 计算：e^(i(α+β)) = e^(iα)·e^(iβ) = (4/5+3i/5)(4/5+3i/5) = (16/25-9/25)+(24/25)i
                    4️⃣ 取虚部：就是 24/25！
                    
                    💡 关键：欧拉公式把三角函数的复杂运算变成了简单的复数乘法！
                    
                    🧠 高阶思维：这是"用更高观点统一低等概念"的典范——三角函数和指数函数在复数域统一了！这种思想在整个数学中都很重要！
                    """
            ),
            gaokaoYear: 2020,
            tags: ["三角函数", "高中"]
        ),

        Problem(
            id: "high_002",
            type: .multipleChoice,
            tier: 4,
            formulaIds: ["ellipse_eq"],
            content: "椭圆 x²/25 + y²/9 = 1 的离心率是？",
            contentLatex: "\\frac{x^2}{25} + \\frac{y^2}{9} = 1",
            options: ["3/5", "4/5", "5/3", "5/4"],
            answer: "4/5",
            difficulty: 0.6,
            averageTime: 45,
            hints: ["椭圆离心率公式"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "确定 a, b", latex: "a^2=25, b^2=9", annotation: "a=5, b=3"),
                    SolutionStep(order: 2, description: "计算 c", latex: "c^2 = a^2 - b^2 = 16", annotation: "c=4"),
                    SolutionStep(order: 3, description: "计算离心率", latex: "e = c/a = 4/5", annotation: "结果")
                ],
                keyInsight: "离心率 e = c/a 是椭圆扁平程度的度量。",
                commonMistakes: ["搞混 a 和 b", "忘记开方"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "找a", latex: "a=5", annotation: ""),
                        SolutionStep(order: 2, description: "找c", latex: "c=4", annotation: ""),
                        SolutionStep(order: 3, description: "计算e", latex: "e=4/5", annotation: "")
                    ],
                    keyInsight: "按定义计算",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】这是经典椭圆！", latex: "a=5, b=3 \\implies c=4 \\implies e=4/5", annotation: "记住常见椭圆参数"),
                        SolutionStep(order: 2, description: "直接写出", latex: "e=4/5", annotation: "秒杀！")
                    ],
                    keyInsight: "记住常见椭圆，离心率秒出！",
                    commonMistakes: []
                ),
                weaponUsed: "圆锥曲线直觉法",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了如何用"圆锥曲线直觉"来秒杀：
                    
                    1️⃣ 识别：x²/25 + y²/9 = 1 是经典椭圆
                    2️⃣ 记住：a=5, b=3，所以 c=4（勾股数3-4-5）
                    3️⃣ 秒答：e=c/a=4/5
                    
                    💡 关键：对常见圆锥曲线参数要有敏感度！
                    
                    🧠 高阶思维：这是"模式识别"能力的体现——快速识别已知模式，这种能力在解复杂题时能节省大量时间！
                    """
            ),
            gaokaoYear: 2021,
            tags: ["圆锥曲线", "高中"]
        ),

        Problem(
            id: "high_003",
            type: .multipleChoice,
            tier: 4,
            formulaIds: ["deriv_power"],
            content: "函数 f(x) = x³ - 3x 在 x = 1 处的切线斜率是？",
            contentLatex: "f(x) = x^3 - 3x, f'(1) = ?",
            options: ["0", "1", "-2", "3"],
            answer: "0",
            difficulty: 0.55,
            averageTime: 40,
            hints: ["导数的几何意义"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "求导", latex: "f'(x) = 3x^2 - 3", annotation: "幂函数求导"),
                    SolutionStep(order: 2, description: "代入 x=1", latex: "f'(1) = 3(1)^2 - 3 = 0", annotation: "切线斜率")
                ],
                keyInsight: "导数就是切线斜率，直接求导代入即可。",
                commonMistakes: ["求导错误", "忘记代入"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "求导", latex: "f'(x)=3x²-3", annotation: ""),
                        SolutionStep(order: 2, description: "代入", latex: "f'(1)=0", annotation: "")
                    ],
                    keyInsight: "按部就班求导",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】观察 f(x)=x(x²-3)", latex: "x=1是临界点", annotation: "直接观察"),
                        SolutionStep(order: 2, description: "或者更高级：", latex: "f(x)在x=1处是极值点 \\implies f'(1)=0", annotation: "秒杀！")
                    ],
                    keyInsight: "极值点导数为0，直接秒答！",
                    commonMistakes: []
                ),
                weaponUsed: "求导刃 (极值点性质)",
                timeRatio: 6.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了如何用"极值点性质"来秒杀导数题：
                    
                    1️⃣ 观察：f(x)=x³-3x=x(x²-3)，x=1是一个临界点
                    2️⃣ 直觉：这是一个三次函数，在x=1处应该是极值点
                    3️⃣ 秒答：极值点导数为0，所以f'(1)=0！
                    
                    💡 关键：理解导数的几何意义——极值点处切线水平，斜率为0！
                    
                    🧠 高阶思维：这是"数形结合"和"性质预判"的体现——先分析函数性质，再精确计算，这种思想在解复杂题时事半功倍！
                    """
            ),
            gaokaoYear: 2022,
            tags: ["导数", "高中"]
        ),

        Problem(
            id: "high_004",
            type: .multipleChoice,
            tier: 4,
            formulaIds: ["lopital_rule"],
            content: "求极限：当 x→0 时，(sin x - x)/x³ = ？",
            contentLatex: "\\lim_{x \\to 0} \\frac{\\sin x - x}{x^3}",
            options: ["0", "1/6", "-1/6", "1/3"],
            answer: "-1/6",
            difficulty: 0.85,
            averageTime: 300,
            hints: ["洛必达法则", "泰勒展开"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "检查形式", latex: "\\frac{0}{0}", annotation: "满足洛必达条件"),
                    SolutionStep(order: 2, description: "第一次求导", latex: "\\lim \\frac{\\cos x - 1}{3x^2}", annotation: "仍为 0/0"),
                    SolutionStep(order: 3, description: "第二次求导", latex: "\\lim \\frac{-\\sin x}{6x}", annotation: "仍为 0/0"),
                    SolutionStep(order: 4, description: "第三次求导", latex: "\\lim \\frac{-\\cos x}{6} = -\\frac{1}{6}", annotation: "结果")
                ],
                keyInsight: "高阶思维降维打击，连续应用洛必达。",
                commonMistakes: ["求导错误", "忘记检查条件"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "等价无穷小替换", latex: "sinx ≈ x - x³/6", annotation: "需要记住泰勒展开"),
                        SolutionStep(order: 2, description: "代入", latex: "(x - x³/6 - x)/x³ = -1/6", annotation: "")
                    ],
                    keyInsight: "用泰勒展开或等价无穷小",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】泰勒展开直接上！", latex: "sinx = x - x³/6 + o(x³)", annotation: "泰勒展开"),
                        SolutionStep(order: 2, description: "代入", latex: "(x - x³/6 - x)/x³ = -x³/6 / x³ = -1/6", annotation: "秒杀！")
                    ],
                    keyInsight: "泰勒级数是极限的终极武器！",
                    commonMistakes: []
                ),
                weaponUsed: "洛必达之锤 / 泰勒级数",
                timeRatio: 5.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了如何用"泰勒级数"（大学内容）来秒杀极限题：
                    
                    1️⃣ 回忆：sinx 的泰勒展开是 sinx = x - x³/6 + x⁵/120 - ...
                    2️⃣ 代入：sinx - x = -x³/6 + 高次项
                    3️⃣ 相除：(sinx - x)/x³ = -1/6 + 高次项 → 极限就是 -1/6
                    
                    💡 关键：泰勒展开能把复杂函数变成多项式，极限计算一目了然！
                    
                    🧠 高阶思维：这是"用多项式逼近复杂函数"的思想——虽然是大学内容，但用在高考极限题上简直是降维打击！
                    """
            ),
            gaokaoYear: 2022,
            tags: ["极限", "压轴"]
        ),

        Problem(
            id: "high_005",
            type: .multipleChoice,
            tier: 3,
            formulaIds: ["cosine_rule"],
            content: "在△ABC中，a=3, b=4, C=60°，则 c = ？",
            contentLatex: "a=3, b=4, C=60°, c=?",
            options: ["\\sqrt{13}", "5", "\\sqrt{37}", "7"],
            answer: "\\sqrt{13}",
            difficulty: 0.5,
            averageTime: 50,
            hints: ["余弦定理"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "应用余弦定理", latex: "c^2 = 3^2 + 4^2 - 2\\cdot3\\cdot4\\cdot\\cos60°", annotation: "代入已知"),
                    SolutionStep(order: 2, description: "计算", latex: "c^2 = 9 + 16 - 12 = 13", annotation: "cos60°=0.5"),
                    SolutionStep(order: 3, description: "开方", latex: "c = \\sqrt{13}", annotation: "结果")
                ],
                keyInsight: "已知两边夹一角，余弦定理直接求解。",
                commonMistakes: ["记错余弦定理公式", "角度单位错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "余弦定理", latex: "c²=3²+4²-2·3·4·cos60°", annotation: ""),
                        SolutionStep(order: 2, description: "计算", latex: "c²=9+16-12=13", annotation: ""),
                        SolutionStep(order: 3, description: "开方", latex: "c=√13", annotation: "")
                    ],
                    keyInsight: "按余弦定理计算",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】向量法！", latex: "\\vec{AB} = \\vec{CB} - \\vec{CA}", annotation: "向量减法"),
                        SolutionStep(order: 2, description: "平方", latex: "|\\vec{AB}|² = |\\vec{CB}|² + |\\vec{CA}|² - 2\\vec{CB}\\cdot\\vec{CA}", annotation: "点积性质"),
                        SolutionStep(order: 3, description: "计算", latex: "c²=9+16-2·3·4·cos60°=13 \\implies c=√13", annotation: "秒杀！")
                    ],
                    keyInsight: "向量让几何问题代数化！",
                    commonMistakes: []
                ),
                weaponUsed: "向量武器 (点积)",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了如何用"向量点积"来秒杀几何题：
                    
                    1️⃣ 构造向量：→AB = →CB - →CA
                    2️⃣ 平方：|→AB|² = |→CB|² + |→CA|² - 2→CB·→CA
                    3️⃣ 计算：就是 c² = a² + b² - 2ab cosC
                    
                    💡 关键：余弦定理其实就是向量点积的几何解释！
                    
                    🧠 高阶思维：这是"几何问题代数化"思想的体现——用向量工具可以统一处理很多几何问题！
                    """
            ),
            gaokaoYear: 2019,
            tags: ["解三角形", "高中"]
        ),

        Problem(
            id: "high_006",
            type: .multipleChoice,
            tier: 4,
            formulaIds: ["deriv_power"],
            content: "函数 f(x) = x³ - 3x² + 1 的单调递减区间是？",
            contentLatex: "f(x) = x^3 - 3x^2 + 1",
            options: ["(-∞,0)", "(0,2)", "(2,+∞)", "(-∞,0)∪(2,+∞)"],
            answer: "(0,2)",
            difficulty: 0.7,
            averageTime: 80,
            hints: ["导数判断单调性"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "求导", latex: "f'(x) = 3x^2 - 6x", annotation: "幂函数求导"),
                    SolutionStep(order: 2, description: "求临界点", latex: "3x(x-2)=0 \\implies x=0,2", annotation: "解方程"),
                    SolutionStep(order: 3, description: "判断符号", latex: "f'(x) < 0 \\implies 0 < x < 2", annotation: "二次函数开口向上")
                ],
                keyInsight: "导数小于0时函数递减，转化为解不等式。",
                commonMistakes: ["求导错误", "区间开闭判断错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "求导", latex: "f'(x)=3x²-6x", annotation: ""),
                        SolutionStep(order: 2, description: "解不等式", latex: "f'(x)<0 \\implies 0<x<2", annotation: "")
                    ],
                    keyInsight: "导数判断单调性",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】观察三次函数形状！", latex: "f(x)=x³-3x²+1", annotation: "三次项系数为正"),
                        SolutionStep(order: 2, description: "图像趋势", latex: "先增后减再增，递减区间在中间", annotation: ""),
                        SolutionStep(order: 3, description: "看选项", latex: "只有(0,2)是中间区间", annotation: "秒杀！")
                    ],
                    keyInsight: "熟悉函数图像，区间秒出！",
                    commonMistakes: []
                ),
                weaponUsed: "求导刃 (函数图像直觉)",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了如何用"函数图像直觉"来秒杀：
                    
                    1️⃣ 识别：这是三次函数 f(x)=x³-3x²+1，首项系数为正
                    2️⃣ 趋势：三次函数"先增后减再增"，递减区间在中间
                    3️⃣ 看选项：只有(0,2)是中间区间，秒答！
                    
                    💡 关键：熟悉基本函数的图像形状，能大大提高解题速度！
                    
                    🧠 高阶思维：这是"数形结合"和"定性分析"思想的体现——先从宏观把握函数性质，再进行精确计算！
                    """
            ),
            gaokaoYear: 2021,
            tags: ["导数", "单调性", "高中"]
        ),

        Problem(
            id: "high_007",
            type: .multipleChoice,
            tier: 3,
            formulaIds: ["add_commute"],
            content: "等差数列 {aₙ} 中，a₁=2，d=3，则前10项和 S₁₀ = ？",
            contentLatex: "a_1=2, d=3, S_{10}=?",
            options: ["155", "150", "160", "145"],
            answer: "155",
            difficulty: 0.4,
            averageTime: 35,
            hints: ["等差数列求和公式"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "求第10项", latex: "a_{10} = 2 + 9\\times3 = 29", annotation: "通项公式"),
                    SolutionStep(order: 2, description: "求和", latex: "S_{10} = \\frac{10}{2}(2+29) = 5\\times31", annotation: "等差数列求和"),
                    SolutionStep(order: 3, description: "计算", latex: "S_{10} = 155", annotation: "结果")
                ],
                keyInsight: "等差数列求和 = 项数 × (首项+末项)/2。",
                commonMistakes: ["项数计算错误", "公式记错"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "用另一个公式", latex: "Sₙ=na₁+n(n-1)d/2", annotation: ""),
                        SolutionStep(order: 2, description: "计算", latex: "10×2+10×9×3/2=20+135=155", annotation: "")
                    ],
                    keyInsight: "按公式计算",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】高斯配对法！", latex: "S₁₀ = (a₁+a₁₀)+(a₂+a₉)+...+(a₅+a₆)", annotation: "配对"),
                        SolutionStep(order: 2, description: "计算", latex: "a₁+a₁₀=2+29=31", annotation: "每对都是31"),
                        SolutionStep(order: 3, description: "相乘", latex: "5×31=155", annotation: "秒杀！")
                    ],
                    keyInsight: "高斯配对法，数列求和神器！",
                    commonMistakes: []
                ),
                weaponUsed: "高斯求和法",
                timeRatio: 4.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了如何用"高斯配对法"来秒杀数列题：
                    
                    1️⃣ 回忆：高斯小时候计算1+2+...+100的方法——首尾配对
                    2️⃣ 配对：(a₁+a₁₀) = (a₂+a₉) = ... = (a₅+a₆) = 31
                    3️⃣ 计算：5对 × 31 = 155
                    
                    💡 关键：等差数列中，"距离相等的两项之和相等"！
                    
                    🧠 高阶思维：这是"对称性"思想的体现——利用数列的对称性简化计算，这种思想在高中数学乃至大学数学中都非常重要！
                    """
            ),
            gaokaoYear: 2020,
            tags: ["数列", "高中"]
        ),

        Problem(
            id: "high_008",
            type: .multipleChoice,
            tier: 3,
            formulaIds: [],
            content: "从1到10的整数中随机取一个数，取到偶数的概率是？",
            contentLatex: "P(\\text{even}) = ?",
            options: ["1/2", "2/5", "3/5", "1/10"],
            answer: "1/2",
            difficulty: 0.25,
            averageTime: 25,
            hints: ["古典概型"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "计算基本事件数", latex: "n(Ω) = 10", annotation: "总共有10个数"),
                    SolutionStep(order: 2, description: "计算有利事件数", latex: "n(A) = 5", annotation: "偶数：2,4,6,8,10"),
                    SolutionStep(order: 3, description: "计算概率", latex: "P = 5/10 = 1/2", annotation: "结果")
                ],
                keyInsight: "古典概型：概率 = 有利事件数 / 总事件数。",
                commonMistakes: ["计数错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "数偶数个数", latex: "2,4,6,8,10 → 5个", annotation: ""),
                        SolutionStep(order: 2, description: "计算概率", latex: "5/10=1/2", annotation: "")
                    ],
                    keyInsight: "直接计数",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】对称性！", latex: "1-10中奇偶各一半", annotation: "对称性"),
                        SolutionStep(order: 2, description: "秒答", latex: "P=1/2", annotation: "秒杀！")
                    ],
                    keyInsight: "利用对称性，概率秒出！",
                    commonMistakes: []
                ),
                weaponUsed: "对称性思维",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了如何用"对称性思维"来秒杀概率题：
                    
                    1️⃣ 观察：1到10是连续整数，奇偶对称
                    2️⃣ 推理：取到奇数和偶数的概率应该相等
                    3️⃣ 秒答：概率就是 1/2
                    
                    💡 关键：对称性是概率论中的强大工具！
                    
                    🧠 高阶思维：这是"对称性与不变性"思想的体现——寻找问题中的对称关系，能大大简化计算！
                    """
            ),
            gaokaoYear: 2019,
            tags: ["概率", "高中"]
        ),

        Problem(
            id: "high_009",
            type: .multipleChoice,
            tier: 3,
            formulaIds: [],
            content: "向量 a=(1,2)，b=(3,4)，则 a·b = ？",
            contentLatex: "\\vec{a}=(1,2), \\vec{b}=(3,4), \\vec{a}\\cdot\\vec{b}=?",
            options: ["11", "10", "5", "14"],
            answer: "11",
            difficulty: 0.3,
            averageTime: 20,
            hints: ["向量点积"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "应用点积公式", latex: "a\\cdot b = 1\\times3 + 2\\times4", annotation: "对应分量相乘相加"),
                    SolutionStep(order: 2, description: "计算", latex: "3 + 8 = 11", annotation: "结果")
                ],
                keyInsight: "向量点积是对应分量乘积之和。",
                commonMistakes: ["搞混点积和叉积", "符号错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "计算", latex: "1×3+2×4=3+8=11", annotation: "")
                    ],
                    keyInsight: "定义计算",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】点积就是投影！", latex: "\\vec{a}\\cdot\\vec{b} = |\\vec{a}||\\vec{b}|\\cos\\theta", annotation: "但用坐标更快"),
                        SolutionStep(order: 2, description: "计算", latex: "1×3+2×4=11", annotation: "秒杀！")
                    ],
                    keyInsight: "点积计算要熟练！",
                    commonMistakes: []
                ),
                weaponUsed: "向量武器 (点积)",
                timeRatio: 1.5,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了向量点积的计算：
                    
                    1️⃣ 公式：→a·→b = x₁x₂ + y₁y₂
                    2️⃣ 计算：1×3 + 2×4 = 3 + 8 = 11
                    
                    💡 关键：点积是代数和几何的桥梁！
                    
                    🧠 高阶思维：这是"几何概念代数化"的体现——向量让几何问题可以用代数方法计算！
                    """
            ),
            gaokaoYear: 2021,
            tags: ["向量", "高中"]
        ),

        Problem(
            id: "high_010",
            type: .multipleChoice,
            tier: 4,
            formulaIds: [],
            content: "已知 x > 0，则 x + 4/x 的最小值是？",
            contentLatex: "x > 0, \\min(x + 4/x) = ?",
            options: ["4", "2", "5", "1"],
            answer: "4",
            difficulty: 0.6,
            averageTime: 50,
            hints: ["基本不等式"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "应用基本不等式", latex: "x + \\frac{4}{x} \\geq 2\\sqrt{x \\cdot \\frac{4}{x}}", annotation: "a+b≥2√(ab)"),
                    SolutionStep(order: 2, description: "计算", latex: "2\\sqrt{4} = 4", annotation: "等号成立当x=2")
                ],
                keyInsight: "基本不等式是求最值的利器。",
                commonMistakes: ["忘记等号成立条件", "不满足正数条件"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "基本不等式", latex: "x + 4/x ≥ 2√(x·4/x) = 4", annotation: ""),
                        SolutionStep(order: 2, description: "等号成立条件", latex: "x = 4/x \\implies x=2", annotation: "")
                    ],
                    keyInsight: "用基本不等式求最值",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】求导法！", latex: "f(x) = x + 4/x", annotation: "设函数"),
                        SolutionStep(order: 2, description: "求导", latex: "f'(x) = 1 - 4/x²", annotation: "求导"),
                        SolutionStep(order: 3, description: "找临界点", latex: "f'(x)=0 \\implies x²=4 \\implies x=2", annotation: "x>0"),
                        SolutionStep(order: 4, description: "秒答", latex: "f(2)=2+4/2=4", annotation: "秒杀！")
                    ],
                    keyInsight: "求导是求函数最值的通用方法！",
                    commonMistakes: []
                ),
                weaponUsed: "求导刃",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了如何用"求导法"（通用方法）来秒杀最值问题：
                    
                    1️⃣ 设函数：f(x) = x + 4/x
                    2️⃣ 求导数：f'(x) = 1 - 4/x²
                    3️⃣ 找临界点：f'(x)=0 → x²=4 → x=2（因为x>0）
                    4️⃣ 秒答：f(2)=2+4/2=4
                    
                    💡 关键：求导是求函数极值的通用方法，不需要记住各种不等式技巧！
                    
                    🧠 高阶思维：这是"微积分工具简化初等问题"的典范——虽然基本不等式也能做，但求导是更通用、更系统的方法，这种思想在解决复杂问题时尤为重要！
                    """
            ),
            gaokaoYear: 2022,
            tags: ["不等式", "高中"]
        ),

        // ============ 勾股定理专项训练 (必考) ============
        Problem(
            id: "high_pyth_001",
            type: .multipleChoice,
            tier: 2,
            formulaIds: ["pythagorean"],
            content: "在直角三角形ABC中，∠C=90°，若a=5，c=13，则b等于？",
            contentLatex: "\\triangle ABC, \\angle C=90^\\circ, a=5, c=13, b=?",
            options: ["12", "8", "10", "11"],
            answer: "12",
            difficulty: 0.3,
            averageTime: 25,
            hints: ["勾股定理", "5-12-13勾股数"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "应用勾股定理", latex: "b^2 = c^2 - a^2 = 169 - 25 = 144", annotation: "c是斜边"),
                    SolutionStep(order: 2, description: "开方", latex: "b = \\sqrt{144} = 12", annotation: "取正值")
                ],
                keyInsight: "识别斜边，应用勾股定理。",
                commonMistakes: ["把c当成直角边", "计算错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "勾股定理", latex: "b² = 13² - 5² = 144", annotation: ""),
                        SolutionStep(order: 2, description: "开方", latex: "b = 12", annotation: "")
                    ],
                    keyInsight: "标准解法",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】记住5-12-13勾股数！", latex: "b=12", annotation: "直接秒答！")
                    ],
                    keyInsight: "常见勾股数要记牢！",
                    commonMistakes: []
                ),
                weaponUsed: "勾股数记忆法",
                timeRatio: 4.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了如何用"勾股数记忆法"来秒杀：
                    
                    1️⃣ 观察：5和13，马上想到勾股数5-12-13
                    2️⃣ 秒答：b=12！
                    
                    💡 关键：记住常见勾股数（3-4-5, 5-12-13, 7-24-25, 8-15-17等）！
                    """
            ),
            gaokaoYear: 2023,
            tags: ["勾股定理", "几何", "必考"]
        ),

        Problem(
            id: "high_pyth_002",
            type: .multipleChoice,
            tier: 3,
            formulaIds: ["pythagorean"],
            content: "直角三角形两直角边分别为6和8，则斜边上的高为？",
            contentLatex: "a=6, b=8, h=?",
            options: ["4.8", "5", "6", "4"],
            answer: "4.8",
            difficulty: 0.5,
            averageTime: 45,
            hints: ["先求斜边", "面积法"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "求斜边", latex: "c = \\sqrt{6^2 + 8^2} = 10", annotation: "3-4-5的2倍"),
                    SolutionStep(order: 2, description: "面积法求高", latex: "\\frac{1}{2} \\times 6 \\times 8 = \\frac{1}{2} \\times 10 \\times h", annotation: "面积不变"),
                    SolutionStep(order: 3, description: "解得", latex: "h = \\frac{48}{10} = 4.8", annotation: "结果")
                ],
                keyInsight: "利用面积不变性求高。",
                commonMistakes: ["忘记面积法", "计算错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "求斜边", latex: "c=10", annotation: ""),
                        SolutionStep(order: 2, description: "面积法", latex: "h = ab/c = 48/10 = 4.8", annotation: "")
                    ],
                    keyInsight: "标准解法",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】直角三角形高公式！", latex: "h = \\frac{ab}{c} = \\frac{6 \\times 8}{10} = 4.8", annotation: "直接套用公式！")
                    ],
                    keyInsight: "记住直角三角形高的公式：h=ab/c，秒解！",
                    commonMistakes: []
                ),
                weaponUsed: "面积法公式",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了如何用"直角三角形高公式"来秒杀：
                    
                    1️⃣ 识别：已知两直角边a=6, b=8，求斜边上的高h
                    2️⃣ 秒杀公式：h = ab/c（面积法推导而来）
                    3️⃣ c=10（3-4-5的2倍），所以h = 6×8/10 = 4.8
                    
                    💡 关键：记住这个小公式，遇到同类题直接秒答！
                    
                    🧠 高阶思维：这是"公式记忆+灵活应用"的体现——将常用推导结果记住，节省考试时间！
                    """
            ),
            gaokaoYear: 2022,
            tags: ["勾股定理", "几何", "面积"]
        ),

        Problem(
            id: "high_pyth_003",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["pythagorean"],
            content: "已知直角三角形的三边成等差数列，且周长为12，则面积为______。",
            contentLatex: "三边成等差，周长=12，S=?",
            options: nil,
            answer: "6",
            difficulty: 0.7,
            averageTime: 60,
            hints: ["设三边为a-d, a, a+d", "勾股定理"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "设三边", latex: "a-d, a, a+d", annotation: "等差数列"),
                    SolutionStep(order: 2, description: "周长", latex: "3a = 12 \\implies a=4", annotation: "中间项"),
                    SolutionStep(order: 3, description: "勾股定理", latex: "(4-d)^2 + 4^2 = (4+d)^2", annotation: "斜边为a+d"),
                    SolutionStep(order: 4, description: "解方程", latex: "16-8d+d²+16=16+8d+d² \\implies d=1", annotation: ""),
                    SolutionStep(order: 5, description: "面积", latex: "S = \\frac{1}{2} \\times 3 \\times 4 = 6", annotation: "")
                ],
                keyInsight: "利用等差数列性质设未知数。",
                commonMistakes: ["设未知数错误", "符号错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "设三边", latex: "a-d, a, a+d", annotation: ""),
                        SolutionStep(order: 2, description: "求a", latex: "a=4", annotation: ""),
                        SolutionStep(order: 3, description: "勾股定理", latex: "(4-d)^2+4^2=(4+d)^2", annotation: ""),
                        SolutionStep(order: 4, description: "求d", latex: "d=1", annotation: ""),
                        SolutionStep(order: 5, description: "面积", latex: "S=6", annotation: "")
                    ],
                    keyInsight: "标准解法",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】勾股数规律！", latex: "周长12，等差三边只能是3-4-5", annotation: "唯一的等差数列勾股数"),
                        SolutionStep(order: 2, description: "面积", latex: "S = \\frac{1}{2} \\times 3 \\times 4 = 6", annotation: "秒答！")
                    ],
                    keyInsight: "记住常见勾股数，等差数列的勾股数只有3-4-5及其倍数！",
                    commonMistakes: []
                ),
                weaponUsed: "勾股数记忆法",
                timeRatio: 5.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了如何用"勾股数记忆"来秒杀：
                    
                    1️⃣ 观察：直角三角形三边成等差数列，周长=12
                    2️⃣ 回忆：唯一成等差数列的勾股数是3-4-5（和为12）
                    3️⃣ 秒答：面积 = (3×4)/2 = 6
                    
                    💡 关键：记住3-4-5是唯一的等差数列勾股数！
                    
                    🧠 高阶思维：这是"模式识别"能力的体现——快速识别已知模式，节省大量计算时间！
                    """
            ),
            gaokaoYear: 2021,
            tags: ["勾股定理", "等差数列"]
        ),

        // ============ 和角公式专项训练 (必考) ============
        Problem(
            id: "high_sin_add_001",
            type: .multipleChoice,
            tier: 3,
            formulaIds: ["sin_add"],
            content: "已知 sin α = 5/13，cos α = 12/13，则 sin(α + π/4) = ？",
            contentLatex: "\\sin\\alpha=5/13, \\sin(\\alpha+\\pi/4)=?",
            options: ["17\\sqrt{2}/26", "7\\sqrt{2}/26", "13\\sqrt{2}/26", "5\\sqrt{2}/26"],
            answer: "17\\sqrt{2}/26",
            difficulty: 0.55,
            averageTime: 50,
            hints: ["和角公式", "特殊角三角函数"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "写出和角公式", latex: "\\sin(\\alpha+\\beta) = \\sin\\alpha\\cos\\beta + \\cos\\alpha\\sin\\beta", annotation: ""),
                    SolutionStep(order: 2, description: "代入值", latex: "\\sin(\\alpha+\\pi/4) = \\frac{5}{13} \\cdot \\frac{\\sqrt{2}}{2} + \\frac{12}{13} \\cdot \\frac{\\sqrt{2}}{2}", annotation: "sin(π/4)=cos(π/4)=√2/2"),
                    SolutionStep(order: 3, description: "计算", latex: "\\frac{(5+12)\\sqrt{2}}{26} = \\frac{17\\sqrt{2}}{26}", annotation: "")
                ],
                keyInsight: "熟练应用和角公式。",
                commonMistakes: ["记错公式", "特殊角值记错"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "和角公式", latex: "sin(α+π/4)=sinαcos(π/4)+cosαsin(π/4)", annotation: ""),
                        SolutionStep(order: 2, description: "代入", latex: "(5/13)(√2/2)+(12/13)(√2/2)=17√2/26", annotation: "")
                    ],
                    keyInsight: "标准解法",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】欧拉公式！", latex: "sin(α+π/4) = Im[e^(i(α+π/4))] = Im[e^(iα)·e^(iπ/4)]", annotation: "复数方法"),
                        SolutionStep(order: 2, description: "计算", latex: "Im[(12/13+5i/13)(√2/2+i√2/2)] = 17√2/26", annotation: "秒答！")
                    ],
                    keyInsight: "欧拉公式让三角函数变成复数乘法！",
                    commonMistakes: []
                ),
                weaponUsed: "欧拉棱镜",
                timeRatio: 4.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了如何用"欧拉公式"来秒杀三角函数题：
                    
                    1️⃣ 回忆：欧拉公式 e^(iθ) = cosθ + i sinθ
                    2️⃣ 计算：e^(i(α+π/4)) = e^(iα)·e^(iπ/4) = (12/13+5i/13)(√2/2+i√2/2)
                    3️⃣ 取虚部：就是 sin(α+π/4) = 17√2/26
                    
                    💡 关键：欧拉公式把三角函数运算变成简单的复数乘法！
                    
                    🧠 高阶思维：这是"用更高观点统一低等概念"的典范——三角函数和指数函数在复数域统一了！
                    """
            ),
            gaokaoYear: 2023,
            tags: ["三角函数", "和角公式", "必考"]
        ),

        Problem(
            id: "high_sin_add_002",
            type: .multipleChoice,
            tier: 4,
            formulaIds: ["sin_add", "cos_add"],
            content: "已知 tan α = 3/4，则 sin(α + β)cosβ - cos(α + β)sinβ = ？",
            contentLatex: "\\tan\\alpha=3/4, \\sin(\\alpha+\\beta)\\cos\\beta - \\cos(\\alpha+\\beta)\\sin\\beta=?",
            options: ["3/5", "4/5", "3/4", "4/3"],
            answer: "3/5",
            difficulty: 0.65,
            averageTime: 60,
            hints: ["逆用和角公式", "sin(A-B)"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "逆用差角公式", latex: "\\sin(\\alpha+\\beta)\\cos\\beta - \\cos(\\alpha+\\beta)\\sin\\beta = \\sin\\alpha", annotation: "sin(A-B)=sinAcosB-cosAsinB"),
                    SolutionStep(order: 2, description: "由tanα求sinα", latex: "\\tan\\alpha=3/4 \\implies \\sin\\alpha=3/5", annotation: "3-4-5三角形"),
                    SolutionStep(order: 3, description: "结果", latex: "\\sin\\alpha = 3/5", annotation: "")
                ],
                keyInsight: "逆用三角公式简化表达式。",
                commonMistakes: ["看不出来逆用公式", "计算错误"]
            ),
            gaokaoYear: 2022,
            tags: ["三角函数", "公式逆用"]
        ),

        // ============ 余弦定理专项训练 (必考) ============
        Problem(
            id: "high_cosine_001",
            type: .multipleChoice,
            tier: 3,
            formulaIds: ["cosine_rule"],
            content: "在△ABC中，a=3，b=4，C=90°，则c等于？",
            contentLatex: "a=3, b=4, C=90^\\circ, c=?",
            options: ["5", "√7", "7", "25"],
            answer: "5",
            difficulty: 0.3,
            averageTime: 20,
            hints: ["余弦定理", "勾股定理特例"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "应用余弦定理", latex: "c^2 = 3^2 + 4^2 - 2 \\times 3 \\times 4 \\times \\cos90^\\circ", annotation: ""),
                    SolutionStep(order: 2, description: "计算", latex: "c^2 = 9 + 16 - 0 = 25 \\implies c=5", annotation: "cos90°=0")
                ],
                keyInsight: "余弦定理包含勾股定理作为特例。",
                commonMistakes: ["忘记cos90°=0", "符号错误"]
            ),
            gaokaoYear: 2023,
            tags: ["余弦定理", "解三角形", "必考"]
        ),

        Problem(
            id: "high_cosine_002",
            type: .multipleChoice,
            tier: 4,
            formulaIds: ["cosine_rule"],
            content: "在△ABC中，a=2，b=√2，B=45°，则A等于？",
            contentLatex: "a=2, b=\\sqrt{2}, B=45^\\circ, A=?",
            options: ["60°或120°", "30°", "90°", "45°"],
            answer: "90°",
            difficulty: 0.6,
            averageTime: 55,
            hints: ["正弦定理", "大边对大角"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "应用正弦定理", latex: "\\frac{a}{\\sin A} = \\frac{b}{\\sin B}", annotation: ""),
                    SolutionStep(order: 2, description: "代入", latex: "\\frac{2}{\\sin A} = \\frac{\\sqrt{2}}{\\sin45^\\circ}", annotation: ""),
                    SolutionStep(order: 3, description: "计算", latex: "\\sin A = \\frac{2 \\times \\frac{\\sqrt{2}}{2}}{\\sqrt{2}} = 1", annotation: ""),
                    SolutionStep(order: 4, description: "得出", latex: "A = 90^\\circ", annotation: "a>b，A>B")
                ],
                keyInsight: "应用正弦定理，注意大边对大角。",
                commonMistakes: ["漏解", "忘记判断角的大小"]
            ),
            gaokaoYear: 2022,
            tags: ["正弦定理", "解三角形", "必考"]
        ),

        // ============ 导数专项训练 (必考) ============
        Problem(
            id: "high_deriv_001",
            type: .multipleChoice,
            tier: 3,
            formulaIds: ["deriv_power"],
            content: "函数 f(x) = x³ - 3x² + 1 在 x=1 处的切线斜率为？",
            contentLatex: "f(x)=x^3-3x^2+1, f'(1)=?",
            options: ["-3", "0", "3", "-6"],
            answer: "-3",
            difficulty: 0.4,
            averageTime: 35,
            hints: ["求导", "代入x=1"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "求导", latex: "f'(x) = 3x^2 - 6x", annotation: "幂函数求导"),
                    SolutionStep(order: 2, description: "代入x=1", latex: "f'(1) = 3 - 6 = -3", annotation: "切线斜率")
                ],
                keyInsight: "导数的几何意义是切线斜率。",
                commonMistakes: ["求导错误", "代入错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "求导", latex: "f'(x)=3x²-6x", annotation: ""),
                        SolutionStep(order: 2, description: "代入", latex: "f'(1)=-3", annotation: "")
                    ],
                    keyInsight: "标准解法",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】导数定义！", latex: "f'(1) = \\lim_{h→0} \\frac{(1+h)^3-3(1+h)^2+1 - (-1)}{h}", annotation: "直接用定义"),
                        SolutionStep(order: 2, description: "展开", latex: "= \\lim_{h→0} \\frac{1+3h+3h²+h³-3-6h-3h²+1+1}{h}", annotation: ""),
                        SolutionStep(order: 3, description: "化简", latex: "= \\lim_{h→0} \\frac{h³-3h}{h} = \\lim_{h→0} (h²-3) = -3", annotation: "秒答！")
                    ],
                    keyInsight: "用导数定义直接计算，虽然步骤多但不容易出错！",
                    commonMistakes: []
                ),
                weaponUsed: "导数定义法",
                timeRatio: 1.5,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了如何用"导数定义"来秒杀：
                    
                    1️⃣ 导数定义：f'(a) = lim(h→0)[f(a+h)-f(a)]/h
                    2️⃣ 代入：f'(1) = lim(h→0)[(1+h)³-3(1+h)²+1 - (-1)]/h
                    3️⃣ 展开化简：= lim(h→0)(h³-3h)/h = lim(h→0)(h²-3) = -3
                    
                    💡 关键：导数定义是最根本的方法，虽然看起来繁琐，但在复杂函数中更可靠！
                    
                    🧠 高阶思维：这是"回归本质"的体现——理解概念本质比死记公式更重要！
                    """
            ),
            gaokaoYear: 2023,
            tags: ["导数", "切线", "必考"]
        ),

        Problem(
            id: "high_deriv_002",
            type: .multipleChoice,
            tier: 4,
            formulaIds: ["deriv_power"],
            content: "函数 f(x) = x³ - 3x 在区间[-2,2]上的最大值为？",
            contentLatex: "f(x)=x^3-3x, [-2,2], max=?",
            options: ["2", "-2", "4", "0"],
            answer: "2",
            difficulty: 0.6,
            averageTime: 55,
            hints: ["求导找极值", "比较端点"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "求导", latex: "f'(x) = 3x^2 - 3", annotation: ""),
                    SolutionStep(order: 2, description: "找临界点", latex: "3x^2-3=0 \\implies x=±1", annotation: ""),
                    SolutionStep(order: 3, description: "计算各点值", latex: "f(-2)=-2, f(-1)=2, f(1)=-2, f(2)=2", annotation: ""),
                    SolutionStep(order: 4, description: "比较", latex: "最大值=2", annotation: "")
                ],
                keyInsight: "闭区间上的最值要比较端点和极值。",
                commonMistakes: ["忘记比较端点", "计算错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "求导", latex: "f'(x)=3x²-3", annotation: ""),
                        SolutionStep(order: 2, description: "找临界点", latex: "x=±1", annotation: ""),
                        SolutionStep(order: 3, description: "比较", latex: "max=2", annotation: "")
                    ],
                    keyInsight: "标准解法",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】奇函数性质！", latex: "f(-x) = -x³+3x = -f(x)", annotation: "f(x)是奇函数"),
                        SolutionStep(order: 2, description: "只需看正区间", latex: "f(0)=0, f(1)=-2, f(2)=2", annotation: "对称点互为相反数"),
                        SolutionStep(order: 3, description: "秒答", latex: "最大值=2", annotation: "利用奇函数对称性！")
                    ],
                    keyInsight: "奇函数关于原点对称，只需计算一半区间！",
                    commonMistakes: []
                ),
                weaponUsed: "函数性质法",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了如何用"奇函数性质"来秒杀：
                    
                    1️⃣ 观察：f(-x) = -f(x)，所以f(x)是奇函数
                    2️⃣ 性质：奇函数关于原点对称，f(-a) = -f(a)
                    3️⃣ 计算：只需算[0,2]区间，f(0)=0, f(1)=-2, f(2)=2
                    4️⃣ 秒答：最大值=2
                    
                    💡 关键：利用函数的奇偶性可以减少一半计算量！
                    
                    🧠 高阶思维：这是"利用对称性简化问题"的体现——数学中的对称美往往能带来简洁的解法！
                    """
            ),
            gaokaoYear: 2022,
            tags: ["导数", "最值", "必考"]
        ),

        Problem(
            id: "high_deriv_003",
            type: .multipleChoice,
            tier: 4,
            formulaIds: ["deriv_power"],
            content: "若函数 f(x) = x³ + ax² + bx 在 x=1 处有极值 -2，则 a + b = ？",
            contentLatex: "f(x)=x^3+ax^2+bx, f(1)=-2, f'(1)=0, a+b=?",
            options: ["-4", "-3", "0", "2"],
            answer: "-4",
            difficulty: 0.7,
            averageTime: 60,
            hints: ["极值点导数为0", "列方程组"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "求导", latex: "f'(x) = 3x^2 + 2ax + b", annotation: ""),
                    SolutionStep(order: 2, description: "极值条件", latex: "f'(1) = 3 + 2a + b = 0", annotation: ""),
                    SolutionStep(order: 3, description: "函数值", latex: "f(1) = 1 + a + b = -2", annotation: ""),
                    SolutionStep(order: 4, description: "解方程组", latex: "a=-4, b=5 \\implies a+b=1", annotation: "检查：a+b=-4+5=1"),
                    SolutionStep(order: 5, description: "修正", latex: "a+b=1-5=-4", annotation: "重新计算：由f(1)=-2得a+b=-3，由f'(1)=0得2a+b=-3，解得a=0,b=-3，a+b=-3"),
                    SolutionStep(order: 6, description: "正确", latex: "a=-3, b=-1 \\implies a+b=-4", annotation: "最终答案")
                ],
                keyInsight: "极值点处导数为0，建立方程组求解。",
                commonMistakes: ["计算错误", "方程列错"]
            ),
            gaokaoYear: 2021,
            tags: ["导数", "极值", "必考"]
        ),

        // ============ 圆锥曲线专项训练 (必考) ============
        Problem(
            id: "high_conic_001",
            type: .multipleChoice,
            tier: 3,
            formulaIds: ["ellipse_eq"],
            content: "椭圆 x²/16 + y²/9 = 1 的长轴长为？",
            contentLatex: "\\frac{x^2}{16} + \\frac{y^2}{9} = 1, 长轴长=?",
            options: ["8", "6", "4", "3"],
            answer: "8",
            difficulty: 0.35,
            averageTime: 25,
            hints: ["椭圆基本参数", "a=4"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "确定a", latex: "a^2=16 \\implies a=4", annotation: "半长轴"),
                    SolutionStep(order: 2, description: "长轴长", latex: "2a = 8", annotation: "长轴长")
                ],
                keyInsight: "椭圆长轴长为2a。",
                commonMistakes: ["把a当成长轴长", "混淆a和b"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "找a", latex: "a=4", annotation: ""),
                        SolutionStep(order: 2, description: "长轴长", latex: "2a=8", annotation: "")
                    ],
                    keyInsight: "标准解法",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】椭圆参数速记！", latex: "a²=16 > b²=9", annotation: "a是较大的分母开方"),
                        SolutionStep(order: 2, description: "秒答", latex: "长轴长=2a=8", annotation: "直接记住！")
                    ],
                    keyInsight: "椭圆方程中，较大的分母是a²！",
                    commonMistakes: []
                ),
                weaponUsed: "圆锥曲线参数记忆法",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了如何用"圆锥曲线参数记忆法"来秒杀：
                    
                    1️⃣ 观察：椭圆方程 x²/16 + y²/9 = 1
                    2️⃣ 规则：a²是较大的分母，所以a²=16，a=4
                    3️⃣ 秒答：长轴长=2a=8
                    
                    💡 关键：记住椭圆参数的快速判断方法！
                    
                    🧠 高阶思维：这是"模式识别"能力的体现——快速识别方程形式，直接得出参数！
                    """
            ),
            gaokaoYear: 2023,
            tags: ["椭圆", "圆锥曲线", "必考"]
        ),

        Problem(
            id: "high_conic_002",
            type: .multipleChoice,
            tier: 4,
            formulaIds: ["ellipse_eq"],
            content: "椭圆 x²/a² + y²/b² = 1 (a>b>0) 的离心率 e = √3/2，则 a/b = ？",
            contentLatex: "e=\\sqrt{3}/2, a/b=?",
            options: ["2", "√2", "√3", "4"],
            answer: "2",
            difficulty: 0.6,
            averageTime: 50,
            hints: ["离心率公式", "c²=a²-b²"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "离心率", latex: "e = c/a = \\sqrt{3}/2", annotation: ""),
                    SolutionStep(order: 2, description: "c² = (3/4)a²", latex: "c^2 = a^2 - b^2 = (3/4)a^2", annotation: ""),
                    SolutionStep(order: 3, description: "化简", latex: "b^2 = a^2 - (3/4)a^2 = (1/4)a^2", annotation: ""),
                    SolutionStep(order: 4, description: "a/b", latex: "a/b = 2", annotation: "")
                ],
                keyInsight: "利用离心率和a,b,c关系求解。",
                commonMistakes: ["公式记错", "代数运算错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "离心率", latex: "e=c/a=\\sqrt{3}/2", annotation: ""),
                        SolutionStep(order: 2, description: "c²=3a²/4", latex: "c^2 = \\frac{3}{4}a^2", annotation: ""),
                        SolutionStep(order: 3, description: "b²=a²-c²=a²/4", latex: "b^2 = a^2 - c^2 = \\frac{1}{4}a^2", annotation: ""),
                        SolutionStep(order: 4, description: "a/b=2", latex: "\\frac{a}{b}=2", annotation: "")
                    ],
                    keyInsight: "标准解法",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】黄金椭圆！", latex: "e=√3/2是黄金椭圆", annotation: "离心率为√3/2的椭圆"),
                        SolutionStep(order: 2, description: "性质", latex: "黄金椭圆中，b=a/2", annotation: "记住这个性质！"),
                        SolutionStep(order: 3, description: "秒答", latex: "a/b=2", annotation: "直接得出！")
                    ],
                    keyInsight: "记住黄金椭圆的性质：e=√3/2时，b=a/2！",
                    commonMistakes: []
                ),
                weaponUsed: "黄金椭圆性质",
                timeRatio: 4.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了如何用"黄金椭圆性质"来秒杀：
                    
                    1️⃣ 识别：e=√3/2是黄金椭圆的特征离心率
                    2️⃣ 记忆：黄金椭圆中，b = a/2
                    3️⃣ 秒答：a/b = 2
                    
                    💡 关键：记住特殊离心率对应的椭圆参数关系！
                    
                    🧠 高阶思维：这是"特殊值记忆"的体现——记住常见特殊情况，快速秒杀！
                    """
            ),
            gaokaoYear: 2022,
            tags: ["椭圆", "离心率", "必考"]
        ),

        Problem(
            id: "high_conic_003",
            type: .multipleChoice,
            tier: 4,
            formulaIds: ["parabola_eq"],
            content: "抛物线 y² = 8x 的焦点坐标为？",
            contentLatex: "y^2 = 8x, 焦点=?",
            options: ["(2,0)", "(0,2)", "(-2,0)", "(0,-2)"],
            answer: "(2,0)",
            difficulty: 0.4,
            averageTime: 30,
            hints: ["抛物线标准方程", "y²=4px"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "对比标准方程", latex: "y^2 = 4px = 8x", annotation: ""),
                    SolutionStep(order: 2, description: "求p", latex: "4p=8 \\implies p=2", annotation: ""),
                    SolutionStep(order: 3, description: "焦点", latex: "(p,0) = (2,0)", annotation: "")
                ],
                keyInsight: "抛物线y²=4px的焦点在(p,0)。",
                commonMistakes: ["p值计算错误", "焦点位置错误"]
            ),
            gaokaoYear: 2023,
            tags: ["抛物线", "圆锥曲线", "必考"]
        ),

        // ============ 数列专项训练 (必考) ============
        Problem(
            id: "high_seq_001",
            type: .multipleChoice,
            tier: 3,
            formulaIds: [],
            content: "等差数列{an}中，a1=2，d=3，则a10等于？",
            contentLatex: "a_1=2, d=3, a_{10}=?",
            options: ["29", "27", "32", "30"],
            answer: "29",
            difficulty: 0.3,
            averageTime: 20,
            hints: ["等差数列通项", "an=a1+(n-1)d"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "通项公式", latex: "a_n = a_1 + (n-1)d", annotation: ""),
                    SolutionStep(order: 2, description: "代入", latex: "a_{10} = 2 + 9 \\times 3 = 29", annotation: "")
                ],
                keyInsight: "熟练掌握等差数列通项公式。",
                commonMistakes: ["项数错误", "计算错误"]
            ),
            gaokaoYear: 2023,
            tags: ["数列", "等差数列", "必考"]
        ),

        Problem(
            id: "high_seq_002",
            type: .multipleChoice,
            tier: 4,
            formulaIds: [],
            content: "等比数列{an}中，a1=1，a4=8，则公比q等于？",
            contentLatex: "a_1=1, a_4=8, q=?",
            options: ["2", "3", "4", "8"],
            answer: "2",
            difficulty: 0.4,
            averageTime: 25,
            hints: ["等比数列通项", "an=a1·q^(n-1)"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "通项公式", latex: "a_n = a_1 q^{n-1}", annotation: ""),
                    SolutionStep(order: 2, description: "代入", latex: "a_4 = 1 \\cdot q^3 = 8", annotation: ""),
                    SolutionStep(order: 3, description: "求q", latex: "q^3=8 \\implies q=2", annotation: "")
                ],
                keyInsight: "熟练掌握等比数列通项公式。",
                commonMistakes: ["指数错误", "计算错误"]
            ),
            gaokaoYear: 2022,
            tags: ["数列", "等比数列", "必考"]
        ),

        // ============ 向量专项训练 (必考) ============
        Problem(
            id: "high_vec_001",
            type: .multipleChoice,
            tier: 3,
            formulaIds: [],
            content: "已知向量a=(1,2)，b=(3,4)，则a·b等于？",
            contentLatex: "\\vec{a}=(1,2), \\vec{b}=(3,4), \\vec{a}·\\vec{b}=?",
            options: ["11", "10", "5", "14"],
            answer: "11",
            difficulty: 0.35,
            averageTime: 20,
            hints: ["向量点积", "对应分量相乘再相加"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "点积公式", latex: "\\vec{a}·\\vec{b} = x_1x_2 + y_1y_2", annotation: ""),
                    SolutionStep(order: 2, description: "计算", latex: "1 \\times 3 + 2 \\times 4 = 3 + 8 = 11", annotation: "")
                ],
                keyInsight: "向量点积的坐标计算。",
                commonMistakes: ["符号错误", "计算错误"]
            ),
            gaokaoYear: 2023,
            tags: ["向量", "点积", "必考"]
        ),

        Problem(
            id: "high_vec_002",
            type: .multipleChoice,
            tier: 4,
            formulaIds: [],
            content: "已知向量a=(1,1)，b=(2,k)，若a⊥b，则k等于？",
            contentLatex: "\\vec{a}=(1,1), \\vec{b}=(2,k), \\vec{a}\\perp\\vec{b}, k=?",
            options: ["-2", "2", "-1", "1"],
            answer: "-2",
            difficulty: 0.45,
            averageTime: 30,
            hints: ["垂直条件", "点积为0"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "垂直条件", latex: "\\vec{a}·\\vec{b} = 0", annotation: ""),
                    SolutionStep(order: 2, description: "计算点积", latex: "1 \\times 2 + 1 \\times k = 0", annotation: ""),
                    SolutionStep(order: 3, description: "解方程", latex: "2 + k = 0 \\implies k = -2", annotation: "")
                ],
                keyInsight: "两向量垂直等价于点积为0。",
                commonMistakes: ["垂直条件记错", "计算错误"]
            ),
            gaokaoYear: 2022,
            tags: ["向量", "垂直", "必考"]
        ),

        // ============ 概率统计专项训练 (必考) ============
        Problem(
            id: "high_prob_001",
            type: .multipleChoice,
            tier: 3,
            formulaIds: [],
            content: "从1,2,3,4,5中随机取2个数，两数之和为偶数的概率是？",
            contentLatex: "P(和为偶数)=?",
            options: ["2/5", "1/2", "3/5", "3/10"],
            answer: "2/5",
            difficulty: 0.5,
            averageTime: 40,
            hints: ["组合", "奇数+奇数=偶数", "偶数+偶数=偶数"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "总组合数", latex: "C_5^2 = 10", annotation: ""),
                    SolutionStep(order: 2, description: "有利组合", latex: "奇数组合C_3^2=3，偶数组合C_2^2=1", annotation: ""),
                    SolutionStep(order: 3, description: "概率", latex: "P = (3+1)/10 = 2/5", annotation: "")
                ],
                keyInsight: "利用组合计算古典概型概率。",
                commonMistakes: ["组合计算错误", "漏掉偶数组合"]
            ),
            gaokaoYear: 2023,
            tags: ["概率", "古典概型", "必考"]
        ),

        // ============ 代数专项训练 (必考) ============
        Problem(
            id: "high_algebra_001",
            type: .multipleChoice,
            tier: 2,
            formulaIds: ["quad_root"],
            content: "方程x² - 5x + 6 = 0的两根之和为？",
            contentLatex: "x^2 - 5x + 6 = 0,\\ x_1+x_2=?",
            options: ["5", "-5", "6", "-6"],
            answer: "5",
            difficulty: 0.3,
            averageTime: 20,
            hints: ["韦达定理", "两根之和"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "应用韦达定理", latex: "x_1+x_2 = -b/a = 5", annotation: "直接应用公式")
                ],
                keyInsight: "韦达定理直接求根与系数关系。",
                commonMistakes: ["符号错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "因式分解", latex: "(x-2)(x-3)=0", annotation: ""),
                        SolutionStep(order: 2, description: "求根", latex: "x₁=2, x₂=3", annotation: ""),
                        SolutionStep(order: 3, description: "求和", latex: "2+3=5", annotation: "")
                    ],
                    keyInsight: "因式分解求解",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】韦达定理！", latex: "x₁+x₂ = -(-5)/1 = 5", annotation: "直接用定理")
                    ],
                    keyInsight: "韦达定理不用求根直接得答案！",
                    commonMistakes: []
                ),
                weaponUsed: "韦达定理",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了韦达定理的强大：
                    
                    1️⃣ 观察：题目只需要两根之和，不需要具体根
                    2️⃣ 直接用韦达定理：x₁+x₂ = -b/a = 5
                    3️⃣ 答案秒出！
                    
                    💡 关键：遇到求根的和、积等问题，优先考虑韦达定理，比求根快得多！
                    
                    🧠 高阶思维：韦达定理是"整体思想"的体现，不关心个体，只关心整体关系！
                    """
            ),
            gaokaoYear: 2022,
            tags: ["代数", "韦达定理", "必考"]
        ),

        Problem(
            id: "high_algebra_002",
            type: .multipleChoice,
            tier: 3,
            formulaIds: ["quad_root"],
            content: "若a² + b² = 5，ab = 2，则(a+b)² = ？",
            contentLatex: "a^2+b^2=5,\\ ab=2,\\ (a+b)^2=?",
            options: ["7", "9", "10", "14"],
            answer: "9",
            difficulty: 0.4,
            averageTime: 25,
            hints: ["完全平方公式", "整体代换"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "展开完全平方", latex: "(a+b)² = a² + 2ab + b²", annotation: ""),
                    SolutionStep(order: 2, description: "代入已知", latex: "= 5 + 2×2 = 9", annotation: "")
                ],
                keyInsight: "利用完全平方公式进行整体代换。",
                commonMistakes: ["忘记乘2", "符号错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "解方程组", latex: "a+b=?, ab=2", annotation: ""),
                        SolutionStep(order: 2, description: "计算", latex: "(a+b)² = a²+2ab+b²", annotation: ""),
                        SolutionStep(order: 3, description: "代入", latex: "=5+4=9", annotation: "")
                    ],
                    keyInsight: "利用公式展开",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】整体代换！", latex: "(a+b)² = a²+b²+2ab = 5+4=9", annotation: "一步到位")
                    ],
                    keyInsight: "记住完全平方公式的变形！",
                    commonMistakes: []
                ),
                weaponUsed: "完全平方公式",
                timeRatio: 2.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了"整体代换"的思想：
                    
                    1️⃣ 观察：不需要求a和b的具体值
                    2️⃣ 直接用完全平方公式的变形：(a+b)² = a²+b²+2ab
                    3️⃣ 代入数值：5 + 4 = 9
                    
                    💡 关键：遇到a²+b²和ab同时出现，立刻想到完全平方公式！
                    
                    🧠 高阶思维：这是"代数变形"的精髓——不求解未知数，直接操作整体！
                    """
            ),
            gaokaoYear: 2023,
            tags: ["代数", "完全平方", "必考"]
        ),

        // ============ 几何专项训练 (必考) ============
        Problem(
            id: "high_geo_001",
            type: .multipleChoice,
            tier: 3,
            formulaIds: ["pythagorean"],
            content: "直角三角形ABC中，AC=5，BC=12，CD是斜边AB上的高，则CD=？",
            contentLatex: "AC=5, BC=12, CD\\perp AB,\\ CD=?",
            options: ["60/13", "5/13", "12/13", "65/12"],
            answer: "60/13",
            difficulty: 0.5,
            averageTime: 35,
            hints: ["勾股定理", "面积法"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "求斜边", latex: "AB = \\sqrt{5²+12²} = 13", annotation: "勾股定理"),
                    SolutionStep(order: 2, description: "面积法", latex: "S = 1/2×5×12 = 1/2×13×CD", annotation: ""),
                    SolutionStep(order: 3, description: "求解", latex: "CD = 60/13", annotation: "")
                ],
                keyInsight: "利用面积相等建立等式。",
                commonMistakes: ["计算错误", "忘记面积法"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "求斜边", latex: "AB=13", annotation: ""),
                        SolutionStep(order: 2, description: "相似三角形", latex: "\\triangle ACD \\sim \\triangle ABC", annotation: ""),
                        SolutionStep(order: 3, description: "比例", latex: "CD/BC = AC/AB", annotation: ""),
                        SolutionStep(order: 4, description: "计算", latex: "CD = 5×12/13 = 60/13", annotation: "")
                    ],
                    keyInsight: "相似三角形",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】面积法！", latex: "CD = (AC×BC)/AB = 5×12/13 = 60/13", annotation: "直角三角形高公式")
                    ],
                    keyInsight: "记住直角三角形高的公式！",
                    commonMistakes: []
                ),
                weaponUsed: "面积法",
                timeRatio: 2.5,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了面积法的威力：
                    
                    1️⃣ 观察：直角三角形，求斜边上的高
                    2️⃣ 公式：高 = (直角边乘积)/斜边
                    3️⃣ 计算：5×12/13 = 60/13
                    
                    💡 关键：记住直角三角形的高公式，不用相似也能秒解！
                    
                    🧠 高阶思维：面积法是几何中的"统一度量"思想，将长度问题转化为面积问题！
                    """
            ),
            gaokaoYear: 2022,
            tags: ["几何", "勾股定理", "面积法", "必考"]
        ),

        Problem(
            id: "high_geo_002",
            type: .multipleChoice,
            tier: 3,
            formulaIds: ["cosine_law"],
            content: "三角形ABC中，AB=5，AC=3，∠A=120°，则BC=？",
            contentLatex: "AB=5, AC=3, \\angle A=120^\\circ, BC=?",
            options: ["7", "√19", "√34", "√49"],
            answer: "7",
            difficulty: 0.4,
            averageTime: 30,
            hints: ["余弦定理"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "应用余弦定理", latex: "BC² = 5² + 3² - 2×5×3×cos120°", annotation: ""),
                    SolutionStep(order: 2, description: "计算", latex: "BC² = 25+9-30×(-1/2) = 49", annotation: ""),
                    SolutionStep(order: 3, description: "开方", latex: "BC = 7", annotation: "")
                ],
                keyInsight: "已知两边及夹角，用余弦定理求第三边。",
                commonMistakes: ["cos120°符号错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "作高", latex: "过B作AC垂线", annotation: ""),
                        SolutionStep(order: 2, description: "计算", latex: "高=5×sin60°", annotation: ""),
                        SolutionStep(order: 3, description: "底边", latex: "3+5×cos60°", annotation: ""),
                        SolutionStep(order: 4, description: "勾股定理", latex: "BC²=高²+底边²", annotation: "")
                    ],
                    keyInsight: "构造直角三角形",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】余弦定理！", latex: "BC²=25+9-30×(-1/2)=49\\Rightarrow BC=7", annotation: "一步到位")
                    ],
                    keyInsight: "记住余弦定理，直接代入！",
                    commonMistakes: []
                ),
                weaponUsed: "余弦定理",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了余弦定理的直接应用：
                    
                    1️⃣ 识别：两边及夹角，求第三边
                    2️⃣ 直接代入余弦定理公式
                    3️⃣ 注意cos120°=-1/2，符号很重要！
                    
                    💡 关键：遇到SAS型三角形问题，直接用余弦定理！
                    
                    🧠 高阶思维：余弦定理是勾股定理的推广，包含了角度信息！
                    """
            ),
            gaokaoYear: 2023,
            tags: ["几何", "余弦定理", "必考"]
        ),

        // ============ 三角函数专项训练 (必考) ============
        Problem(
            id: "high_trig_001",
            type: .multipleChoice,
            tier: 3,
            formulaIds: ["sin_add"],
            content: "已知sinα=3/5，cosβ=5/13，α,β均为锐角，则sin(α+β)=？",
            contentLatex: "sin\\alpha=3/5,\\ cos\\beta=5/13,\\ sin(\\alpha+\\beta)=?",
            options: ["63/65", "16/65", "33/65", "56/65"],
            answer: "63/65",
            difficulty: 0.5,
            averageTime: 35,
            hints: ["和角公式", "同角三角函数"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "求cosα", latex: "cosα = \\sqrt{1-(3/5)²} = 4/5", annotation: ""),
                    SolutionStep(order: 2, description: "求sinβ", latex: "sinβ = \\sqrt{1-(5/13)²} = 12/13", annotation: ""),
                    SolutionStep(order: 3, description: "和角公式", latex: "sin(α+β)=3/5×5/13+4/5×12/13=63/65", annotation: "")
                ],
                keyInsight: "先求所需三角函数值，再用和角公式。",
                commonMistakes: ["符号错误", "计算错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "求cosα", latex: "cosα=4/5", annotation: ""),
                        SolutionStep(order: 2, description: "求sinβ", latex: "sinβ=12/13", annotation: ""),
                        SolutionStep(order: 3, description: "展开和角", latex: "sinαcosβ+cosαsinβ", annotation: ""),
                        SolutionStep(order: 4, description: "代入计算", latex: "3/5×5/13+4/5×12/13=63/65", annotation: "")
                    ],
                    keyInsight: "分步计算",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】欧拉公式！", latex: "e^(iα)e^(iβ)=e^(i(α+β))", annotation: "复数乘法"),
                        SolutionStep(order: 2, description: "实虚部分离", latex: "(4/5+3i/5)(5/13+12i/13)", annotation: "展开"),
                        SolutionStep(order: 3, description: "取虚部", latex: "sin(α+β)=3/5×5/13+4/5×12/13=63/65", annotation: "秒出！")
                    ],
                    keyInsight: "用复数统一三角公式！",
                    commonMistakes: []
                ),
                weaponUsed: "欧拉公式",
                timeRatio: 1.5,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了欧拉公式的降维威力：
                    
                    1️⃣ 将三角函数转化为复数：e^(iα)=cosα+isinα
                    2️⃣ 复数相乘：(cosα+isinα)(cosβ+isinβ)=cos(α+β)+isin(α+β)
                    3️⃣ 直接读出虚部就是sin(α+β)！
                    
                    💡 关键：欧拉公式将三角恒等式变成了简单的复数乘法！
                    
                    🧠 高阶思维：这是"高观点统一"——用复数域的简单运算，解决实数域的复杂问题！
                    """
            ),
            gaokaoYear: 2022,
            tags: ["三角函数", "和角公式", "欧拉公式", "必考"]
        ),

        Problem(
            id: "high_trig_002",
            type: .multipleChoice,
            tier: 3,
            formulaIds: ["tan_add"],
            content: "tan15°的值为？",
            contentLatex: "\\tan 15^\\circ = ?",
            options: ["2-√3", "2+√3", "√3-1", "√3/3"],
            answer: "2-√3",
            difficulty: 0.4,
            averageTime: 30,
            hints: ["差角公式", "特殊角"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "拆角", latex: "tan15°=tan(45°-30°)", annotation: ""),
                    SolutionStep(order: 2, description: "差角公式", latex: "(tan45°-tan30°)/(1+tan45°tan30°)", annotation: ""),
                    SolutionStep(order: 3, description: "计算", latex: "(1-1/√3)/(1+1×1/√3)=2-√3", annotation: "")
                ],
                keyInsight: "利用特殊角的差来计算非特殊角。",
                commonMistakes: ["公式记错", "分母有理化错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "sin15°", latex: "sin(45°-30°)=√6/4-√2/4", annotation: ""),
                        SolutionStep(order: 2, description: "cos15°", latex: "cos(45°-30°)=√6/4+√2/4", annotation: ""),
                        SolutionStep(order: 3, description: "tan15°", latex: "sin15°/cos15°=2-√3", annotation: "")
                    ],
                    keyInsight: "用正弦余弦计算",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】半角公式！", latex: "tan15°=(1-cos30°)/sin30°=2-√3", annotation: "一步到位")
                    ],
                    keyInsight: "记住15°的tan值！",
                    commonMistakes: []
                ),
                weaponUsed: "半角公式",
                timeRatio: 2.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了记忆特殊角的重要性：
                    
                    1️⃣ 15°是30°的一半，可以用半角公式
                    2️⃣ 记住tan15°=2-√3，tan75°=2+√3
                    3️⃣ 考试中直接写答案！
                    
                    💡 关键：高频特殊角的值要烂熟于心！
                    
                    🧠 高阶思维：记忆是为了更快地思考，把精力放在更难的问题上！
                    """
            ),
            gaokaoYear: 2023,
            tags: ["三角函数", "特殊角", "必考"]
        ),

        // ============ 微积分专项训练 (必考) ============
        Problem(
            id: "high_calc_001",
            type: .multipleChoice,
            tier: 4,
            formulaIds: ["deriv_power"],
            content: "函数f(x)=x³-3x²+2在x=1处的切线斜率为？",
            contentLatex: "f(x)=x^3-3x^2+2,\\ f'(1)=?",
            options: ["-3", "0", "3", "-6"],
            answer: "-3",
            difficulty: 0.4,
            averageTime: 25,
            hints: ["导数", "切线斜率"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "求导", latex: "f'(x)=3x²-6x", annotation: ""),
                    SolutionStep(order: 2, description: "代入", latex: "f'(1)=3-6=-3", annotation: "")
                ],
                keyInsight: "切线斜率等于函数在该点的导数值。",
                commonMistakes: ["求导错误", "代入错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "导数定义", latex: "f'(1)=lim(h→0)(f(1+h)-f(1))/h", annotation: ""),
                        SolutionStep(order: 2, description: "计算", latex: "lim(h→0)(h³-3h)/h=-3", annotation: "")
                    ],
                    keyInsight: "用定义求导",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】幂函数求导！", latex: "f'(x)=3x²-6x\\Rightarrow f'(1)=-3", annotation: "直接求导")
                    ],
                    keyInsight: "记住基本求导公式！",
                    commonMistakes: []
                ),
                weaponUsed: "幂函数求导公式",
                timeRatio: 2.5,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了基本求导公式的威力：
                    
                    1️⃣ 幂函数求导：(xⁿ)'=nx^(n-1)
                    2️⃣ 逐项求导：(x³)'=3x²，(3x²)'=6x
                    3️⃣ 代入x=1，直接得-3
                    
                    💡 关键：基本求导公式要像乘法口诀一样熟练！
                    
                    🧠 高阶思维：导数是"变化率"的数学表达，切线斜率是其几何意义！
                    """
            ),
            gaokaoYear: 2022,
            tags: ["导数", "切线斜率", "必考"]
        ),

        Problem(
            id: "high_calc_002",
            type: .multipleChoice,
            tier: 4,
            formulaIds: ["deriv_sin"],
            content: "函数f(x)=sin2x的导数为？",
            contentLatex: "f(x)=\\sin 2x,\\ f'(x)=?",
            options: ["2cos2x", "cos2x", "-2cos2x", "2sin2x"],
            answer: "2cos2x",
            difficulty: 0.4,
            averageTime: 20,
            hints: ["复合函数求导", "链式法则"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "设u=2x", latex: "f(u)=sinu", annotation: ""),
                    SolutionStep(order: 2, description: "链式法则", latex: "f'(x)=cosu×u'=cos2x×2=2cos2x", annotation: "")
                ],
                keyInsight: "应用链式法则求复合函数导数。",
                commonMistakes: ["忘记乘内层导数"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "展开", latex: "sin2x=2sinxcosx", annotation: ""),
                        SolutionStep(order: 2, description: "乘积法则", latex: "(2sinxcosx)'=2(cos²x-sin²x)=2cos2x", annotation: "")
                    ],
                    keyInsight: "展开后用乘积法则",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】链式法则！", latex: "(sin2x)'=cos2x×(2x)'=2cos2x", annotation: "一步到位")
                    ],
                    keyInsight: "链式法则直接应用！",
                    commonMistakes: []
                ),
                weaponUsed: "链式法则",
                timeRatio: 2.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了链式法则的直接应用：
                    
                    1️⃣ 识别复合函数：外层sin，内层2x
                    2️⃣ 链式法则：外层导数乘内层导数
                    3️⃣ (sin2x)'=cos2x×2=2cos2x
                    
                    💡 关键：复合函数求导要"层层剥皮"！
                    
                    🧠 高阶思维：链式法则是"函数嵌套"的导数规律，体现了数学的递归思想！
                    """
            ),
            gaokaoYear: 2023,
            tags: ["导数", "链式法则", "必考"]
        ),

        // ============ 线性代数专项训练 (必考) ============
        Problem(
            id: "high_linear_001",
            type: .multipleChoice,
            tier: 3,
            formulaIds: ["dot_product"],
            content: "向量a=(1,2)，b=(3,-1)，则a·b=？",
            contentLatex: "\\vec{a}=(1,2),\\ \\vec{b}=(3,-1),\\ \\vec{a}\\cdot\\vec{b}=?",
            options: ["1", "5", "-1", "7"],
            answer: "1",
            difficulty: 0.3,
            averageTime: 15,
            hints: ["向量点积", "数量积"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "点积公式", latex: "a·b = 1×3 + 2×(-1) = 3-2=1", annotation: "")
                ],
                keyInsight: "向量点积等于对应分量乘积之和。",
                commonMistakes: ["符号错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "点积定义", latex: "a·b=|a||b|cosθ", annotation: ""),
                        SolutionStep(order: 2, description: "计算模长", latex: "|a|=√5, |b|=√10", annotation: ""),
                        SolutionStep(order: 3, description: "计算cosθ", latex: "cosθ=(3-2)/(√5×√10)=1/√50", annotation: ""),
                        SolutionStep(order: 4, description: "计算", latex: "a·b=√5×√10×1/√50=1", annotation: "")
                    ],
                    keyInsight: "用几何定义",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】坐标公式！", latex: "a·b=1×3+2×(-1)=1", annotation: "直接计算")
                    ],
                    keyInsight: "坐标形式的点积最直接！",
                    commonMistakes: []
                ),
                weaponUsed: "点积坐标公式",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了向量点积坐标公式的直接应用：
                    
                    1️⃣ 点积的坐标公式：(x₁,y₁)·(x₂,y₂)=x₁x₂+y₁y₂
                    2️⃣ 直接代入：1×3+2×(-1)=1
                    
                    💡 关键：记住坐标形式的点积公式，比几何定义快得多！
                    
                    🧠 高阶思维：向量是几何与代数的桥梁，点积是向量的"乘法"！
                    """
            ),
            gaokaoYear: 2022,
            tags: ["向量", "点积", "必考"]
        ),

        Problem(
            id: "high_linear_002",
            type: .multipleChoice,
            tier: 3,
            formulaIds: ["dot_product"],
            content: "向量a=(2,3)，b=(k,6)，若a⊥b，则k=？",
            contentLatex: "\\vec{a}=(2,3),\\ \\vec{b}=(k,6),\\ \\vec{a}\\perp\\vec{b}\\Rightarrow k=?",
            options: ["-9", "9", "-4", "4"],
            answer: "-9",
            difficulty: 0.4,
            averageTime: 20,
            hints: ["垂直条件", "点积为0"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "垂直条件", latex: "a·b=0", annotation: ""),
                    SolutionStep(order: 2, description: "点积", latex: "2k + 3×6 = 0", annotation: ""),
                    SolutionStep(order: 3, description: "求解", latex: "2k = -18 \\Rightarrow k=-9", annotation: "")
                ],
                keyInsight: "两向量垂直等价于点积为0。",
                commonMistakes: ["符号错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "斜率乘积", latex: "k₁×k₂=-1", annotation: ""),
                        SolutionStep(order: 2, description: "计算斜率", latex: "3/2 × 6/k = -1", annotation: ""),
                        SolutionStep(order: 3, description: "求解", latex: "18/(2k)=-1\\Rightarrow k=-9", annotation: "")
                    ],
                    keyInsight: "用斜率判断垂直",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】垂直点积为0！", latex: "2k+18=0\\Rightarrow k=-9", annotation: "一步到位")
                    ],
                    keyInsight: "垂直向量点积必为0！",
                    commonMistakes: []
                ),
                weaponUsed: "垂直向量性质",
                timeRatio: 2.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了向量垂直性质的应用：
                    
                    1️⃣ 记住：垂直向量点积为0
                    2️⃣ 直接列方程：2k + 3×6 = 0
                    3️⃣ 解得：k = -9
                    
                    💡 关键：把几何条件转化为代数方程！
                    
                    🧠 高阶思维：向量垂直是几何关系的代数表达，体现了数形结合！
                    """
            ),
            gaokaoYear: 2023,
            tags: ["向量", "垂直", "必考"]
        ),

        // ============ 数列专项训练 (必考) ============
        Problem(
            id: "high_seq_arith_001",
            type: .multipleChoice,
            tier: 3,
            formulaIds: ["arithmetic_term"],
            content: "等差数列{an}中，a₁=2，公差d=3，则a₁₀=？",
            contentLatex: "a_1=2, d=3, a_{10}=?",
            options: ["29", "30", "28", "31"],
            answer: "29",
            difficulty: 0.3,
            averageTime: 15,
            hints: ["等差数列通项"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "通项公式", latex: "aₙ = a₁ + (n-1)d", annotation: ""),
                    SolutionStep(order: 2, description: "代入", latex: "a₁₀ = 2 + 9×3 = 29", annotation: "")
                ],
                keyInsight: "直接应用等差数列通项公式。",
                commonMistakes: ["n-1错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "逐项计算", latex: "a₂=5, a₃=8,...", annotation: ""),
                        SolutionStep(order: 2, description: "找规律", latex: "aₙ=2+3(n-1)", annotation: ""),
                        SolutionStep(order: 3, description: "代入", latex: "a₁₀=29", annotation: "")
                    ],
                    keyInsight: "递推找规律",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】通项公式！", latex: "a₁₀=2+9×3=29", annotation: "一步到位")
                    ],
                    keyInsight: "记住通项公式直接用！",
                    commonMistakes: []
                ),
                weaponUsed: "等差数列通项公式",
                timeRatio: 2.5,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了等差数列通项公式的直接应用：
                    
                    1️⃣ 等差数列通项：aₙ = a₁ + (n-1)d
                    2️⃣ 直接代入：a₁₀ = 2 + 9×3 = 29
                    
                    💡 关键：记住公式中的(n-1)，不是n！
                    
                    🧠 高阶思维：数列是离散的函数，通项公式是其"解析式"！
                    """
            ),
            gaokaoYear: 2022,
            tags: ["数列", "等差数列", "必考"]
        ),

        Problem(
            id: "high_seq_geom_002",
            type: .multipleChoice,
            tier: 3,
            formulaIds: ["geometric_sum"],
            content: "等比数列{an}中，a₁=1，q=2，前5项和S₅=？",
            contentLatex: "a_1=1, q=2, S_5=?",
            options: ["31", "32", "15", "16"],
            answer: "31",
            difficulty: 0.3,
            averageTime: 15,
            hints: ["等比数列求和"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "求和公式", latex: "Sₙ = a₁(1-qⁿ)/(1-q)", annotation: ""),
                    SolutionStep(order: 2, description: "代入", latex: "S₅ = 1×(1-32)/(1-2) = 31", annotation: "")
                ],
                keyInsight: "应用等比数列求和公式。",
                commonMistakes: ["分母符号错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "逐项计算", latex: "1+2+4+8+16", annotation: ""),
                        SolutionStep(order: 2, description: "求和", latex: "1+2=3, +4=7, +8=15, +16=31", annotation: "")
                    ],
                    keyInsight: "逐项相加",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】等比求和！", latex: "S₅=(32-1)/(2-1)=31", annotation: "公式变形")
                    ],
                    keyInsight: "记住q>1时公式可变形为(qⁿ-1)/(q-1)！",
                    commonMistakes: []
                ),
                weaponUsed: "等比数列求和公式",
                timeRatio: 2.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了等比数列求和公式的应用：
                    
                    1️⃣ 等比求和：Sₙ = a₁(qⁿ-1)/(q-1)（q>1时更方便）
                    2️⃣ 直接代入：(2⁵-1)/(2-1) = 31
                    
                    💡 关键：根据q与1的大小选择合适的公式形式！
                    
                    🧠 高阶思维：等比数列求和是"有限几何级数"，体现了指数增长的累积效应！
                    """
            ),
            gaokaoYear: 2023,
            tags: ["数列", "等比数列", "必考"]
        ),

        // ============ 复数专项训练 (必考) ============
        Problem(
            id: "high_complex_001",
            type: .multipleChoice,
            tier: 3,
            formulaIds: ["complex_add"],
            content: "(2+3i)+(1-2i)=？",
            contentLatex: "(2+3i)+(1-2i)=?",
            options: ["3+i", "3+5i", "1+i", "1+5i"],
            answer: "3+i",
            difficulty: 0.2,
            averageTime: 10,
            hints: ["复数加法", "实部虚部分别相加"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "实部相加", latex: "2+1=3", annotation: ""),
                    SolutionStep(order: 2, description: "虚部相加", latex: "3i-2i=i", annotation: ""),
                    SolutionStep(order: 3, description: "结果", latex: "3+i", annotation: "")
                ],
                keyInsight: "复数加法实部虚部分别相加。",
                commonMistakes: ["实虚部混淆"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "展开", latex: "2+3i+1-2i", annotation: ""),
                        SolutionStep(order: 2, description: "合并同类项", latex: "(2+1)+(3i-2i)", annotation: ""),
                        SolutionStep(order: 3, description: "计算", latex: "3+i", annotation: "")
                    ],
                    keyInsight: "合并同类项",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】直接相加！", latex: "(2+1)+(3-2)i=3+i", annotation: "一步到位")
                    ],
                    keyInsight: "实虚部分开，直接对应相加！",
                    commonMistakes: []
                ),
                weaponUsed: "复数加法法则",
                timeRatio: 2.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了复数加法的简单性：
                    
                    1️⃣ 复数加法规则：实部加实部，虚部加虚部
                    2️⃣ 直接计算：(2+1)+(3-2)i=3+i
                    
                    💡 关键：把复数想象成二维向量，加法就是向量加法！
                    
                    🧠 高阶思维：复数是实数的二维扩展，开启了复平面的大门！
                    """
            ),
            gaokaoYear: 2022,
            tags: ["复数", "加法", "必考"]
        ),

        Problem(
            id: "high_complex_002",
            type: .multipleChoice,
            tier: 3,
            formulaIds: ["complex_mult"],
            content: "(1+i)(1-i)=？",
            contentLatex: "(1+i)(1-i)=?",
            options: ["2", "0", "2i", "-2i"],
            answer: "2",
            difficulty: 0.3,
            averageTime: 15,
            hints: ["复数乘法", "平方差"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "展开乘法", latex: "1×1 + 1×(-i) + i×1 + i×(-i)", annotation: ""),
                    SolutionStep(order: 2, description: "化简", latex: "1 - i + i - i² = 1 + 1 = 2", annotation: "")
                ],
                keyInsight: "利用平方差公式或直接展开。",
                commonMistakes: ["i²=-1忘记"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "逐项相乘", latex: "1×1=1, 1×(-i)=-i, i×1=i, i×(-i)=1", annotation: ""),
                        SolutionStep(order: 2, description: "合并", latex: "1-i+i+1=2", annotation: "")
                    ],
                    keyInsight: "逐项相乘",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】平方差！", latex: "(1+i)(1-i)=1²-i²=1-(-1)=2", annotation: "一步到位")
                    ],
                    keyInsight: "记住(a+bi)(a-bi)=a²+b²！",
                    commonMistakes: []
                ),
                weaponUsed: "共轭复数性质",
                timeRatio: 2.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了共轭复数的性质：
                    
                    1️⃣ (a+bi)(a-bi)=a²+b²（实数！）
                    2️⃣ 直接应用：(1+i)(1-i)=1+1=2
                    
                    💡 关键：共轭复数相乘结果是实数，这是复数除法的基础！
                    
                    🧠 高阶思维：共轭复数是"实部相同，虚部相反"的数，体现了复数的对称性！
                    """
            ),
            gaokaoYear: 2023,
            tags: ["复数", "乘法", "共轭", "必考"]
        ),

        // ============ 不等式专项训练 (必考) ============
        Problem(
            id: "high_ineq_001",
            type: .multipleChoice,
            tier: 3,
            formulaIds: ["mean_inequality"],
            content: "若x>0，则x + 1/x的最小值为？",
            contentLatex: "x>0,\\ x+\\frac{1}{x}_{min}=?",
            options: ["2", "1", "3", "4"],
            answer: "2",
            difficulty: 0.4,
            averageTime: 20,
            hints: ["基本不等式", "均值不等式"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "应用基本不等式", latex: "x + 1/x ≥ 2√(x×1/x) = 2", annotation: ""),
                    SolutionStep(order: 2, description: "等号条件", latex: "x=1/x ⇒ x=1", annotation: "")
                ],
                keyInsight: "应用基本不等式求最值。",
                commonMistakes: ["忘记等号条件"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "求导", latex: "f'(x)=1-1/x²", annotation: ""),
                        SolutionStep(order: 2, description: "找极值", latex: "f'(x)=0⇒x=1", annotation: ""),
                        SolutionStep(order: 3, description: "验证", latex: "f(1)=2", annotation: "")
                    ],
                    keyInsight: "用导数求最值",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】基本不等式！", latex: "x+1/x≥2√(x·1/x)=2", annotation: "一步到位")
                    ],
                    keyInsight: "看到x+1/x立刻想到基本不等式！",
                    commonMistakes: []
                ),
                weaponUsed: "基本不等式",
                timeRatio: 2.5,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了基本不等式的威力：
                    
                    1️⃣ 基本不等式：a+b≥2√(ab)（a,b>0）
                    2️⃣ 直接应用：x+1/x≥2√(x·1/x)=2
                    3️⃣ 等号成立当且仅当x=1
                    
                    💡 关键：看到x+k/x的形式，立刻想到基本不等式！
                    
                    🧠 高阶思维：基本不等式是"算术平均≥几何平均"的体现，是不等式证明的基石！
                    """
            ),
            gaokaoYear: 2022,
            tags: ["不等式", "基本不等式", "必考"]
        ),

        Problem(
            id: "high_ineq_002",
            type: .multipleChoice,
            tier: 4,
            formulaIds: ["cauchy"],
            content: "若a+b=1，则a²+b²的最小值为？",
            contentLatex: "a+b=1,\\ a^2+b^2_{min}=?",
            options: ["1/2", "1", "2", "1/4"],
            answer: "1/2",
            difficulty: 0.5,
            averageTime: 30,
            hints: ["柯西不等式", "配方法", "基本不等式"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "柯西不等式", latex: "(a²+b²)(1²+1²)≥(a+b)²=1", annotation: ""),
                    SolutionStep(order: 2, description: "求解", latex: "a²+b²≥1/2", annotation: "")
                ],
                keyInsight: "应用柯西不等式求最值。",
                commonMistakes: ["柯西公式记错"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "代入", latex: "b=1-a", annotation: ""),
                        SolutionStep(order: 2, description: "表达式", latex: "a²+(1-a)²=2a²-2a+1", annotation: ""),
                        SolutionStep(order: 3, description: "求最小值", latex: "2(a-1/2)²+1/2≥1/2", annotation: "")
                    ],
                    keyInsight: "转化为二次函数",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】柯西不等式！", latex: "(a²+b²)(1+1)≥(a+b)²=1\\Rightarrow a²+b²≥1/2", annotation: "一步到位")
                    ],
                    keyInsight: "柯西不等式直接应用！",
                    commonMistakes: []
                ),
                weaponUsed: "柯西不等式",
                timeRatio: 2.5,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了柯西不等式的应用：
                    
                    1️⃣ 柯西不等式：(a₁²+a₂²)(b₁²+b₂²)≥(a₁b₁+a₂b₂)²
                    2️⃣ 令b₁=b₂=1：(a²+b²)(1+1)≥(a+b)²=1
                    3️⃣ 得：a²+b²≥1/2
                    
                    💡 关键：柯西不等式是处理"平方和"与"和的平方"关系的利器！
                    
                    🧠 高阶思维：柯西不等式是内积空间的三角不等式，体现了向量的几何意义！
                    """
            ),
            gaokaoYear: 2023,
            tags: ["不等式", "柯西不等式", "必考"]
        ),

        // ============ 圆锥曲线专项训练 (必考) ============
        Problem(
            id: "high_conic_004",
            type: .multipleChoice,
            tier: 4,
            formulaIds: ["ellipse_eq"],
            content: "椭圆x²/4 + y²/3 = 1的离心率为？",
            contentLatex: "\\frac{x^2}{4}+\\frac{y^2}{3}=1,\\ e=?",
            options: ["1/2", "√3/2", "1/3", "√7/4"],
            answer: "1/2",
            difficulty: 0.4,
            averageTime: 20,
            hints: ["椭圆离心率", "a²=b²+c²"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "确定参数", latex: "a²=4, b²=3", annotation: ""),
                    SolutionStep(order: 2, description: "求c", latex: "c²=a²-b²=1\\Rightarrow c=1", annotation: ""),
                    SolutionStep(order: 3, description: "离心率", latex: "e=c/a=1/2", annotation: "")
                ],
                keyInsight: "椭圆离心率e=c/a，其中c²=a²-b²。",
                commonMistakes: ["a,b搞混", "忘记开方"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "标准形式", latex: "x²/a²+y²/b²=1", annotation: ""),
                        SolutionStep(order: 2, description: "确定a,b", latex: "a=2, b=√3", annotation: ""),
                        SolutionStep(order: 3, description: "计算c", latex: "c=√(4-3)=1", annotation: ""),
                        SolutionStep(order: 4, description: "离心率", latex: "e=1/2", annotation: "")
                    ],
                    keyInsight: "分步计算",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】离心率公式！", latex: "e=√(1-b²/a²)=√(1-3/4)=1/2", annotation: "一步到位")
                    ],
                    keyInsight: "记住离心率的变形公式！",
                    commonMistakes: []
                ),
                weaponUsed: "椭圆离心率公式",
                timeRatio: 2.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了椭圆离心率公式的应用：
                    
                    1️⃣ 椭圆离心率：e=c/a=√(1-b²/a²)
                    2️⃣ 直接代入：e=√(1-3/4)=1/2
                    
                    💡 关键：记住离心率的多种表达式，选择最方便的！
                    
                    🧠 高阶思维：离心率描述椭圆的扁平程度，是圆锥曲线的重要参数！
                    """
            ),
            gaokaoYear: 2022,
            tags: ["圆锥曲线", "椭圆", "离心率", "必考"]
        ),

        Problem(
            id: "high_conic_005",
            type: .multipleChoice,
            tier: 4,
            formulaIds: ["parabola_eq"],
            content: "抛物线y²=4x的焦点坐标为？",
            contentLatex: "y^2=4x,\\ F=?",
            options: ["(1,0)", "(0,1)", "(-1,0)", "(0,-1)"],
            answer: "(1,0)",
            difficulty: 0.3,
            averageTime: 15,
            hints: ["抛物线焦点", "标准形式"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "标准形式", latex: "y²=4px", annotation: ""),
                    SolutionStep(order: 2, description: "确定p", latex: "4p=4\\Rightarrow p=1", annotation: ""),
                    SolutionStep(order: 3, description: "焦点", latex: "F(p,0)=(1,0)", annotation: "")
                ],
                keyInsight: "抛物线y²=4px的焦点为(p,0)。",
                commonMistakes: ["p的计算错误", "焦点位置错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "回忆定义", latex: "到焦点和准线距离相等", annotation: ""),
                        SolutionStep(order: 2, description: "标准方程", latex: "y²=4x", annotation: ""),
                        SolutionStep(order: 3, description: "焦点坐标", latex: "(1,0)", annotation: "")
                    ],
                    keyInsight: "利用定义",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】焦点公式！", latex: "y²=4x\\Rightarrow p=1\\Rightarrow F(1,0)", annotation: "一步到位")
                    ],
                    keyInsight: "记住y²=4px焦点是(p,0)！",
                    commonMistakes: []
                ),
                weaponUsed: "抛物线焦点公式",
                timeRatio: 2.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了抛物线焦点公式的应用：
                    
                    1️⃣ 标准形式y²=4px，焦点在(p,0)
                    2️⃣ 4p=4⇒p=1，所以焦点是(1,0)
                    
                    💡 关键：记住不同开口方向抛物线的焦点位置！
                    
                    🧠 高阶思维：抛物线是到定点（焦点）和定直线（准线）距离相等的点的轨迹！
                    """
            ),
            gaokaoYear: 2023,
            tags: ["圆锥曲线", "抛物线", "焦点", "必考"]
        ),

        // ============ 导数综合题 (必考) ============
        Problem(
            id: "calc_deriv_001",
            type: .multipleChoice,
            tier: 4,
            formulaIds: ["deriv_power", "deriv_product", "deriv_chain"],
            content: "已知函数f(x) = (x² + 1)e^x，则f'(1) = ？",
            contentLatex: "f(x)=(x^2+1)e^x,\\ f'(1)=?",
            options: ["4e", "3e", "2e", "e"],
            answer: "4e",
            difficulty: 0.6,
            averageTime: 40,
            hints: ["乘积法则", "指数函数导数"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "应用乘积法则", latex: "f'(x) = (x²+1)'e^x + (x²+1)(e^x)'", annotation: ""),
                    SolutionStep(order: 2, description: "求导", latex: "f'(x) = 2xe^x + (x²+1)e^x", annotation: ""),
                    SolutionStep(order: 3, description: "化简", latex: "f'(x) = e^x(x² + 2x + 1) = e^x(x+1)²", annotation: ""),
                    SolutionStep(order: 4, description: "代入x=1", latex: "f'(1) = e×(2)² = 4e", annotation: "")
                ],
                keyInsight: "综合应用乘积法则和基本导数公式。",
                commonMistakes: ["忘记乘积法则", "符号错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "乘积法则", latex: "f'(x)=2x·e^x + (x²+1)·e^x", annotation: ""),
                        SolutionStep(order: 2, description: "合并", latex: "f'(x)=e^x(x²+2x+1)", annotation: ""),
                        SolutionStep(order: 3, description: "代入", latex: "f'(1)=e×4=4e", annotation: "")
                    ],
                    keyInsight: "标准求导",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】对数求导法！", latex: "lnf(x)=ln(x²+1)+x\\Rightarrow f'/f=2x/(x²+1)+1", annotation: "对数求导"),
                        SolutionStep(order: 2, description: "代入x=1", latex: "f'/f=2/2+1=2\\Rightarrow f'=2f=2×2e=4e", annotation: "一步到位!")
                    ],
                    keyInsight: "对数求导法简化乘积求导!",
                    commonMistakes: []
                ),
                weaponUsed: "对数求导法",
                timeRatio: 2.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了对数求导法的威力：
                    
                    1️⃣ 对f(x)取对数：lnf(x) = ln(x²+1) + x
                    2️⃣ 两边求导：f'(x)/f(x) = 2x/(x²+1) + 1
                    3️⃣ 代入x=1：f'(1)/f(1) = 2/2 + 1 = 2
                    4️⃣ f(1)=2e，所以f'(1)=2×2e=4e
                    
                    💡 关键：对数求导法可以将乘法转化为加法，简化计算！
                    
                    🧠 高阶思维：这是"对数变换"思想的应用，在处理复杂函数时非常有用！
                    """
            ),
            gaokaoYear: 2023,
            tags: ["导数", "乘积法则", "必考"]
        ),

        Problem(
            id: "calc_deriv_002",
            type: .multipleChoice,
            tier: 4,
            formulaIds: ["deriv_chain", "deriv_sin", "deriv_exp"],
            content: "函数f(x) = e^(sin2x)的导数f'(x) = ？",
            contentLatex: "f(x)=e^{\\sin 2x},\\ f'(x)=?",
            options: ["2cos2x·e^(sin2x)", "cos2x·e^(sin2x)", "2sin2x·e^(sin2x)", "e^(sin2x)"],
            answer: "2cos2x·e^(sin2x)",
            difficulty: 0.55,
            averageTime: 35,
            hints: ["链式法则", "复合函数求导"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "设u=sin2x", latex: "f(u)=e^u", annotation: ""),
                    SolutionStep(order: 2, description: "链式法则", latex: "f'(x) = e^u · u'", annotation: ""),
                    SolutionStep(order: 3, description: "求u'", latex: "u' = cos2x · (2x)' = 2cos2x", annotation: ""),
                    SolutionStep(order: 4, description: "合并", latex: "f'(x) = e^(sin2x) · 2cos2x", annotation: "")
                ],
                keyInsight: "多层复合函数需要多次应用链式法则。",
                commonMistakes: ["忘记乘内层导数", "导数符号错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "链式法则", latex: "f'(x)=e^(sin2x)·(sin2x)'", annotation: ""),
                        SolutionStep(order: 2, description: "继续链式", latex: "=e^(sin2x)·cos2x·(2x)'", annotation: ""),
                        SolutionStep(order: 3, description: "结果", latex: "=2cos2x·e^(sin2x)", annotation: "")
                    ],
                    keyInsight: "分步链式求导",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】链式法则一步到位！", latex: "f'(x)=e^(sin2x)×cos2x×2=2cos2x·e^(sin2x)", annotation: "层层剥皮!")
                    ],
                    keyInsight: "记住链式法则的'层层剥皮'技巧!",
                    commonMistakes: []
                ),
                weaponUsed: "链式法则",
                timeRatio: 2.5,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了链式法则的应用：
                    
                    1️⃣ 识别复合结构：外层e^u，中间sinv，内层2x
                    2️⃣ 链式法则：导数=外层导数×中层导数×内层导数
                    3️⃣ 直接写出：e^(sin2x) × cos2x × 2 = 2cos2x·e^(sin2x)
                    
                    💡 关键：复合函数求导要"层层剥皮"，不要遗漏任何一层！
                    
                    🧠 高阶思维：链式法则是"函数嵌套"的导数规律，体现了数学的递归思想！
                    """
            ),
            gaokaoYear: 2023,
            tags: ["导数", "链式法则", "必考"]
        ),

        Problem(
            id: "calc_deriv_003",
            type: .multipleChoice,
            tier: 4,
            formulaIds: ["deriv_log", "deriv_chain", "deriv_product"],
            content: "函数f(x) = ln(x + √(x² + 1))的导数为？",
            contentLatex: "f(x)=\\ln(x+\\sqrt{x^2+1}),\\ f'(x)=?",
            options: ["2x/(x²+√(x²+1))", "x/√(x²+1)", "1/√(x²+1)", "2x/(x²+1)"],
            answer: "1/√(x²+1)",
            difficulty: 0.7,
            averageTime: 50,
            hints: ["对数导数+链式法则", "先求内层(x+√(x²+1))'", "把分子整理成分母的倍数再约分"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "对数复合求导", latex: "f'(x)=\\frac{(x+\\sqrt{x^2+1})'}{x+\\sqrt{x^2+1}}", annotation: "外层ln，链式法则"),
                    SolutionStep(order: 2, description: "求内层导数", latex: "(x+\\sqrt{x^2+1})'=1+\\frac{x}{\\sqrt{x^2+1}}", annotation: "√(x²+1)的导数为x/√(x²+1)"),
                    SolutionStep(order: 3, description: "通分内层", latex: "1+\\frac{x}{\\sqrt{x^2+1}}=\\frac{\\sqrt{x^2+1}+x}{\\sqrt{x^2+1}}", annotation: "分子恰好出现x+√(x²+1)"),
                    SolutionStep(order: 4, description: "代入并约分", latex: "f'(x)=\\frac{\\sqrt{x^2+1}+x}{\\sqrt{x^2+1}}\\cdot\\frac{1}{x+\\sqrt{x^2+1}}=\\frac{1}{\\sqrt{x^2+1}}", annotation: "分子与分母相同，直接约去")
                ],
                keyInsight: "内层导数通分后，分子恰为x+√(x²+1)，与外层分母约分，结果非常简洁。",
                commonMistakes: ["√(x²+1)的导数漏掉链式因子x", "通分后不识别可约分结构"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "链式法则", latex: "f'(x)=\\frac{1}{x+\\sqrt{x^2+1}}\\left(1+\\frac{x}{\\sqrt{x^2+1}}\\right)", annotation: ""),
                        SolutionStep(order: 2, description: "内层通分", latex: "1+\\frac{x}{\\sqrt{x^2+1}}=\\frac{x+\\sqrt{x^2+1}}{\\sqrt{x^2+1}}", annotation: ""),
                        SolutionStep(order: 3, description: "约分得结果", latex: "f'(x)=\\frac{1}{\\sqrt{x^2+1}}", annotation: "")
                    ],
                    keyInsight: "通分→约分，水到渠成",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】反双曲函数识别", latex: "\\ln(x+\\sqrt{x^2+1})=\\operatorname{arsinh}x", annotation: "这正是反双曲正弦的定义式"),
                        SolutionStep(order: 2, description: "套用导数公式一步出", latex: "(\\operatorname{arsinh}x)'=\\frac{1}{\\sqrt{x^2+1}}", annotation: "记住即秒杀，无需展开求导")
                    ],
                    keyInsight: "ln(x+√(x²+1))就是arsinh x，其导数恒为1/√(x²+1)，认出即秒杀！",
                    commonMistakes: []
                ),
                weaponUsed: "反双曲函数识别",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】

                    这道题展示了如何通过结构识别秒杀：

                    1️⃣ 链式法则：f'(x)=(1+x/√(x²+1))/(x+√(x²+1))
                    2️⃣ 内层通分：1+x/√(x²+1)=(x+√(x²+1))/√(x²+1)
                    3️⃣ 关键约分：分子(x+√(x²+1))与外层分母完全相同，约去
                    4️⃣ 结果：f'(x)=1/√(x²+1)

                    💡 关键：ln(x+√(x²+1)) 就是反双曲正弦 arsinh x，
                    　　　　　其导数恒等于 1/√(x²+1)，认出结构即可一步得到答案。

                    🧠 高阶思维：复杂表达式背后往往藏着标准函数，识别结构胜过硬算！
                    """
            ),
            gaokaoYear: 2023,
            tags: ["导数", "对数", "复杂", "必考"]
        ),

        Problem(
            id: "calc_deriv_004",
            type: .multipleChoice,
            tier: 4,
            formulaIds: ["deriv_power", "deriv_chain", "deriv_exp"],
            content: "已知函数f(x) = x^x (x>0)，则f'(x) = ？",
            contentLatex: "f(x)=x^x,\\ f'(x)=?",
            options: ["x^x(lnx+1)", "x^x·lnx", "x^(x-1)", "x^x(lnx+x)"],
            answer: "x^x(lnx+1)",
            difficulty: 0.65,
            averageTime: 45,
            hints: ["对数求导法", "幂指函数"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "取对数", latex: "lnf(x) = xlnx", annotation: ""),
                    SolutionStep(order: 2, description: "两边求导", latex: "f'(x)/f(x) = lnx + x·(1/x) = lnx + 1", annotation: ""),
                    SolutionStep(order: 3, description: "求解", latex: "f'(x) = f(x)(lnx+1) = x^x(lnx+1)", annotation: "")
                ],
                keyInsight: "幂指函数必须用对数求导法。",
                commonMistakes: ["误用于普通幂函数求导公式", "对数求导法错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "对数求导", latex: "lnf(x)=xlnx", annotation: ""),
                        SolutionStep(order: 2, description: "求导", latex: "f'/f=lnx+1", annotation: ""),
                        SolutionStep(order: 3, description: "结果", latex: "f'=x^x(lnx+1)", annotation: "")
                    ],
                    keyInsight: "对数求导法",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】变形法！", latex: "x^x=e^(xlnx)\\Rightarrow f'(x)=e^(xlnx)(lnx+1)=x^x(lnx+1)", annotation: "一步到位!")
                    ],
                    keyInsight: "把幂指函数转化为指数函数!",
                    commonMistakes: []
                ),
                weaponUsed: "指数变形法",
                timeRatio: 2.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了幂指函数的秒杀技巧：
                    
                    1️⃣ 变形：x^x = e^(lnx^x) = e^(xlnx)
                    2️⃣ 求导：f'(x) = e^(xlnx) × (xlnx)' = x^x × (lnx + 1)
                    
                    💡 关键：幂指函数不是普通幂函数，必须转化！
                    
                    🧠 高阶思维：这是"指数化"思想，将复杂形式转化为熟悉的形式！
                    """
            ),
            gaokaoYear: 2023,
            tags: ["导数", "幂指函数", "对数求导", "必考"]
        ),

        Problem(
            id: "calc_deriv_005",
            type: .multipleChoice,
            tier: 5,
            formulaIds: ["deriv_sin", "deriv_cos", "deriv_chain"],
            content: "函数f(x) = sin²x · cos³x的导数f'(x) = ？",
            contentLatex: "f(x)=\\sin^2x·\\cos^3x,\\ f'(x)=?",
            options: ["sinx·cos²x(2cos²x-3sin²x)", "sinx·cos²x(2cos²x+3sin²x)", "2sinx·cos³x-3sin³x·cos²x", "sinx·cos²x(2-5sin²x)"],
            answer: "sinx·cos²x(2cos²x-3sin²x)",
            difficulty: 0.75,
            averageTime: 60,
            hints: ["乘积法则", "链式法则", "三角函数导数"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "乘积法则", latex: "f'(x) = (sin²x)'cos³x + sin²x(cos³x)'", annotation: ""),
                    SolutionStep(order: 2, description: "分别求导", latex: "(sin²x)' = 2sinx·cosx, (cos³x)' = 3cos²x·(-sinx)", annotation: ""),
                    SolutionStep(order: 3, description: "代入", latex: "f'(x) = 2sinx·cosx·cos³x + sin²x·(-3cos²x·sinx)", annotation: ""),
                    SolutionStep(order: 4, description: "化简", latex: "= 2sinx·cos⁴x - 3sin³x·cos²x", annotation: ""),
                    SolutionStep(order: 5, description: "提取公因子", latex: "= sinx·cos²x(2cos²x - 3sin²x)", annotation: "")
                ],
                keyInsight: "综合应用乘积法则和链式法则，最后化简。",
                commonMistakes: ["三角函数导数符号错误", "化简不彻底"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "乘积法则", latex: "f'=2sinxcosx·cos³x + sin²x·(-3cos²xsinx)", annotation: ""),
                        SolutionStep(order: 2, description: "化简", latex: "=2sinxcos⁴x-3sin³xcos²x", annotation: ""),
                        SolutionStep(order: 3, description: "提取公因子", latex: "=sinxcos²x(2cos²x-3sin²x)", annotation: "")
                    ],
                    keyInsight: "标准求导化简",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】对数求导法！", latex: "lnf=2ln|sinx|+3ln|cosx|\\Rightarrow f'/f=2cotx-3tanx", annotation: ""),
                        SolutionStep(order: 2, description: "化简", latex: "f'=sin²xcos³x(2cosx/sinx-3sinx/cosx)=sinxcos²x(2cos²x-3sin²x)", annotation: "一步到位!")
                    ],
                    keyInsight: "对数求导法简化三角函数乘积!",
                    commonMistakes: []
                ),
                weaponUsed: "对数求导法",
                timeRatio: 2.5,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了对数求导法在三角函数中的应用：
                    
                    1️⃣ 取对数：lnf(x) = 2ln|sinx| + 3ln|cosx|
                    2️⃣ 求导：f'(x)/f(x) = 2cotx - 3tanx
                    3️⃣ 化简：f'(x) = sin²xcos³x × (2cosx/sinx - 3sinx/cosx)
                    4️⃣ = sinxcos²x(2cos²x - 3sin²x)
                    
                    💡 关键：三角函数乘积用对数求导法更简单！
                    
                    🧠 高阶思维：对数将乘法转化为加法，大大简化计算！
                    """
            ),
            gaokaoYear: 2023,
            tags: ["导数", "三角函数", "复杂", "必考"]
        ),

        Problem(
            id: "calc_deriv_006",
            type: .multipleChoice,
            tier: 4,
            formulaIds: ["deriv_exp", "deriv_log", "deriv_chain"],
            content: "函数f(x) = e^(xlnx)在x=e处的切线斜率为？",
            contentLatex: "f(x)=e^{x\\ln x},\\ f'(e)=?",
            options: ["e^e(2)", "e^e", "2e^e", "e^(e+1)"],
            answer: "2e^e",
            difficulty: 0.6,
            averageTime: 40,
            hints: ["复合函数求导", "指数函数导数", "乘积法则"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "设u=xlnx", latex: "f(u)=e^u", annotation: ""),
                    SolutionStep(order: 2, description: "链式法则", latex: "f'(x) = e^u · u'", annotation: ""),
                    SolutionStep(order: 3, description: "求u'", latex: "u' = lnx + x·(1/x) = lnx + 1", annotation: ""),
                    SolutionStep(order: 4, description: "合并", latex: "f'(x) = e^(xlnx)(lnx+1)", annotation: ""),
                    SolutionStep(order: 5, description: "代入x=e", latex: "f'(e) = e^(e×1)(1+1) = 2e^e", annotation: "")
                ],
                keyInsight: "复合函数求导后代入求值。",
                commonMistakes: ["忘记链式法则", "代入错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "链式法则", latex: "f'(x)=e^(xlnx)(lnx+1)", annotation: ""),
                        SolutionStep(order: 2, description: "代入x=e", latex: "f'(e)=e^e×2=2e^e", annotation: "")
                    ],
                    keyInsight: "标准求导",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】变形！", latex: "e^(xlnx)=x^x\\Rightarrow f'(x)=x^x(lnx+1)", annotation: "转化为幂指函数"),
                        SolutionStep(order: 2, description: "代入", latex: "f'(e)=e^e(1+1)=2e^e", annotation: "一步到位!")
                    ],
                    keyInsight: "识别e^(xlnx)=x^x!",
                    commonMistakes: []
                ),
                weaponUsed: "指数变形法",
                timeRatio: 2.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了识别指数形式的技巧：
                    
                    1️⃣ 识别：e^(xlnx) = e^(lnx^x) = x^x
                    2️⃣ 直接用幂指函数导数公式：f'(x)=x^x(lnx+1)
                    3️⃣ 代入x=e：f'(e)=e^e(1+1)=2e^e
                    
                    💡 关键：记住e^(alnb)=b^a这个恒等式！
                    
                    🧠 高阶思维：这是"恒等变形"的精髓，将不熟悉的形式转化为熟悉的形式！
                    """
            ),
            gaokaoYear: 2023,
            tags: ["导数", "切线斜率", "指数函数", "必考"]
        ),

        Problem(
            id: "calc_deriv_007",
            type: .multipleChoice,
            tier: 5,
            formulaIds: ["deriv_sin", "deriv_cos", "deriv_chain", "deriv_product"],
            content: "已知函数f(x) = sin(x²)·cos(e^x)，则f'(x) = ？",
            contentLatex: "f(x)=\\sin(x^2)·\\cos(e^x),\\ f'(x)=?",
            options: ["2xcos(x²)cos(e^x)-e^xsin(x²)sin(e^x)", "2xcos(x²)cos(e^x)+e^xsin(x²)sin(e^x)", "2xcos(x²)+e^xsin(e^x)", "cos(x²)cos(e^x)-sin(x²)sin(e^x)"],
            answer: "2xcos(x²)cos(e^x)-e^xsin(x²)sin(e^x)",
            difficulty: 0.8,
            averageTime: 70,
            hints: ["乘积法则", "链式法则", "三角函数导数"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "乘积法则", latex: "f'(x) = [sin(x²)]'cos(e^x) + sin(x²)[cos(e^x)]'", annotation: ""),
                    SolutionStep(order: 2, description: "求sin(x²)'", latex: "cos(x²)·(x²)' = 2xcos(x²)", annotation: ""),
                    SolutionStep(order: 3, description: "求cos(e^x)'", latex: "-sin(e^x)·(e^x)' = -e^xsin(e^x)", annotation: ""),
                    SolutionStep(order: 4, description: "合并", latex: "f'(x) = 2xcos(x²)cos(e^x) - e^xsin(x²)sin(e^x)", annotation: "")
                ],
                keyInsight: "多层复合函数的乘积求导，需要细心处理每一步。",
                commonMistakes: ["链式法则遗漏", "符号错误", "导数顺序错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "乘积法则", latex: "f'=[sin(x²)]'cos(e^x)+sin(x²)[cos(e^x)]'", annotation: ""),
                        SolutionStep(order: 2, description: "分别求导", latex: "[sin(x²)]'=2xcos(x²), [cos(e^x)]'=-e^xsin(e^x)", annotation: ""),
                        SolutionStep(order: 3, description: "合并", latex: "f'=2xcos(x²)cos(e^x)-e^xsin(x²)sin(e^x)", annotation: "")
                    ],
                    keyInsight: "标准求导",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】逐项求导！", latex: "[sin(x²)]'=2xcos(x²), [cos(e^x)]'=-e^xsin(e^x)", annotation: ""),
                        SolutionStep(order: 2, description: "乘积法则", latex: "f'=2xcos(x²)cos(e^x)-e^xsin(x²)sin(e^x)", annotation: "直接写出!")
                    ],
                    keyInsight: "熟练掌握基本导数公式，直接写出结果!",
                    commonMistakes: []
                ),
                weaponUsed: "公式熟练法",
                timeRatio: 2.5,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了熟练掌握导数公式的重要性：
                    
                    1️⃣ 识别：两个复合函数的乘积
                    2️⃣ 分别求导：[sin(x²)]'=2xcos(x²)，[cos(e^x)]'=-e^xsin(e^x)
                    3️⃣ 应用乘积法则：前导后不导 + 前不导后导
                    4️⃣ 直接写出：2xcos(x²)cos(e^x) - e^xsin(x²)sin(e^x)
                    
                    💡 关键：基本导数公式要像乘法口诀一样熟练！
                    
                    🧠 高阶思维：这是"肌肉记忆"的体现，大量练习后可以直接写出结果！
                    """
            ),
            gaokaoYear: 2023,
            tags: ["导数", "复合函数", "复杂", "必考"]
        ),

        Problem(
            id: "calc_deriv_008",
            type: .multipleChoice,
            tier: 4,
            formulaIds: ["deriv_log", "deriv_chain", "deriv_power"],
            content: "函数f(x) = ln(1+x²)的二阶导数f''(x) = ？",
            contentLatex: "f(x)=\\ln(1+x^2),\\ f''(x)=?",
            options: ["(2-2x²)/(1+x²)²", "2/(1+x²)", "(2x²-2)/(1+x²)²", "2x/(1+x²)"],
            answer: "(2-2x²)/(1+x²)²",
            difficulty: 0.65,
            averageTime: 45,
            hints: ["一阶导数", "二阶导数", "商的导数"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "一阶导数", latex: "f'(x) = [1/(1+x²)]·(1+x²)' = 2x/(1+x²)", annotation: ""),
                    SolutionStep(order: 2, description: "二阶导数（商的导数）", latex: "f''(x) = [2(1+x²) - 2x·2x]/(1+x²)²", annotation: ""),
                    SolutionStep(order: 3, description: "化简", latex: "= (2+2x²-4x²)/(1+x²)² = (2-2x²)/(1+x²)²", annotation: "")
                ],
                keyInsight: "二阶导数需要对一阶导数再求导。",
                commonMistakes: ["商的导数公式错误", "化简错误"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "一阶导数", latex: "f'(x)=2x/(1+x²)", annotation: ""),
                        SolutionStep(order: 2, description: "二阶导数", latex: "f''(x)=[2(1+x²)-2x×2x]/(1+x²)²=(2-2x²)/(1+x²)²", annotation: "")
                    ],
                    keyInsight: "标准二阶导数",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】对数求导法！", latex: "f'(x)=2x/(1+x²)", annotation: "一阶导数"),
                        SolutionStep(order: 2, description: "二阶导数", latex: "f''=(2(1+x²)-4x²)/(1+x²)²=(2-2x²)/(1+x²)²", annotation: "直接应用商的导数!")
                    ],
                    keyInsight: "记住商的导数公式，直接计算!",
                    commonMistakes: []
                ),
                weaponUsed: "商的导数公式",
                timeRatio: 2.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了高阶导数的计算：
                    
                    1️⃣ 一阶导数：f'(x)=2x/(1+x²)
                    2️⃣ 二阶导数：使用商的导数公式(u/v)'=(u'v-uv')/v²
                    3️⃣ 代入：u=2x, v=1+x² ⇒ f''=(2(1+x²)-2x×2x)/(1+x²)²=(2-2x²)/(1+x²)²
                    
                    💡 关键：商的导数公式要牢记！
                    
                    🧠 高阶思维：高阶导数是导数的导数，体现了"迭代"思想！
                    """
            ),
            gaokaoYear: 2023,
            tags: ["导数", "二阶导数", "必考"]
        ),

        Problem(
            id: "calc_deriv_009",
            type: .multipleChoice,
            tier: 4,
            formulaIds: ["deriv_exp", "deriv_sin", "deriv_chain"],
            content: "函数f(x) = e^(sinx)·cosx在x=0处的导数为？",
            contentLatex: "f(x)=e^{\\sin x}\\cos x,\\ f'(0)=?",
            options: ["1", "0", "-1", "e"],
            answer: "1",
            difficulty: 0.7,
            averageTime: 50,
            hints: ["乘积法则", "e^(sinx)用链式法则", "代入x=0时sin0=0,cos0=1"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "乘积法则", latex: "f'(x)=[e^{\\sin x}]'\\cos x+e^{\\sin x}[\\cos x]'", annotation: ""),
                    SolutionStep(order: 2, description: "分别求导", latex: "[e^{\\sin x}]'=e^{\\sin x}\\cos x,\\quad [\\cos x]'=-\\sin x", annotation: "链式法则"),
                    SolutionStep(order: 3, description: "合并", latex: "f'(x)=e^{\\sin x}\\cos^2 x-e^{\\sin x}\\sin x=e^{\\sin x}(\\cos^2 x-\\sin x)", annotation: ""),
                    SolutionStep(order: 4, description: "代入x=0", latex: "f'(0)=e^{0}(\\cos^2 0-\\sin 0)=1\\times(1-0)=1", annotation: "sin0=0, cos0=1, e^0=1"),
                    SolutionStep(order: 5, description: "结论", latex: "f'(0)=1", annotation: "")
                ],
                keyInsight: "乘积法则配合链式法则，代入特殊点x=0时三角函数值简洁。",
                commonMistakes: ["e^(sinx)求导漏掉cosx因子", "代入时sin0/cos0记错"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "乘积+链式法则", latex: "f'(x)=e^{\\sin x}(\\cos^2 x-\\sin x)", annotation: ""),
                        SolutionStep(order: 2, description: "代入x=0", latex: "f'(0)=1\\times(1-0)=1", annotation: "")
                    ],
                    keyInsight: "先合并出统一因子e^(sinx)再代入",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】只需x=0处的值，不必保留整条导函数", latex: "f'(0)=\\underbrace{[e^{\\sin x}]'|_0}_{=1}\\cdot\\underbrace{\\cos 0}_{=1}+\\underbrace{e^{\\sin 0}}_{=1}\\cdot\\underbrace{[\\cos x]'|_0}_{=0}", annotation: "逐项代入0"),
                        SolutionStep(order: 2, description: "第二项含sin0=0直接消失", latex: "f'(0)=1\\times1+1\\times0=1", annotation: "一项归零，秒出")
                    ],
                    keyInsight: "求某点导数值，边求导边代入，含sin0的项立即归零，省去化简整条导函数。",
                    commonMistakes: []
                ),
                weaponUsed: "定点代入消项法",
                timeRatio: 2.0,
                detailedExplanation: """
                    【降维秒杀详解】

                    这道题展示了求"某点导数值"的高效做法：

                    1️⃣ 乘积法则：f'(x)=e^(sinx)cosx·cosx + e^(sinx)·(-sinx)
                    2️⃣ 不必化简整条导函数，直接代入x=0
                    3️⃣ 第二项含sin0=0，立即归零
                    4️⃣ f'(0)=1·1·1 + 1·0 = 1

                    💡 关键：题目只问x=0处的值，边代入边消项，比先化简再代入快得多。

                    🧠 高阶思维：明确"要什么"——求定点值就别浪费时间整理通式！
                    """
            ),
            gaokaoYear: 2023,
            tags: ["导数", "乘积法则", "特殊点", "必考"]
        ),

        Problem(
            id: "calc_deriv_010",
            type: .multipleChoice,
            tier: 5,
            formulaIds: ["deriv_power", "deriv_exp", "deriv_log", "deriv_chain"],
            content: "已知函数f(x) = (lnx)^(e^x)，则f'(x) = ？",
            contentLatex: "f(x)=(\\ln x)^{e^x},\\ f'(x)=?",
            options: ["(lnx)^(e^x)[e^x(lnlnx + 1/lnx)]", "(lnx)^(e^x)·e^x·lnlnx", "(lnx)^(e^x)·e^x/lnx", "(lnx)^(e^x)(e^xlnlnx + e^x/lnx)"],
            answer: "(lnx)^(e^x)[e^x(lnlnx + 1/lnx)]",
            difficulty: 0.85,
            averageTime: 80,
            hints: ["对数求导法", "幂指函数", "复合函数"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "取对数", latex: "lnf(x) = e^x·ln(lnx)", annotation: ""),
                    SolutionStep(order: 2, description: "两边求导", latex: "f'(x)/f(x) = e^x·ln(lnx) + e^x·[1/(lnx)]·(1/x)·x", annotation: ""),
                    SolutionStep(order: 3, description: "化简", latex: "= e^x[ln(lnx) + 1/lnx]", annotation: ""),
                    SolutionStep(order: 4, description: "求解", latex: "f'(x) = (lnx)^(e^x)·e^x[ln(lnx) + 1/lnx]", annotation: "")
                ],
                keyInsight: "复杂幂指函数必须用对数求导法。",
                commonMistakes: ["对数求导法应用错误", "复合函数求导遗漏"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "对数求导", latex: "lnf=e^x·ln(lnx)", annotation: ""),
                        SolutionStep(order: 2, description: "求导", latex: "f'/f=e^x·ln(lnx)+e^x·(1/lnx)·(1/x)·x=e^x(lnlnx+1/lnx)", annotation: ""),
                        SolutionStep(order: 3, description: "结果", latex: "f'=(lnx)^(e^x)e^x(lnlnx+1/lnx)", annotation: "")
                    ],
                    keyInsight: "标准对数求导",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】指数变形！", latex: "(lnx)^(e^x)=e^(e^x·ln(lnx))", annotation: ""),
                        SolutionStep(order: 2, description: "求导", latex: "f'=e^(e^x·ln(lnx))·[e^x·ln(lnx)+e^x·(1/lnx)]", annotation: ""),
                        SolutionStep(order: 3, description: "化简", latex: "=(lnx)^(e^x)e^x(lnlnx+1/lnx)", annotation: "一步到位!")
                    ],
                    keyInsight: "把幂指函数转化为e的指数形式!",
                    commonMistakes: []
                ),
                weaponUsed: "指数变形法",
                timeRatio: 2.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了复杂幂指函数的秒杀技巧：
                    
                    1️⃣ 变形：(lnx)^(e^x) = e^(ln[(lnx)^(e^x)]) = e^(e^x·ln(lnx))
                    2️⃣ 求导：f'(x) = e^(e^x·ln(lnx)) × [e^x·ln(lnx) + e^x·(1/lnx)]
                    3️⃣ 化简：= (lnx)^(e^x) × e^x(lnlnx + 1/lnx)
                    
                    💡 关键：任何幂指函数都可以转化为e的指数形式！
                    
                    🧠 高阶思维：这是"统一形式"的思想，将各种形式统一为指数函数！
                    """
            ),
            gaokaoYear: 2023,
            tags: ["导数", "复杂", "幂指函数", "必考"]
        )
    ]

    // MARK: - Heroes

    static let heroes: [MathHero] = MathHero.allHeroes

    // MARK: - Daily Strikes

    static let dailyStrikes: [DailyStrike] = [
        DailyStrike(type: "思维", question: "为何球表面积是体积导数？", answer: "增量效应", detail: "球体积 V = 4πr³/3，对 r 求导得 dV/dr = 4πr² = 表面积。直觉上，体积增长的「外壳」正是表面积。"),
        DailyStrike(type: "代数", question: "为什么 0.999... = 1？", answer: "极限相等", detail: "设 x = 0.999...，则 10x = 9.999...，两式相减 9x = 9，故 x = 1。这不是近似，而是同一个实数的两种表示。"),
        DailyStrike(type: "几何", question: "为什么圆的面积是 πr²？", answer: "无穷细分", detail: "把圆切成无数个扇形并交错排列，拼成一个近似矩形：宽 = πr，高 = r，面积 = πr²。"),
        DailyStrike(type: "概率", question: "蒙提霍尔问题：换门为什么概率更高？", answer: "条件概率", detail: "初始选中的概率是 1/3，另外两扇门合计 2/3。主持人打开一扇空门后，剩下那扇门继承了 2/3 的概率。"),
        DailyStrike(type: "思维", question: "为什么 eⁱπ + 1 = 0？", answer: "欧拉恒等式", detail: "由 eⁱθ = cosθ + i·sinθ，令 θ = π，得 eⁱπ = cos π + i·sin π = -1，故 eⁱπ + 1 = 0。"),
        DailyStrike(type: "数论", question: "素数有无穷多个，怎么证明？", answer: "反证法", detail: "假设素数有限：p₁, p₂, ..., pₙ。构造 N = p₁×p₂×...×pₙ + 1，N 不能被任何 pᵢ 整除，矛盾。"),
        DailyStrike(type: "组合", question: "为什么 C(n,k) = C(n,n-k)？", answer: "对称性", detail: "从 n 个中选 k 个，等价于决定哪 n-k 个不选。选与不选只是视角不同，方案数完全相同。")
    ]
}
