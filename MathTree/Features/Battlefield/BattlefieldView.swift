import SwiftUI

struct BattlefieldView: View {
    @State private var problems: [Problem] = []
    @State private var currentIndex = 0
    @State private var showSolution = false
    @State private var selectedAnswer: String?

    @State private var showDualView = false
    @State private var showDescendAnimation = false

    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    VStack(spacing: 20) {
                        battleHeader

                        if !problems.isEmpty {
                            problemCard

                            if showDualView, let dual = problems[currentIndex].dualSolution {
                                dualSolutionView(dual)
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
                        subtitle: "目标：\(problems[currentIndex].dualSolution?.weaponUsed ?? "高维武器")",
                        isPresented: $showDescendAnimation
                    )
                    .transition(.opacity)
                    .zIndex(100)
                }
            }
            .onAppear { loadProblems() }
        }
    }

    private var battleHeader: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("今日高考题")
                    .font(.headline)
                    .foregroundColor(.primary)
                Text("用降维工具秒杀高考题")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
            HStack(spacing: 4) {
                Text("\(currentIndex + 1)")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.apexLava)
                Text("/ \(problems.count)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding(20)
        .background(Color.apexCardSurface)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }

    private var problemCard: some View {
        let problem = problems[currentIndex]
        return VStack(alignment: .leading, spacing: 16) {
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
                .lineSpacing(6)

            if let latex = problem.contentLatex {
                FormulaView(latex: latex, fontSize: 20)
                    .frame(height: 60)
            }

            if let options = problem.options {
                VStack(spacing: 10) {
                    ForEach(Array(options.enumerated()), id: \.offset) { index, option in
                        OptionButton(
                            label: ["A", "B", "C", "D"][index],
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
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(Color.apexStarBlue)
                        .cornerRadius(14)
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
                        Image(systemName: "arrow.up.right.and.arrow.down.left.rectangle")
                        Text("对比解法")
                    }
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.apexLava)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(Color.apexLava.opacity(0.1))
                    .cornerRadius(14)
                }
            }

            if showSolution {
                solutionView(problem.solution)
            }
        }
        .padding(20)
        .background(Color.apexCardSurface)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }

    private func solutionView(_ solution: SolutionPath) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Divider().background(Color.gray.opacity(0.1))

            HStack {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(.apexGold)
                Text("解题关键")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.apexGold)
            }

            Text(solution.keyInsight)
                .font(.subheadline)
                .foregroundColor(.primary)

            ForEach(solution.steps) { step in
                HStack(alignment: .top, spacing: 12) {
                    Text("\(step.order)")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 24, height: 24)
                        .background(Color.apexStarBlue)
                        .cornerRadius(12)

                    VStack(alignment: .leading, spacing: 4) {
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
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("常规解法")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                    Text("高中标准做法")
                        .font(.caption2)
                        .foregroundColor(.secondary.opacity(0.7))
                    Divider().background(Color.gray.opacity(0.1))
                    Text("步骤：\(dual.standardMethod.steps.count)步")
                        .font(.caption)
                        .foregroundColor(.primary)
                    Text("风险：易出错")
                        .font(.caption)
                        .foregroundColor(.apexDanger)
                }
                .frame(maxWidth: .infinity)
                .padding(16)

                Rectangle()
                    .fill(Color.gray.opacity(0.1))
                    .frame(width: 1)

                VStack(alignment: .leading, spacing: 8) {
                    Text("降维解法")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.apexLava)
                    Text("高阶工具秒杀")
                        .font(.caption2)
                        .foregroundColor(.apexLava.opacity(0.7))
                    Divider().background(Color.gray.opacity(0.1))
                    Text("步骤：\(dual.descentMethod.steps.count)步")
                        .font(.caption)
                        .foregroundColor(.primary)
                    Text("风险：几乎为零")
                        .font(.caption)
                        .foregroundColor(.apexEmerald)
                }
                .frame(maxWidth: .infinity)
                .padding(16)
            }
            .background(Color.apexCardSurface)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.apexLava.opacity(0.2), lineWidth: 1)
            )
            .shadow(color: .black.opacity(0.04), radius: 6, y: 3)
        }
    }

    private var emptyState: some View {
        VStack(spacing: 16) {
            Image(systemName: "sparkles")
                .font(.system(size: 48))
                .foregroundColor(.apexEmerald)
            Text("正在加载题目...")
                .font(.headline)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(40)
    }

    private func loadProblems() {
        problems = SampleData.problems
    }
}

struct DifficultyBar: View {
    let level: Double

    var body: some View {
        HStack(spacing: 3) {
            ForEach(0..<5) { i in
                Capsule()
                    .fill(Double(i) / 5.0 < level ? rainbowColor(i) : Color.gray.opacity(0.15))
                    .frame(width: 14, height: 5)
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
                return correct ? Color.apexEmerald.opacity(0.12) : Color.apexDanger.opacity(0.12)
            }
            if correct { return Color.apexEmerald.opacity(0.08) }
        }
        return isSelected ? Color.apexStarBlue.opacity(0.1) : Color.apexBackground
    }

    var borderColor: Color {
        if let correct = isCorrect {
            if isSelected {
                return correct ? .apexEmerald : .apexDanger
            }
            if correct { return .apexEmerald }
        }
        return isSelected ? .apexStarBlue : Color.gray.opacity(0.2)
    }

    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Text(label)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(isSelected ? .apexStarBlue : .secondary)
                    .frame(width: 28, height: 28)
                    .background(isSelected ? Color.apexStarBlue.opacity(0.12) : Color.clear)
                    .cornerRadius(14)

                Text(text)
                    .font(.subheadline)
                    .foregroundColor(.primary)

                Spacer()
            }
            .padding(14)
            .background(backgroundColor)
            .cornerRadius(14)
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(borderColor, lineWidth: 1)
            )
        }
    }
}
