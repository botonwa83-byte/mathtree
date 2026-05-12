import Foundation

enum WeaponTier: Int, Codable, CaseIterable {
    case dagger = 1      // 匕首
    case blade = 2       // 快刀
    case sharpWeapon = 3 // 利器
    case heavyWeapon = 4 // 重器
    case divine = 5      // 神兵

    var displayName: String {
        switch self {
        case .dagger: return "第一阶 · 匕首"
        case .blade: return "第二阶 · 快刀"
        case .sharpWeapon: return "第三阶 · 利器"
        case .heavyWeapon: return "第四阶 · 重器"
        case .divine: return "第五阶 · 神兵"
        }
    }
}

enum WeaponMasteryLevel: Int, Codable {
    case locked = 0
    case beginner = 1    // 入门
    case proficient = 2  // 精通
    case master = 3      // 大师
    case legend = 4      // 传说

    var displayName: String {
        switch self {
        case .locked: return "未解锁"
        case .beginner: return "入门"
        case .proficient: return "精通"
        case .master: return "大师"
        case .legend: return "传说"
        }
    }
}

struct WeaponDemo: Codable, Identifiable {
    var id: String { problemTitle }
    let problemTitle: String
    let standardMethod: String
    let standardSteps: Int
    let descentMethod: String
    let descentSteps: Int
    let timeRatio: String
}

struct DescendWeapon: Identifiable, Codable {
    let id: String
    let name: String
    let codename: String
    let tier: WeaponTier
    let principle: String
    let tagline: String
    let unlockConditions: [String]
    let slayableGaokaoTypes: [String]
    let demonstrations: [WeaponDemo]
    var masteryLevel: WeaponMasteryLevel

    static let derivativeBlade = DescendWeapon(
        id: "derivative_blade",
        name: "Derivative Blade",
        codename: "求导刃",
        tier: .blade,
        principle: "单变量微积分导数",
        tagline: "函数在某点的瞬时变化速度，是切线的斜率",
        unlockConditions: ["power_function", "exp_function", "trig_basic"],
        slayableGaokaoTypes: ["函数极值", "单调区间", "切线方程", "不等式证明"],
        demonstrations: [
            WeaponDemo(
                problemTitle: "求 f(x) = xe^x 的极值",
                standardMethod: "分析函数性质，讨论单调性...",
                standardSteps: 5,
                descentMethod: "f'(x) = e^x(x+1) = 0, x = -1",
                descentSteps: 2,
                timeRatio: "3x"
            )
        ],
        masteryLevel: .locked
    )

    static let eulerPrism = DescendWeapon(
        id: "euler_prism",
        name: "Euler Prism",
        codename: "欧拉棱镜",
        tier: .blade,
        principle: "欧拉公式 e^(iθ) = cosθ + isinθ",
        tagline: "复数平面上的旋转，将三角函数统一为指数函数",
        unlockConditions: ["complex_basic"],
        slayableGaokaoTypes: ["三角恒等式", "三角方程", "三角变换"],
        demonstrations: [
            WeaponDemo(
                problemTitle: "证明 cos(A+B) = cosAcosB - sinAsinB",
                standardMethod: "几何方法或向量法证明...",
                standardSteps: 6,
                descentMethod: "e^(i(A+B)) = e^(iA)·e^(iB)，取实部",
                descentSteps: 2,
                timeRatio: "3x"
            )
        ],
        masteryLevel: .locked
    )
}
