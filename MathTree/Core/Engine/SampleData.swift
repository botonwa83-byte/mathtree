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
        Formula(id: "pythagorean", name: "勾股定理", latex: "a^2 + b^2 = c^2", level: .middle, category: .geometry, prerequisites: ["rect_area"], derivations: ["dist_formula"], advancedForm: "inner_product", gaokaoRelevance: 1.0, tags: ["几何", "核心", "必考"], intuition: "直角三角形的三边‘力量’守恒。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "在直角三角形中，两条直角边的平方和等于斜边的平方。这个定理揭示了直角三角形三边之间的基本关系。", proofSteps: ["以三边为边长作三个正方形", "利用面积变换证明", "直角边上两个正方形面积之和等于斜边上正方形面积"], applications: ["计算距离", "建筑施工放直角", "导航定位"], history: "中国古代商高在公元前1000年发现此定理。"),
        Formula(id: "quad_root", name: "二次方程求根公式", latex: "x = \\frac{-b \\pm \\sqrt{b^2-4ac}}{2a}", level: .middle, category: .algebra, prerequisites: [], derivations: ["vieta"], advancedForm: "galois", gaokaoRelevance: 1.0, tags: ["方程", "必考"], intuition: "暴力破解任何二次方程的终极钥匙。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "对于一元二次方程ax²+bx+c=0，其解由求根公式给出。判别式Δ=b²-4ac决定解的性质。", proofSteps: ["将方程ax²+bx+c=0配方", "a(x+b/(2a))² = b²/(4a) - c", "两边开方得求根公式"], applications: ["解方程", "求抛物线与x轴交点", "物理问题求解"], history: "古巴比伦人已有类似方法，现代形式由韦达完善。"),
        Formula(id: "tri_angle_sum", name: "三角形内角和", latex: "\\angle A + \\angle B + \\angle C = 180^\\circ", level: .middle, category: .geometry, prerequisites: [], derivations: ["polygon_angle"], advancedForm: "spherical_geometry", gaokaoRelevance: 1.0, tags: ["几何", "基础"], intuition: "一条直线的平角。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "任意三角形的三个内角之和恒等于180度。这是欧几里得几何的基本公理之一。", proofSteps: ["过顶点作底边平行线", "利用平行线内错角相等", "三个内角拼成平角180度"], applications: ["角度计算", "三角形类型判断", "几何证明"], history: "欧几里得在《几何原本》中作为命题32证明。"),
        Formula(id: "similar_tri", name: "相似三角形判定", latex: "\\frac{a}{a'} = \\frac{b}{b'} = \\frac{c}{c'} = k", level: .middle, category: .geometry, prerequisites: ["tri_angle_sum"], derivations: ["ratio_theorem"], advancedForm: "homothety", gaokaoRelevance: 0.9, tags: ["几何", "相似", "必考"], intuition: "放大或缩小的副本。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "如果两个三角形的对应角相等，则对应边成比例。相似三角形是解决几何问题的重要工具。", proofSteps: ["证明对应角相等", "利用平行线截割定理", "推出对应边成比例"], applications: ["测量树高", "地图比例尺", "投影变换"], history: "古希腊数学家泰勒斯利用相似三角形测量金字塔高度。"),
        Formula(id: "trapezoid_area", name: "梯形面积", latex: "S = \\frac{(a+b)}{2} \\times h", level: .middle, category: .geometry, prerequisites: ["tri_area_base"], derivations: [], advancedForm: "integration", gaokaoRelevance: 0.8, tags: ["几何", "面积"], intuition: "两个三角形面积之和。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "梯形面积等于上底加下底的和乘以高再除以2。", proofSteps: ["连接对角线将梯形分成两个三角形", "两个三角形面积分别为(1/2)×a×h和(1/2)×b×h", "总面积 = (a+b)×h÷2"], applications: ["计算堤坝截面面积", "梯田地计算", "建筑截面设计"], history: "古代巴比伦泥板中已有梯形面积计算方法。"),
        Formula(id: "parallelogram_area", name: "平行四边形面积", latex: "S = a \\times h", level: .middle, category: .geometry, prerequisites: ["rect_area"], derivations: ["tri_area_base"], advancedForm: "cross_product", gaokaoRelevance: 0.85, tags: ["几何", "面积"], intuition: "底乘高不变。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "平行四边形面积等于底乘以高。通过割补法可以将平行四边形转化为等面积的矩形。", proofSteps: ["沿高切割三角形", "平移拼接成矩形", "矩形面积 = 底 × 高"], applications: ["计算不规则四边形面积", "向量叉积", "晶体结构"], history: "欧几里得《几何原本》中已记载此公式。"),

        // HIGH SCHOOL - 高中几何
        Formula(id: "sin_add", name: "和角公式", latex: "\\sin(\\alpha + \\beta) = \\sin\\alpha\\cos\\beta + \\cos\\alpha\\sin\\beta", level: .high, category: .trigonometry, prerequisites: ["pythagorean"], derivations: ["double_angle"], advancedForm: "euler_formula", gaokaoRelevance: 1.0, tags: ["三角函数", "核心", "必考"], intuition: "旋转的分解与合成。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "两个角之和的正弦等于各自正弦余弦的交叉乘积之和。这是三角恒等式的基础。", proofSteps: ["利用单位圆和三角函数定义", "或利用欧拉公式e^(i(α+β))=e^(iα)e^(iβ)", "展开比较虚部"], applications: ["三角恒等变换", "波形合成", "交流电"], history: "托勒密在公元2世纪提出相关定理。"),
        Formula(id: "cosine_rule", name: "余弦定理", latex: "a^2 = b^2 + c^2 - 2bc\\cos A", level: .high, category: .trigonometry, prerequisites: ["pythagorean"], derivations: ["sine_rule"], advancedForm: "vector_dot", gaokaoRelevance: 1.0, tags: ["解三角形", "必考", "核心"], intuition: "勾股定理的非直角修正版。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "对于任意三角形，一边的平方等于另外两边平方和减去这两边与它们夹角余弦的乘积的两倍。", proofSteps: ["作高h，将c分成两段", "利用勾股定理表达h²", "合并两式消去h", "利用三角函数定义化简"], applications: ["解三角形", "测量距离", "航海导航"], history: "阿拉伯数学家阿尔·花剌子模在9世纪首次完整表述。"),
        Formula(id: "sine_rule", name: "正弦定理", latex: "\\frac{a}{\\sin A} = \\frac{b}{\\sin B} = \\frac{c}{\\sin C} = 2R", level: .high, category: .trigonometry, prerequisites: ["cosine_rule"], derivations: [], advancedForm: "law_of_sines_3d", gaokaoRelevance: 1.0, tags: ["解三角形", "必考"], intuition: "边长与对角正弦成正比。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "三角形各边与其对角正弦的比值相等，且等于外接圆直径2R。", proofSteps: ["作外接圆，连接直径", "利用圆周角定理", "直角三角形中sinA = a/2R", "同理证明其他边"], applications: ["解三角形", "测量高度", "天文学计算"], history: "波斯数学家阿尔·比鲁尼在10世纪提出。"),
        Formula(id: "heron", name: "海伦公式", latex: "S = \\sqrt{s(s-a)(s-b)(s-c)},\\ s=\\frac{a+b+c}{2}", level: .high, category: .geometry, prerequisites: ["tri_area_base", "pythagorean"], derivations: [], advancedForm: "brahmagupta", gaokaoRelevance: 0.9, tags: ["几何", "面积", "公式"], intuition: "只需要三边就能算面积。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "已知三角形三边长度a,b,c，半周长s=(a+b+c)/2，则面积S=√[s(s-a)(s-b)(s-c)]。", proofSteps: ["设高为h，利用勾股定理", "h² = b² - x² = c² - (a-x)²", "解得x，代入求h", "面积=(1/2)ah化简得海伦公式"], applications: ["测量不规则地块", "计算机图形学", "三角剖分"], history: "古希腊数学家海伦在公元1世纪提出。"),
        Formula(id: "ellipse_eq", name: "椭圆标准方程", latex: "\\frac{x^2}{a^2} + \\frac{y^2}{b^2} = 1", level: .high, category: .conicSections, prerequisites: ["pythagorean"], derivations: ["ellipse_foci"], advancedForm: "conic_projection", gaokaoRelevance: 1.0, tags: ["圆锥曲线", "核心", "必考"], intuition: "被均匀拉伸的圆。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "中心在原点、长轴在x轴上的椭圆标准方程。a是半长轴，b是半短轴。", proofSteps: ["利用椭圆定义：到两焦点距离之和为常数2a", "设焦点(±c,0)", "距离和=2a，平方化简得方程"], applications: ["行星轨道", "光学反射", "建筑设计"], history: "阿波罗尼奥斯在公元前3世纪系统研究圆锥曲线。"),
        Formula(id: "hyperbola_eq", name: "双曲线标准方程", latex: "\\frac{x^2}{a^2} - \\frac{y^2}{b^2} = 1", level: .high, category: .conicSections, prerequisites: ["ellipse_eq"], derivations: ["hyperbola_asymptote"], advancedForm: "conic_dual", gaokaoRelevance: 0.9, tags: ["圆锥曲线", "核心"], intuition: "到两焦点距离差为常数。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "中心在原点、实轴在x轴上的双曲线标准方程。a是半实轴，b是半虚轴。", proofSteps: ["利用双曲线定义：到两焦点距离差为常数2a", "设焦点(±c,0)", "距离差=2a，平方化简得方程"], applications: ["双曲线导航", "光学仪器", "天体轨道"], history: "阿波罗尼奥斯系统研究。"),
        Formula(id: "parabola_eq", name: "抛物线标准方程", latex: "y^2 = 4px", level: .high, category: .conicSections, prerequisites: [], derivations: [], advancedForm: "parabola_focus", gaokaoRelevance: 0.85, tags: ["圆锥曲线", "核心"], intuition: "到焦点和准线距离相等。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "开口向右的抛物线标准方程。焦点在(p,0)，准线为x=-p。", proofSteps: ["设焦点(p,0)，准线x=-p", "任取点(x,y)到焦点距离=到准线距离", "√[(x-p)²+y²] = |x+p|", "平方化简得方程"], applications: ["卫星天线", "探照灯", "弹道轨迹"], history: "古希腊数学家梅内克缪斯发现。"),
        Formula(id: "deriv_power", name: "幂函数导数", latex: "(x^n)' = nx^{n-1}", level: .high, category: .calculus, prerequisites: [], derivations: ["deriv_product"], advancedForm: "operator", gaokaoRelevance: 1.0, tags: ["导数", "核心", "必考"], intuition: "降幂打击，瞬时变化。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "幂函数xⁿ的导数等于n乘以x^(n-1)。这是最基本的导数公式。", proofSteps: ["利用导数定义f'(x)=lim(h→0)[(x+h)ⁿ-xⁿ]/h", "展开(x+h)ⁿ用二项式定理", "消去xⁿ后除以h", "取极限得nx^(n-1)"], applications: ["求切线斜率", "优化问题", "变化率"], history: "牛顿和莱布尼茨独立发现微积分。"),

        // UNIVERSITY - 大学数学
        Formula(id: "lopital_rule", name: "洛必达法则", latex: "\\lim_{x \\to a} \\frac{f(x)}{g(x)} = \\lim_{x \\to a} \\frac{f'(x)}{g'(x)}", level: .university, category: .calculus, prerequisites: ["derivative_def"], derivations: [], advancedForm: "cauchy_mean_value", gaokaoRelevance: 0.8, tags: ["极限", "秒杀"], intuition: "变化率决定极限。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "当极限为0/0或∞/∞型时，可对分子分母分别求导再求极限。这是计算极限的强大工具。", proofSteps: ["利用柯西中值定理", "f(x)/g(x)=[f(x)-f(a)]/[g(x)-g(a)]=[f'(ξ)]/[g'(ξ)]", "当x→a时ξ→a，得证"], applications: ["极限计算", "不定式求值", "级数收敛"], history: "伯努利在1696年提出。"),
        Formula(id: "taylor_series", name: "泰勒级数", latex: "f(x) = \\sum_{n=0}^{\\infty} \\frac{f^{(n)}(a)}{n!}(x-a)^n", level: .university, category: .calculus, prerequisites: ["derivative_def"], derivations: ["euler_proof"], advancedForm: "analytic_continuation", gaokaoRelevance: 0.3, tags: ["逼近", "多项式"], intuition: "无限多项式克隆曲线。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "任何光滑函数都可以表示为无限多项式级数。泰勒级数用函数在某点的各阶导数来近似函数。", proofSteps: ["假设f(x)可展开为幂级数", "逐项求导确定系数", "利用n阶导数在a点的值确定系数"], applications: ["函数逼近", "数值计算", "级数展开"], history: "泰勒在1715年发表。"),
        Formula(id: "euler_formula", name: "欧拉公式", latex: "e^{i\\theta} = \\cos\\theta + i\\sin\\theta", level: .university, category: .complexNumbers, prerequisites: ["taylor_series"], derivations: ["euler_identity"], advancedForm: "harmonic_analysis", gaokaoRelevance: 0.2, tags: ["复数", "上帝公式"], intuition: "数学美学的巅峰合一。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "将指数函数与三角函数联系起来的神奇公式。当θ=π时得到欧拉恒等式e^(iπ)+1=0。", proofSteps: ["利用e^x, cosx, sinx的泰勒展开", "将x替换为iθ", "合并实部和虚部"], applications: ["复数运算", "傅里叶分析", "信号处理"], history: "欧拉在1748年提出。"),
        Formula(id: "vector_dot", name: "向量点积", latex: "\\vec{a} \\cdot \\vec{b} = |\\vec{a}||\\vec{b}|\\cos\\theta", level: .high, category: .linearAlgebra, prerequisites: ["pythagorean"], derivations: ["projection"], advancedForm: "inner_product", gaokaoRelevance: 0.8, tags: ["向量", "代数", "必考"], intuition: "一个向量在另一个向量上的投影长度。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "两个向量的点积等于它们的模长乘积乘以夹角的余弦。点积为零表示两向量垂直。", proofSteps: ["利用余弦定理", "|a-b|² = |a|² + |b|² - 2a·b", "展开左边得a·b = |a||b|cosθ"], applications: ["投影计算", "垂直判定", "功的计算"], history: "19世纪哈密顿引入向量概念后广泛使用。"),
        Formula(id: "vector_cross", name: "向量叉积", latex: "|\\vec{a} \\times \\vec{b}| = |\\vec{a}||\\vec{b}|\\sin\\theta", level: .university, category: .linearAlgebra, prerequisites: ["vector_dot"], derivations: ["triple_product"], advancedForm: "exterior_product", gaokaoRelevance: 0.5, tags: ["向量", "代数"], intuition: "平行四边形面积。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "两个向量叉积的模长等于它们构成的平行四边形面积。叉积方向垂直于两向量。", proofSteps: ["利用平行四边形面积=底×高", "高=|b|sinθ", "面积=|a||b|sinθ=|a×b|"], applications: ["面积计算", "垂直向量", "力矩计算"], history: "格拉斯曼在1844年引入外代数。"),
        Formula(id: "sphere_volume", name: "球的体积", latex: "V = \\frac{4}{3} \\pi r^3", level: .high, category: .geometry, prerequisites: ["cone_volume"], derivations: [], advancedForm: "spherical_integral", gaokaoRelevance: 0.85, tags: ["立体几何", "体积", "必考"], intuition: "无限薄球壳体积之和。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "半径为r的球体体积等于(4/3)πr³。可以通过将球分割为无限薄球壳积分得到。", proofSteps: ["将球分割为无限薄球壳", "每个球壳体积≈4πx²dx", "积分从0到r得V=4π∫x²dx=4/3πr³"], applications: ["球体容器", "星球体积", "球体设计"], history: "阿基米德在公元前225年证明。"),
        Formula(id: "sphere_surface", name: "球的表面积", latex: "S = 4 \\pi r^2", level: .high, category: .geometry, prerequisites: ["sphere_volume"], derivations: [], advancedForm: "surface_integral", gaokaoRelevance: 0.7, tags: ["立体几何", "表面积"], intuition: "四个大圆面积。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "半径为r的球体表面积等于4πr²。表面积是体积对半径的导数。", proofSteps: ["体积V=(4/3)πr³", "表面积S=dV/dr=4πr²"], applications: ["球体表面积计算", "散热面积", "地球表面积"], history: "阿基米德发现球表面积与外切圆柱侧面积相等。"),
        Formula(id: "cone_volume", name: "圆锥体积", latex: "V = \\frac{1}{3} \\pi r^2 h", level: .high, category: .geometry, prerequisites: ["cylinder_volume"], derivations: ["pyramid"], advancedForm: "cone_integral", gaokaoRelevance: 0.9, tags: ["立体几何", "体积", "必考"], intuition: "等底等高圆柱体积的1/3。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "底面半径r、高h的圆锥体体积等于同底同高圆柱体积的三分之一。", proofSteps: ["利用祖暅原理：等高处截面积相等则体积相等", "圆锥与同底等高棱锥体积相等", "棱锥体积=1/3×底面积×高"], applications: ["锥形容器", "金字塔体积", "圆锥光学"], history: "祖冲之父子在5世纪提出祖暅原理证明。"),
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
        Formula(id: "fundamental_theorem", name: "微积分基本定理", latex: "\\int_a^b f(x)dx = F(b) - F(a)", level: .high, category: .calculus, prerequisites: ["int_power"], derivations: [], advancedForm: "stokes_theorem", gaokaoRelevance: 1.0, tags: ["积分", "核心", "必考"], intuition: "微分与积分的桥梁。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "定积分等于原函数在上下限处的值之差。这是微积分的核心定理。", proofSteps: ["定义变上限积分F(x)=∫ₐˣf(t)dt", "证明F'(x)=f(x)", "利用中值定理证明∫ₐᵇf(x)dx=F(b)-F(a)"], applications: ["定积分计算", "面积体积", "物理应用"], history: "牛顿和莱布尼茨分别独立发现。"),
        Formula(id: "deriv_product", name: "乘积法则", latex: "(uv)' = u'v + uv'", level: .high, category: .calculus, prerequisites: ["deriv_power"], derivations: ["deriv_quotient"], advancedForm: "leibniz_rule", gaokaoRelevance: 1.0, tags: ["导数", "核心", "必考"], intuition: "前导后不导加前不导后导。", leapfrogKey: false, unlockedBy: nil, detailedExplanation: "两个函数乘积的导数等于第一个函数的导数乘第二个函数加上第一个函数乘第二个函数的导数。", proofSteps: ["利用导数定义", "lim[(u+du)(v+dv)-uv]/dx", "展开化简得u'v+uv'"], applications: ["复杂函数求导", "隐函数求导", "微分方程"], history: "莱布尼茨规则。"),
        Formula(id: "deriv_chain", name: "复合函数求导", latex: "\\frac{dy}{dx} = \\frac{dy}{du} \\cdot \\frac{du}{dx}", level: .high, category: .calculus, prerequisites: ["deriv_power"], derivations: [], advancedForm: "chain_rule_multivariable", gaokaoRelevance: 1.0, tags: ["导数", "核心", "必考"], intuition: "链式传递。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "复合函数y=f(u), u=g(x)的导数等于dy/du乘以du/dx。", proofSteps: ["利用导数定义的极限形式", "Δy/Δx = (Δy/Δu)(Δu/Δx)", "取极限得链式法则"], applications: ["复杂函数求导", "隐函数求导", "相关变化率"], history: "微积分基本法则。"),
        Formula(id: "int_power", name: "幂函数积分", latex: "\\int x^n dx = \\frac{x^{n+1}}{n+1} + C", level: .high, category: .calculus, prerequisites: ["deriv_power"], derivations: ["int_definite"], advancedForm: "integration_by_parts", gaokaoRelevance: 1.0, tags: ["积分", "核心", "必考"], intuition: "升幂补偿。", leapfrogKey: true, unlockedBy: nil, detailedExplanation: "幂函数xⁿ的不定积分等于x^(n+1)/(n+1)加常数C（n≠-1）。", proofSteps: ["对x^(n+1)/(n+1)求导", "导数=(n+1)x^n/(n+1)=x^n", "故积分成立"], applications: ["面积计算", "体积计算", "物理积分"], history: "牛顿-莱布尼茨公式。")
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
            relatedWeaponId: "bayes_theorem",
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
            relatedHeroId: "russell",
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
            relatedWeaponId: "nl_formula",
            relatedHeroId: nil,
            votes: MysteryVotes(agreeCount: 6700, disagreeCount: 1100, userVote: nil),
            openQuestion: "现实物理中存在吗？"
        )
    ]

    // MARK: - Problems (Strike Pack)
    
    static let problems: [Problem] = [
        // ============ 小学题目 (5%) ============
        Problem(
            id: "elem_001",
            type: .multipleChoice,
            tier: 1,
            formulaIds: ["add_commute"],
            content: "计算：3 + 5 + 7 = ？",
            contentLatex: "3 + 5 + 7 = ?",
            options: ["12", "15", "18", "20"],
            answer: "15",
            difficulty: 0.1,
            averageTime: 10,
            hints: ["加法交换律", "凑十法"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "使用加法交换律", latex: "3 + 7 + 5 = 10 + 5", annotation: "先算 3+7")
                ],
                keyInsight: "交换顺序让计算更简单。",
                commonMistakes: ["忘记进位"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "按顺序计算", latex: "3+5=8", annotation: ""),
                        SolutionStep(order: 2, description: "继续加法", latex: "8+7=15", annotation: "")
                    ],
                    keyInsight: "按顺序计算",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】凑整法！", latex: "(3+7)+5 = 10+5 = 15", annotation: "先凑10再算！")
                    ],
                    keyInsight: "凑整让复杂计算变简单！",
                    commonMistakes: []
                ),
                weaponUsed: "凑整法 (加法交换律)",
                timeRatio: 2.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了如何用"凑整法"（加法交换律和结合律）来秒杀计算题：
                    
                    1️⃣ 观察：3和7可以凑成10
                    2️⃣ 分组：(3+7)+5，利用交换律和结合律重新排列
                    3️⃣ 计算：每组都是10，直接得出15
                    
                    💡 关键：遇到加法题，先看能不能凑整！这比按顺序计算快得多，也不容易出错！
                    
                    🧠 高阶思维：这是"代数运算律"的体现——虽然是小学题，但体现了"重新排列使计算简化"的思想，这种思想在高中、大学数学中也广泛使用！
                    """
            ),
            gaokaoYear: nil,
            tags: ["算术", "小学"]
        ),

        // ============ 初中题目 (15%) ============
        Problem(
            id: "middle_001",
            type: .multipleChoice,
            tier: 2,
            formulaIds: ["pythagorean"],
            content: "直角三角形两直角边分别为3和4，斜边长为？",
            contentLatex: "a=3, b=4, c=?",
            options: ["5", "6", "7", "12"],
            answer: "5",
            difficulty: 0.2,
            averageTime: 20,
            hints: ["勾股定理"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "应用勾股定理", latex: "c^2 = 3^2 + 4^2 = 25", annotation: "计算平方和"),
                    SolutionStep(order: 2, description: "开方", latex: "c = \\sqrt{25} = 5", annotation: "取正值")
                ],
                keyInsight: "识别直角三角形，直接应用公式。",
                commonMistakes: ["忘记开方", "搞混斜边和直角边"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "应用勾股定理", latex: "c²=3²+4²=25", annotation: ""),
                        SolutionStep(order: 2, description: "开方", latex: "c=5", annotation: "")
                    ],
                    keyInsight: "直接应用勾股定理",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】记住3-4-5勾股数！", latex: "c=5", annotation: "直接秒答！")
                    ],
                    keyInsight: "记住常见勾股数，秒答直角三角形！",
                    commonMistakes: []
                ),
                weaponUsed: "勾股数记忆法",
                timeRatio: 5.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了如何用"勾股数记忆法"来秒杀几何题：
                    
                    1️⃣ 观察：3和4，马上想到勾股数3-4-5
                    2️⃣ 秒答：斜边就是5！
                    
                    💡 关键：记住常见勾股数（3-4-5，5-12-13，7-24-25，8-15-17等），它们的倍数也是勾股数！
                    
                    🧠 高阶思维：这是"数感"的体现——对数的敏感度和记忆，这种能力在解三角形、解析几何等高中内容中也至关重要！
                    """
            ),
            gaokaoYear: nil,
            tags: ["几何", "初中"]
        ),

        Problem(
            id: "middle_002",
            type: .multipleChoice,
            tier: 2,
            formulaIds: ["quad_root"],
            content: "方程 x² - 5x + 6 = 0 的两根之和是？",
            contentLatex: "x^2 - 5x + 6 = 0",
            options: ["5", "-5", "6", "-6"],
            answer: "5",
            difficulty: 0.35,
            averageTime: 30,
            hints: ["韦达定理"],
            solution: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "应用韦达定理", latex: "x_1 + x_2 = -\\frac{b}{a} = 5", annotation: "直接套用公式")
                ],
                keyInsight: "不求根直接用韦达定理。",
                commonMistakes: ["记错符号"]
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "求根公式", latex: "x = [5 ± √(25-24)]/2", annotation: ""),
                        SolutionStep(order: 2, description: "求出两根", latex: "x₁=2, x₂=3", annotation: ""),
                        SolutionStep(order: 3, description: "相加", latex: "2+3=5", annotation: "")
                    ],
                    keyInsight: "求根公式",
                    commonMistakes: []
                ),
                descentMethod: SolutionPath(
                    steps: [
                        SolutionStep(order: 1, description: "【秒杀】韦达定理直接用！", latex: "x₁+x₂ = -b/a = -(-5)/1 = 5", annotation: "不求根，秒杀！")
                    ],
                    keyInsight: "韦达定理是二次方程的神器！",
                    commonMistakes: []
                ),
                weaponUsed: "韦达定理",
                timeRatio: 3.0,
                detailedExplanation: """
                    【降维秒杀详解】
                    
                    这道题展示了如何用"韦达定理"来秒杀二次方程问题：
                    
                    1️⃣ 识别：对于 ax²+bx+c=0，根的和是 -b/a
                    2️⃣ 代入：这里a=1, b=-5，所以和就是 -(-5)/1 = 5
                    3️⃣ 完成：不需要求根，直接得出答案！
                    
                    💡 关键：韦达定理告诉我们"根与系数的关系"，在不需要知道具体根的时候特别有用！
                    
                    🧠 高阶思维：这是"对称多项式"思想的体现——虽然是初中题，但这种"研究整体性质而不求解个体"的思想，在高中不等式、数列，大学抽象代数中都有应用！
                    """
            ),
            gaokaoYear: nil,
            tags: ["方程", "初中"]
        ),

        // ============ 高中题目 (80%) ============
        
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
        )
    ]

    // MARK: - Heroes

    static let heroes: [MathHero] = [
        MathHero(id: "euler", name: "欧拉", nameEN: "Leonhard Euler", era: "1707 - 1783", attributes: HeroAttributes(insight: 10, creativity: 10, perseverance: 9, influence: 10), weaponSkills: ["欧拉恒等式"], legendStory: "失明后依然统治数学界。", famousQuote: "数学是上帝书写宇宙的语言。", relatedMysteries: ["099_equals_1", "gabriel_horn"], portraitEmoji: "👴"),
        MathHero(id: "gauss", name: "高斯", nameEN: "Carl Friedrich Gauss", era: "1777 - 1855", attributes: HeroAttributes(insight: 10, creativity: 9, perseverance: 10, influence: 10), weaponSkills: ["正态分布"], legendStory: "3岁纠错，10岁秒算。", famousQuote: "数学是科学的女王。", relatedMysteries: ["monty_hall"], portraitEmoji: "👑"),
        MathHero(id: "russell", name: "罗素", nameEN: "Bertrand Russell", era: "1872 - 1970", attributes: HeroAttributes(insight: 10, creativity: 8, perseverance: 9, influence: 10), weaponSkills: ["逻辑主义"], legendStory: "用逻辑挑战整个数学界。", famousQuote: "数学不确定的科学。", relatedMysteries: ["russell_paradox"], portraitEmoji: "🎩")
    ]

    // MARK: - Weapons

    static let weapons: [DescendWeapon] = [
        DescendWeapon(id: "derivative_blade", name: "Derivative Blade", codename: "求导刃", tier: .blade, principle: "导数", tagline: "变化率秒杀器", unlockConditions: [], slayableGaokaoTypes: ["单调性"], demonstrations: [], masteryLevel: .beginner),
        DescendWeapon(id: "lopital_hammer", name: "L'Hôpital's Hammer", codename: "洛必达之锤", tier: .heavyWeapon, principle: "导数极限", tagline: "极限陷阱粉碎机", unlockConditions: [], slayableGaokaoTypes: ["极限"], demonstrations: [], masteryLevel: .locked)
    ]

    // MARK: - Daily Strikes

    static let dailyStrikes: [DailyStrike] = [
        DailyStrike(type: "思维", question: "为何球表面积是体积导数？", answer: "增量效应", detail: "微分几何直观")
    ]
}
