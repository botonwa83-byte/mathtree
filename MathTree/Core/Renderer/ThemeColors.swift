import SwiftUI

extension Color {
    // Deep Space Theme (APEX v2.0)
    static let apexDeepBackground = Color(hex: "070C1D")    // Darkest blue
    static let apexDeepSurface = Color(hex: "0E1628")       // Card surface
    static let apexDeepActive = Color(hex: "FF6B35")        // Lava orange
    static let apexDeepBrand = Color(hex: "0EC9A0")         // Emerald green
    static let apexDeepStar = Color(hex: "3B8DE0")          // Star blue
    static let apexDeepDanger = Color(hex: "E8445A")        // Danger red
    static let apexDeepMystery = Color(hex: "7B5EA7")       // Mystery purple
    static let apexDeepPaper = Color(hex: "1A1408")         // Mystery paper (dark)

    // Legacy / Warm Theme (Rainbow Fresh)
    static let apexBackground = Color(hex: "F5F0EB")       // warm cream
    static let apexCardSurface = Color.white
    static let apexLava = Color(hex: "FF7043")             // warm coral
    static let apexEmerald = Color(hex: "26A69A")           // teal mint
    static let apexStarBlue = Color(hex: "42A5F5")          // sky blue
    static let apexDanger = Color(hex: "EF5350")            // soft red
    static let apexMystery = Color(hex: "7E57C2")           // lavender purple
    static let apexGold = Color(hex: "FFA726")              // warm amber
    static let mysteryBackground = Color(hex: "F3EEFF")     // light lavender
    static let mysteryPaper = Color(hex: "FFF8E1")          // parchment cream

    // Rainbow accent palette for tags / chips
    static let rainbowRed = Color(hex: "FF7043")
    static let rainbowOrange = Color(hex: "FFA726")
    static let rainbowYellow = Color(hex: "FFEE58")
    static let rainbowGreen = Color(hex: "66BB6A")
    static let rainbowTeal = Color(hex: "26A69A")
    static let rainbowBlue = Color(hex: "42A5F5")
    static let rainbowIndigo = Color(hex: "5C6BC0")
    static let rainbowPurple = Color(hex: "AB47BC")

    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
