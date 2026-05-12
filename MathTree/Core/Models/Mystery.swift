import Foundation

enum MysteryCategory: String, Codable, CaseIterable {
    case intuitiveRebel = "intuitive_rebel"
    case infinityWar = "infinity_war"
    case foundation = "foundation"
    case coldCase = "cold_case"

    var displayName: String {
        switch self {
        case .intuitiveRebel: return "直觉叛徒"
        case .infinityWar: return "无穷的战争"
        case .foundation: return "数学的地震"
        case .coldCase: return "百年悬案"
        }
    }

    var icon: String {
        switch self {
        case .intuitiveRebel: return "brain.head.profile"
        case .infinityWar: return "infinity"
        case .foundation: return "building.columns"
        case .coldCase: return "questionmark.folder"
        }
    }
}

struct Argument: Codable, Identifiable {
    var id: String { title }
    let title: String
    let content: String
    let isCorrect: Bool?
}

struct ProofStep: Codable, Identifiable {
    var id: String { "\(order)" }
    let order: Int
    let latex: String
    let explanation: String
    let title: String?
    let content: String?
    let visualHint: String?
    let keyInsight: String?
    
    init(order: Int, latex: String, explanation: String, title: String? = nil, content: String? = nil, visualHint: String? = nil, keyInsight: String? = nil) {
        self.order = order
        self.latex = latex
        self.explanation = explanation
        self.title = title
        self.content = content
        self.visualHint = visualHint
        self.keyInsight = keyInsight
    }
}

struct MysteryVotes: Codable {
    var agreeCount: Int
    var disagreeCount: Int
    var userVote: Bool?
}

struct MathMystery: Identifiable, Codable {
    let id: String
    let title: String
    let category: MysteryCategory
    let shockRating: Int
    let summary: String
    let premise: String
    let arguments: [Argument]
    let proofSteps: [ProofStep]
    let verdict: String
    let historicalContext: String
    let relatedWeaponId: String?
    let relatedHeroId: String?
    var votes: MysteryVotes
    let openQuestion: String?

    static let example = MathMystery(
        id: "099_equals_1",
        title: "0.999... 到底等不等于 1？",
        category: .intuitiveRebel,
        shockRating: 8,
        summary: "一个让互联网每年都爆发争论的数学问题",
        premise: "大多数人凭直觉认为 0.999... 永远比 1 少一点点，所以不等于 1。但数学证明它们严格相等。",
        arguments: [
            Argument(title: "代数证明", content: "令 x = 0.999...\n10x = 9.999...\n9x = 9\nx = 1", isCorrect: true),
            Argument(title: "极限证明", content: "0.999... = 9/10 + 9/100 + ... = 9 × (1/10)/(1-1/10) = 1", isCorrect: true),
            Argument(title: "常见反驳", content: "「无穷小的差值存在！」\n在标准实数系中，没有无穷小的数。", isCorrect: false)
        ],
        proofSteps: [
            ProofStep(order: 1, latex: "x = 0.\\overline{9}", explanation: "设 x 等于 0.999..."),
            ProofStep(order: 2, latex: "10x = 9.\\overline{9}", explanation: "两边乘以10"),
            ProofStep(order: 3, latex: "10x - x = 9", explanation: "两式相减"),
            ProofStep(order: 4, latex: "x = 1", explanation: "解方程得 x = 1")
        ],
        verdict: "在实数体系中，0.999... 严格等于 1。这不是近似，不是约定，是严格的数学事实。",
        historicalContext: "这个问题在数学论坛上引发了数以万计的争论。2007年一项调查显示，约1/3的大学生学过极限后仍不相信这个结论。",
        relatedWeaponId: nil,
        relatedHeroId: "russell",
        votes: MysteryVotes(agreeCount: 0, disagreeCount: 0, userVote: nil),
        openQuestion: nil
    )
}
