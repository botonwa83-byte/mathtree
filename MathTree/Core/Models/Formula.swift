import Foundation

enum FormulaLevel: String, Codable, CaseIterable {
    case elementary = "elementary"
    case middle = "middle"
    case high = "high"
    case university = "university"
    case advanced = "advanced"

    var displayName: String {
        switch self {
        case .elementary: return "小学"
        case .middle: return "初中"
        case .high: return "高中"
        case .university: return "大学"
        case .advanced: return "研究生"
        }
    }

    var color: String {
        switch self {
        case .elementary: return "orange"
        case .middle: return "green"
        case .high: return "purple"
        case .university: return "gold"
        case .advanced: return "red"
        }
    }
}

enum FormulaCategory: String, Codable, CaseIterable {
    case algebra = "algebra"
    case geometry = "geometry"
    case trigonometry = "trigonometry"
    case calculus = "calculus"
    case linearAlgebra = "linear_algebra"
    case probability = "probability"
    case sequences = "sequences"
    case complexNumbers = "complex_numbers"
    case inequalities = "inequalities"
    case conicSections = "conic_sections"

    var displayName: String {
        switch self {
        case .algebra: return "代数"
        case .geometry: return "几何"
        case .trigonometry: return "三角函数"
        case .calculus: return "微积分"
        case .linearAlgebra: return "线性代数"
        case .probability: return "概率统计"
        case .sequences: return "数列"
        case .complexNumbers: return "复数"
        case .inequalities: return "不等式"
        case .conicSections: return "圆锥曲线"
        }
    }
}

struct Formula: Identifiable, Codable {
    let id: String
    let name: String
    let latex: String
    let level: FormulaLevel
    let category: FormulaCategory
    let prerequisites: [String]
    let derivations: [String]
    let advancedForm: String?
    let gaokaoRelevance: Double
    let tags: [String]
    let intuition: String
    let leapfrogKey: Bool
    let unlockedBy: String?
    let detailedExplanation: String?
    let proofSteps: [String]?
    let applications: [String]?
    let history: String?

    static let example = Formula(
        id: "pythagorean",
        name: "勾股定理",
        latex: "a^2 + b^2 = c^2",
        level: .middle,
        category: .geometry,
        prerequisites: ["rectangle_area"],
        derivations: ["distance_formula", "circle_equation"],
        advancedForm: "inner_product",
        gaokaoRelevance: 0.85,
        tags: ["几何", "基础", "必考"],
        intuition: "直角三角形两条直角边的平方和等于斜边的平方",
        leapfrogKey: false,
        unlockedBy: nil,
        detailedExplanation: nil,
        proofSteps: nil,
        applications: nil,
        history: nil
    )
}
