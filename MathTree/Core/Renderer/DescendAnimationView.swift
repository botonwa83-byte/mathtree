import SwiftUI

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
            Color.apexDeepBackground.ignoresSafeArea()
            
            // Background Stars / Particles
            ForEach(0..<20) { _ in
                Circle()
                    .fill(Color.white)
                    .frame(width: CGFloat.random(in: 1...3))
                    .position(x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                              y: CGFloat.random(in: 0...UIScreen.main.bounds.height))
                    .opacity(Double.random(in: 0.1...0.5))
            }

            VStack(spacing: 30) {
                // The problem "shrinking" as we move up
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.apexDeepActive, lineWidth: 2)
                        .frame(width: 100, height: 60)
                    Text("题目")
                        .font(.caption)
                        .foregroundColor(.apexDeepActive)
                }
                .scaleEffect(scale)
                .opacity(opacity)
                .offset(y: yOffset)

                if showText {
                    VStack(spacing: 12) {
                        Text(title)
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        
                        Text(subtitle)
                            .font(.headline)
                            .foregroundColor(.apexDeepBrand)
                        
                        Text("— 从高维度俯瞰，此题显然 —")
                            .font(.caption)
                            .foregroundColor(.apexDeepStar)
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
