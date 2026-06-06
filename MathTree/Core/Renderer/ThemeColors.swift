import SwiftUI

extension Color {
    // MARK: - Adaptive base colors (light / dark)

    static let apexBackground = Color(UIColor { tc in
        tc.userInterfaceStyle == .dark ? UIColor(hex6: 0x1C1C1E) : UIColor(hex6: 0xF5F0EB)
    })

    static let apexCardSurface = Color(UIColor { tc in
        tc.userInterfaceStyle == .dark ? UIColor(hex6: 0x2C2C2E) : UIColor(hex6: 0xFFFFFF)
    })

    static let mysteryBackground = Color(UIColor { tc in
        tc.userInterfaceStyle == .dark ? UIColor(hex6: 0x1E1A2E) : UIColor(hex6: 0xF3EEFF)
    })

    static let mysteryPaper = Color(UIColor { tc in
        tc.userInterfaceStyle == .dark ? UIColor(hex6: 0x2A2520) : UIColor(hex6: 0xFFF8E1)
    })

    // MARK: - Accent colors (slightly adjusted for dark readability)

    static let apexLava = Color(UIColor { tc in
        tc.userInterfaceStyle == .dark ? UIColor(hex6: 0xFF8A65) : UIColor(hex6: 0xFF7043)
    })

    static let apexEmerald = Color(UIColor { tc in
        tc.userInterfaceStyle == .dark ? UIColor(hex6: 0x4DB6AC) : UIColor(hex6: 0x26A69A)
    })

    static let apexStarBlue = Color(UIColor { tc in
        tc.userInterfaceStyle == .dark ? UIColor(hex6: 0x64B5F6) : UIColor(hex6: 0x42A5F5)
    })

    static let apexDanger = Color(UIColor { tc in
        tc.userInterfaceStyle == .dark ? UIColor(hex6: 0xEF5350) : UIColor(hex6: 0xEF5350)
    })

    static let apexMystery = Color(UIColor { tc in
        tc.userInterfaceStyle == .dark ? UIColor(hex6: 0x9575CD) : UIColor(hex6: 0x7E57C2)
    })

    static let apexGold = Color(UIColor { tc in
        tc.userInterfaceStyle == .dark ? UIColor(hex6: 0xFFB74D) : UIColor(hex6: 0xFFA726)
    })

    // MARK: - Level palette (brighter in dark mode)

    static let levelElementary = Color(UIColor { tc in
        tc.userInterfaceStyle == .dark ? UIColor(hex6: 0x81C784) : UIColor(hex6: 0x66BB6A)
    })

    static let levelMiddle = Color(UIColor { tc in
        tc.userInterfaceStyle == .dark ? UIColor(hex6: 0x64B5F6) : UIColor(hex6: 0x42A5F5)
    })

    static let levelHigh = Color(UIColor { tc in
        tc.userInterfaceStyle == .dark ? UIColor(hex6: 0xFF8A65) : UIColor(hex6: 0xFF7043)
    })

    static let levelUniversity = Color(UIColor { tc in
        tc.userInterfaceStyle == .dark ? UIColor(hex6: 0x9575CD) : UIColor(hex6: 0x7E57C2)
    })

    static let levelAdvanced = Color(UIColor { tc in
        tc.userInterfaceStyle == .dark ? UIColor(hex6: 0x4DB6AC) : UIColor(hex6: 0x26A69A)
    })

    // MARK: - Deep space (unchanged, already dark)

    static let apexDeepBackground = Color(hex: "070C1D")
    static let apexDeepSurface = Color(hex: "0E1628")
    static let apexDeepActive = Color(hex: "FF6B35")
    static let apexDeepBrand = Color(hex: "0EC9A0")
    static let apexDeepStar = Color(hex: "3B8DE0")

    // MARK: - Rainbow accent palette (brighter in dark)

    static let rainbowRed = Color(UIColor { tc in
        tc.userInterfaceStyle == .dark ? UIColor(hex6: 0xFF8A65) : UIColor(hex6: 0xFF7043)
    })
    static let rainbowOrange = Color(UIColor { tc in
        tc.userInterfaceStyle == .dark ? UIColor(hex6: 0xFFB74D) : UIColor(hex6: 0xFFA726)
    })
    static let rainbowYellow = Color(UIColor { tc in
        tc.userInterfaceStyle == .dark ? UIColor(hex6: 0xFFF176) : UIColor(hex6: 0xFFEE58)
    })
    static let rainbowGreen = Color(UIColor { tc in
        tc.userInterfaceStyle == .dark ? UIColor(hex6: 0x81C784) : UIColor(hex6: 0x66BB6A)
    })
    static let rainbowTeal = Color(UIColor { tc in
        tc.userInterfaceStyle == .dark ? UIColor(hex6: 0x4DB6AC) : UIColor(hex6: 0x26A69A)
    })
    static let rainbowBlue = Color(UIColor { tc in
        tc.userInterfaceStyle == .dark ? UIColor(hex6: 0x64B5F6) : UIColor(hex6: 0x42A5F5)
    })
    static let rainbowIndigo = Color(UIColor { tc in
        tc.userInterfaceStyle == .dark ? UIColor(hex6: 0x7986CB) : UIColor(hex6: 0x5C6BC0)
    })
    static let rainbowPurple = Color(UIColor { tc in
        tc.userInterfaceStyle == .dark ? UIColor(hex6: 0xBA68C8) : UIColor(hex6: 0xAB47BC)
    })

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

// MARK: - UIColor hex helper for adaptive colors

extension UIColor {
    convenience init(hex6: UInt32) {
        self.init(
            red:   CGFloat((hex6 >> 16) & 0xFF) / 255,
            green: CGFloat((hex6 >> 8)  & 0xFF) / 255,
            blue:  CGFloat( hex6        & 0xFF) / 255,
            alpha: 1
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
