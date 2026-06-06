import Foundation

enum ProblemType: String, Codable {
    case multipleChoice = "multiple_choice"
    case fillInBlank = "fill_in_blank"
    case proof = "proof"
    case calculation = "calculation"
}

struct SolutionStep: Codable, Identifiable {
    var id: String { "\(order)" }
    let order: Int
    let description: String
    let latex: String
    let annotation: String
}

struct SolutionPath: Codable {
    let steps: [SolutionStep]
    let keyInsight: String
    let commonMistakes: [String]
}

struct DualSolution: Codable {
    let standardMethod: SolutionPath
    let descentMethod: SolutionPath
    let weaponUsed: String
    let timeRatio: Double
    let detailedExplanation: String?
}

struct Problem: Identifiable, Codable {
    let id: String
    let type: ProblemType
    let tier: Int
    let formulaIds: [String]
    let content: String
    let contentLatex: String?
    let options: [String]?
    let answer: String
    let difficulty: Double
    let averageTime: TimeInterval
    let hints: [String]
    let solution: SolutionPath
    let dualSolution: DualSolution?
    let gaokaoYear: Int?
    let tags: [String]

    init(id: String, type: ProblemType, tier: Int, formulaIds: [String], content: String, contentLatex: String?, options: [String]?, answer: String, difficulty: Double, averageTime: TimeInterval, hints: [String], solution: SolutionPath, dualSolution: DualSolution? = nil, gaokaoYear: Int?, tags: [String]) {
        self.id = id
        self.type = type
        self.tier = tier
        self.formulaIds = formulaIds
        self.content = content
        self.contentLatex = contentLatex
        self.options = options
        self.answer = answer
        self.difficulty = difficulty
        self.averageTime = averageTime
        self.hints = hints
        self.solution = solution
        self.dualSolution = dualSolution
        self.gaokaoYear = gaokaoYear
        self.tags = tags
    }

    static let example = Problem(
        id: "prob_001",
        type: .multipleChoice,
        tier: 1,
        formulaIds: ["pythagorean"],
        content: "直角三角形两条直角边分别为3和4，求斜边长度",
        contentLatex: nil,
        options: ["5", "6", "7", "8"],
        answer: "5",
        difficulty: 0.2,
        averageTime: 30,
        hints: ["使用勾股定理", "a² + b² = c²", "3² + 4² = ?"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "代入勾股定理", latex: "c^2 = 3^2 + 4^2 = 9 + 16 = 25", annotation: "直接代入公式"),
                SolutionStep(order: 2, description: "开方", latex: "c = \\sqrt{25} = 5", annotation: "取正值")
            ],
            keyInsight: "识别直角三角形，直接应用勾股定理",
            commonMistakes: ["忘记开方", "将斜边和直角边搞混"]
        ),
        dualSolution: nil,
        gaokaoYear: nil,
        tags: ["几何", "基础"]
    )
}
