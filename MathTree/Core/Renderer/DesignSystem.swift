import SwiftUI

// MARK: - 设计系统：统一间距 / 圆角 / 字阶 / 卡片样式
//
// 目的：消除全 app 散落的魔法数字（cornerRadius 16/18/20/22/24、padding 12/14/…/26、
// font.system(size:…) 等），用一套阶梯让排版有节奏、易统一调整。
// 颜色仍走 ThemeColors（apex* / rainbow* / level*）。

/// 间距阶梯（4 的倍数为主）。
enum Spacing {
    static let xs: CGFloat = 4
    static let sm: CGFloat = 8
    static let md: CGFloat = 12
    static let lg: CGFloat = 16
    static let xl: CGFloat = 20
    static let xxl: CGFloat = 28
}

/// 圆角阶梯。卡片统一 card，内部小元素用 chip / inner，品牌大卡用 hero。
enum Radius {
    static let chip: CGFloat = 8     // 标签 / 小药丸
    static let inner: CGFloat = 12   // 卡内子块 / 按钮
    static let card: CGFloat = 20    // 标准卡片
    static let hero: CGFloat = 24    // 品牌大卡（秒杀殿堂等）
}

/// 字阶。语义命名，避免到处 .system(size:)。
enum AppFont {
    static let sectionTitle = Font.headline          // 卡片/区块标题
    static let cardTitle = Font.subheadline.weight(.bold)
    static let body = Font.subheadline
    static let caption = Font.caption
    static let chip = Font.system(size: 11, weight: .semibold)

    /// 大数字（倒计时 / 连击 / 统计）。统一字重与圆角字形。
    static func bigStat(_ size: CGFloat = 30) -> Font {
        .system(size: size, weight: .bold, design: .rounded)
    }
}

/// 卡片阴影（统一一档轻投影）。
extension View {
    func cardShadow() -> some View {
        shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }

    /// 统一的卡片外观：内边距 + 表面色 + 标准圆角 + 轻投影。
    /// 替换全 app 重复的 `.padding(20).background(apexCardSurface).cornerRadius(20).shadow(...)`。
    func cardSurface(padding: CGFloat = Spacing.xl) -> some View {
        self
            .padding(padding)
            .background(Color.apexCardSurface)
            .cornerRadius(Radius.card)
            .cardShadow()
    }
}

// MARK: - 流式布局（标签自动换行）。供公式可秒杀题型、英雄标签等使用。

struct FlowLayout: Layout {
    var spacing: CGFloat = 8

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        arrange(proposal: proposal, subviews: subviews).size
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = arrange(proposal: proposal, subviews: subviews)
        for (index, position) in result.positions.enumerated() {
            subviews[index].place(at: CGPoint(x: bounds.minX + position.x, y: bounds.minY + position.y), proposal: .unspecified)
        }
    }

    private func arrange(proposal: ProposedViewSize, subviews: Subviews) -> (positions: [CGPoint], size: CGSize) {
        let maxWidth = proposal.width ?? .infinity
        var positions: [CGPoint] = []
        var x: CGFloat = 0
        var y: CGFloat = 0
        var rowHeight: CGFloat = 0
        var maxX: CGFloat = 0

        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            if x + size.width > maxWidth, x > 0 {
                x = 0
                y += rowHeight + spacing
                rowHeight = 0
            }
            positions.append(CGPoint(x: x, y: y))
            rowHeight = max(rowHeight, size.height)
            x += size.width + spacing
            maxX = max(maxX, x)
        }

        return (positions, CGSize(width: maxX, height: y + rowHeight))
    }
}
