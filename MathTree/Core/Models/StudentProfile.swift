import Foundation

struct DimensionalMastery: Codable {
    var formulaMastery: Double = 0
    var applicationMastery: Double = 0
    var descentMastery: Double = 0

    var overallMastery: Double {
        formulaMastery * 0.2 + applicationMastery * 0.3 + descentMastery * 0.5
    }
}

struct FormulaMasteryRecord: Codable, Identifiable {
    var id: String { formulaId }
    let formulaId: String
    var masteryLevel: Double
    var reviewCount: Int
    var lastReviewedAt: Date
    var nextReviewAt: Date
    var easeFactor: Double
}

struct PracticeRecord: Codable, Identifiable {
    let id: String
    let problemId: String
    let solvedAt: Date
    let isCorrect: Bool
    let responseTime: Double
    let hintsUsed: Int
    let usedAdvancedMethod: Bool
}

class StudentProfile: ObservableObject, Codable {
    @Published var displayName: String
    @Published var currentLevel: FormulaLevel
    @Published var streak: Int
    @Published var totalProblems: Int
    @Published var correctProblems: Int
    @Published var formulaMasteries: [String: Double]
    @Published var unlockedWeapons: [String]
    @Published var completedMysteries: [String]
    @Published var predictedGaokaoScore: Double

    enum CodingKeys: String, CodingKey {
        case displayName, currentLevel, streak, totalProblems, correctProblems
        case formulaMasteries, unlockedWeapons, completedMysteries, predictedGaokaoScore
    }

    init() {
        self.displayName = "数学探险家"
        self.currentLevel = .high
        self.streak = 0
        self.totalProblems = 0
        self.correctProblems = 0
        self.formulaMasteries = [:]
        self.unlockedWeapons = []
        self.completedMysteries = []
        self.predictedGaokaoScore = 90
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        displayName = try container.decode(String.self, forKey: .displayName)
        currentLevel = try container.decode(FormulaLevel.self, forKey: .currentLevel)
        streak = try container.decode(Int.self, forKey: .streak)
        totalProblems = try container.decode(Int.self, forKey: .totalProblems)
        correctProblems = try container.decode(Int.self, forKey: .correctProblems)
        formulaMasteries = try container.decode([String: Double].self, forKey: .formulaMasteries)
        unlockedWeapons = try container.decode([String].self, forKey: .unlockedWeapons)
        completedMysteries = try container.decode([String].self, forKey: .completedMysteries)
        predictedGaokaoScore = try container.decode(Double.self, forKey: .predictedGaokaoScore)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(displayName, forKey: .displayName)
        try container.encode(currentLevel, forKey: .currentLevel)
        try container.encode(streak, forKey: .streak)
        try container.encode(totalProblems, forKey: .totalProblems)
        try container.encode(correctProblems, forKey: .correctProblems)
        try container.encode(formulaMasteries, forKey: .formulaMasteries)
        try container.encode(unlockedWeapons, forKey: .unlockedWeapons)
        try container.encode(completedMysteries, forKey: .completedMysteries)
        try container.encode(predictedGaokaoScore, forKey: .predictedGaokaoScore)
    }

    var accuracy: Double {
        guard totalProblems > 0 else { return 0 }
        return Double(correctProblems) / Double(totalProblems)
    }
}
