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

    static let newton = MathHero(
        id: "newton",
        name: "牛顿",
        nameEN: "Isaac Newton",
        era: "1643-1727",
        attributes: HeroAttributes(insight: 10, creativity: 10, perseverance: 9, influence: 10),
        weaponSkills: ["nl_formula", "calculus_blade"],
        legendStory: "在瘟疫期间避居乡下，一年内发明了微积分、发现万有引力定律、分解白光。传说被苹果砸中脑袋激发了灵感。",
        famousQuote: "如果说我看得更远，那是因为我站在巨人的肩膀上。",
        relatedMysteries: ["gabriel_horn"],
        portraitEmoji: "🍎"
    )

    static let euclid = MathHero(
        id: "euclid",
        name: "欧几里得",
        nameEN: "Euclid",
        era: "约前330-前275",
        attributes: HeroAttributes(insight: 10, creativity: 9, perseverance: 9, influence: 10),
        weaponSkills: ["parallel_postulate"],
        legendStory: "被称为'几何之父'，著有《几何原本》，建立了完整的欧几里得几何体系。这本书两千多年来一直是几何学的标准教科书。",
        famousQuote: "几何中没有王者之道。",
        relatedMysteries: [],
        portraitEmoji: "📐"
    )

    static let archimedes = MathHero(
        id: "archimedes",
        name: "阿基米德",
        nameEN: "Archimedes",
        era: "前287-前212",
        attributes: HeroAttributes(insight: 10, creativity: 10, perseverance: 9, influence: 9),
        weaponSkills: ["buoyancy_principle"],
        legendStory: "洗澡时发现浮力定律，赤身裸体跑上街大喊'Eureka!'。发明了阿基米德螺旋、杠杆原理，据说能用镜子烧毁敌军战船。",
        famousQuote: "给我一个支点，我就能撬动地球。",
        relatedMysteries: [],
        portraitEmoji: "⚖️"
    )

    static let descartes = MathHero(
        id: "descartes",
        name: "笛卡尔",
        nameEN: "René Descartes",
        era: "1596-1650",
        attributes: HeroAttributes(insight: 10, creativity: 10, perseverance: 8, influence: 10),
        weaponSkills: ["coordinate_system"],
        legendStory: "躺在床上观察苍蝇在天花板上爬行，从而发明了坐标系，开创了解析几何。将代数与几何完美结合。",
        famousQuote: "我思故我在。",
        relatedMysteries: [],
        portraitEmoji: "🦟"
    )

    static let fermat = MathHero(
        id: "fermat",
        name: "费马",
        nameEN: "Pierre de Fermat",
        era: "1607-1665",
        attributes: HeroAttributes(insight: 9, creativity: 10, perseverance: 7, influence: 9),
        weaponSkills: ["number_theory"],
        legendStory: "业余数学家之王。在一本书的空白处写下'我发现了一个美妙的证明，可惜这里空白太小写不下'，这就是著名的费马大定理，历经358年才被证明。",
        famousQuote: "无穷递降法是数论的灵魂。",
        relatedMysteries: [],
        portraitEmoji: "✍️"
    )

    static let riemann = MathHero(
        id: "riemann",
        name: "黎曼",
        nameEN: "Bernhard Riemann",
        era: "1826-1866",
        attributes: HeroAttributes(insight: 10, creativity: 10, perseverance: 6, influence: 10),
        weaponSkills: ["riemann_zeta"],
        legendStory: "提出了黎曼几何，为爱因斯坦的广义相对论提供了数学基础。提出的黎曼猜想至今仍是数学界最大的未解之谜之一。",
        famousQuote: "只有在潮水退去时，你才知道谁在裸泳。",
        relatedMysteries: [],
        portraitEmoji: "🌊"
    )

    static let galois = MathHero(
        id: "galois",
        name: "伽罗瓦",
        nameEN: "Évariste Galois",
        era: "1811-1832",
        attributes: HeroAttributes(insight: 10, creativity: 10, perseverance: 5, influence: 9),
        weaponSkills: ["group_theory"],
        legendStory: "21岁时在决斗前夜，奋笔疾书将毕生数学思想写在纸上，创立了群论。次日决斗身亡，成为数学史上最令人惋惜的天才。",
        famousQuote: "我没有时间了。",
        relatedMysteries: [],
        portraitEmoji: "⚔️"
    )

    static let cantor = MathHero(
        id: "cantor",
        name: "康托尔",
        nameEN: "Georg Cantor",
        era: "1845-1918",
        attributes: HeroAttributes(insight: 10, creativity: 10, perseverance: 10, influence: 9),
        weaponSkills: ["set_theory"],
        legendStory: "创立了集合论，证明了无穷也有大小之分，提出了连续统假设。他的理论在当时饱受争议，晚年患上精神病。",
        famousQuote: "数学的本质在于它的自由。",
        relatedMysteries: ["banach_tarski", "russell_paradox"],
        portraitEmoji: "🔢"
    )

    static let turing = MathHero(
        id: "turing",
        name: "图灵",
        nameEN: "Alan Turing",
        era: "1912-1954",
        attributes: HeroAttributes(insight: 10, creativity: 10, perseverance: 8, influence: 10),
        weaponSkills: ["turing_machine"],
        legendStory: "计算机科学之父。二战期间破解了德军的恩尼格玛密码，拯救了数百万人的生命。提出了图灵测试，奠定了人工智能的基础。",
        famousQuote: "有时候，正是那些无人看好的人，成就了无人能及的成就。",
        relatedMysteries: [],
        portraitEmoji: "💻"
    )

    static let allHeroes: [MathHero] = [
        .euler,
        .gauss,
        .newton,
        .euclid,
        .archimedes,
        .descartes,
        .fermat,
        .riemann,
        .galois,
        .cantor,
        .turing
    ]
}
