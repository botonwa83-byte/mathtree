import SwiftUI

extension Color {
    // Rainbow Fresh Theme (Primary)
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

    // Rainbow Levels Palette
    static let levelElementary = Color(hex: "66BB6A")       // Fresh Green
    static let levelMiddle = Color(hex: "42A5F5")           // Sky Blue
    static let levelHigh = Color(hex: "FF7043")             // Lava Orange
    static let levelUniversity = Color(hex: "7E57C2")       // Mystery Purple
    static let levelAdvanced = Color(hex: "26A69A")         // Emerald Teal

    // Legacy / Deep Space Theme (Optional / Utility)
    static let apexDeepBackground = Color(hex: "070C1D")
    static let apexDeepSurface = Color(hex: "0E1628")
    static let apexDeepActive = Color(hex: "FF6B35")
    static let apexDeepBrand = Color(hex: "0EC9A0")
    static let apexDeepStar = Color(hex: "3B8DE0")

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

struct DescendAnimationView: View {
    let title: String
    let subtitle: String
    @Binding var isPresented: Bool
    @State private var scale: CGFloat = 1.0
    @State private var opacity: Double = 0.0
    @State private var yOffset: CGFloat = 0
    @State private var showText = false

    var body: some View {
        ZStack {
            // Updated to be more "Light Space" / Sky like for Rainbow theme
            LinearGradient(colors: [Color.apexStarBlue.opacity(0.8), Color.apexBackground], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            // Background Stars / Particles
            ForEach(0..<20) { _ in
                Circle()
                    .fill(Color.white)
                    .frame(width: CGFloat.random(in: 1...3))
                    .position(x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                              y: CGFloat.random(in: 0...UIScreen.main.bounds.height))
                    .opacity(Double.random(in: 0.3...0.7))
            }

            VStack(spacing: 30) {
                // The problem "shrinking" as we move up
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.apexLava, lineWidth: 2)
                        .frame(width: 100, height: 60)
                    Text("题目")
                        .font(.caption)
                        .foregroundColor(.apexLava)
                }
                .scaleEffect(scale)
                .opacity(opacity)
                .offset(y: yOffset)

                if showText {
                    VStack(spacing: 12) {
                        Text(title)
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundColor(.apexLava)
                        
                        Text(subtitle)
                            .font(.headline)
                            .foregroundColor(.apexEmerald)
                        
                        Text("— 从高维度俯瞰，此题显然 —")
                            .font(.caption)
                            .foregroundColor(.apexStarBlue)
                            .padding(.top, 10)
                    }
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }
            }
        }
        .onAppear {
            withAnimation(.easeIn(duration: 1.0)) {
                opacity = 1.0
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation(.easeInOut(duration: 2.0)) {
                    scale = 0.1
                    yOffset = -200
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation {
                        showText = true
                    }
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                isPresented = false
            }
        }
    }
}

#Preview {
    DescendAnimationView(title: "求导刃", subtitle: "已歼灭", isPresented: .constant(true))
}
