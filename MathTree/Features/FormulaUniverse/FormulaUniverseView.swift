import SwiftUI

struct FormulaUniverseView: View {
    @Environment(\.horizontalSizeClass) private var sizeClass
    @State private var formulas: [Formula] = SampleData.formulas
    @State private var selectedLevel: FormulaLevel?
    @State private var selectedCategory: FormulaCategory?
    @State private var searchText = ""

    var filteredFormulas: [Formula] {
        var result = formulas
        if let level = selectedLevel {
            result = result.filter { $0.level == level }
        }
        if let category = selectedCategory {
            result = result.filter { $0.category == category }
        }
        if !searchText.isEmpty {
            result = result.filter {
                $0.name.localizedCaseInsensitiveContains(searchText) ||
                $0.tags.contains { $0.localizedCaseInsensitiveContains(searchText) }
            }
        }
        return result
    }

    private var isIPad: Bool { sizeClass == .regular }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    universeHeader
                    levelFilter
                    categoryFilter

                    if isIPad {
                        // iPad: 2-column grid
                        LazyVGrid(columns: [
                            GridItem(.flexible(), spacing: 16),
                            GridItem(.flexible(), spacing: 16)
                        ], spacing: 16) {
                            ForEach(filteredFormulas) { formula in
                                NavigationLink {
                                    FormulaDetailView(formula: formula)
                                } label: {
                                    FormulaCard(formula: formula)
                                }
                            }
                        }
                    } else {
                        // iPhone: single column
                        LazyVStack(spacing: 14) {
                            ForEach(filteredFormulas) { formula in
                                NavigationLink {
                                    FormulaDetailView(formula: formula)
                                } label: {
                                    FormulaCard(formula: formula)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, isIPad ? 32 : 16)
                .padding(.top, 12)
                .padding(.bottom, 30)
            }
            .background(Color.apexBackground)
            .navigationTitle("公式")
            .searchable(text: $searchText, prompt: "搜索公式")
        }
    }

    private var universeHeader: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "sparkles")
                    .foregroundColor(.apexStarBlue)
                    .font(.title2)
                Text("知识星图")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            Text("每个公式是一颗恒星，公式间的推导关系是引力连线")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(isIPad ? 24 : 16)
        .background(
            LinearGradient(
                colors: [Color.apexStarBlue.opacity(0.2), Color.apexBackground],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(16)
    }

    private var levelFilter: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                LevelChip(title: "全部", color: .gray, isSelected: selectedLevel == nil) {
                    selectedLevel = nil
                }
                ForEach(FormulaLevel.allCases, id: \.self) { level in
                    LevelChip(
                        title: level.displayName,
                        color: levelColor(level),
                        isSelected: selectedLevel == level
                    ) {
                        selectedLevel = level
                    }
                }
            }
        }
    }

    private var categoryFilter: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                CategoryChip(title: "全部", icon: "square.grid.2x2", isSelected: selectedCategory == nil) {
                    selectedCategory = nil
                }
                ForEach(FormulaCategory.allCases, id: \.self) { cat in
                    CategoryChip(title: cat.displayName, icon: "function", isSelected: selectedCategory == cat) {
                        selectedCategory = cat
                    }
                }
            }
        }
    }

    private func levelColor(_ level: FormulaLevel) -> Color {
        switch level {
        case .elementary: return .levelElementary
        case .middle: return .levelMiddle
        case .high: return .levelHigh
        case .university: return .levelUniversity
        case .advanced: return .levelAdvanced
        }
    }
}

// MARK: - Level Chip

struct LevelChip: View {
    let title: String
    let color: Color
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(isSelected ? .white : color)
                .padding(.horizontal, 12)
                .padding(.vertical, 7)
                .background(isSelected ? color.opacity(0.8) : color.opacity(0.15))
                .cornerRadius(16)
        }
    }
}

// MARK: - Formula Card

struct FormulaCard: View {
    @Environment(\.horizontalSizeClass) private var sizeClass
    let formula: Formula

    private var isIPad: Bool { sizeClass == .regular }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Top row: level badge + category + leapfrog + gaokao
            HStack(spacing: 6) {
                Text(formula.level.displayName)
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundColor(levelColor)
                    .padding(.horizontal, 7)
                    .padding(.vertical, 3)
                    .background(levelColor.opacity(0.15))
                    .cornerRadius(6)

                Text(formula.category.displayName)
                    .font(.caption2)
                    .foregroundColor(.secondary)

                Spacer()

                if formula.leapfrogKey {
                    Image(systemName: "bolt.fill")
                        .font(.caption2)
                        .foregroundColor(.apexGold)
                }

                HStack(spacing: 2) {
                    Image(systemName: "target")
                        .font(.caption2)
                    Text("\(Int(formula.gaokaoRelevance * 100))%")
                        .font(.caption2)
                }
                .foregroundColor(.apexLava)
            }

            // Formula name
            Text(formula.name)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)

            // LaTeX formula
            FormulaView(latex: formula.latex, fontSize: isIPad ? 14 : 12)
                .allowsHitTesting(false)

            // Intuition
            Text(formula.intuition)
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)

            // Tags - wrapped flow layout
            if !formula.tags.isEmpty {
                WrappingHStack(items: Array(formula.tags.prefix(4))) { tag in
                    Text(tag)
                        .font(.caption2)
                        .foregroundColor(.apexStarBlue)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Color.apexStarBlue.opacity(0.1))
                        .cornerRadius(4)
                }
            }
        }
        .padding(isIPad ? 20 : 14)
        .background(Color.apexCardSurface)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }

    private var levelColor: Color {
        switch formula.level {
        case .elementary: return .levelElementary
        case .middle: return .levelMiddle
        case .high: return .levelHigh
        case .university: return .levelUniversity
        case .advanced: return .levelAdvanced
        }
    }
}

// MARK: - Wrapping HStack (Flow Layout)

struct WrappingHStack<Item: Hashable, Content: View>: View {
    let items: [Item]
    let content: (Item) -> Content

    var body: some View {
        // Use a simple HStack with scroll for compatibility
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 6) {
                ForEach(items, id: \.self) { item in
                    content(item)
                }
            }
        }
    }
}
