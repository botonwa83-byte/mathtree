import SwiftUI

struct FormulaUniverseView: View {
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

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    universeHeader
                    levelFilter
                    categoryFilter

                    ForEach(filteredFormulas) { formula in
                        NavigationLink {
                            FormulaDetailView(formula: formula)
                        } label: {
                            FormulaCard(formula: formula)
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 12)
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
        .padding(20)
        .background(
            LinearGradient(
                colors: [Color.apexStarBlue.opacity(0.2), Color.apexBackground],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(20)
    }

    private var levelFilter: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
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
            HStack(spacing: 10) {
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
        case .elementary: return .orange
        case .middle: return .green
        case .high: return .purple
        case .university: return .apexGold
        case .advanced: return .red
        }
    }
}

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
                .padding(.horizontal, 14)
                .padding(.vertical, 8)
                .background(isSelected ? color.opacity(0.8) : color.opacity(0.15))
                .cornerRadius(20)
        }
    }
}

struct FormulaCard: View {
    let formula: Formula

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(formula.level.displayName)
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundColor(levelColor)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
                    .background(levelColor.opacity(0.15))
                    .cornerRadius(6)

                Text(formula.category.displayName)
                    .font(.caption2)
                    .foregroundColor(.secondary)

                Spacer()

                if formula.leapfrogKey {
                    Image(systemName: "bolt.fill")
                        .font(.caption)
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

            Text(formula.name)
                .font(.headline)
                .foregroundColor(.primary)

            FormulaView(latex: formula.latex, fontSize: 18)
                .frame(height: 44)

            Text(formula.intuition)
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(2)

            if !formula.tags.isEmpty {
                HStack(spacing: 6) {
                    ForEach(formula.tags.prefix(3), id: \.self) { tag in
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
        }
        .padding(20)
        .background(Color.apexCardSurface)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }

    private var levelColor: Color {
        switch formula.level {
        case .elementary: return .orange
        case .middle: return .green
        case .high: return .purple
        case .university: return .apexGold
        case .advanced: return .red
        }
    }
}
