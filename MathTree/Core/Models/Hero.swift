import Foundation

struct HeroAttributes: Codable {
    let insight: Int       // 洞察力 1-10
    let creativity: Int    // 创造力 1-10
    let perseverance: Int  // 毅力 1-10
    let influence: Int     // 影响力 1-10
}

struct MathHero: Identifiable, Codable {
    let id: String
    let name: String
    let nameEN: String
    let era: String
    let attributes: HeroAttributes
    let weaponSkills: [String]
    let legendStory: String
    let famousQuote: String
    let relatedMysteries: [String]
    let portraitEmoji: String

    static let euler = MathHero(
        id: "euler",
        name: "欧拉",
        nameEN: "Leonhard Euler",
        era: "1707-1783",
        attributes: HeroAttributes(insight: 10, creativity: 10, perseverance: 9, influence: 10),
        weaponSkills: ["euler_prism", "euler_equation"],
        legendStory: "双眼相继失明后，仍然靠心算完成了大量工作。一生发表论文800+篇，直到去世前都在计算。",
        famousQuote: "数学是研究所有可能世界的科学。",
        relatedMysteries: ["099_equals_1", "gabriel_horn"],
        portraitEmoji: "🧮"
    )

    static let gauss = MathHero(
        id: "gauss",
        name: "高斯",
        nameEN: "Carl Friedrich Gauss",
        era: "1777-1855",
        attributes: HeroAttributes(insight: 10, creativity: 10, perseverance: 8, influence: 10),
        weaponSkills: ["matrix_cannon", "gaussian_elimination"],
        legendStory: "3岁时发现老师算术题的错误。10岁时用等差数列首尾配对秒算1到100之和，震惊了老师。终生不轻易发表，因为他要求每篇文章都如大理石雕塑般完美。",
        famousQuote: "数学是科学的女王，数论是数学的女王。",
        relatedMysteries: ["monty_hall"],
        portraitEmoji: "👑"
    )
}
