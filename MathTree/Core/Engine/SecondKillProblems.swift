import SwiftUI

// MARK: - 降维打击 · 秒杀殿堂 数据层
//
// 产品灵魂：用「高维」数学工具（大学知识 / 纲内深用技巧）秒杀近二十年高考压轴题。
// 每个战例 = 一道压轴题 + 双解对决：
//   · standardMethod（常规法）：高中老师会教的、正确但繁琐的硬解
//   · descentMethod（降维秒杀）：用一把"武器"几步拿下
// 数据复用现有 Problem / DualSolution 模型；额外的展示元数据放在 SecondKillCase。
//
// ⚠️ 诚信原则：题型源自历年高考压轴高频题型（部分为改编），不臆造"某年某卷某题"的精确出处。
// ⚠️ 使用守则：超纲武器（洛必达/泰勒/中值/对数平均/积分放缩）直接写进高考大题可能不被认可，
//    其正确定位是——选择填空直接秒杀、大题用来"先秒出答案再倒推标准步骤 / 检验 / 定方向"。

// MARK: - 武器（按"工具"组织，而非按章节）

enum KillWeapon: String, CaseIterable, Identifiable {
    case secondDerivative   // 二次求导 · 凹凸性 / Jensen
    case taylor             // 泰勒展开
    case lopital            // 洛必达法则
    case extremumOffset     // 极值点偏移（对数平均不等式）
    case tangentLine        // 切线放缩
    case lagrange           // 拉格朗日中值定理
    case integralBound      // 定积分放缩
    case lagrangeMultiplier // 拉格朗日乘数法（多元条件极值）
    case eulerFormula       // 欧拉公式（三角求和 / 复数）
    case recurrence         // 特征根法 · 不动点（递推数列通项）
    case cauchyPower        // 柯西 · 权方和（分式和最值）
    case quadraticForm      // 二次型 · 特征值（圆上二次式范围）
    case sosDecomposition   // SOS 配方法（平方和）
    case trigSubstitution   // 三角换元
    case rolleTheorem       // 罗尔定理 · 构造原函数（存在性）
    // ── 高考选择/填空题「技巧型」秒杀（纲内，学校讲得浅）──
    case specialValue       // 特殊值 / 赋值法
    case optionElimination  // 选项代入 · 排除法
    case numberShape        // 数形结合 · 几何意义
    case estimation         // 估算 · 特例比较

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .secondDerivative: return "二次求导 · 凹凸性"
        case .taylor:           return "泰勒展开"
        case .lopital:          return "洛必达法则"
        case .extremumOffset:   return "极值点偏移"
        case .tangentLine:      return "切线放缩"
        case .lagrange:         return "拉格朗日中值定理"
        case .integralBound:    return "定积分放缩"
        case .lagrangeMultiplier: return "拉格朗日乘数法"
        case .eulerFormula:     return "欧拉公式"
        case .recurrence:       return "特征根法 · 不动点"
        case .cauchyPower:      return "柯西 · 权方和"
        case .quadraticForm:    return "二次型 · 特征值"
        case .sosDecomposition: return "SOS 配方法"
        case .trigSubstitution: return "三角换元"
        case .rolleTheorem:     return "罗尔定理 · 构造原函数"
        case .specialValue:     return "特殊值 · 赋值法"
        case .optionElimination: return "选项代入 · 排除法"
        case .numberShape:      return "数形结合 · 几何意义"
        case .estimation:       return "估算 · 特例比较"
        }
    }

    /// 一句话武器定位
    var tagline: String {
        switch self {
        case .secondDerivative: return "二阶导定凹凸，Jensen 一步压住一串"
        case .taylor:           return "把函数拆成多项式，极限与放缩瞬间看穿"
        case .lopital:          return "0/0、∞/∞ 直接求导，绕开重要极限拼凑"
        case .extremumOffset:   return "双零点之和/积，对数平均一击夹定"
        case .tangentLine:      return "用切线 eˣ≥x+1、lnx≤x-1 整段放缩"
        case .lagrange:         return "把函数增量化成 f'(ξ)·Δx，区间一夹即证"
        case .integralBound:    return "数列求和卡住？用积分把每一项夹住再求和"
        case .lagrangeMultiplier: return "多元条件极值，梯度平行一步定驻点"
        case .eulerFormula:     return "e^{iθ}=cosθ+isinθ，三角求和化几何级数"
        case .recurrence:       return "递推数列通项，特征方程/不动点直接给闭式"
        case .cauchyPower:      return "分式平方和，(Σa)²/(Σb) 一步压到最小"
        case .quadraticForm:    return "圆上二次式的范围 = 对称矩阵的两个特征值"
        case .sosDecomposition: return "把式子配成平方和，非负性一眼可见"
        case .trigSubstitution: return "带根号或 x²+y² 约束？换到角度世界"
        case .rolleTheorem:     return "构造原函数，两端相等必有驻点"
        case .specialValue:     return "抽象函数/恒等式？代特殊值瞬间出数"
        case .optionElimination: return "别正算，把选项代回去，对的留下"
        case .numberShape:      return "代数式翻译成斜率/距离/面积，看图秒答"
        case .estimation:       return "选择题只要量级，估出大小直接排除"
        }
    }

    var icon: String {
        switch self {
        case .secondDerivative: return "function"
        case .taylor:           return "chart.xyaxis.line"
        case .lopital:          return "divide"
        case .extremumOffset:   return "arrow.left.and.right"
        case .tangentLine:      return "line.diagonal"
        case .lagrange:         return "ruler"
        case .integralBound:    return "sum"
        case .lagrangeMultiplier: return "circle.grid.cross.fill"
        case .eulerFormula:     return "wave.3.forward"
        case .recurrence:       return "arrow.triangle.2.circlepath"
        case .cauchyPower:      return "chart.bar.xaxis"
        case .quadraticForm:    return "rectangle.split.2x2"
        case .sosDecomposition: return "square.grid.2x2.fill"
        case .trigSubstitution: return "triangle.fill"
        case .rolleTheorem:     return "waveform.path"
        case .specialValue:     return "1.circle.fill"
        case .optionElimination: return "checklist.checked"
        case .numberShape:      return "ruler.fill"
        case .estimation:       return "lessthan.circle.fill"
        }
    }

    var tint: Color {
        switch self {
        case .secondDerivative: return .apexLava
        case .taylor:           return .apexStarBlue
        case .lopital:          return .apexMystery
        case .extremumOffset:   return .rainbowOrange
        case .tangentLine:      return .apexEmerald
        case .lagrange:         return .rainbowIndigo
        case .integralBound:    return .apexGold
        case .lagrangeMultiplier: return .rainbowPurple
        case .eulerFormula:     return .rainbowBlue
        case .recurrence:       return .rainbowTeal
        case .cauchyPower:      return .rainbowGreen
        case .quadraticForm:    return .rainbowYellow
        case .sosDecomposition: return .rainbowRed
        case .trigSubstitution: return .levelElementary
        case .rolleTheorem:     return .levelUniversity
        case .specialValue:     return .apexGold
        case .optionElimination: return .apexEmerald
        case .numberShape:      return .apexStarBlue
        case .estimation:       return .rainbowOrange
        }
    }

    /// 是否纲内（绿色）；超纲武器为 false。
    var inSyllabus: Bool {
        switch self {
        case .secondDerivative, .tangentLine, .cauchyPower, .sosDecomposition, .trigSubstitution,
             .specialValue, .optionElimination, .numberShape, .estimation: return true
        default: return false
        }
    }

    /// 是否为「选择/填空题技巧」类武器（纲内、靠机智不靠公式）。
    var isExamTechnique: Bool {
        switch self {
        case .specialValue, .optionElimination, .numberShape, .estimation: return true
        default: return false
        }
    }

    /// 武器原理：为什么它能"降维"。
    var principle: String {
        switch self {
        case .secondDerivative:
            return "对函数求二阶导可判断凹凸性：f''>0 下凸、f''<0 上凸。一阶导分不清单调时，二阶导能定下一阶导的单调性，从而钉死原函数走势；配合 Jensen 不等式，凹（凸）函数能把 n 个点的和一次性压到/抬到端点，整串不等式一步搞定。"
        case .taylor:
            return "任何光滑函数在某点附近都可展成多项式：eˣ=1+x+x²/2+…，ln(1+x)=x−x²/2+…，sinx=x−x³/6+…。把超越函数换成多项式后，极限、估值、不等式放缩都退化成「比系数」，难度断崖式下降。"
        case .lopital:
            return "对 0/0 或 ∞/∞ 型极限，lim f/g = lim f'/g'（满足条件时）。直接对分子分母求导，绕开高中「凑重要极限」的技巧依赖，可反复使用直到不再是未定式。"
        case .extremumOffset:
            return "极值点两侧函数不对称（「偏移」）。处理双零点/双解的和与积时，对数平均不等式 √(ab) < (a−b)/(lna−lnb) < (a+b)/2 能把 x₁、x₂ 的对称组合一步夹定，免去繁琐的构造对称函数。"
        case .tangentLine:
            return "凸函数恒在其切线上方、凹函数恒在下方。于是 eˣ≥x+1、ln x≤x−1、ln(1+x)≤x 这些「切线不等式」对全定义域成立，可逐项替换、整段放缩，把超越式压成线性式。"
        case .lagrange:
            return "若 f 在 [a,b] 连续、(a,b) 可导，则存在 ξ∈(a,b) 使 f(b)−f(a)=f'(ξ)(b−a)。它把「函数值之差」一步换成「导数值×自变量之差」，再用 ξ 的范围夹逼，证不等式快得离谱。"
        case .integralBound:
            return "单调函数在 [k,k+1] 上的值可被定积分夹住：递减时 ∫_k^{k+1}f < f(k) < ∫_{k-1}^{k}f。把数列每一项换成可积的面积条，求和即化为可直接算的定积分，攻克「和式估计」压轴。"
        case .lagrangeMultiplier:
            return "求 f 在约束 g=0 下的极值，极值点处两函数梯度平行：∇f=λ∇g。联立 ∇f=λ∇g 与 g=0 解出驻点，免去『消元代入再单变量求导』的繁琐，多元、非对称约束尤其管用。"
        case .eulerFormula:
            return "e^{iθ}=cosθ+isinθ 把三角与指数打通。于是 Σcos kθ、Σsin kθ 就是复指数等比数列求和的实/虚部；而 cosⁿθ 可由二项式展开 (e^{iθ}+e^{-iθ})ⁿ/2ⁿ 取实部，瞬间线性降幂。"
        case .recurrence:
            return "线性递推 a_{n+2}=p·a_{n+1}+q·a_n 的通项由特征方程 x²=px+q 的根决定：相异根 r₁,r₂ 给 A·r₁ⁿ+B·r₂ⁿ，重根 r 给 (A+Bn)rⁿ；一阶分式递推则用『不动点』把它化成等比/等差数列。"
        case .cauchyPower:
            return "权方和不等式（柯西的分式形式）：当 bᵢ>0，Σ aᵢ²/bᵢ ≥ (Σaᵢ)²/Σbᵢ，等号当所有 aᵢ/bᵢ 相等。它把一串分式之和一步压缩成单个分式，是分式型最值的核武器。"
        case .quadraticForm:
            return "形如 ax²+bxy+cy² 的二次式对应对称矩阵 [[a, b/2],[b/2, c]]。在单位圆 x²+y²=1 上，它的取值范围正好是该矩阵的最小、最大特征值 [λ_min, λ_max]；λ 由特征方程 λ²−(a+c)λ+(ac−b²/4)=0 解出，省去三角配辅助角。"
        case .sosDecomposition:
            return "Sum of Squares：把多项式恒等地写成若干平方之和，则它的非负性一目了然，取等条件就是各平方同时为 0。它把『证不等式』变成『配方』，是对称/轮换不等式的万能起手式。"
        case .trigSubstitution:
            return "看到 √(1−x²)、x²+y²=r²、或限定在 [−1,1] 的变量，就令 x=cosθ（或 x=r cosθ、x=tanθ）。根号被 sin/cos 化掉、约束自动满足，问题从代数世界跳到角度世界，辅助角与有界性立刻可用。"
        case .rolleTheorem:
            return "罗尔定理：f 在 [a,b] 连续、(a,b) 可导且 f(a)=f(b)，则存在 ξ∈(a,b) 使 f'(ξ)=0。证『某方程有根 / 某导数等式成立』时，反向构造一个两端取等的原函数 F，对它用罗尔，存在性立得。"
        case .specialValue:
            return "选择/填空题的条件若对『任意 x』『任意参数』成立，那它对任何你挑的特殊值也成立。给抽象函数、含参恒等式、二项式系数题代入 x=0、1、−1（或特殊角、特殊数列），未知量瞬间被解出——这是高考最高频的省时手段。"
        case .optionElimination:
            return "选择题答案就藏在四个选项里。与其正向硬算，不如把选项（或题目给的特殊点）代回条件验证：算 a₁、a₂ 看哪个通项对得上、把根代进方程、用奇偶/单调性筛。对的留下，错的秒删。"
        case .numberShape:
            return "把代数式翻译成几何量：(y₂−y₁)/(x₂−x₁) 是斜率、√((x−a)²+(y−b)²) 是距离、|x−a|+|x−b| 是数轴距离和、行列式是面积。画出图形，最值/范围一眼读出，免去繁琐代数。"
        case .estimation:
            return "选择题只需要『落在哪个区间/谁大谁小』，不需要精确值。对幂、对数、根式取公共乘方或与基准值（0、1、1/2、e）比较，估出量级即可锁定唯一选项，比精确计算快十倍。"
        }
    }

    /// 触发信号：题目出现什么特征，就掏这把武器。
    var signal: String {
        switch self {
        case .secondDerivative:
            return "一阶导符号判不清；恒成立求参且 g(0)=g'(0)=0；三角/对数的和式求最值（凹凸 + Jensen）。"
        case .taylor:
            return "含参极限要求「有限/存在」反求参数；高阶（x³、x⁴）未定式极限；要把 eˣ、ln、sin 估到某一阶。"
        case .lopital:
            return "选择/填空中出现 0/0 或 ∞/∞ 型极限，且无法一眼套重要极限。"
        case .extremumOffset:
            return "两个零点/两个解 x₁、x₂，要证它们的「和」或「积」满足某不等式（x₁+x₂>2、x₁x₂>e² 之类）。"
        case .tangentLine:
            return "要证含 eˣ 或 ln 的不等式；或数列求和与 ln(n+1)、调和级数作比较。"
        case .lagrange:
            return "出现 f(b)−f(a) 形式的差、或 (lnb−lna)/(b−a) 这类「差商」，要夹在两个表达式之间。"
        case .integralBound:
            return "要证形如 Σ1/k、Σ1/√k、Σln k 的和式不等式，且右边是个「连续」的封闭表达式。"
        case .lagrangeMultiplier:
            return "多元函数在等式约束下求最大/最小：圆/椭圆/球面/平面上的最值、和为定值求平方和、约束下求乘积等。"
        case .eulerFormula:
            return "求 Σcos kθ 或 Σsin kθ；推导 n 倍角恒等式；把 cosⁿθ 线性化为各次余弦之和（积分预备）。"
        case .recurrence:
            return "给定二阶线性递推 a_{n+2}=p·a_{n+1}+q·a_n，或一阶分式递推 a_{n+1}=(αa_n+β)/(γa_n+δ)，要求通项公式。"
        case .cauchyPower:
            return "求形如 Σ(常数²/变量) 或 Σ aᵢ²/bᵢ 的最小值，且分母之和为定值或可控。"
        case .quadraticForm:
            return "在单位圆 / x²+y²=定值 上，求二次式 ax²+bxy+cy² 的最大、最小值或取值范围。"
        case .sosDecomposition:
            return "证对称或轮换的二次（多次）不等式恒成立，尤其右边为 0、要找取等条件时。"
        case .trigSubstitution:
            return "出现 √(1−x²)、√(a²−x²)、x²+y²=r² 约束，或变量限定 [−1,1] 求值域/最值。"
        case .rolleTheorem:
            return "要证『某方程在区间内有根』或『存在 ξ 使某导数等式成立』这类存在性命题。"
        case .specialValue:
            return "抽象函数（只给 f(x+y)=… 之类性质）、含参恒等式对任意 x 成立、二项式展开求系数和。"
        case .optionElimination:
            return "选择题求数列通项/解析式/方程的根，且四个选项形式具体、便于代入验证时。"
        case .numberShape:
            return "求 √(…)+√(…) 的最值、(sinθ)/(cosθ−a) 的范围、|x−a|+|x−b| 的最小值等『有几何味』的式子。"
        case .estimation:
            return "比较若干幂/对数/根式的大小，或判断某表达式落在哪个区间（选择题）。"
        }
    }

    /// 高考大题里能否直接书写（诚实标注）。
    var examSafe: Bool {
        switch self {
        case .secondDerivative, .tangentLine, .cauchyPower, .sosDecomposition, .trigSubstitution,
             .specialValue, .optionElimination, .numberShape, .estimation: return true
        default: return false
        }
    }

    /// 使用守则（针对大题书写）。
    var examNote: String {
        switch self {
        case .secondDerivative:
            return "✅ 纲内方法，二阶导判凹凸、求最值可直接书写。Jensen 不等式建议在大题里改写为「构造函数 + 求最值」的等价过程更稳妥。"
        case .tangentLine:
            return "✅ 切线不等式属常用技巧，大题可用，但建议先用一句「构造 g(x)=eˣ−x−1，g'(x)=eˣ−1」现场证明再引用，更稳。"
        case .taylor:
            return "⚠️ 带 o(xⁿ) 的泰勒展开高考大题不被认可。选择填空可直接秒；大题请改用「泰勒指引方向 + 标准构造函数」补全步骤。"
        case .lopital:
            return "⚠️ 洛必达高考大题明确不认，写了判 0 分。它是选择/填空的极限神器，大题只用来「心算出答案再倒推标准解」。"
        case .extremumOffset:
            return "⚠️ 对数平均不等式属超纲。选填可直接用；大题需先证明该不等式（或改用构造对称函数 F(x)=f(x)−f(2c−x)）。"
        case .lagrange:
            return "⚠️ 中值定理高中不在考纲。选填可秒；大题需先用单调性把结论等价转化，或现证中值结构。"
        case .integralBound:
            return "⚠️ 定积分放缩属超纲技巧。选填/检验可用；大题建议改写为数学归纳法或裂项放缩补全严格步骤。"
        case .lagrangeMultiplier:
            return "⚠️ 拉格朗日乘数法超纲。选填可直接用驻点定答案；大题需改用柯西不等式 / 消元 / 三角换元给出严格过程。"
        case .eulerFormula:
            return "⚠️ 欧拉公式与复指数超纲。选填可借它心算；大题需改用积化和差裂项或数学归纳补全。"
        case .recurrence:
            return "⚠️ 特征根法超纲。选填/验证可秒得通项；大题需用『构造等比数列』的纲内写法——而特征根正好告诉你该怎么构造。"
        case .cauchyPower:
            return "✅ 权方和（柯西-施瓦茨推论）大题可用，但建议注明它源自柯西不等式，或现场用柯西证一句，更稳妥。"
        case .quadraticForm:
            return "⚠️ 特征值方法超纲。选填可直接报 [λ_min, λ_max]；大题需改用三角换元 + 辅助角给出严格过程。"
        case .sosDecomposition:
            return "✅ 配方法（SOS）完全纲内，可直接书写，是最稳的不等式证法之一——把恒等变形写清楚即可。"
        case .trigSubstitution:
            return "✅ 三角换元纲内常用，可直接书写；注意写明新变量 θ 的取值范围以保证等价。"
        case .rolleTheorem:
            return "⚠️ 罗尔/达布定理高考不在考纲。选填/思路可用；大题构造原函数后宜改用零点定理 + 单调性书写。"
        case .specialValue:
            return "✅ 选择/填空题直接用，又快又稳。注意：仅当条件对『任意』成立时才能代特殊值；解答题求通项仍需完整推导。"
        case .optionElimination:
            return "✅ 选择题专用利器，代入验证完全合法。填空/解答题没有选项，需回到正向求解。"
        case .numberShape:
            return "✅ 数形结合纲内核心思想，选填可直接读图作答；解答题需把几何结论再用代数严格写出。"
        case .estimation:
            return "✅ 选择题估算合法且高效。但只用于『比大小/定区间』，需要精确值的填空/解答题不可估。"
        }
    }
}

// MARK: - 战例（压轴题 + 展示元数据）

struct SecondKillCase: Identifiable {
    let id: String
    let weapon: KillWeapon
    let title: String          // 钩子标题
    let source: String         // 题型出处（诚实标注）
    let standardMinutes: Int   // 常规法预估耗时（分钟）
    let killSeconds: Int       // 降维秒杀预估耗时（秒）
    let signal: String         // 本题的"识别信号"
    let problem: Problem       // 含 dualSolution 的完整题目

    /// 省时倍数（用于"震撼对比"）。
    var speedup: Double {
        let std = Double(standardMinutes) * 60
        return std / Double(max(killSeconds, 1))
    }
}

extension SampleData {

    static let secondKillCases: [SecondKillCase] = [

        // 1 ── 泰勒展开：恒成立求参
        skCase(
            id: "sk_001", weapon: .taylor,
            title: "恒成立卡住的参数，泰勒比系数一眼定",
            source: "函数与导数 · 恒成立求参（高考压轴高频）",
            standardMinutes: 9, killSeconds: 45,
            signal: "x≥0 恒成立、且 g(0)=g'(0)=0——二阶导能定，泰勒更快。",
            content: "当 x≥0 时，恒有 eˣ ≥ 1 + x + (a/2)x²，求实数 a 的最大值。",
            contentLatex: #"x\ge 0\ \text{时恒有}\ e^{x}\ge 1+x+\tfrac a2 x^{2},\ \ a_{\max}=?"#,
            answer: "a 的最大值为 1",
            difficulty: 0.74, tier: 5,
            formulaIds: ["taylor_series"],
            stdSteps: [
                skStep(1, "构造作差函数", #"g(x)=e^{x}-1-x-\tfrac a2x^{2},\quad g(0)=0"#),
                skStep(2, "一阶导仍为 0/0 型", #"g'(x)=e^{x}-1-ax,\quad g'(0)=0"#),
                skStep(3, "二次求导定符号", #"g''(x)=e^{x}-a"#),
                skStep(4, "讨论 a≤1", #"x\ge0\Rightarrow e^{x}\ge1\ge a\Rightarrow g''\ge0\Rightarrow g'\nearrow\Rightarrow g'\ge g'(0)=0\Rightarrow g\nearrow\Rightarrow g\ge0"#),
                skStep(5, "讨论 a>1 失效", #"g''(0)=1-a<0,\ \text{近 }0\text{ 处 }g'<0\Rightarrow g<0,\ \text{不成立}"#),
                skStep(6, "结论", #"a_{\max}=1"#)
            ],
            killSteps: [
                skStep(1, "泰勒展开 eˣ", #"e^{x}=1+x+\tfrac{x^{2}}{2}+\tfrac{x^{3}}{6}+\cdots\ (x\ge0\text{ 各项非负})"#),
                skStep(2, "立得 a=1 成立", #"e^{x}\ge 1+x+\tfrac{x^{2}}{2}\Rightarrow a=1\text{ 时恒成立}"#),
                skStep(3, "比 x² 系数定上界", #"a>1\Rightarrow x\to0^{+}\ \text{主项}\ \tfrac{1-a}{2}x^{2}<0\ \text{必破坏}\Rightarrow a_{\max}=1"#)
            ],
            stdKey: "二次求导定一阶导单调性，再回推原函数非负，分类讨论定出 a。",
            killKey: "eˣ 的泰勒展开自带 x²/2，比较二次项系数即知 a 最大为 1。",
            mistakes: ["忘记验证 g(0)=g'(0)=0 两个边界", "a>1 时未说明在 x→0⁺ 处失效"]
        ),

        // 2 ── 洛必达：选填极限直接秒
        skCase(
            id: "sk_002", weapon: .lopital,
            title: "(x−sinx)/x³ 这种极限，洛必达连捅三刀",
            source: "极限 · 选择填空（高考/竞赛常见）",
            standardMinutes: 6, killSeconds: 40,
            signal: "0/0 型且凑不出重要极限——直接洛必达。",
            content: "求极限 lim(x→0) (x − sin x) / x³。",
            contentLatex: #"\lim_{x\to0}\frac{x-\sin x}{x^{3}}=?"#,
            answer: "1/6",
            difficulty: 0.66, tier: 4,
            formulaIds: ["lopital_rule", "taylor_series"],
            stdSteps: [
                skStep(1, "中学思路：泰勒/夹逼", #"\sin x=x-\tfrac{x^{3}}{6}+o(x^{3})"#),
                skStep(2, "代入作差", #"x-\sin x=\tfrac{x^{3}}{6}+o(x^{3})"#),
                skStep(3, "求值", #"\frac{x-\sin x}{x^{3}}\to\frac16"#)
            ],
            killSteps: [
                skStep(1, "洛必达第一刀", #"\frac{x-\sin x}{x^{3}}\xrightarrow{0/0}\frac{1-\cos x}{3x^{2}}"#),
                skStep(2, "第二刀", #"\xrightarrow{0/0}\frac{\sin x}{6x}"#),
                skStep(3, "第三刀（或重要极限）", #"\xrightarrow{0/0}\frac{\cos x}{6}=\frac16"#)
            ],
            stdKey: "纯高中只能靠泰勒或夹逼，思路门槛高。",
            killKey: "0/0 型连续洛必达三次，机械求导即得 1/6，无需任何技巧。",
            mistakes: ["每步都要确认仍是 0/0 型才能继续洛必达", "大题不能直接写洛必达"]
        ),

        // 3 ── 泰勒展开：高阶未定式
        skCase(
            id: "sk_003", weapon: .taylor,
            title: "x⁴ 量级的极限，洛必达要四次，泰勒一步",
            source: "极限 · 高阶未定式（压轴选填）",
            standardMinutes: 10, killSeconds: 50,
            signal: "分母 x⁴ 高阶，洛必达要求导到崩溃——泰勒展开到四阶。",
            content: "求极限 lim(x→0) (cos x − e^(−x²/2)) / x⁴。",
            contentLatex: #"\lim_{x\to0}\frac{\cos x-e^{-x^{2}/2}}{x^{4}}=?"#,
            answer: "−1/12",
            difficulty: 0.80, tier: 5,
            formulaIds: ["taylor_series", "lopital_rule"],
            stdSteps: [
                skStep(1, "洛必达需连用四次", #"\text{分母 }x^{4}\Rightarrow\text{每次降一阶，求导式越来越长}"#),
                skStep(2, "极易算错", #"\text{四阶导后代入才得 }-\tfrac1{12}\ (\text{过程繁、易错})"#)
            ],
            killSteps: [
                skStep(1, "两个函数都展到 x⁴", #"\cos x=1-\tfrac{x^{2}}{2}+\tfrac{x^{4}}{24}+o(x^{4})"#),
                skStep(2, "指数展开", #"e^{-x^{2}/2}=1-\tfrac{x^{2}}{2}+\tfrac{x^{4}}{8}+o(x^{4})"#),
                skStep(3, "作差只剩四次项", #"\cos x-e^{-x^{2}/2}=\Big(\tfrac1{24}-\tfrac18\Big)x^{4}+o(x^{4})=-\tfrac{x^{4}}{12}+o(x^{4})"#),
                skStep(4, "求值", #"\Rightarrow\ \lim=-\frac1{12}"#)
            ],
            stdKey: "硬洛必达要对分子分母各求导四次，计算量巨大且极易出错。",
            killKey: "两函数同展到 x⁴，二次项恰好抵消，四次项系数 1/24−1/8=−1/12 直接读出。",
            mistakes: ["e^(−x²/2) 的 x⁴ 项是 (x²/2)²/2 = x⁴/8，别漏 1/2!", "展开阶数不足会得 0/0 错觉"]
        ),

        // 4 ── 极值点偏移：对数平均不等式
        skCase(
            id: "sk_004", weapon: .extremumOffset,
            title: "双零点之和 x₁+x₂>2，对数平均一击夹定",
            source: "导数 · 极值点偏移（全国卷经典压轴）",
            standardMinutes: 12, killSeconds: 70,
            signal: "两点函数值相等，要证它们的和——极值点偏移。",
            content: "设 f(x) = x·e^(−x)。若 f(x₁) = f(x₂) 且 x₁ ≠ x₂，证明 x₁ + x₂ > 2。",
            contentLatex: #"f(x)=xe^{-x},\ f(x_1)=f(x_2),\ x_1\ne x_2\Rightarrow x_1+x_2>2"#,
            answer: "成立，x₁+x₂>2（极大值点 x=1，左右偏移）",
            difficulty: 0.82, tier: 5,
            formulaIds: ["lagrange_mean"],
            stdSteps: [
                skStep(1, "构造对称差函数", #"\text{设 }x_1<1<x_2,\ F(x)=f(x)-f(2-x),\ x>1"#),
                skStep(2, "求导判单调", #"F'(x)=f'(x)+f'(2-x),\ \text{证 }F'>0\ (\text{需细致放缩})"#),
                skStep(3, "推出不等关系", #"F(x_2)>F(1)=0\Rightarrow f(x_2)>f(2-x_2)"#),
                skStep(4, "结合单调性比较", #"f(x_1)=f(x_2)>f(2-x_2),\ x_1,2-x_2<1\ \text{且 }f\nearrow\Rightarrow x_1>2-x_2"#),
                skStep(5, "结论", #"\Rightarrow x_1+x_2>2"#)
            ],
            killSteps: [
                skStep(1, "取对数化简条件", #"x_1e^{-x_1}=x_2e^{-x_2}\Rightarrow \ln x_1-x_1=\ln x_2-x_2"#),
                skStep(2, "整理出差商=1", #"x_2-x_1=\ln x_2-\ln x_1\Rightarrow\frac{x_2-x_1}{\ln x_2-\ln x_1}=1"#),
                skStep(3, "对数平均不等式", #"\frac{x_2-x_1}{\ln x_2-\ln x_1}<\frac{x_1+x_2}{2}"#),
                skStep(4, "一步夹定", #"1<\frac{x_1+x_2}{2}\Rightarrow x_1+x_2>2"#)
            ],
            stdKey: "构造 F(x)=f(x)−f(2−x) 证单调，再借单调性比较——步骤多、放缩繁。",
            killKey: "条件取对数后差商恰为 1，对数平均不等式上界 (x₁+x₂)/2 直接给出 >2。",
            mistakes: ["对数平均不等式大题需先证明", "注意 f(x)=xe⁻ˣ 在 x>0 才有两零点结构"]
        ),

        // 5 ── 切线放缩：调和和与 ln 比较
        skCase(
            id: "sk_005", weapon: .tangentLine,
            title: "调和和 > ln(n+1)，切线不等式一行求和",
            source: "数列 · 与对数的放缩证明（高考压轴）",
            standardMinutes: 8, killSeconds: 50,
            signal: "数列求和 ↔ ln(n+1)——用 ln(1+x)<x 切线放缩。",
            content: "证明：对任意正整数 n，1 + 1/2 + 1/3 + … + 1/n > ln(n+1)。",
            contentLatex: #"\sum_{k=1}^{n}\frac1k>\ln(n+1)\quad(n\in\mathbb N^{*})"#,
            answer: "成立",
            difficulty: 0.70, tier: 4,
            formulaIds: ["deriv_log"],
            stdSteps: [
                skStep(1, "数学归纳：奠基", #"n=1:\ 1>\ln2\approx0.693\ \checkmark"#),
                skStep(2, "归纳假设", #"\sum_{k=1}^{n}\tfrac1k>\ln(n+1)"#),
                skStep(3, "递推需再证一步", #"\text{需 }\tfrac1{n+1}>\ln(n+2)-\ln(n+1)=\ln\!\big(1+\tfrac1{n+1}\big)"#),
                skStep(4, "仍回到切线不等式", #"\text{即证 }\ln(1+x)<x,\ x=\tfrac1{n+1}\ \checkmark"#)
            ],
            killSteps: [
                skStep(1, "切线不等式", #"\ln(1+x)<x\quad(x>0)\ \ [\,y=x\ \text{是}\ \ln(1+x)\ \text{在 }0\text{ 处切线}\,]"#),
                skStep(2, "逐项取 x=1/k", #"\ln\frac{k+1}{k}=\ln\!\Big(1+\tfrac1k\Big)<\frac1k"#),
                skStep(3, "裂项求和", #"\ln(n+1)=\sum_{k=1}^{n}\ln\frac{k+1}{k}<\sum_{k=1}^{n}\frac1k"#)
            ],
            stdKey: "归纳法绕一圈，最后递推步仍要用到 ln(1+x)<x。",
            killKey: "直接用切线不等式逐项放缩，对数和裂项成 ln(n+1)，一次求和到位。",
            mistakes: ["ln((k+1)/k) 要写成 ln(1+1/k) 才好套切线不等式", "求和后是 ln(n+1) 不是 ln n"]
        ),

        // 6 ── 拉格朗日中值：对数双边夹
        skCase(
            id: "sk_006", weapon: .lagrange,
            title: "ln(b/a) 夹在两式之间，中值定理一步到位",
            source: "导数 · 对数不等式（高考压轴）",
            standardMinutes: 9, killSeconds: 55,
            signal: "出现 lnb−lna 的差，要夹在两个分式之间——拉格朗日。",
            content: "设 0 < a < b，证明：(b−a)/b < ln(b/a) < (b−a)/a。",
            contentLatex: #"0<a<b\Rightarrow\frac{b-a}{b}<\ln\frac ba<\frac{b-a}{a}"#,
            answer: "成立",
            difficulty: 0.72, tier: 4,
            formulaIds: ["lagrange_mean", "deriv_log"],
            stdSteps: [
                skStep(1, "左不等式构造函数", #"\varphi(x)=\ln x-\ln a-\frac{x-a}{x},\ \varphi(a)=0"#),
                skStep(2, "求导判单调", #"\varphi'(x)=\frac1x-\frac{a}{x^{2}}=\frac{x-a}{x^{2}}>0\Rightarrow\varphi(b)>0"#),
                skStep(3, "右不等式另构造", #"\psi(x)=\frac{x-a}{a}-\ln\frac xa,\ \psi'(x)=\frac1a-\frac1x>0\Rightarrow\psi(b)>0"#),
                skStep(4, "合并", #"\Rightarrow\frac{b-a}{b}<\ln\frac ba<\frac{b-a}{a}"#)
            ],
            killSteps: [
                skStep(1, "对 lnx 用中值定理", #"\ln b-\ln a=\frac1\xi(b-a),\quad \xi\in(a,b)"#),
                skStep(2, "夹住 1/ξ", #"a<\xi<b\Rightarrow\frac1b<\frac1\xi<\frac1a"#),
                skStep(3, "乘正数 (b−a)", #"\frac{b-a}{b}<\frac{b-a}{\xi}=\ln\frac ba<\frac{b-a}{a}"#)
            ],
            stdKey: "要分别构造两个辅助函数各证一边，工作量翻倍。",
            killKey: "中值定理把 lnb−lna 一次写成 (b−a)/ξ，再用 ξ∈(a,b) 同时夹出双边。",
            mistakes: ["乘 (b−a) 时注意它为正不变号", "中值定理大题需先转化为单调性"]
        ),

        // 7 ── 二次求导（凹凸 + Jensen）
        skCase(
            id: "sk_007", weapon: .secondDerivative,
            title: "三角和的最值，凹凸性 + Jensen 一步封顶",
            source: "三角 / 不等式 · 多元最值（高考压轴）",
            standardMinutes: 11, killSeconds: 60,
            signal: "三个角的 sin 求和最值——sin 在 (0,π) 上凹，Jensen。",
            content: "在三角形 ABC 中，证明：sin A + sin B + sin C ≤ 3√3/2。",
            contentLatex: #"\triangle ABC:\ \sin A+\sin B+\sin C\le\frac{3\sqrt3}{2}"#,
            answer: "成立，当 A=B=C=π/3 时取等",
            difficulty: 0.76, tier: 5,
            formulaIds: ["sum_to_product"],
            stdSteps: [
                skStep(1, "两两和差化积", #"\sin A+\sin B=2\sin\frac{A+B}{2}\cos\frac{A-B}{2}\le2\sin\frac{A+B}{2}"#),
                skStep(2, "固定 C 放缩", #"\le 2\cos\frac C2,\ \text{再处理 }\sin C=2\sin\frac C2\cos\frac C2"#),
                skStep(3, "化单变量求最值", #"\text{令 }t=\sin\frac C2,\ \text{求三次函数最大值（繁）}"#),
                skStep(4, "结论", #"\Rightarrow\le\frac{3\sqrt3}{2}"#)
            ],
            killSteps: [
                skStep(1, "二次求导判凹凸", #"f(x)=\sin x,\ f''(x)=-\sin x<0\ (x\in(0,\pi))\Rightarrow f\ \text{上凹(concave)}"#),
                skStep(2, "Jensen 不等式", #"\frac{\sin A+\sin B+\sin C}{3}\le\sin\frac{A+B+C}{3}=\sin\frac\pi3"#),
                skStep(3, "代入求和", #"\Rightarrow \sin A+\sin B+\sin C\le3\cdot\frac{\sqrt3}{2}=\frac{3\sqrt3}{2}"#)
            ],
            stdKey: "和差化积后被迫化成单变量三次函数求最值，步骤长。",
            killKey: "sin 的二阶导 <0 即上凹，Jensen 把三项均值压到 sin(π/3)，一步封顶。",
            mistakes: ["A+B+C=π 是 Jensen 取等的关键", "凹函数 Jensen 是 ≤，方向别反"]
        ),

        // 8 ── 定积分放缩
        skCase(
            id: "sk_008", weapon: .integralBound,
            title: "Σ1/√k 的下界，用积分把每项夹住再求和",
            source: "数列 · 和式估计（高考压轴）",
            standardMinutes: 10, killSeconds: 60,
            signal: "Σ1/√k 要证 > 连续表达式——定积分放缩。",
            content: "证明：对任意正整数 n，1/√1 + 1/√2 + … + 1/√n > 2(√(n+1) − 1)。",
            contentLatex: #"\sum_{k=1}^{n}\frac1{\sqrt k}>2\big(\sqrt{n+1}-1\big)"#,
            answer: "成立",
            difficulty: 0.74, tier: 5,
            formulaIds: ["fundamental_theorem", "int_power"],
            stdSteps: [
                skStep(1, "数学归纳：奠基", #"n=1:\ 1>2(\sqrt2-1)\approx0.828\ \checkmark"#),
                skStep(2, "归纳假设 + 递推", #"\text{需证 }\tfrac1{\sqrt{n+1}}>2(\sqrt{n+2}-\sqrt{n+1})"#),
                skStep(3, "有理化验证", #"2(\sqrt{n+2}-\sqrt{n+1})=\frac{2}{\sqrt{n+2}+\sqrt{n+1}}<\frac{2}{2\sqrt{n+1}}=\tfrac1{\sqrt{n+1}}\ \checkmark"#)
            ],
            killSteps: [
                skStep(1, "1/√x 递减 → 积分夹住每项", #"\frac1{\sqrt k}>\int_{k}^{k+1}\frac{dx}{\sqrt x}\quad(\tfrac1{\sqrt x}\downarrow)"#),
                skStep(2, "算出该积分", #"\int_{k}^{k+1}\frac{dx}{\sqrt x}=\big[2\sqrt x\big]_{k}^{k+1}=2\big(\sqrt{k+1}-\sqrt k\big)"#),
                skStep(3, "裂项求和", #"\sum_{k=1}^{n}\frac1{\sqrt k}>2\sum_{k=1}^{n}\big(\sqrt{k+1}-\sqrt k\big)=2\big(\sqrt{n+1}-1\big)"#)
            ],
            stdKey: "归纳法需要把递推步有理化验证，技巧性强。",
            killKey: "把每项 1/√k 用定积分从下方夹住，求和后望远镜式抵消，直接得 2(√(n+1)−1)。",
            mistakes: ["1/√x 递减时 1/√k > ∫ₖ^{k+1}，方向别反", "求和望远镜后下界是 √1=1"]
        ),

        // 9 ── 洛必达：比值型未定式
        skCase(
            id: "sk_009", weapon: .lopital,
            title: "(tanx−x)/(x−sinx)，洛必达两刀变 2sec³x",
            source: "极限 · 比值型 0/0（压轴选填）",
            standardMinutes: 7, killSeconds: 40,
            signal: "两个三次无穷小相比，凑不出重要极限——洛必达。",
            content: "求极限 lim(x→0) (tan x − x)/(x − sin x)。",
            contentLatex: #"\lim_{x\to0}\frac{\tan x-x}{x-\sin x}=?"#,
            answer: "2",
            difficulty: 0.70, tier: 4,
            formulaIds: ["lopital_rule", "taylor_series"],
            stdSteps: [
                skStep(1, "中学需双泰勒", #"\tan x=x+\tfrac{x^{3}}{3}+o,\quad x-\sin x=\tfrac{x^{3}}{6}+o"#),
                skStep(2, "比值", #"\frac{x^{3}/3}{x^{3}/6}=2"#)
            ],
            killSteps: [
                skStep(1, "洛必达第一刀", #"\frac{\tan x-x}{x-\sin x}\xrightarrow{0/0}\frac{\sec^{2}x-1}{1-\cos x}"#),
                skStep(2, "第二刀", #"\xrightarrow{0/0}\frac{2\sec^{2}x\tan x}{\sin x}=\frac{2\sec^{2}x}{\cos x}=2\sec^{3}x"#),
                skStep(3, "代入", #"\to 2\sec^{3}0=2"#)
            ],
            stdKey: "纯高中要同时记 tan、sin 的三阶泰勒。",
            killKey: "两次洛必达后整理成 2sec³x，代 0 即 2，无需记忆展开式。",
            mistakes: ["每步都要核对仍为 0/0 型", "sec²x−1=tan²x 别漏"]
        ),

        // 10 ── 泰勒：幂指型极限
        skCase(
            id: "sk_010", weapon: .taylor,
            title: "((1+x)^(1/x)−e)/x，取对数泰勒一步得 −e/2",
            source: "极限 · 幂指型（压轴选填）",
            standardMinutes: 9, killSeconds: 55,
            signal: "出现 (1+x)^(1/x) 这种 1^∞ 结构——先取对数再泰勒。",
            content: "求极限 lim(x→0) ((1+x)^(1/x) − e) / x。",
            contentLatex: #"\lim_{x\to0}\frac{(1+x)^{1/x}-e}{x}=?"#,
            answer: "−e/2",
            difficulty: 0.82, tier: 5,
            formulaIds: ["taylor_series"],
            stdSteps: [
                skStep(1, "硬洛必达极繁", #"\text{需对 }(1+x)^{1/x}\text{ 求导，含 }\ln(1+x)/x\text{ 的复合，易错}"#)
            ],
            killSteps: [
                skStep(1, "取对数再泰勒", #"\ln(1+x)^{1/x}=\frac{\ln(1+x)}{x}=1-\frac x2+\frac{x^{2}}{3}-\cdots"#),
                skStep(2, "还原指数", #"(1+x)^{1/x}=e^{\,1-\frac x2+o(x)}=e\Big(1-\frac x2+o(x)\Big)"#),
                skStep(3, "作差求极限", #"\frac{(1+x)^{1/x}-e}{x}=\frac{-\tfrac e2 x+o(x)}{x}\to-\frac e2"#)
            ],
            stdKey: "直接洛必达要对幂指函数求导，计算链很长。",
            killKey: "先把底数对数 ln(1+x)/x 泰勒成 1−x/2+…，再 e^(…) 展开，一次得 −e/2。",
            mistakes: ["ln(1+x)/x 的常数项是 1，别漏", "e^(1−x/2)=e·e^(−x/2) 要再展一阶"]
        ),

        // 11 ── 洛必达：无穷远未定式
        skCase(
            id: "sk_011", weapon: .lopital,
            title: "x(π/2−arctanx) 当 x→∞，洛必达一步得 1",
            source: "极限 · ∞·0 型（压轴选填）",
            standardMinutes: 7, killSeconds: 45,
            signal: "x→∞ 的 ∞·0 型——化成 0/0 再洛必达。",
            content: "求极限 lim(x→+∞) x·(π/2 − arctan x)。",
            contentLatex: #"\lim_{x\to+\infty}x\Big(\frac\pi2-\arctan x\Big)=?"#,
            answer: "1",
            difficulty: 0.72, tier: 4,
            formulaIds: ["lopital_rule"],
            stdSteps: [
                skStep(1, "估计 arctan 余量（繁）", #"\frac\pi2-\arctan x=\arctan\frac1x\approx\frac1x-\frac1{3x^{3}}"#),
                skStep(2, "相乘", #"x\Big(\frac1x-\frac1{3x^{3}}\Big)=1-\frac1{3x^{2}}\to1"#)
            ],
            killSteps: [
                skStep(1, "化 0/0 型", #"x\Big(\frac\pi2-\arctan x\Big)=\frac{\frac\pi2-\arctan x}{1/x}\quad(0/0)"#),
                skStep(2, "洛必达", #"\xrightarrow{\text{洛}}\frac{-\frac1{1+x^{2}}}{-\frac1{x^{2}}}=\frac{x^{2}}{1+x^{2}}"#),
                skStep(3, "取极限", #"\to1"#)
            ],
            stdKey: "中学要把 π/2−arctanx 转成 arctan(1/x) 再级数估计。",
            killKey: "∞·0 改写成 (π/2−arctanx)/(1/x) 的 0/0，洛必达一步化为 x²/(1+x²)→1。",
            mistakes: ["∞·0 必须先化成 0/0 或 ∞/∞ 才能洛必达", "求导别漏负号"]
        ),

        // 12 ── 泰勒：连乘余弦
        skCase(
            id: "sk_012", weapon: .taylor,
            title: "(1−cosx·cos2x·cos3x)/x²，泰勒读出 1+4+9 的一半",
            source: "极限 · 连乘三角（压轴选填）",
            standardMinutes: 9, killSeconds: 50,
            signal: "多个余弦连乘的 0/0——每个 cos(kx) 展到二阶即可。",
            content: "求极限 lim(x→0) (1 − cos x · cos 2x · cos 3x)/x²。",
            contentLatex: #"\lim_{x\to0}\frac{1-\cos x\cos 2x\cos 3x}{x^{2}}=?"#,
            answer: "7",
            difficulty: 0.78, tier: 5,
            formulaIds: ["taylor_series"],
            stdSteps: [
                skStep(1, "和差化积逐步合并（繁）", #"\text{反复积化和差，三因子展开冗长}"#)
            ],
            killSteps: [
                skStep(1, "各 cos 展到二阶", #"\cos kx=1-\tfrac{(kx)^{2}}{2}+o(x^{2})"#),
                skStep(2, "连乘只留二次项", #"\prod_{k=1}^{3}\cos kx=1-\frac{(1^{2}+2^{2}+3^{2})}{2}x^{2}+o(x^{2})=1-7x^{2}+o(x^{2})"#),
                skStep(3, "作差求值", #"\frac{1-(1-7x^{2})}{x^{2}}\to 7"#)
            ],
            stdKey: "硬展三因子乘积或反复积化和差，过程冗长易错。",
            killKey: "每个 cos(kx) 取 1−(kx)²/2，乘积二次项系数为 −(1+4+9)/2，直接得 7。",
            mistakes: ["连乘时只需保留到 x² 项，高阶丢弃", "系数是 Σk²/2=14/2=7"]
        ),

        // 13 ── 泰勒：e^x·sinx 型
        skCase(
            id: "sk_013", weapon: .taylor,
            title: "(eˣsinx − x(1+x))/x³，泰勒乘开只剩三次项",
            source: "极限 · 混合超越（压轴选填）",
            standardMinutes: 9, killSeconds: 55,
            signal: "分母 x³、含 eˣsinx——两个泰勒相乘到三阶。",
            content: "求极限 lim(x→0) (eˣ·sin x − x(1+x)) / x³。",
            contentLatex: #"\lim_{x\to0}\frac{e^{x}\sin x-x(1+x)}{x^{3}}=?"#,
            answer: "1/3",
            difficulty: 0.80, tier: 5,
            formulaIds: ["taylor_series", "lopital_rule"],
            stdSteps: [
                skStep(1, "洛必达需三次", #"\text{分母 }x^{3}\Rightarrow\text{三次求导，乘积求导项数爆炸}"#)
            ],
            killSteps: [
                skStep(1, "两因子展到三阶", #"e^{x}=1+x+\tfrac{x^{2}}2+\tfrac{x^{3}}6,\ \ \sin x=x-\tfrac{x^{3}}6"#),
                skStep(2, "相乘保留到 x³", #"e^{x}\sin x=x+x^{2}+\Big(\tfrac12-\tfrac16\Big)x^{3}+o=x+x^{2}+\tfrac{x^{3}}3+o"#),
                skStep(3, "作差求值", #"\frac{(x+x^{2}+\tfrac{x^{3}}3)-(x+x^{2})}{x^{3}}\to\frac13"#)
            ],
            stdKey: "洛必达对 eˣsinx 连续三次求导，乘积法则使项数迅速膨胀。",
            killKey: "eˣ、sinx 各展到三阶相乘，一二次项与 x(1+x) 抵消，三次项系数 1/2−1/6=1/3。",
            mistakes: ["相乘时收集 x³ 项要齐全", "x(1+x)=x+x² 恰好消去低次"]
        ),

        // 14 ── 二次求导（凹）+ Jensen：根式和最值
        skCase(
            id: "sk_014", weapon: .secondDerivative,
            title: "a+b+c=3 时 √a+√b+√c 的最大值，凹函数 Jensen 封顶",
            source: "不等式 · 多元最值（压轴）",
            standardMinutes: 8, killSeconds: 50,
            signal: "约束和为定值、求根式之和最值——√ 上凹，Jensen。",
            content: "已知 a, b, c > 0 且 a + b + c = 3，求 √a + √b + √c 的最大值。",
            contentLatex: #"a,b,c>0,\ a+b+c=3,\ \sqrt a+\sqrt b+\sqrt c\ \text{的最大值}=?"#,
            answer: "最大值 3（a=b=c=1 时取得）",
            difficulty: 0.72, tier: 4,
            formulaIds: ["deriv_power"],
            stdSteps: [
                skStep(1, "柯西不等式", #"(\sqrt a+\sqrt b+\sqrt c)^{2}\le 3(a+b+c)=9"#),
                skStep(2, "开方", #"\Rightarrow \sqrt a+\sqrt b+\sqrt c\le 3"#)
            ],
            killSteps: [
                skStep(1, "二次求导判凹", #"f(x)=\sqrt x,\ f''(x)=-\tfrac14 x^{-3/2}<0\Rightarrow f\ \text{上凹}"#),
                skStep(2, "Jensen", #"\frac{\sqrt a+\sqrt b+\sqrt c}{3}\le\sqrt{\frac{a+b+c}{3}}=\sqrt1=1"#),
                skStep(3, "结论", #"\Rightarrow \sqrt a+\sqrt b+\sqrt c\le 3,\ \text{等号 }a=b=c=1"#)
            ],
            stdKey: "柯西虽快，但要凑出 (Σ√)²≤3Σ 的结构。",
            killKey: "√ 的二阶导 <0 即上凹，Jensen 把均值压到 √(均值)=1，三倍即上界 3。",
            mistakes: ["凹函数 Jensen 是 ≤", "取等条件是三者相等"]
        ),

        // 15 ── 二次求导（凸）+ Jensen：锐角三角
        skCase(
            id: "sk_015", weapon: .secondDerivative,
            title: "锐角三角形 tanA+tanB+tanC≥3√3，凸函数 Jensen 托底",
            source: "三角 · 多元最值（压轴）",
            standardMinutes: 10, killSeconds: 55,
            signal: "锐角三角形三个 tan 求和下界——tan 在 (0,π/2) 上凸，Jensen。",
            content: "在锐角三角形 ABC 中，证明：tan A + tan B + tan C ≥ 3√3。",
            contentLatex: #"\text{锐角}\triangle ABC:\ \tan A+\tan B+\tan C\ge 3\sqrt3"#,
            answer: "成立，A=B=C=π/3 取等",
            difficulty: 0.78, tier: 5,
            formulaIds: ["deriv_chain"],
            stdSteps: [
                skStep(1, "恒等式", #"A+B+C=\pi\Rightarrow \tan A+\tan B+\tan C=\tan A\tan B\tan C"#),
                skStep(2, "记 s=Σtan，由 AM-GM", #"s=\tan A\tan B\tan C\le\Big(\tfrac s3\Big)^{3}"#),
                skStep(3, "解不等式", #"s\le \tfrac{s^{3}}{27}\Rightarrow s^{2}\ge27\Rightarrow s\ge 3\sqrt3\ (s>0)"#)
            ],
            killSteps: [
                skStep(1, "二次求导判凸", #"f(x)=\tan x,\ f''(x)=2\sec^{2}x\tan x>0\ \text{在}(0,\tfrac\pi2)\Rightarrow f\ \text{下凸}"#),
                skStep(2, "Jensen", #"\frac{\tan A+\tan B+\tan C}{3}\ge\tan\frac{A+B+C}{3}=\tan\frac\pi3=\sqrt3"#),
                skStep(3, "结论", #"\Rightarrow \tan A+\tan B+\tan C\ge 3\sqrt3"#)
            ],
            stdKey: "需先证 tanA+tanB+tanC=tanAtanBtanC 恒等式，再 AM-GM 反解。",
            killKey: "tan 在 (0,π/2) 二阶导 >0 即下凸，Jensen 把均值托到 tan(π/3)=√3，三倍得下界。",
            mistakes: ["必须是锐角三角形才能保证三角都在 (0,π/2) 凸区间", "凸函数 Jensen 是 ≥"]
        ),

        // 16 ── 极值点偏移（对数平均）：积的下界
        skCase(
            id: "sk_016", weapon: .extremumOffset,
            title: "(lnx)/x 双解之积 x₁x₂>e²，化归对数平均",
            source: "导数 · 极值点偏移（全国卷经典压轴）",
            standardMinutes: 13, killSeconds: 75,
            signal: "(lnx)/x 取相同值的两点，证其积——换元化成对数平均。",
            content: "设 f(x) = (ln x)/x。若 f(x₁) = f(x₂) 且 x₁ ≠ x₂，证明 x₁·x₂ > e²。",
            contentLatex: #"f(x)=\frac{\ln x}{x},\ f(x_1)=f(x_2),\ x_1\ne x_2\Rightarrow x_1x_2>e^{2}"#,
            answer: "成立（极大值点 x=e，两交点之积 >e²）",
            difficulty: 0.84, tier: 5,
            formulaIds: ["lagrange_mean", "deriv_log"],
            stdSteps: [
                skStep(1, "设 1<x₁<e<x₂，构造", #"F(x)=f(x)-f\Big(\tfrac{e^{2}}{x}\Big),\ \text{证单调与符号（繁）}"#),
                skStep(2, "比较得偏移", #"\Rightarrow f(x_2)\ \text{与}\ f(e^{2}/x_1)\ \text{比较，结合单调性}"#),
                skStep(3, "结论", #"\Rightarrow x_1x_2>e^{2}"#)
            ],
            killSteps: [
                skStep(1, "换元 s=lnx₁, t=lnx₂", #"\frac{\ln x_1}{x_1}=\frac{\ln x_2}{x_2}\Rightarrow s\,e^{-s}=t\,e^{-t}"#),
                skStep(2, "再取对数", #"\ln s-s=\ln t-t\Rightarrow\frac{t-s}{\ln t-\ln s}=1"#),
                skStep(3, "对数平均不等式", #"1=\frac{t-s}{\ln t-\ln s}<\frac{s+t}{2}\Rightarrow s+t>2"#),
                skStep(4, "还原", #"\ln x_1+\ln x_2>2\Rightarrow x_1x_2>e^{2}"#)
            ],
            stdKey: "极值点偏移构造 F(x)=f(x)−f(e²/x) 并证单调，步骤繁、放缩难。",
            killKey: "令 s=lnx₁,t=lnx₂ 后条件化成 se⁻ˢ=te⁻ᵗ，再用对数平均把 s+t 一步夹到 >2。",
            mistakes: ["两交点都 >1，保证 s,t>0", "对数平均不等式大题需先证"]
        ),

        // 17 ── 极值点偏移（对数平均）：和的下界
        skCase(
            id: "sk_017", weapon: .extremumOffset,
            title: "lnx=ax 双零点之和 x₁+x₂>2/a，对数平均一击",
            source: "导数 · 零点与参数（压轴）",
            standardMinutes: 12, killSeconds: 70,
            signal: "方程 lnx=ax 两根求和的下界——对数平均直击。",
            content: "已知函数 f(x) = ln x − a x（a>0）有两个零点 x₁ < x₂，证明 x₁ + x₂ > 2/a。",
            contentLatex: #"f(x)=\ln x-ax\ (a>0)\ \text{有两零点}\ x_1<x_2\Rightarrow x_1+x_2>\frac2a"#,
            answer: "成立",
            difficulty: 0.82, tier: 5,
            formulaIds: ["lagrange_mean", "deriv_log"],
            stdSteps: [
                skStep(1, "构造对称差函数", #"\text{设 }g(x)=f\Big(\tfrac2{a}-x\Big)\ \text{与}\ f(x)\ \text{比较，证偏移（繁）}"#),
                skStep(2, "单调性推断", #"\Rightarrow x_1>\tfrac2a-x_2"#),
                skStep(3, "结论", #"\Rightarrow x_1+x_2>\tfrac2a"#)
            ],
            killSteps: [
                skStep(1, "两零点方程", #"\ln x_1=ax_1,\ \ln x_2=ax_2"#),
                skStep(2, "相减得 a", #"\ln x_2-\ln x_1=a(x_2-x_1)\Rightarrow a=\frac{\ln x_2-\ln x_1}{x_2-x_1}"#),
                skStep(3, "对数平均不等式", #"\frac{x_2-x_1}{\ln x_2-\ln x_1}<\frac{x_1+x_2}{2}\Rightarrow\frac1a<\frac{x_1+x_2}{2}"#),
                skStep(4, "结论", #"\Rightarrow x_1+x_2>\frac2a"#)
            ],
            stdKey: "极值点偏移需构造 f(2/a−x) 比较单调，过程长。",
            killKey: "两零点相减直接解出 a=(lnx₂−lnx₁)/(x₂−x₁)，对数平均上界即给出 x₁+x₂>2/a。",
            mistakes: ["对数平均不等式大题需先证明", "a=差商这一步是关键桥梁"]
        ),

        // 18 ── 切线放缩：经典极限不等式
        skCase(
            id: "sk_018", weapon: .tangentLine,
            title: "(1+1/n)ⁿ<e，切线不等式一行搞定",
            source: "数列 · 与 e 的比较（压轴）",
            standardMinutes: 7, killSeconds: 40,
            signal: "要比较 (1+1/n)ⁿ 与 e——取对数后套 ln(1+x)<x。",
            content: "证明：对任意正整数 n，(1 + 1/n)ⁿ < e。",
            contentLatex: #"\Big(1+\frac1n\Big)^{n}<e\quad(n\in\mathbb N^{*})"#,
            answer: "成立",
            difficulty: 0.70, tier: 4,
            formulaIds: ["deriv_log"],
            stdSteps: [
                skStep(1, "二项式展开", #"\Big(1+\tfrac1n\Big)^{n}=\sum_{k=0}^{n}\binom nk\frac1{n^{k}}"#),
                skStep(2, "逐项放缩", #"\binom nk\frac1{n^{k}}=\frac1{k!}\prod_{j=1}^{k-1}\Big(1-\tfrac jn\Big)<\frac1{k!}"#),
                skStep(3, "求和", #"<\sum_{k=0}^{n}\frac1{k!}<\sum_{k=0}^{\infty}\frac1{k!}=e"#)
            ],
            killSteps: [
                skStep(1, "取对数", #"\ln\Big(1+\tfrac1n\Big)^{n}=n\ln\Big(1+\tfrac1n\Big)"#),
                skStep(2, "切线不等式", #"\ln(1+x)<x\ (x>0)\Rightarrow \ln\Big(1+\tfrac1n\Big)<\tfrac1n"#),
                skStep(3, "结论", #"\Rightarrow n\ln\Big(1+\tfrac1n\Big)<1\Rightarrow\Big(1+\tfrac1n\Big)^{n}<e"#)
            ],
            stdKey: "二项式展开后逐项与 1/k! 比较再求和，步骤多。",
            killKey: "取对数后用切线不等式 ln(1+1/n)<1/n，乘 n 得 <1，指数还原即 <e。",
            mistakes: ["取对数方向不变（指数函数单调增）", "ln(1+x)<x 仅对 x>0"]
        ),

        // 19 ── 切线放缩：调和级数上界
        skCase(
            id: "sk_019", weapon: .tangentLine,
            title: "调和和 < 1+ln n，下切线 ln(1+x)>x/(1+x) 收口",
            source: "数列 · 调和级数估计（压轴）",
            standardMinutes: 9, killSeconds: 55,
            signal: "要给 Σ1/k 一个 ln 上界——用下切线 ln(1+x)>x/(1+x)。",
            content: "证明：对任意正整数 n，1 + 1/2 + … + 1/n < 1 + ln n。",
            contentLatex: #"\sum_{k=1}^{n}\frac1k<1+\ln n\quad(n\ge1)"#,
            answer: "成立",
            difficulty: 0.74, tier: 5,
            formulaIds: ["deriv_log"],
            stdSteps: [
                skStep(1, "数学归纳/积分", #"\text{需对每步比较 }\tfrac1k\ \text{与}\ \ln k-\ln(k-1)"#),
                skStep(2, "归纳验证", #"\text{逐步累加，过程繁琐}"#)
            ],
            killSteps: [
                skStep(1, "下切线不等式", #"\ln(1+x)>\frac{x}{1+x}\ (x>0)\ \ [\,g'(x)=\tfrac{x}{(1+x)^2}>0\,]"#),
                skStep(2, "取 x=1/(k−1)，k≥2", #"\ln\frac{k}{k-1}=\ln\Big(1+\tfrac1{k-1}\Big)>\frac{1}{k}"#),
                skStep(3, "求和裂项", #"\sum_{k=2}^{n}\frac1k<\sum_{k=2}^{n}\big(\ln k-\ln(k-1)\big)=\ln n"#),
                skStep(4, "补回首项", #"1+\sum_{k=2}^{n}\frac1k<1+\ln n"#)
            ],
            stdKey: "归纳法需逐项验证 1/k<ln(k/(k−1))，繁琐。",
            killKey: "用下切线 ln(1+x)>x/(1+x) 反向放缩出 1/k<ln k−ln(k−1)，裂项求和得上界。",
            mistakes: ["这里用的是『下切线』ln(1+x)>x/(1+x)，方向与上界 ln(1+x)<x 相反", "首项 1 单独留出"]
        ),

        // 20 ── 拉格朗日中值：反正切双边
        skCase(
            id: "sk_020", weapon: .lagrange,
            title: "arctanb−arctana 夹在两式间，中值定理一夹即得",
            source: "导数 · 反三角不等式（压轴）",
            standardMinutes: 9, killSeconds: 50,
            signal: "出现 arctanb−arctana 的差要双边夹——拉格朗日。",
            content: "设 0 < a < b，证明：(b−a)/(1+b²) < arctan b − arctan a < (b−a)/(1+a²)。",
            contentLatex: #"0<a<b\Rightarrow\frac{b-a}{1+b^{2}}<\arctan b-\arctan a<\frac{b-a}{1+a^{2}}"#,
            answer: "成立",
            difficulty: 0.74, tier: 4,
            formulaIds: ["lagrange_mean"],
            stdSteps: [
                skStep(1, "左边构造函数", #"\varphi(x)=\arctan x-\arctan a-\frac{x-a}{1+x^{2}}\ \text{证 }\varphi(b)>0"#),
                skStep(2, "右边另构造", #"\psi(x)=\frac{x-a}{1+a^{2}}-(\arctan x-\arctan a)\ \text{证 }\psi(b)>0"#),
                skStep(3, "合并", #"\Rightarrow\text{双边成立}"#)
            ],
            killSteps: [
                skStep(1, "对 arctan 用中值定理", #"\arctan b-\arctan a=\frac{1}{1+\xi^{2}}(b-a),\ \xi\in(a,b)"#),
                skStep(2, "夹 1/(1+ξ²)", #"a<\xi<b\Rightarrow\frac1{1+b^{2}}<\frac1{1+\xi^{2}}<\frac1{1+a^{2}}"#),
                skStep(3, "乘正数 (b−a)", #"\Rightarrow\frac{b-a}{1+b^{2}}<\arctan b-\arctan a<\frac{b-a}{1+a^{2}}"#)
            ],
            stdKey: "要分别构造两个辅助函数各证一侧。",
            killKey: "(arctan)'=1/(1+x²)，中值定理一步写成 (b−a)/(1+ξ²)，再用 ξ∈(a,b) 双边夹。",
            mistakes: ["1/(1+x²) 随 x 增大而减小，夹的方向要对", "乘 (b−a)>0 不变号"]
        ),

        // 21 ── 拉格朗日中值：正弦差双边
        skCase(
            id: "sk_021", weapon: .lagrange,
            title: "siny−sinx 夹在 (y−x)cosy 与 (y−x)cosx 之间",
            source: "导数 · 三角不等式（压轴）",
            standardMinutes: 9, killSeconds: 50,
            signal: "sin 之差要被 cos 端点夹住——拉格朗日 + cos 单调。",
            content: "设 0 < x < y < π/2，证明：(y−x)cos y < sin y − sin x < (y−x)cos x。",
            contentLatex: #"0<x<y<\tfrac\pi2\Rightarrow(y-x)\cos y<\sin y-\sin x<(y-x)\cos x"#,
            answer: "成立",
            difficulty: 0.74, tier: 4,
            formulaIds: ["lagrange_mean"],
            stdSteps: [
                skStep(1, "和差化积", #"\sin y-\sin x=2\cos\frac{x+y}{2}\sin\frac{y-x}{2}"#),
                skStep(2, "双边放缩 sin 与 cos（繁）", #"\text{需分别用 }\sin t<t,\ \sin t>\tfrac{2}{\pi}t\ \text{等估计}"#)
            ],
            killSteps: [
                skStep(1, "对 sin 用中值定理", #"\sin y-\sin x=\cos\xi\,(y-x),\ \xi\in(x,y)"#),
                skStep(2, "cos 在 (0,π/2) 递减", #"x<\xi<y\Rightarrow \cos y<\cos\xi<\cos x"#),
                skStep(3, "乘正数 (y−x)", #"\Rightarrow(y-x)\cos y<\sin y-\sin x<(y-x)\cos x"#)
            ],
            stdKey: "和差化积后还要对 sin、cos 分别精细放缩。",
            killKey: "中值定理把 siny−sinx 写成 cosξ·(y−x)，cos 在 (0,π/2) 递减直接给双边。",
            mistakes: ["cos 在 (0,π/2) 递减，故 cosy<cosξ<cosx", "区间端点严格不取等"]
        ),

        // 22 ── 定积分放缩：调和级数上界
        skCase(
            id: "sk_022", weapon: .integralBound,
            title: "1/2+…+1/n < ln n，用 1/x 的积分压住每项",
            source: "数列 · 和式估计（压轴）",
            standardMinutes: 8, killSeconds: 50,
            signal: "要给去掉首项的调和和一个 ln 上界——1/x 积分放缩。",
            content: "证明：对 n ≥ 2，1/2 + 1/3 + … + 1/n < ln n。",
            contentLatex: #"\sum_{k=2}^{n}\frac1k<\ln n\quad(n\ge2)"#,
            answer: "成立",
            difficulty: 0.72, tier: 4,
            formulaIds: ["fundamental_theorem", "int_log"],
            stdSteps: [
                skStep(1, "数学归纳", #"n=2:\ \tfrac12<\ln2\approx0.693\ \checkmark"#),
                skStep(2, "递推需再证", #"\text{需 }\tfrac1{n+1}<\ln(n+1)-\ln n=\ln\big(1+\tfrac1n\big)\ (\text{切线不等式})"#)
            ],
            killSteps: [
                skStep(1, "1/x 递减→上方夹每项", #"\frac1k<\int_{k-1}^{k}\frac{dx}{x}\quad(\tfrac1x\downarrow)"#),
                skStep(2, "算积分", #"\int_{k-1}^{k}\frac{dx}{x}=\ln k-\ln(k-1)"#),
                skStep(3, "裂项求和", #"\sum_{k=2}^{n}\frac1k<\sum_{k=2}^{n}\big(\ln k-\ln(k-1)\big)=\ln n"#)
            ],
            stdKey: "归纳法递推步仍要用到切线不等式 ln(1+1/n)>1/(n+1)。",
            killKey: "1/x 递减，1/k 比左邻积分 ∫_{k−1}^k 小，求和望远镜抵消得 ln n。",
            mistakes: ["1/x 递减时 1/k<∫_{k−1}^k，下标方向别反", "从 k=2 起求和，结果是 ln n"]
        ),

        // 23 ── 定积分放缩：根号和上界
        skCase(
            id: "sk_023", weapon: .integralBound,
            title: "√1+…+√n < (2/3)(n+1)^{3/2}，√x 积分托住每项",
            source: "数列 · 幂和估计（压轴）",
            standardMinutes: 9, killSeconds: 55,
            signal: "Σ√k 要一个连续上界——√x 递增用右邻积分夹。",
            content: "证明：对任意正整数 n，√1 + √2 + … + √n < (2/3)·(n+1)^(3/2)。",
            contentLatex: #"\sum_{k=1}^{n}\sqrt k<\frac23(n+1)^{3/2}"#,
            answer: "成立（更精确 < (2/3)[(n+1)^{3/2}−1]）",
            difficulty: 0.74, tier: 5,
            formulaIds: ["fundamental_theorem", "int_power"],
            stdSteps: [
                skStep(1, "数学归纳", #"\text{n=1: }1<\tfrac23\cdot2^{3/2}\approx1.886\ \checkmark"#),
                skStep(2, "递推需有理化验证", #"\text{需 }\sqrt{n+1}<\tfrac23\big[(n+2)^{3/2}-(n+1)^{3/2}\big]\ (\text{繁})"#)
            ],
            killSteps: [
                skStep(1, "√x 递增→右邻积分托住", #"\sqrt k<\int_{k}^{k+1}\sqrt x\,dx\quad(\sqrt x\uparrow)"#),
                skStep(2, "算积分", #"\int_{k}^{k+1}\sqrt x\,dx=\frac23\big[(k+1)^{3/2}-k^{3/2}\big]"#),
                skStep(3, "裂项求和", #"\sum_{k=1}^{n}\sqrt k<\frac23\big[(n+1)^{3/2}-1\big]<\frac23(n+1)^{3/2}"#)
            ],
            stdKey: "归纳法递推步要对幂式有理化估计，技巧性强。",
            killKey: "√x 递增，√k 比右邻积分小，望远镜求和得 (2/3)[(n+1)^{3/2}−1]。",
            mistakes: ["√x 递增时 √k<∫_k^{k+1}，方向别反", "∫√x=(2/3)x^{3/2}"]
        ),

        // 24 ── 定积分放缩：阶乘对数下界（斯特林味）
        skCase(
            id: "sk_024", weapon: .integralBound,
            title: "ln(n!) > n ln n − n + 1，lnx 积分托底",
            source: "数列 · 阶乘估计（压轴，斯特林雏形）",
            standardMinutes: 11, killSeconds: 60,
            signal: "要给 ln(n!)=Σln k 一个封闭下界——lnx 积分放缩。",
            content: "证明：对 n ≥ 2，ln(n!) > n·ln n − n + 1。",
            contentLatex: #"\ln(n!)>n\ln n-n+1\quad(n\ge2)"#,
            answer: "成立",
            difficulty: 0.80, tier: 5,
            formulaIds: ["fundamental_theorem", "int_log"],
            stdSteps: [
                skStep(1, "数学归纳", #"n=2:\ \ln2\approx0.693>2\ln2-1\approx0.386\ \checkmark"#),
                skStep(2, "递推需估计", #"\text{需 }\ln(n+1)>(n+1)\ln(n+1)-n\ln n-1\ (\text{繁})"#)
            ],
            killSteps: [
                skStep(1, "lnx 递增→右值高于积分", #"\ln k>\int_{k-1}^{k}\ln x\,dx\quad(\ln x\uparrow)"#),
                skStep(2, "求和接力", #"\ln(n!)=\sum_{k=2}^{n}\ln k>\int_{1}^{n}\ln x\,dx"#),
                skStep(3, "算定积分", #"\int_{1}^{n}\ln x\,dx=\big[x\ln x-x\big]_{1}^{n}=n\ln n-n+1"#)
            ],
            stdKey: "归纳法递推步对数估计繁琐。",
            killKey: "lnx 递增，每项 ln k 大于左邻积分，求和接成 ∫₁ⁿlnx dx=n ln n−n+1。",
            mistakes: ["lnx 递增时 ln k>∫_{k−1}^k", "∫lnx dx=x lnx−x，别漏 +1"]
        ),

        // 25 ── 拉格朗日乘数法：和定求平方和最小
        skCase(
            id: "sk_025", weapon: .lagrangeMultiplier,
            title: "x+2y+3z=6 下 x²+y²+z² 的最小值，梯度平行一步定",
            source: "多元最值 · 线性约束（压轴）",
            standardMinutes: 8, killSeconds: 50,
            signal: "线性约束下求平方和最小——梯度平行 ∇f=λ∇g。",
            content: "已知实数 x, y, z 满足 x + 2y + 3z = 6，求 x² + y² + z² 的最小值。",
            contentLatex: #"x+2y+3z=6,\ \ (x^{2}+y^{2}+z^{2})_{\min}=?"#,
            answer: "18/7",
            difficulty: 0.74, tier: 4,
            formulaIds: ["vector_dot"],
            stdSteps: [
                skStep(1, "柯西不等式", #"(x+2y+3z)^{2}\le(1^{2}+2^{2}+3^{2})(x^{2}+y^{2}+z^{2})"#),
                skStep(2, "代入约束", #"36\le 14(x^{2}+y^{2}+z^{2})\Rightarrow x^{2}+y^{2}+z^{2}\ge\frac{18}{7}"#)
            ],
            killSteps: [
                skStep(1, "梯度平行", #"\nabla(x^{2}+y^{2}+z^{2})=\lambda\nabla(x+2y+3z)\Rightarrow(2x,2y,2z)=\lambda(1,2,3)"#),
                skStep(2, "解出比例", #"x=\tfrac\lambda2,\ y=\lambda,\ z=\tfrac{3\lambda}2"#),
                skStep(3, "代回约束求 λ", #"\tfrac\lambda2+2\lambda+\tfrac{9\lambda}2=7\lambda=6\Rightarrow\lambda=\tfrac67"#),
                skStep(4, "算最小值", #"x^{2}+y^{2}+z^{2}=\lambda^{2}\Big(\tfrac14+1+\tfrac94\Big)=\tfrac{36}{49}\cdot\tfrac72=\frac{18}{7}"#)
            ],
            stdKey: "柯西需凑出 (1²+2²+3²) 的配对结构，取等条件还要单独验证。",
            killKey: "∇f=λ∇g 给出 (2x,2y,2z)∝(1,2,3)，代回约束解 λ，直接算出 18/7。",
            mistakes: ["驻点 (x,y,z)∝(1,2,3) 与柯西取等条件一致", "拉氏乘数大题需改柯西书写"]
        ),

        // 26 ── 拉格朗日乘数法：椭圆内接矩形最大面积
        skCase(
            id: "sk_026", weapon: .lagrangeMultiplier,
            title: "椭圆内接矩形最大面积 2ab，乘数法直取驻点",
            source: "解析几何 · 约束最值（压轴）",
            standardMinutes: 9, killSeconds: 55,
            signal: "椭圆上一点使面积最大——∇(面积)∥∇(椭圆)。",
            content: "求椭圆 x²/a² + y²/b² = 1（a,b>0）的内接矩形（边平行坐标轴）的最大面积。",
            contentLatex: #"\frac{x^{2}}{a^{2}}+\frac{y^{2}}{b^{2}}=1,\ \text{内接矩形最大面积}=?"#,
            answer: "2ab",
            difficulty: 0.76, tier: 5,
            formulaIds: ["ellipse_eq"],
            stdSteps: [
                skStep(1, "参数化", #"x=a\cos\theta,\ y=b\sin\theta\ (\theta\in(0,\tfrac\pi2))"#),
                skStep(2, "面积函数", #"S=4xy=4ab\cos\theta\sin\theta=2ab\sin2\theta"#),
                skStep(3, "取最大", #"\sin2\theta\le1\Rightarrow S_{\max}=2ab"#)
            ],
            killSteps: [
                skStep(1, "目标与约束", #"\max S=4xy,\quad g=\frac{x^{2}}{a^{2}}+\frac{y^{2}}{b^{2}}-1=0"#),
                skStep(2, "梯度平行", #"(4y,4x)=\lambda\Big(\tfrac{2x}{a^{2}},\tfrac{2y}{b^{2}}\Big)\Rightarrow\frac{x^{2}}{a^{2}}=\frac{y^{2}}{b^{2}}"#),
                skStep(3, "结合约束", #"\Rightarrow\frac{x^{2}}{a^{2}}=\frac{y^{2}}{b^{2}}=\frac12\Rightarrow x=\tfrac{a}{\sqrt2},\ y=\tfrac{b}{\sqrt2}"#),
                skStep(4, "算面积", #"S=4xy=4\cdot\frac{ab}{2}=2ab"#)
            ],
            stdKey: "三角参数化后化为 2ab·sin2θ 求最大，需引入辅助角。",
            killKey: "∇S=λ∇g 直接逼出 x²/a²=y²/b²=1/2，对称点立得最大面积 2ab。",
            mistakes: ["矩形四个顶点，面积是 4xy 不是 xy", "驻点处 x²/a²=y²/b²=1/2"]
        ),

        // 27 ── 欧拉公式：余弦求和闭式
        skCase(
            id: "sk_027", weapon: .eulerFormula,
            title: "cosθ+cos2θ+…+cosnθ，欧拉公式化等比一步求和",
            source: "三角 · 数列求和（压轴）",
            standardMinutes: 10, killSeconds: 60,
            signal: "一串等差角的余弦求和——复指数等比数列取实部。",
            content: "求和：cos θ + cos 2θ + … + cos nθ（θ ≠ 2kπ）。",
            contentLatex: #"\sum_{k=1}^{n}\cos k\theta=?\quad(\theta\ne 2k\pi)"#,
            answer: "sin(nθ/2)·cos((n+1)θ/2) / sin(θ/2)",
            difficulty: 0.80, tier: 5,
            formulaIds: ["euler_formula", "geometric_sum"],
            stdSteps: [
                skStep(1, "乘 2sin(θ/2) 裂项", #"2\sin\tfrac\theta2\cos k\theta=\sin\big((k+\tfrac12)\theta\big)-\sin\big((k-\tfrac12)\theta\big)"#),
                skStep(2, "望远镜求和", #"2\sin\tfrac\theta2\sum_{k=1}^{n}\cos k\theta=\sin\big((n+\tfrac12)\theta\big)-\sin\tfrac\theta2"#),
                skStep(3, "整理", #"\Rightarrow\sum=\frac{\sin\frac{n\theta}{2}\cos\frac{(n+1)\theta}{2}}{\sin\frac\theta2}"#)
            ],
            killSteps: [
                skStep(1, "视为复指数实部", #"\sum_{k=1}^{n}\cos k\theta=\mathrm{Re}\sum_{k=1}^{n}e^{ik\theta}"#),
                skStep(2, "等比数列求和", #"\sum_{k=1}^{n}e^{ik\theta}=e^{i\theta}\frac{e^{in\theta}-1}{e^{i\theta}-1}=e^{i\frac{(n+1)\theta}{2}}\frac{\sin\frac{n\theta}{2}}{\sin\frac\theta2}"#),
                skStep(3, "取实部", #"\Rightarrow\sum_{k=1}^{n}\cos k\theta=\frac{\sin\frac{n\theta}{2}\cos\frac{(n+1)\theta}{2}}{\sin\frac\theta2}"#)
            ],
            stdKey: "需记住『乘 2sin(θ/2) 裂项』这一非显然技巧。",
            killKey: "Σe^{ikθ} 是等比数列，提取半角因子后取实部，闭式自然浮现。",
            mistakes: ["提因子用 e^{iα}−e^{-iα}=2i sinα", "结果分母是 sin(θ/2)"]
        ),

        // 28 ── 欧拉公式：幂次降幂线性化
        skCase(
            id: "sk_028", weapon: .eulerFormula,
            title: "cos⁵θ 拆成各次余弦，欧拉二项式一步降幂",
            source: "三角 · 降幂（积分预备，压轴）",
            standardMinutes: 9, killSeconds: 55,
            signal: "高次幂三角要线性化——(e^{iθ}+e^{-iθ})ⁿ 展开。",
            content: "将 cos⁵θ 表示为 cos θ、cos 3θ、cos 5θ 的线性组合。",
            contentLatex: #"\cos^{5}\theta=?\ (\text{用}\ \cos\theta,\cos3\theta,\cos5\theta\ \text{表示})"#,
            answer: "(1/16)(cos5θ + 5cos3θ + 10cosθ)",
            difficulty: 0.78, tier: 5,
            formulaIds: ["euler_formula", "binomial_theorem"],
            stdSteps: [
                skStep(1, "反复用倍角/积化和差", #"\cos^{2}\theta=\tfrac{1+\cos2\theta}{2},\ \text{逐层代入（繁、易错）}"#),
                skStep(2, "合并同类", #"\text{多次和差化积后整理}"#)
            ],
            killSteps: [
                skStep(1, "欧拉写法", #"\cos\theta=\frac{e^{i\theta}+e^{-i\theta}}{2}\Rightarrow\cos^{5}\theta=\frac{(e^{i\theta}+e^{-i\theta})^{5}}{2^{5}}"#),
                skStep(2, "二项式展开配对", #"(e^{i\theta}+e^{-i\theta})^{5}=2\cos5\theta+10\cos3\theta+20\cos\theta"#),
                skStep(3, "整理", #"\cos^{5}\theta=\frac{1}{16}\big(\cos5\theta+5\cos3\theta+10\cos\theta\big)"#)
            ],
            stdKey: "纯三角降幂要反复套倍角公式，层层嵌套极易出错。",
            killKey: "(e^{iθ}+e^{-iθ})⁵ 用二项式展开，对称项 e^{ikθ}+e^{-ikθ}=2cos kθ 自动配对，系数即 C(5,k)。",
            mistakes: ["配对系数来自 C(5,0)=1,C(5,1)=5,C(5,2)=10（对称翻倍）", "总除以 2⁵=32，约简后分母 16"]
        ),

        // 29 ── 特征根法：二阶线性递推
        skCase(
            id: "sk_029", weapon: .recurrence,
            title: "aₙ₊₂=5aₙ₊₁−6aₙ 的通项，特征方程秒出 2,3",
            source: "数列 · 二阶递推通项（压轴）",
            standardMinutes: 9, killSeconds: 55,
            signal: "二阶常系数线性递推求通项——写特征方程。",
            content: "数列 {aₙ} 满足 a₁=1, a₂=2, a_{n+2}=5a_{n+1}−6a_n，求通项 aₙ。",
            contentLatex: #"a_1=1,a_2=2,\ a_{n+2}=5a_{n+1}-6a_n,\ a_n=?"#,
            answer: "aₙ = 2^(n−1)",
            difficulty: 0.74, tier: 4,
            formulaIds: ["geometric_sum"],
            stdSteps: [
                skStep(1, "凑两个等比", #"a_{n+2}-2a_{n+1}=3(a_{n+1}-2a_n),\ a_{n+2}-3a_{n+1}=2(a_{n+1}-3a_n)"#),
                skStep(2, "求两组比值", #"a_{n+1}-2a_n=0\cdot3^{n-1}=0,\ a_{n+1}-3a_n=-1\cdot2^{n-1}"#),
                skStep(3, "联立解 aₙ", #"\Rightarrow a_n=2^{n-1}"#)
            ],
            killSteps: [
                skStep(1, "特征方程", #"x^{2}=5x-6\Rightarrow x^{2}-5x+6=0\Rightarrow x=2,\,3"#),
                skStep(2, "通解形式", #"a_n=A\cdot2^{n}+B\cdot3^{n}"#),
                skStep(3, "代初值定系数", #"2A+3B=1,\ 4A+9B=2\Rightarrow A=\tfrac12,\ B=0"#),
                skStep(4, "结论", #"a_n=\tfrac12\cdot2^{n}=2^{\,n-1}"#)
            ],
            stdKey: "要同时凑出两个等比数列，再联立消元，构造不直观。",
            killKey: "特征方程 x²−5x+6=0 给根 2、3，通解 A·2ⁿ+B·3ⁿ 代初值即得 2^(n−1)。",
            mistakes: ["特征根相异用 A·r₁ⁿ+B·r₂ⁿ", "B=0 说明此数列纯由根 2 主导"]
        ),

        // 30 ── 不动点：一阶分式递推（重根）
        skCase(
            id: "sk_030", weapon: .recurrence,
            title: "分式递推 aₙ₊₁=(3aₙ−4)/(aₙ−1)，不动点重根化等差",
            source: "数列 · 分式递推通项（压轴）",
            standardMinutes: 11, killSeconds: 65,
            signal: "分式递推求通项——先解不动点，重根取倒数化等差。",
            content: "数列 {aₙ} 满足 a₁=3, a_{n+1}=(3aₙ−4)/(aₙ−1)，求通项 aₙ。",
            contentLatex: #"a_1=3,\ a_{n+1}=\frac{3a_n-4}{a_n-1},\ a_n=?"#,
            answer: "aₙ = (2n+1)/n",
            difficulty: 0.82, tier: 5,
            formulaIds: [],
            stdSteps: [
                skStep(1, "迭代算前几项", #"a_1=3,\ a_2=\tfrac52,\ a_3=\tfrac73,\ a_4=\tfrac94,\dots"#),
                skStep(2, "猜想 + 归纳证明", #"\text{猜 }a_n=\tfrac{2n+1}{n},\ \text{再数学归纳验证（繁）}"#)
            ],
            killSteps: [
                skStep(1, "解不动点", #"x=\frac{3x-4}{x-1}\Rightarrow x^{2}-4x+4=0\Rightarrow x=2\ (\text{重根})"#),
                skStep(2, "重根取倒数", #"a_{n+1}-2=\frac{a_n-2}{a_n-1}\Rightarrow\frac1{a_{n+1}-2}=\frac{a_n-1}{a_n-2}=1+\frac1{a_n-2}"#),
                skStep(3, "得等差数列", #"b_n=\tfrac1{a_n-2}:\ b_{n+1}=b_n+1,\ b_1=\tfrac1{3-2}=1\Rightarrow b_n=n"#),
                skStep(4, "还原", #"a_n=2+\frac1n=\frac{2n+1}{n}"#)
            ],
            stdKey: "硬迭代只能『算几项→猜→归纳』，没有方向感。",
            killKey: "不动点 x=2 是重根，于是 1/(aₙ−2) 成等差数列，一步写出闭式 (2n+1)/n。",
            mistakes: ["不动点重根 → 取倒数化等差；相异根则取比化等比", "初值 a₁≠不动点 2，b₁ 才有意义"]
        ),

        // 31 ── 权方和：分式和最小（约束 x+y=1）
        skCase(
            id: "sk_031", weapon: .cauchyPower,
            title: "1/x+4/y（x+y=1）最小值 9，权方和一步压死",
            source: "不等式 · 分式最值（压轴）",
            standardMinutes: 6, killSeconds: 35,
            signal: "分式之和、分母和为定值——权方和 (Σa)²/Σb。",
            content: "已知 x>0, y>0 且 x+y=1，求 1/x + 4/y 的最小值。",
            contentLatex: #"x,y>0,\ x+y=1,\ \Big(\frac1x+\frac4y\Big)_{\min}=?"#,
            answer: "9",
            difficulty: 0.66, tier: 4,
            formulaIds: ["cauchy_schwarz"],
            stdSteps: [
                skStep(1, "乘 1 = x+y", #"\frac1x+\frac4y=(x+y)\Big(\frac1x+\frac4y\Big)=5+\frac yx+\frac{4x}y"#),
                skStep(2, "基本不等式", #"\frac yx+\frac{4x}y\ge2\sqrt4=4\Rightarrow\ge9"#)
            ],
            killSteps: [
                skStep(1, "权方和不等式", #"\frac1x+\frac4y=\frac{1^{2}}{x}+\frac{2^{2}}{y}\ge\frac{(1+2)^{2}}{x+y}"#),
                skStep(2, "代约束", #"=\frac{9}{1}=9\quad(\text{等号 }\tfrac1x=\tfrac2y,\ \text{即 }y=2x)"#)
            ],
            stdKey: "需要主动『乘 1=x+y』再用基本不等式，构造有门槛。",
            killKey: "权方和把 1²/x+2²/y 一步压到 (1+2)²/(x+y)=9，分母正好是约束 1。",
            mistakes: ["权方和分子要写成平方 1²、2²", "取等条件 1/x=2/y → y=2x"]
        ),

        // 32 ── 权方和：三元轮换分式
        skCase(
            id: "sk_032", weapon: .cauchyPower,
            title: "Σ a²/(a+b) 的最小值，权方和一击得 (a+b+c)/2",
            source: "不等式 · 轮换分式（压轴）",
            standardMinutes: 10, killSeconds: 50,
            signal: "轮换分式平方和、分母之和可控——权方和。",
            content: "已知 a, b, c > 0 且 a+b+c=1，求 a²/(a+b) + b²/(b+c) + c²/(c+a) 的最小值。",
            contentLatex: #"a,b,c>0,a+b+c=1,\ \Big(\frac{a^{2}}{a+b}+\frac{b^{2}}{b+c}+\frac{c^{2}}{c+a}\Big)_{\min}=?"#,
            answer: "1/2",
            difficulty: 0.80, tier: 5,
            formulaIds: ["cauchy_schwarz"],
            stdSteps: [
                skStep(1, "逐项配凑（难）", #"\frac{a^{2}}{a+b}=a-\frac{ab}{a+b},\ \text{需再处理 }\sum\frac{ab}{a+b}\ (\text{繁})"#),
                skStep(2, "放缩验证", #"\text{综合 AM-GM 估计，过程曲折}"#)
            ],
            killSteps: [
                skStep(1, "权方和", #"\sum\frac{a^{2}}{a+b}\ge\frac{(a+b+c)^{2}}{(a+b)+(b+c)+(c+a)}"#),
                skStep(2, "化简分母", #"=\frac{(a+b+c)^{2}}{2(a+b+c)}=\frac{a+b+c}{2}"#),
                skStep(3, "代约束", #"=\frac12\quad(\text{等号 }a=b=c=\tfrac13)"#)
            ],
            stdKey: "逐项裂成 a−ab/(a+b) 后还要处理 Σab/(a+b)，思路曲折。",
            killKey: "权方和把三个分式合成 (a+b+c)²/[2(a+b+c)]=(a+b+c)/2=1/2，一步到底。",
            mistakes: ["分母三项相加=2(a+b+c)", "取等 a=b=c=1/3"]
        ),

        // 33 ── 二次型·特征值：圆上二次式范围
        skCase(
            id: "sk_033", weapon: .quadraticForm,
            title: "x²+y²=1 上 x²+4xy+y² 的范围 = 特征值 [−1,3]",
            source: "解析几何/代数 · 圆上二次式（压轴）",
            standardMinutes: 8, killSeconds: 45,
            signal: "单位圆上求二次式范围——对称矩阵两个特征值即上下界。",
            content: "已知 x² + y² = 1，求 x² + 4xy + y² 的取值范围。",
            contentLatex: #"x^{2}+y^{2}=1,\ x^{2}+4xy+y^{2}\in?"#,
            answer: "[−1, 3]",
            difficulty: 0.74, tier: 4,
            formulaIds: [],
            stdSteps: [
                skStep(1, "三角换元", #"x=\cos\theta,\ y=\sin\theta"#),
                skStep(2, "化辅助角", #"\cos^{2}\theta+4\cos\theta\sin\theta+\sin^{2}\theta=1+2\sin2\theta"#),
                skStep(3, "求范围", #"\sin2\theta\in[-1,1]\Rightarrow 1+2\sin2\theta\in[-1,3]"#)
            ],
            killSteps: [
                skStep(1, "写成对称矩阵", #"x^{2}+4xy+y^{2}\leftrightarrow M=\begin{pmatrix}1&2\\2&1\end{pmatrix}"#),
                skStep(2, "特征方程", #"\lambda^{2}-(1+1)\lambda+(1\cdot1-2^{2})=0\Rightarrow\lambda^{2}-2\lambda-3=0"#),
                skStep(3, "解得范围", #"\lambda=3,\,-1\Rightarrow\text{范围}=[\lambda_{\min},\lambda_{\max}]=[-1,3]"#)
            ],
            stdKey: "三角换元后还要凑辅助角才能定上下界。",
            killKey: "二次式对应矩阵 [[1,2],[2,1]]，单位圆上的范围正是其特征值 −1 与 3。",
            mistakes: ["矩阵非对角元是 b/2=4/2=2", "范围两端就是 λ_min、λ_max"]
        ),

        // 34 ── 二次型·特征值：非对称系数
        skCase(
            id: "sk_034", weapon: .quadraticForm,
            title: "x²+y²=1 上 5x²+4xy+8y² 的最值 = 特征值 4 与 9",
            source: "代数 · 条件二次最值（压轴）",
            standardMinutes: 9, killSeconds: 50,
            signal: "系数不对称的圆上二次式最值——还是特征值。",
            content: "已知 x² + y² = 1，求 5x² + 4xy + 8y² 的最大值与最小值。",
            contentLatex: #"x^{2}+y^{2}=1,\ 5x^{2}+4xy+8y^{2}\ \text{的最值}=?"#,
            answer: "最大 9，最小 4",
            difficulty: 0.76, tier: 5,
            formulaIds: [],
            stdSteps: [
                skStep(1, "三角换元降幂", #"5\cos^{2}\theta+4\cos\theta\sin\theta+8\sin^{2}\theta=\tfrac{13}{2}-\tfrac32\cos2\theta+2\sin2\theta"#),
                skStep(2, "合成辅助角", #"=\tfrac{13}{2}+\tfrac52\sin(2\theta-\varphi),\ \ \sqrt{(\tfrac32)^{2}+2^{2}}=\tfrac52"#),
                skStep(3, "求最值", #"\Rightarrow\Big[\tfrac{13}{2}-\tfrac52,\ \tfrac{13}{2}+\tfrac52\Big]=[4,9]"#)
            ],
            killSteps: [
                skStep(1, "对称矩阵", #"M=\begin{pmatrix}5&2\\2&8\end{pmatrix}"#),
                skStep(2, "特征方程", #"\lambda^{2}-13\lambda+(40-4)=0\Rightarrow\lambda^{2}-13\lambda+36=0"#),
                skStep(3, "解根", #"\lambda=\frac{13\pm5}{2}=9,\,4\Rightarrow\max=9,\ \min=4"#)
            ],
            stdKey: "降幂后要算振幅 √((3/2)²+2²)=5/2 再合成，易算错。",
            killKey: "矩阵 [[5,2],[2,8]]：迹 13、行列式 36，特征值 9、4 即为最大最小值。",
            mistakes: ["特征方程 λ²−(迹)λ+(行列式)=0", "行列式 5·8−2²=36"]
        ),

        // 35 ── SOS 配方：对称二次不等式
        skCase(
            id: "sk_035", weapon: .sosDecomposition,
            title: "a²+b²+c²≥ab+bc+ca，配成平方和一眼非负",
            source: "不等式 · 对称二次（压轴基石）",
            standardMinutes: 6, killSeconds: 35,
            signal: "对称二次不等式右边可移项为 0——配平方和。",
            content: "证明：对任意实数 a, b, c，a² + b² + c² ≥ ab + bc + ca。",
            contentLatex: #"a^{2}+b^{2}+c^{2}\ge ab+bc+ca"#,
            answer: "成立，a=b=c 时取等",
            difficulty: 0.66, tier: 4,
            formulaIds: ["sos_inequality"],
            stdSteps: [
                skStep(1, "三式基本不等式", #"a^{2}+b^{2}\ge2ab,\ b^{2}+c^{2}\ge2bc,\ c^{2}+a^{2}\ge2ca"#),
                skStep(2, "相加除 2", #"2(a^{2}+b^{2}+c^{2})\ge2(ab+bc+ca)"#)
            ],
            killSteps: [
                skStep(1, "直接配平方和", #"a^{2}+b^{2}+c^{2}-ab-bc-ca=\tfrac12\big[(a-b)^{2}+(b-c)^{2}+(c-a)^{2}\big]"#),
                skStep(2, "非负显然", #"\ge0,\ \text{等号}\Leftrightarrow a=b=c"#)
            ],
            stdKey: "三次基本不等式相加，取等条件需另说明。",
            killKey: "恒等配成 ½[(a−b)²+(b−c)²+(c−a)²]，非负与取等条件同时读出。",
            mistakes: ["系数是 1/2，别漏", "取等当三个平方同时为 0，即 a=b=c"]
        ),

        // 36 ── SOS 配方：含 1 的非对称式
        skCase(
            id: "sk_036", weapon: .sosDecomposition,
            title: "x²+y²+1≥xy+x+y，2 倍后配三平方",
            source: "不等式 · 配方/判别式（压轴）",
            standardMinutes: 7, killSeconds: 40,
            signal: "两元二次恒成立——配平方和（或判别式）。",
            content: "证明：对任意实数 x, y，x² + y² + 1 ≥ xy + x + y。",
            contentLatex: #"x^{2}+y^{2}+1\ge xy+x+y"#,
            answer: "成立，x=y=1 时取等",
            difficulty: 0.70, tier: 4,
            formulaIds: ["sos_inequality"],
            stdSteps: [
                skStep(1, "视为 x 的二次", #"x^{2}-(y+1)x+(y^{2}-y+1)\ge0"#),
                skStep(2, "判别式", #"\Delta=(y+1)^{2}-4(y^{2}-y+1)=-3(y-1)^{2}\le0"#),
                skStep(3, "结论", #"\text{开口向上且 }\Delta\le0\Rightarrow\ge0\ \text{恒成立}"#)
            ],
            killSteps: [
                skStep(1, "乘 2 配平方", #"2(x^{2}+y^{2}+1-xy-x-y)=(x-y)^{2}+(x-1)^{2}+(y-1)^{2}"#),
                skStep(2, "非负显然", #"\ge0,\ \text{等号}\Leftrightarrow x=y=1"#)
            ],
            stdKey: "判别式法要把它当作 x 的二次再算 Δ，步骤稍绕。",
            killKey: "乘 2 后恰好配成 (x−y)²+(x−1)²+(y−1)²，非负一目了然。",
            mistakes: ["先乘 2 才能配出整系数平方", "取等需三平方同时为 0：x=y=1"]
        ),

        // 37 ── 三角换元：根式函数值域
        skCase(
            id: "sk_037", weapon: .trigSubstitution,
            title: "y=x+√(1−x²) 的值域，令 x=cosθ 一步辅助角",
            source: "函数 · 根式值域（压轴）",
            standardMinutes: 8, killSeconds: 45,
            signal: "含 √(1−x²) 且 x∈[−1,1]——令 x=cosθ。",
            content: "求函数 y = x + √(1 − x²) 的值域。",
            contentLatex: #"y=x+\sqrt{1-x^{2}}\ \text{的值域}=?"#,
            answer: "[−1, √2]",
            difficulty: 0.72, tier: 4,
            formulaIds: ["aux_angle"],
            stdSteps: [
                skStep(1, "定义域+求导", #"x\in[-1,1],\ y'=1-\frac{x}{\sqrt{1-x^{2}}}=0\Rightarrow x=\tfrac{1}{\sqrt2}"#),
                skStep(2, "比较驻点与端点", #"y(\tfrac1{\sqrt2})=\sqrt2,\ y(-1)=-1,\ y(1)=1"#),
                skStep(3, "结论", #"\Rightarrow\text{值域}=[-1,\sqrt2]"#)
            ],
            killSteps: [
                skStep(1, "三角换元", #"\text{令 }x=\cos\theta,\ \theta\in[0,\pi]\Rightarrow\sqrt{1-x^{2}}=\sin\theta"#),
                skStep(2, "合成辅助角", #"y=\cos\theta+\sin\theta=\sqrt2\sin\!\Big(\theta+\tfrac\pi4\Big)"#),
                skStep(3, "用范围定值域", #"\theta+\tfrac\pi4\in[\tfrac\pi4,\tfrac{5\pi}4]\Rightarrow\sin\in[-\tfrac{\sqrt2}2,1]\Rightarrow y\in[-1,\sqrt2]"#)
            ],
            stdKey: "求导要处理根式分母，还要比较驻点与两端点。",
            killKey: "x=cosθ 把根号化掉，y=√2 sin(θ+π/4)，由 θ 的范围直接读出值域。",
            mistakes: ["√(1−x²)=sinθ 需 θ∈[0,π] 保证非负", "辅助角后看 θ+π/4 的实际区间"]
        ),

        // 38 ── 三角换元：双圆约束不等式
        skCase(
            id: "sk_038", weapon: .trigSubstitution,
            title: "a²+b²=1,c²+d²=1 ⇒ ac+bd≤1，双角换元化 cos(α−β)",
            source: "不等式 · 单位圆约束（压轴）",
            standardMinutes: 7, killSeconds: 40,
            signal: "两组『平方和=1』的约束——各设一个角。",
            content: "已知 a²+b²=1，c²+d²=1，证明 ac + bd ≤ 1。",
            contentLatex: #"a^{2}+b^{2}=1,\ c^{2}+d^{2}=1\Rightarrow ac+bd\le1"#,
            answer: "成立",
            difficulty: 0.70, tier: 4,
            formulaIds: ["aux_angle", "cauchy_schwarz"],
            stdSteps: [
                skStep(1, "柯西不等式", #"(ac+bd)^{2}\le(a^{2}+b^{2})(c^{2}+d^{2})=1"#),
                skStep(2, "开方", #"\Rightarrow|ac+bd|\le1\Rightarrow ac+bd\le1"#)
            ],
            killSteps: [
                skStep(1, "两组角换元", #"a=\cos\alpha,b=\sin\alpha,\ c=\cos\beta,d=\sin\beta"#),
                skStep(2, "和角公式", #"ac+bd=\cos\alpha\cos\beta+\sin\alpha\sin\beta=\cos(\alpha-\beta)"#),
                skStep(3, "有界性", #"\cos(\alpha-\beta)\le1"#)
            ],
            stdKey: "柯西要先平方再开方，且需说明取正。",
            killKey: "两组约束各设一角后，ac+bd 正好是 cos(α−β)，余弦不超过 1。",
            mistakes: ["换元后恰好凑成余弦和角公式", "cos≤1 等号当 α=β"]
        ),

        // 39 ── 罗尔定理：多项式系数条件 → 有根
        skCase(
            id: "sk_039", weapon: .rolleTheorem,
            title: "系数和 Σaₖ/(k+1)=0 ⇒ 多项式在 (0,1) 有根，构造原函数+罗尔",
            source: "存在性 · 方程有根（压轴）",
            standardMinutes: 10, killSeconds: 55,
            signal: "要证多项式在区间有根，但符号判不了——构造原函数用罗尔。",
            content: "设 a₀ + a₁/2 + a₂/3 + … + aₙ/(n+1) = 0，证明方程 a₀ + a₁x + … + aₙxⁿ = 0 在 (0,1) 内必有实根。",
            contentLatex: #"a_0+\tfrac{a_1}2+\cdots+\tfrac{a_n}{n+1}=0\Rightarrow a_0+a_1x+\cdots+a_nx^{n}=0\ \text{在}(0,1)\text{有根}"#,
            answer: "成立",
            difficulty: 0.82, tier: 5,
            formulaIds: [],
            stdSteps: [
                skStep(1, "零点定理难直接", #"\text{多项式 }P(x)\text{ 在 }0,1\text{ 的符号无法确定，零点定理无从下手}"#)
            ],
            killSteps: [
                skStep(1, "构造原函数", #"F(x)=a_0x+\tfrac{a_1}2x^{2}+\cdots+\tfrac{a_n}{n+1}x^{n+1}"#),
                skStep(2, "两端相等", #"F(0)=0,\ F(1)=a_0+\tfrac{a_1}2+\cdots+\tfrac{a_n}{n+1}=0"#),
                skStep(3, "罗尔定理", #"\exists\,\xi\in(0,1):\ F'(\xi)=0"#),
                skStep(4, "还原", #"F'(x)=a_0+a_1x+\cdots+a_nx^{n}\Rightarrow P(\xi)=0"#)
            ],
            stdKey: "直接用零点定理时多项式端点符号不确定，根本判不了。",
            killKey: "把多项式视为某个 F 的导数：积出的 F 恰好 F(0)=F(1)=0，罗尔保证 F'=P 有零点。",
            mistakes: ["条件 Σaₖ/(k+1) 正是 F(1) 的值", "罗尔要求 F(0)=F(1) 且连续可导"]
        ),

        // 40 ── 罗尔定理：三零点 → 二阶导有零点
        skCase(
            id: "sk_040", weapon: .rolleTheorem,
            title: "f(0)=f(1)=f(2)=0 ⇒ f″ 在 (0,2) 有零点，两次罗尔",
            source: "存在性 · 高阶导数（压轴）",
            standardMinutes: 9, killSeconds: 50,
            signal: "函数有三个零点，要证二阶导有零点——罗尔接力。",
            content: "设 f(x) 在 [0,2] 上二阶可导，且 f(0)=f(1)=f(2)=0，证明存在 ξ∈(0,2) 使 f″(ξ)=0。",
            contentLatex: #"f(0)=f(1)=f(2)=0\Rightarrow\exists\,\xi\in(0,2):\ f''(\xi)=0"#,
            answer: "成立",
            difficulty: 0.78, tier: 5,
            formulaIds: [],
            stdSteps: [
                skStep(1, "直接分析无从下手", #"\text{仅知三点函数值为 0，难以直接定位 }f''\text{ 的零点}"#)
            ],
            killSteps: [
                skStep(1, "第一层罗尔", #"f(0)=f(1)\Rightarrow\exists\,p\in(0,1):f'(p)=0;\ f(1)=f(2)\Rightarrow\exists\,q\in(1,2):f'(q)=0"#),
                skStep(2, "第二层罗尔", #"f'(p)=f'(q)=0\Rightarrow\exists\,\xi\in(p,q):\ f''(\xi)=0"#),
                skStep(3, "结论", #"\xi\in(p,q)\subset(0,2)"#)
            ],
            stdKey: "只盯 f 本身无法定位二阶导零点。",
            killKey: "对相邻零点用罗尔得 f′ 的两个零点，再对 f′ 用一次罗尔，f″ 的零点自动出现。",
            mistakes: ["罗尔接力：n+1 个零点 → n 个一阶导零点 → …", "ξ 落在 (p,q)⊂(0,2)"]
        ),

        // 41 ── 特殊值/赋值：奇函数 + 常数平移
        skCase(
            id: "sk_041", weapon: .specialValue,
            title: "f(x)=ax⁵+bx³+cx+8，由 f(−3)=5 秒求 f(3)",
            source: "函数 · 奇偶性（高考选择高频）",
            standardMinutes: 5, killSeconds: 20,
            signal: "只有奇次项+常数，问对称两点的函数值——剥去常数看奇函数。",
            content: "已知 f(x) = ax⁵ + bx³ + cx + 8（a,b,c 为常数），且 f(−3) = 5，则 f(3) = ?",
            contentLatex: #"f(x)=ax^{5}+bx^{3}+cx+8,\ f(-3)=5\Rightarrow f(3)=?"#,
            answer: "11",
            difficulty: 0.55, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "试图解 a,b,c", #"\text{三个未知数仅一个方程，无法逐一求出}"#),
                skStep(2, "被迫整体处理", #"\text{需观察 }f(3)+f(-3)\text{ 的结构}"#)
            ],
            killSteps: [
                skStep(1, "剥常数得奇函数", #"g(x)=f(x)-8=ax^{5}+bx^{3}+cx\ \text{为奇函数}"#),
                skStep(2, "奇函数对称", #"g(3)=-g(-3)=-(f(-3)-8)=-(5-8)=3"#),
                skStep(3, "还原", #"f(3)=g(3)+8=11"#)
            ],
            stdKey: "三未知一方程，正面求 a,b,c 是死路。",
            killKey: "f(x)−8 是奇函数，f(3)+f(−3)=16，由 f(−3)=5 立得 f(3)=11。",
            mistakes: ["常数项 8 不具奇偶性，要先剥离", "f(3)+f(−3)=2×常数=16"],
            type: .multipleChoice,
            options: ["11", "−11", "5", "13"]
        ),

        // 42 ── 赋值法：二项式系数和
        skCase(
            id: "sk_042", weapon: .specialValue,
            title: "(1+x)¹⁰ 的 a₁+a₂+…+a₁₀，赋值 x=1、x=0 两步",
            source: "二项式定理 · 系数和（高考选择高频）",
            standardMinutes: 5, killSeconds: 20,
            signal: "求展开式系数之和——给 x 赋特殊值 1、−1、0。",
            content: "设 (1+x)¹⁰ = a₀ + a₁x + a₂x² + … + a₁₀x¹⁰，则 a₁ + a₂ + … + a₁₀ = ?",
            contentLatex: #"(1+x)^{10}=\sum_{k=0}^{10}a_kx^{k},\ a_1+a_2+\cdots+a_{10}=?"#,
            answer: "1023",
            difficulty: 0.50, tier: 3,
            formulaIds: ["binomial_theorem"],
            stdSteps: [
                skStep(1, "逐项算组合数", #"a_k=\binom{10}{k},\ \text{再求 }\sum_{k=1}^{10}\binom{10}{k}\ (\text{繁})"#)
            ],
            killSteps: [
                skStep(1, "赋值 x=1（取全部和）", #"a_0+a_1+\cdots+a_{10}=(1+1)^{10}=1024"#),
                skStep(2, "赋值 x=0（取 a₀）", #"a_0=(1+0)^{10}=1"#),
                skStep(3, "相减", #"a_1+\cdots+a_{10}=1024-1=1023"#)
            ],
            stdKey: "逐个算 C(10,k) 再求和，又慢又易错。",
            killKey: "x=1 得所有系数和 2¹⁰=1024，x=0 得 a₀=1，一减即 1023。",
            mistakes: ["求全部系数和令 x=1", "题目不含 a₀，要减去 a₀=1"],
            type: .multipleChoice,
            options: ["1023", "1024", "1022", "512"]
        ),

        // 43 ── 选项代入排除：由 Sₙ 求 aₙ
        skCase(
            id: "sk_043", weapon: .optionElimination,
            title: "Sₙ=n²+n 求 aₙ，算 a₁、a₂ 代选项秒排除",
            source: "数列 · 由和求项（高考选择）",
            standardMinutes: 5, killSeconds: 25,
            signal: "选择题求通项，选项具体——算前两项代回排除。",
            content: "已知数列 {aₙ} 的前 n 项和 Sₙ = n² + n，则 aₙ = ?",
            contentLatex: #"S_n=n^{2}+n,\ a_n=?"#,
            answer: "2n",
            difficulty: 0.45, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "分类讨论", #"a_n=S_n-S_{n-1}\ (n\ge2),\ a_1=S_1\ \text{单独验证}"#),
                skStep(2, "计算", #"a_n=(n^{2}+n)-((n-1)^{2}+(n-1))=2n\ (n\ge2),\ a_1=2\ \text{符合}"#)
            ],
            killSteps: [
                skStep(1, "算前两项", #"a_1=S_1=2,\ a_2=S_2-S_1=6-2=4"#),
                skStep(2, "代选项验证", #"\text{要 }a_1=2,a_2=4:\ \text{仅 }a_n=2n\ \text{同时满足}"#)
            ],
            stdKey: "需对 n=1 与 n≥2 分类讨论并验证衔接。",
            killKey: "选择题只要 a₁=2、a₂=4 两个数，四个选项里只有 aₙ=2n 全中。",
            mistakes: ["a₁ 要用 S₁ 而非通项公式", "代两项通常足以排除三个选项"],
            type: .multipleChoice,
            options: ["2n", "n² + n", "2n − 1", "n + 1"]
        ),

        // 44 ── 选项代入：抽象解析式
        skCase(
            id: "sk_044", weapon: .optionElimination,
            title: "f(x+1)=x²+2x 求 f(x)，取特殊值验证选项",
            source: "函数 · 解析式（高考选择）",
            standardMinutes: 4, killSeconds: 20,
            signal: "求解析式且有选项——代特殊点验证最快。",
            content: "已知 f(x+1) = x² + 2x，则 f(x) = ?",
            contentLatex: #"f(x+1)=x^{2}+2x,\ f(x)=?"#,
            answer: "x² − 1",
            difficulty: 0.45, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "换元", #"\text{令 }t=x+1\Rightarrow x=t-1"#),
                skStep(2, "代入化简", #"f(t)=(t-1)^{2}+2(t-1)=t^{2}-1\Rightarrow f(x)=x^{2}-1"#)
            ],
            killSteps: [
                skStep(1, "取 x=0 算锚点", #"f(0+1)=0\Rightarrow f(1)=0"#),
                skStep(2, "选项代 x=1 筛选", #"x^{2}-1\big|_{1}=0\ \checkmark,\ \text{其余选项 }f(1)\ne0"#)
            ],
            stdKey: "换元法要细心代入展开，易出符号错。",
            killKey: "由 x=0 得 f(1)=0，四个选项里只有 x²−1 在 x=1 取 0。",
            mistakes: ["换元后是 f(t)=t²−1", "代一个特殊点通常即可锁定"],
            type: .multipleChoice,
            options: ["x² − 1", "x² + 1", "x² − 2x", "x² + 2x"]
        ),

        // 45 ── 数形结合：根式和的最小值（距离和）
        skCase(
            id: "sk_045", weapon: .numberShape,
            title: "√((x−1)²+1)+√((x+2)²+4) 最小值，化两点距离和",
            source: "函数 · 根式最值（高考选择/填空）",
            standardMinutes: 9, killSeconds: 40,
            signal: "两个根号各是『距离』，求和最小——数轴上点到两定点+对称。",
            content: "求 y = √(x²−2x+2) + √(x²+4x+8) 的最小值。",
            contentLatex: #"y=\sqrt{x^{2}-2x+2}+\sqrt{x^{2}+4x+8}\ \text{的最小值}=?"#,
            answer: "3√2",
            difficulty: 0.74, tier: 4,
            formulaIds: [],
            stdSteps: [
                skStep(1, "求导", #"y'=\frac{x-1}{\sqrt{(x-1)^{2}+1}}+\frac{x+2}{\sqrt{(x+2)^{2}+4}}=0\ (\text{方程难解})"#),
                skStep(2, "数值求解", #"\text{需解无理方程定驻点，繁琐}"#)
            ],
            killSteps: [
                skStep(1, "配方看作距离", #"y=\sqrt{(x-1)^{2}+1^{2}}+\sqrt{(x+2)^{2}+2^{2}}"#),
                skStep(2, "几何意义", #"=\text{点 }P(x,0)\text{ 到 }A(1,1),\ B(-2,2)\text{ 的距离和}"#),
                skStep(3, "对称求最短", #"A\text{ 关于 }x\text{ 轴对称点 }A'(1,-1),\ |A'B|=\sqrt{3^{2}+3^{2}}=3\sqrt2"#)
            ],
            stdKey: "求导得到无理方程，定驻点非常麻烦。",
            killKey: "两根号是 P(x,0) 到 A(1,1)、B(−2,2) 的距离；把 A 对 x 轴对称，|A′B|=3√2 即最短。",
            mistakes: ["配方成 (x−h)²+k² 才能读出定点坐标", "两定点在 x 轴同侧，需对称一个点"],
            type: .multipleChoice,
            options: ["3√2", "2√5", "√13", "5"]
        ),

        // 46 ── 数形结合：分式范围（斜率）
        skCase(
            id: "sk_046", weapon: .numberShape,
            title: "sinθ/(cosθ−2) 的范围，看成单位圆点到 (2,0) 的斜率",
            source: "三角 · 范围（高考选择）",
            standardMinutes: 8, killSeconds: 40,
            signal: "(sinθ−0)/(cosθ−2) 是斜率结构——单位圆上点到定点连线斜率。",
            content: "求 (sin θ)/(cos θ − 2) 的取值范围。",
            contentLatex: #"\frac{\sin\theta}{\cos\theta-2}\ \text{的取值范围}=?"#,
            answer: "[−√3/3, √3/3]",
            difficulty: 0.74, tier: 4,
            formulaIds: [],
            stdSteps: [
                skStep(1, "设 k 去分母", #"k=\frac{\sin\theta}{\cos\theta-2}\Rightarrow \sin\theta-k\cos\theta=-2k"#),
                skStep(2, "辅助角有解条件", #"\sqrt{1+k^{2}}\ge|2k|\Rightarrow1+k^{2}\ge4k^{2}\Rightarrow k^{2}\le\tfrac13"#)
            ],
            killSteps: [
                skStep(1, "几何意义", #"k=\frac{\sin\theta-0}{\cos\theta-2}=\text{单位圆上点 }(\cos\theta,\sin\theta)\text{ 与 }(2,0)\text{ 连线斜率}"#),
                skStep(2, "切线临界", #"\text{过 }(2,0)\text{ 作圆切线，}\frac{|2k|}{\sqrt{k^{2}+1}}=1\Rightarrow k=\pm\tfrac{\sqrt3}{3}"#),
                skStep(3, "结论", #"k\in\Big[-\tfrac{\sqrt3}{3},\tfrac{\sqrt3}{3}\Big]"#)
            ],
            stdKey: "去分母后用辅助角『有解』条件解不等式，需小心。",
            killKey: "该式是单位圆上动点到 (2,0) 的斜率，最大最小由两条切线给出 ±√3/3。",
            mistakes: ["切线条件：圆心到直线距离=半径 1", "范围是闭区间，切点可取到"],
            type: .multipleChoice,
            options: ["[−√3/3, √3/3]", "[−√3, √3]", "[−1, 1]", "[−1/2, 1/2]"]
        ),

        // 47 ── 估算：指对幂比大小
        skCase(
            id: "sk_047", weapon: .estimation,
            title: "比较 2^0.3、0.3²、log₀.₃2，按量级一眼排序",
            source: "指对函数 · 比大小（高考选择高频）",
            standardMinutes: 5, killSeconds: 20,
            signal: "幂、指、对数混比——用 0、1 当分界估量级。",
            content: "设 a = 2^0.3，b = 0.3²，c = log₀.₃2，则 a、b、c 的大小关系是？",
            contentLatex: #"a=2^{0.3},\ b=0.3^{2},\ c=\log_{0.3}2,\ \text{比较 }a,b,c"#,
            answer: "c < b < a",
            difficulty: 0.50, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "尝试精确估值", #"a\approx1.23,\ b=0.09,\ c\approx-0.63\ (\text{需查表/换底)}"#)
            ],
            killSteps: [
                skStep(1, "a 与 1 比", #"a=2^{0.3}>2^{0}=1"#),
                skStep(2, "b 落在 (0,1)", #"b=0.3^{2}=0.09\in(0,1)"#),
                skStep(3, "c 为负", #"\text{底 }0.3<1,\ \text{真数 }2>1\Rightarrow c=\log_{0.3}2<0"#),
                skStep(4, "排序", #"c<0<b<1<a\Rightarrow c<b<a"#)
            ],
            stdKey: "逐个求近似值要换底、估幂，慢且依赖记忆。",
            killKey: "只看量级：a>1、b∈(0,1)、c<0，三者大小立判 c<b<a。",
            mistakes: ["底数<1 且真数>1 时对数为负", "比大小常以 0、1 为分界"],
            type: .multipleChoice,
            options: ["c < b < a", "a < b < c", "b < c < a", "c < a < b"]
        ),

        // 48 ── 估算/特例比较：根式比大小（公共乘方）
        skCase(
            id: "sk_048", weapon: .estimation,
            title: "√2 与 ∛3 谁大？取 6 次方比 8 与 9",
            source: "根式 · 比大小（高考选择）",
            standardMinutes: 4, killSeconds: 20,
            signal: "不同次根号比大小——取指数最小公倍数同时乘方。",
            content: "比较 √2 与 ∛3（即 2^(1/2) 与 3^(1/3)）的大小。",
            contentLatex: #"\sqrt2\ \text{与}\ \sqrt[3]{3}\ \text{的大小}=?"#,
            answer: "∛3 > √2",
            difficulty: 0.48, tier: 3,
            formulaIds: [],
            stdSteps: [
                skStep(1, "取对数比较", #"\tfrac12\ln2\ \text{vs}\ \tfrac13\ln3\Rightarrow 3\ln2\ \text{vs}\ 2\ln3"#),
                skStep(2, "即 ln8 vs ln9", #"\ln2^{3}=\ln8<\ln9=\ln3^{2}"#)
            ],
            killSteps: [
                skStep(1, "同时取 6 次方", #"(\sqrt2)^{6}=2^{3}=8,\quad(\sqrt[3]{3})^{6}=3^{2}=9"#),
                skStep(2, "比较即得", #"8<9\Rightarrow\sqrt[3]{3}>\sqrt2"#)
            ],
            stdKey: "取对数还要再化成 ln8 与 ln9，多绕一步。",
            killKey: "两个指数 1/2、1/3 的公倍数是 6，同时 6 次方变成比 8 与 9，直接见分晓。",
            mistakes: ["乘方次数取分母 2、3 的最小公倍数 6", "乘方保序需两数为正"],
            type: .multipleChoice,
            options: ["∛3 > √2", "√2 > ∛3", "√2 = ∛3", "无法比较"]
        )
    ]

    // 战例对应题目也并入题库（可在练习/复习中再遇到）
    static let secondKillProblems: [Problem] = secondKillCases.map(\.problem)

    // MARK: - 工厂

    private static func skStep(_ order: Int, _ description: String, _ latex: String) -> SolutionStep {
        SolutionStep(order: order, description: description, latex: latex, annotation: "")
    }

    private static func skCase(
        id: String,
        weapon: KillWeapon,
        title: String,
        source: String,
        standardMinutes: Int,
        killSeconds: Int,
        signal: String,
        content: String,
        contentLatex: String,
        answer: String,
        difficulty: Double,
        tier: Int,
        formulaIds: [String],
        stdSteps: [SolutionStep],
        killSteps: [SolutionStep],
        stdKey: String,
        killKey: String,
        mistakes: [String],
        type: ProblemType = .proof,
        options: [String]? = nil
    ) -> SecondKillCase {
        let problem = Problem(
            id: id,
            type: type,
            tier: tier,
            formulaIds: formulaIds,
            content: content,
            contentLatex: contentLatex,
            options: options,
            answer: answer,
            difficulty: difficulty,
            averageTime: TimeInterval(standardMinutes * 60),
            hints: [signal],
            solution: SolutionPath(steps: stdSteps, keyInsight: stdKey, commonMistakes: mistakes),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(steps: stdSteps, keyInsight: stdKey, commonMistakes: mistakes),
                descentMethod: SolutionPath(steps: killSteps, keyInsight: killKey, commonMistakes: []),
                weaponUsed: weapon.displayName,
                timeRatio: Double(standardMinutes * 60) / Double(max(killSeconds, 1)),
                detailedExplanation: "降维秒杀（\(weapon.displayName)）：\(killKey)"
            ),
            gaokaoYear: nil,
            tags: ["降维秒杀", "压轴", weapon.displayName] + (weapon.inSyllabus ? ["纲内深用"] : ["超纲秒杀"])
        )
        return SecondKillCase(
            id: id, weapon: weapon, title: title, source: source,
            standardMinutes: standardMinutes, killSeconds: killSeconds,
            signal: signal, problem: problem
        )
    }
}
