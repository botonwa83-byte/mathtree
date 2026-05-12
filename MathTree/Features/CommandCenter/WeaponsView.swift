import SwiftUI

struct WeaponsView: View {
    @State private var weapons: [DescendWeapon] = SampleData.weapons
    @State private var selectedWeapon: DescendWeapon?

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                weaponsHeader

                ForEach(weapons) { weapon in
                    WeaponCard(weapon: weapon) {
                        selectedWeapon = weapon
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 12)
        }
        .background(Color.apexBackground)
        .sheet(item: $selectedWeapon) { weapon in
            WeaponDetailSheet(weapon: weapon)
        }
    }

    private var weaponsHeader: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "shield.fill")
                    .foregroundColor(.apexLava)
                    .font(.title2)
                Text("兵器库")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            Text("降维武器系统 — 用高阶工具秒杀高考题")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(
            LinearGradient(
                colors: [Color.apexLava.opacity(0.2), Color.apexBackground],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(20)
    }
}

struct WeaponCard: View {
    let weapon: DescendWeapon
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 14) {
                HStack {
                    Text(weapon.tier.displayName)
                        .font(.caption2)
                        .fontWeight(.bold)
                        .foregroundColor(.apexLava)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 3)
                        .background(Color.apexLava.opacity(0.1))
                        .cornerRadius(6)

                    Spacer()

                    masteryBadge
                }

                HStack(spacing: 12) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(weaponGlow.opacity(0.15))
                            .frame(width: 56, height: 56)
                        Image(systemName: weaponIcon)
                            .font(.title2)
                            .foregroundColor(weaponGlow)
                    }

                    VStack(alignment: .leading, spacing: 4) {
                        Text(weapon.codename)
                            .font(.headline)
                            .foregroundColor(.primary)
                        Text(weapon.name)
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text(weapon.tagline)
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .lineLimit(2)
                    }
                }

                HStack {
                    Image(systemName: "target")
                        .font(.caption2)
                        .foregroundColor(.apexEmerald)
                    Text("可秒杀：\(weapon.slayableGaokaoTypes.joined(separator: "、"))")
                        .font(.caption2)
                        .foregroundColor(.apexEmerald)
                        .lineLimit(1)
                }
            }
            .padding(20)
            .background(Color.apexCardSurface)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(weapon.masteryLevel != .locked ? weaponGlow.opacity(0.2) : Color.clear, lineWidth: 1)
            )
        }
    }

    private var weaponGlow: Color {
        switch weapon.masteryLevel {
        case .locked: return .gray
        case .beginner: return .apexStarBlue
        case .proficient: return .apexEmerald
        case .master: return .apexLava
        case .legend: return .apexGold
        }
    }

    private var weaponIcon: String {
        switch weapon.id {
        case "derivative_blade": return "function"
        case "euler_prism": return "rotate.3d"
        case "matrix_cannon": return "square.grid.3x3"
        case "generating_gun": return "wand.and.stars"
        default: return "bolt.fill"
        }
    }

    private var masteryBadge: some View {
        Text(weapon.masteryLevel.displayName)
            .font(.caption2)
            .fontWeight(.medium)
            .foregroundColor(weapon.masteryLevel == .locked ? .gray : weaponGlow)
            .padding(.horizontal, 8)
            .padding(.vertical, 3)
            .background(weapon.masteryLevel == .locked ? Color.gray.opacity(0.1) : weaponGlow.opacity(0.15))
            .cornerRadius(6)
    }
}

struct WeaponDetailSheet: View {
    let weapon: DescendWeapon
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    principleSection
                    demonstrationSection
                    unlockSection
                }
                .padding(.horizontal, 20)
                .padding(.top, 12)
                .padding(.bottom, 40)
            }
            .background(Color.apexBackground)
            .navigationTitle(weapon.codename)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("关闭") { dismiss() }
                        .foregroundColor(.secondary)
                }
            }
        }
    }

    private var principleSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("武器原理", systemImage: "cpu")
                .font(.headline)
                .foregroundColor(.apexLava)

            Text(weapon.principle)
                .font(.body)
                .foregroundColor(.primary)

            Text(weapon.tagline)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineSpacing(4)
        }
        .padding(20)
        .background(Color.apexCardSurface)
        .cornerRadius(20)
    }

    private var demonstrationSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Label("秒杀演示", systemImage: "bolt.fill")
                .font(.headline)
                .foregroundColor(.apexGold)

            ForEach(weapon.demonstrations) { demo in
                VStack(alignment: .leading, spacing: 12) {
                    Text(demo.problemTitle)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)

                    HStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("常规")
                                .font(.caption2)
                                .fontWeight(.bold)
                                .foregroundColor(.secondary)
                            Text(demo.standardMethod)
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .lineLimit(3)
                            Text("\(demo.standardSteps) 步")
                                .font(.caption)
                                .foregroundColor(.apexDanger)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(12)

                        Rectangle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 1)

                        VStack(alignment: .leading, spacing: 6) {
                            HStack {
                                Text("降维")
                                    .font(.caption2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.apexLava)
                                Text(demo.timeRatio)
                                    .font(.caption2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.apexEmerald)
                            }
                            Text(demo.descentMethod)
                                .font(.caption)
                                .foregroundColor(.primary)
                                .lineLimit(3)
                            Text("\(demo.descentSteps) 步")
                                .font(.caption)
                                .foregroundColor(.apexEmerald)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(12)
                    }
                    .background(Color.apexBackground)
                    .cornerRadius(12)
                }
            }
        }
        .padding(20)
        .background(Color.apexCardSurface)
        .cornerRadius(20)
    }

    private var unlockSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("解锁条件", systemImage: "lock.fill")
                .font(.headline)
                .foregroundColor(.apexStarBlue)

            ForEach(weapon.unlockConditions, id: \.self) { condition in
                HStack(spacing: 8) {
                    Image(systemName: "circle")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    Text(condition)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }
            }

            Divider()

            Label("可秒杀题型", systemImage: "target")
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(.apexEmerald)

            FlowLayout(spacing: 8) {
                ForEach(weapon.slayableGaokaoTypes, id: \.self) { type in
                    Text(type)
                        .font(.caption)
                        .foregroundColor(.apexEmerald)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Color.apexEmerald.opacity(0.1))
                        .cornerRadius(8)
                }
            }
        }
        .padding(20)
        .background(Color.apexCardSurface)
        .cornerRadius(20)
    }
}

struct FlowLayout: Layout {
    var spacing: CGFloat = 8

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = arrange(proposal: proposal, subviews: subviews)
        return result.size
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
