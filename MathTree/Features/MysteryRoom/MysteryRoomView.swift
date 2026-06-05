import SwiftUI

struct MysteryRoomView: View {
    @State private var mysteries: [MathMystery] = SampleData.mysteries
    @State private var selectedCategory: MysteryCategory?
    @State private var showStats = false

    var filteredMysteries: [MathMystery] {
        if let cat = selectedCategory {
            return mysteries.filter { $0.category == cat }
        }
        return mysteries
    }

    var totalVotes: Int {
        mysteries.reduce(0) { $0 + $1.votes.agreeCount + $1.votes.disagreeCount }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                mysteryHeader
                statsBanner
                categoryFilter
                popularSection
                mysteryGrid
            }
            .padding(.horizontal, 20)
            .padding(.top, 12)
            .readableContentWidth()
        }
        .background(Color.mysteryBackground)
        .navigationTitle("数学发现")
    }

    private var mysteryHeader: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .center, spacing: 12) {
                ZStack {
                    Circle()
                        .fill(Color.apexMystery.opacity(0.15))
                        .frame(width: 48, height: 48)
                    Image(systemName: "sparkles")
                        .foregroundColor(.apexMystery)
                        .font(.title)
                }
                VStack(alignment: .leading, spacing: 4) {
                    Text("数学发现之旅")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    Text("探索数学中最令人惊叹的谜题与悖论")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Spacer()
                Button {
                    withAnimation { showStats.toggle() }
                } label: {
                    Image(systemName: showStats ? "chevron.down" : "bar.chart.2")
                        .font(.title)
                        .foregroundColor(.apexMystery)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(
            LinearGradient(
                colors: [Color.apexMystery.opacity(0.12), Color.mysteryBackground],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(24)
        .shadow(color: Color.apexMystery.opacity(0.1), radius: 12, y: 4)
    }

    private var statsBanner: some View {
        if showStats {
            return AnyView(
                HStack(spacing: 16) {
                    StatCard(value: "\(mysteries.count)", label: "悬案数量", color: .apexMystery)
                    StatCard(value: "\(totalVotes / 1000)K+", label: "讨论人数", color: .apexStarBlue)
                    StatCard(value: "100%", label: "烧脑指数", color: .apexGold)
                }
                .transition(.opacity.animation(.easeInOut(duration: 0.3)))
            )
        }
        return AnyView(EmptyView())
    }

    private var categoryFilter: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                CategoryChip(title: "全部悬案", icon: "sparkles", isSelected: selectedCategory == nil, color: .apexMystery) {
                    selectedCategory = nil
                }
                ForEach(MysteryCategory.allCases, id: \.self) { cat in
                    CategoryChip(title: cat.displayName, icon: cat.icon, isSelected: selectedCategory == cat, color: cat.color) {
                        selectedCategory = cat
                    }
                }
            }
        }
    }

    private var popularSection: some View {
        if let topMystery = filteredMysteries.max(by: { ($0.votes.agreeCount + $0.votes.disagreeCount) < ($1.votes.agreeCount + $1.votes.disagreeCount) }) {
            return AnyView(
                NavigationLink {
                    MysteryDetailView(mystery: topMystery)
                } label: {
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("🔥 本周最热")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.apexLava)
                            Spacer()
                            Image(systemName: "trending.up")
                                .font(.caption)
                                .foregroundColor(.apexLava)
                        }
                        
                        Text(topMystery.title)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        Text(topMystery.summary)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        HStack(spacing: 16) {
                            HStack(spacing: 4) {
                                Image(systemName: "thumbsup")
                                    .font(.caption)
                                    .foregroundColor(.apexEmerald)
                                Text("\(topMystery.votes.agreeCount)")
                                    .font(.caption)
                                    .foregroundColor(.apexEmerald)
                            }
                            HStack(spacing: 4) {
                                Image(systemName: "thumbsdown")
                                    .font(.caption)
                                    .foregroundColor(.apexDanger)
                                Text("\(topMystery.votes.disagreeCount)")
                                    .font(.caption)
                                    .foregroundColor(.apexDanger)
                            }
                            Spacer()
                            Text("查看详情")
                                .font(.caption)
                                .foregroundColor(.apexMystery)
                        }
                    }
                    .padding(20)
                    .background(
                        LinearGradient(
                            colors: [Color.apexLava.opacity(0.08), Color.apexCardSurface],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .cornerRadius(20)
                    .shadow(color: Color.apexLava.opacity(0.1), radius: 8, y: 4)
                }
            )
        }
        return AnyView(EmptyView())
    }

    private var mysteryGrid: some View {
        LazyVGrid(columns: [GridItem(.flexible())], spacing: 16) {
            ForEach(filteredMysteries) { mystery in
                NavigationLink {
                    MysteryDetailView(mystery: mystery)
                } label: {
                    MysteryCard(mystery: mystery)
                }
            }
        }
    }
}

struct CategoryChip: View {
    let title: String
    let icon: String
    let isSelected: Bool
    let color: Color
    let action: () -> Void

    init(title: String, icon: String, isSelected: Bool, color: Color = .apexMystery, action: @escaping () -> Void) {
        self.title = title
        self.icon = icon
        self.isSelected = isSelected
        self.color = color
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.caption)
                Text(title)
                    .font(.caption)
                    .fontWeight(.medium)
            }
            .foregroundColor(isSelected ? .white : color)
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background(isSelected ? color : color.opacity(0.1))
            .cornerRadius(20)
            .shadow(color: isSelected ? color.opacity(0.3) : .clear, radius: 4, y: 2)
        }
    }
}

struct StatCard: View {
    let value: String
    let label: String
    let color: Color

    var body: some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(color)
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color.apexCardSurface)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 4, y: 2)
    }
}

struct MysteryCard: View {
    let mystery: MathMystery

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(mystery.category.displayName)
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundColor(.apexMystery)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.apexMystery.opacity(0.1))
                    .cornerRadius(8)

                Spacer()

                shockRating
            }

            Text(mystery.title)
                .font(.headline)
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)

            Text(mystery.summary)
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
                .lineLimit(2)

            HStack {
                Image(systemName: "person.2.fill")
                    .font(.caption2)
                    .foregroundColor(.secondary)
                Text("\(mystery.votes.agreeCount + mystery.votes.disagreeCount) 人参与讨论")
                    .font(.caption2)
                    .foregroundColor(.secondary)
                Spacer()
                Text("查看详情")
                    .font(.caption2)
                    .foregroundColor(.apexMystery)
                Image(systemName: "chevron.right")
                    .font(.caption2)
                    .foregroundColor(.apexMystery)
            }
        }
        .padding(20)
        .background(Color.apexCardSurface)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }

    private var shockRating: some View {
        HStack(spacing: 2) {
            ForEach(0..<min(mystery.shockRating, 10), id: \.self) { _ in
                Image(systemName: "star.fill")
                    .font(.system(size: 8))
                    .foregroundColor(.apexGold)
            }
        }
    }
}
