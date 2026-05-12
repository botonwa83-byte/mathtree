import SwiftUI

struct BattlefieldView: View {
    @State private var problems: [Problem] = SampleData.problems
    @State private var currentIndex = 0
    @State private var showSolution = false
    @State private var selectedAnswer: String?
    @State private var selectedTopic: FormulaCategory?
    @State private var showDualView = false
    @State private var showDescendAnimation = false

    var filteredProblems: [Problem] {
        if let topic = selectedTopic {
            // In a real app, this would filter by problem tags/formulas
            return problems.filter { $0.tags.contains(topic.displayName) || topic == .calculus } 
        }
        return problems
    }

    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    VStack(spacing: 20) {
                        battleHeader
                        topicSelector

                        if !filteredProblems.isEmpty {
                            problemCard

                            if showDualView, let dual = filteredProblems[currentIndex].dualSolution {
                                dualSolutionView(dual)
                            }

                            if showSolution {
                                nextProblemButton
                            }
                        } else {
                            emptyState
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 12)
                }
                .background(Color.apexBackground)
                .navigationTitle("战场")

                if showDescendAnimation {
                    DescendAnimationView(
                        title: "维度拉升",
                        subtitle: "目标：\(filteredProblems[currentIndex].dualSolution?.weaponUsed ?? "高维武器")",
                        isPresented: $showDescendAnimation
                    )
                    .transition(.opacity)
                    .zIndex(100)
                }
            }
        }
    }

    private var nextProblemButton: some View {
        Button {
            withAnimation {
                goToNextProblem()
            }
        } label: {
            HStack {
                Image(systemName: "arrow.right.circle.fill")
                Text("下一题")
            }
            .font(.subheadline)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(Color.apexEmerald)
            .cornerRadius(16)
        }
        .padding(.top, 8)
    }

    private func goToNextProblem() {
        selectedAnswer = nil
        showSolution = false
        showDualView = false
        if currentIndex < filteredProblems.count - 1 {
            currentIndex += 1
        } else {
            currentIndex = 0
        }
    }

    private var battleHeader: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("实战训练")
                    .font(.headline)
                    .foregroundColor(.primary)
                Text("用高阶思维，精准打击薄弱环节")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
            HStack(spacing: 4) {
                Text("\(currentIndex + 1)")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.apexLava)
                Text("/ \(filteredProblems.count)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding(24)
        .background(Color.apexCardSurface)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }

    private var topicSelector: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                TopicChip(title: "全部今日", isSelected: selectedTopic == nil) {
                    selectedTopic = nil
                    currentIndex = 0
                }
                ForEach(FormulaCategory.allCases, id: \.self) { topic in
                    TopicChip(title: topic.displayName, isSelected: selectedTopic == topic) {
                        selectedTopic = topic
                        currentIndex = 0
                    }
                }
            }
        }
    }

    private var problemCard: some View {
        let problem = filteredProblems[currentIndex]
        return VStack(alignment: .leading, spacing: 20) {
            HStack {
                Label("难度", systemImage: "chart.bar.fill")
                    .font(.caption)
                    .foregroundColor(.secondary)
                DifficultyBar(level: problem.difficulty)
                Spacer()
                if let year = problem.gaokaoYear {
                    Text("\(year)年高考")
                        .font(.caption)
                        .foregroundColor(.apexLava)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.apexLava.opacity(0.1))
                        .cornerRadius(8)
                }
            }

            Text(problem.content)
                .font(.body)
                .foregroundColor(.primary)
                .lineSpacing(8)

            if let latex = problem.contentLatex {
                FormulaView(latex: latex, fontSize: 20)
                    .frame(height: 60)
            }

            if let options = problem.options {
                VStack(spacing: 12) {
                    ForEach(Array(options.enumerated()), id: \.offset) { index, option in
                        OptionButton(
                            label: optionLabel(for: index),
                            text: option,
                            isSelected: selectedAnswer == option,
                            isCorrect: showSolution ? option == problem.answer : nil
                        ) {
                            selectedAnswer = option
                        }
                    }
                }
            }

            HStack(spacing: 12) {
                Button {
                    withAnimation { showSolution = true }
                } label: {
                    Text("查看解析")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(Color.apexStarBlue)
                        .cornerRadius(16)
                }

                Button {
                    withAnimation { 
                        showDualView.toggle()
                        if showDualView {
                            showDescendAnimation = true
                        }
                    }
                } label: {
                    HStack {
                        Image(systemName: "bolt.fill")
                        Text("降维秒杀")
                    }
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.apexLava)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(Color.apexLava.opacity(0.1))
                    .cornerRadius(16)
                }
            }

            if showSolution {
                solutionView(problem.solution)
            }
        }
        .padding(24)
        .background(Color.apexCardSurface)
        .cornerRadius(24)
        .shadow(color: .black.opacity(0.05), radius: 10, y: 5)
    }

    private func solutionView(_ solution: SolutionPath) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Divider().background(Color.gray.opacity(0.1))

            HStack {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(.apexGold)
                Text("解题关键")
                    .font(.headline)
                    .foregroundColor(.apexGold)
            }

            Text(solution.keyInsight)
                .font(.subheadline)
                .foregroundColor(.primary.opacity(0.8))
                .lineSpacing(4)

            ForEach(solution.steps) { step in
                HStack(alignment: .top, spacing: 12) {
                    Text("\(step.order)")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 24, height: 24)
                        .background(Color.apexStarBlue)
                        .cornerRadius(12)

                    VStack(alignment: .leading, spacing: 6) {
                        Text(step.description)
                            .font(.subheadline)
                            .foregroundColor(.primary)
                        FormulaView(latex: step.latex, fontSize: 16)
                            .frame(height: 40)
                        Text(step.annotation)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
    }

    private func dualSolutionView(_ dual: DualSolution) -> some View {
        VStack(spacing: 16) {
            HStack {
                Image(systemName: "zap")
                    .foregroundColor(.apexLava)
                Text("降维打击")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.apexLava)
                Spacer()
                Text("\(dual.timeRatio)x 加速")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.apexEmerald)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Color.apexEmerald.opacity(0.1))
                    .cornerRadius(8)
            }

            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "mountain")
                            .foregroundColor(.secondary)
                        Text("常规解法")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                    }
                    Divider().background(Color.gray.opacity(0.1))
                    Text("高中知识")
                        .font(.caption2)
                        .foregroundColor(.apexStarBlue)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.apexStarBlue.opacity(0.1))
                        .cornerRadius(6)
                    Text("思路：\(dual.standardMethod.keyInsight)")
                        .font(.caption)
                        .foregroundColor(.primary)
                        .lineLimit(2)
                    Text("风险：易错")
                        .font(.caption2)
                        .foregroundColor(.apexDanger)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(16)
                .background(Color.white)
                .cornerRadius(16)

                Image(systemName: "arrow.right")
                    .foregroundColor(.apexLava)
                    .padding(.horizontal, 8)

                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "bolt.fill")
                            .foregroundColor(.apexLava)
                        Text("高阶秒杀")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.apexLava)
                    }
                    Divider().background(Color.apexLava.opacity(0.2))
                    Text("高等数学")
                        .font(.caption2)
                        .foregroundColor(.apexLava)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.apexLava.opacity(0.1))
                        .cornerRadius(6)
                    Text("思路：\(dual.descentMethod.keyInsight)")
                        .font(.caption)
                        .foregroundColor(.primary)
                        .lineLimit(2)
                    Text("武器：\(dual.weaponUsed)")
                        .font(.caption2)
                        .foregroundColor(.apexEmerald)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(16)
                .background(Color.apexCardSurface)
                .cornerRadius(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.apexLava.opacity(0.3), lineWidth: 1)
                )
            }

            Text("💡 掌握高等数学思维，可以让你以更高的维度审视问题，实现真正的秒杀！")
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(.horizontal, 8)
                .padding(.vertical, 12)
                .background(Color.apexGold.opacity(0.05))
                .cornerRadius(12)
        }
        .padding(.top, 10)
    }

    private var emptyState: some View {
        VStack(spacing: 20) {
            Image(systemName: "sparkles")
                .font(.system(size: 64))
                .foregroundColor(.apexEmerald.opacity(0.3))
            Text("该领域暂时没有实战题目")
                .font(.headline)
                .foregroundColor(.secondary)
            Button("切换主题") {
                selectedTopic = nil
            }
            .buttonStyle(.bordered)
        }
        .frame(maxWidth: .infinity)
        .padding(60)
    }

    private func optionLabel(for index: Int) -> String {
        let labels = ["A", "B", "C", "D", "E", "F", "G", "H"]
        return index < labels.count ? labels[index] : "\(index + 1)"
    }
}

struct TopicChip: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(isSelected ? .white : .secondary)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(isSelected ? Color.apexLava : Color.white)
                .cornerRadius(20)
                .shadow(color: .black.opacity(isSelected ? 0.1 : 0.02), radius: 4, y: 2)
        }
    }
}

struct DifficultyBar: View {
    let level: Double

    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<5) { i in
                Capsule()
                    .fill(Double(i) / 5.0 < level ? rainbowColor(i) : Color.gray.opacity(0.15))
                    .frame(width: 16, height: 6)
            }
        }
    }

    private func rainbowColor(_ index: Int) -> Color {
        [Color.rainbowGreen, .rainbowTeal, .rainbowBlue, .rainbowOrange, .rainbowRed][index]
    }
}

struct OptionButton: View {
    let label: String
    let text: String
    let isSelected: Bool
    let isCorrect: Bool?
    let action: () -> Void

    var backgroundColor: Color {
        if let correct = isCorrect {
            if isSelected {
                return correct ? Color.apexEmerald.opacity(0.15) : Color.apexDanger.opacity(0.15)
            }
            if correct { return Color.apexEmerald.opacity(0.1) }
        }
        return isSelected ? Color.apexStarBlue.opacity(0.1) : Color.apexBackground.opacity(0.5)
    }

    var borderColor: Color {
        if let correct = isCorrect {
            if isSelected {
                return correct ? .apexEmerald : .apexDanger
            }
            if correct { return .apexEmerald }
        }
        return isSelected ? .apexStarBlue : Color.gray.opacity(0.1)
    }

    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                Text(label)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(isSelected ? .apexStarBlue : .secondary)
                    .frame(width: 32, height: 32)
                    .background(isSelected ? Color.apexStarBlue.opacity(0.2) : Color.white)
                    .cornerRadius(16)

                Text(text)
                    .font(.body)
                    .foregroundColor(.primary)

                Spacer()
            }
            .padding(16)
            .background(backgroundColor)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(borderColor, lineWidth: 1.5)
            )
        }
    }
}
