import SwiftUI

struct MysteryRoomView: View {
    @State private var mysteries: [MathMystery] = SampleData.mysteries
    @State private var selectedCategory: MysteryCategory?

    var filteredMysteries: [MathMystery] {
        if let cat = selectedCategory {
            return mysteries.filter { $0.category == cat }
        }
        return mysteries
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    mysteryHeader
                    categoryFilter

                    ForEach(filteredMysteries) { mystery in
                        NavigationLink {
                            MysteryDetailView(mystery: mystery)
                        } label: {
                            MysteryCard(mystery: mystery)
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 12)
            }
            .background(Color.mysteryBackground)
            .navigationTitle("发现")
        }
    }

    private var mysteryHeader: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "puzzlepiece.fill")
                    .foregroundColor(.apexMystery)
                    .font(.title2)
                Text("数学悬案")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            Text("数学史上最惊人的争议、悖论与未解之谜")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(
            LinearGradient(
                colors: [Color.apexMystery.opacity(0.1), Color.mysteryBackground],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(20)
    }

    private var categoryFilter: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                CategoryChip(title: "全部", icon: "square.grid.2x2", isSelected: selectedCategory == nil) {
                    selectedCategory = nil
                }
                ForEach(MysteryCategory.allCases, id: \.self) { cat in
                    CategoryChip(title: cat.displayName, icon: cat.icon, isSelected: selectedCategory == cat) {
                        selectedCategory = cat
                    }
                }
            }
        }
    }
}

struct CategoryChip: View {
    let title: String
    let icon: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.caption)
                Text(title)
                    .font(.caption)
                    .fontWeight(.medium)
            }
            .foregroundColor(isSelected ? .white : .apexMystery)
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background(isSelected ? Color.apexMystery : Color.apexMystery.opacity(0.1))
            .cornerRadius(20)
        }
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
