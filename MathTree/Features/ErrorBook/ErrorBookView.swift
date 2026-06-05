import SwiftUI

struct ErrorBookView: View {
    @StateObject private var practiceManager = PracticeManager.shared
    @State private var groupMode: GroupMode = .time
    @State private var selectedProblem: Problem?

    enum GroupMode: String, CaseIterable, Identifiable {
        case time = "按时间"
        case tag = "按知识点"
        case accuracy = "按正确率"
        var id: String { rawValue }
    }

    private var wrongProblems: [Problem] {
        // 错题本 = 用户手动标注的题(在练习页点"加入错题本"，选择题答错也会自动加入)
        practiceManager.flaggedProblems(from: SampleData.problems)
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color.apexBackground.ignoresSafeArea()

                if wrongProblems.isEmpty && practiceManager.totalAnswered == 0 {
                    emptyStateNoRecords
                } else if wrongProblems.isEmpty {
                    emptyStateAllCorrect
                } else {
                    ScrollView {
                        VStack(spacing: 16) {
                            summaryCard
                            groupModePicker
                            problemList
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 12)
                        .padding(.bottom, 30)
                        .readableContentWidth()
                    }
                }
            }
            .navigationTitle("错题本")
            .sheet(item: $selectedProblem) { problem in
                NavigationStack {
                    ErrorProblemDetailView(problem: problem)
                }
            }
        }
    }

    // MARK: - Summary

    private var summaryCard: some View {
        HStack(spacing: 0) {
            StatItem(value: "\(wrongProblems.count)", label: "错题", color: .apexLava)
            StatItem(value: "\(practiceManager.totalAnswered)", label: "总做题", color: .apexStarBlue)
            StatItem(value: String(format: "%.0f%%", practiceManager.overallAccuracy * 100), label: "正确率", color: practiceManager.overallAccuracy >= 0.6 ? .apexEmerald : .apexLava)
            StatItem(value: "\(practiceManager.todayAnswered)", label: "今日", color: .apexGold)
        }
        .padding(.vertical, 16)
        .background(Color.apexCardSurface)
        .cornerRadius(16)
    }

    private var groupModePicker: some View {
        HStack(spacing: 8) {
            ForEach(GroupMode.allCases) { mode in
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) { groupMode = mode }
                } label: {
                    Text(mode.rawValue)
                        .font(.caption)
                        .fontWeight(groupMode == mode ? .bold : .regular)
                        .foregroundColor(groupMode == mode ? .white : .secondary)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 8)
                        .background(groupMode == mode ? Color.apexLava : Color.apexCardSurface)
                        .cornerRadius(12)
                }
            }
            Spacer()
        }
    }

    // MARK: - Problem List

    private var problemList: some View {
        LazyVStack(spacing: 10) {
            switch groupMode {
            case .time:
                ForEach(wrongProblems) { problem in
                    errorRow(problem: problem)
                }
            case .tag:
                let grouped = groupByTag(wrongProblems)
                ForEach(grouped.keys.sorted(), id: \.self) { tag in
                    Section {
                        ForEach(grouped[tag] ?? []) { problem in
                            errorRow(problem: problem)
                        }
                    } header: {
                        HStack {
                            Text(tag)
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.apexLava)
                            Spacer()
                            Text("\(grouped[tag]?.count ?? 0) 道")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                        }
                        .padding(.top, 8)
                    }
                }
            case .accuracy:
                ForEach(wrongProblems.sorted { p1, p2 in
                    practiceManager.stats(for: p1.id).accuracy < practiceManager.stats(for: p2.id).accuracy
                }) { problem in
                    errorRow(problem: problem)
                }
            }
        }
    }

    private func errorRow(problem: Problem) -> some View {
        let stats = practiceManager.stats(for: problem.id)

        return Button {
            selectedProblem = problem
        } label: {
            VStack(alignment: .leading, spacing: 8) {
                HStack(alignment: .top, spacing: 10) {
                    // Accuracy indicator
                    ZStack {
                        Circle()
                            .stroke(Color.apexLava.opacity(0.2), lineWidth: 3)
                            .frame(width: 36, height: 36)
                        Circle()
                            .trim(from: 0, to: stats.accuracy)
                            .stroke(stats.accuracy >= 0.5 ? Color.apexGold : Color.apexLava, style: StrokeStyle(lineWidth: 3, lineCap: .round))
                            .frame(width: 36, height: 36)
                            .rotationEffect(.degrees(-90))
                        Text(String(format: "%.0f", stats.accuracy * 100))
                            .font(.system(size: 10, weight: .bold, design: .rounded))
                            .foregroundColor(stats.accuracy >= 0.5 ? .apexGold : .apexLava)
                    }

                    VStack(alignment: .leading, spacing: 4) {
                        Text(problem.content.mathPretty)
                            .font(.subheadline)
                            .foregroundColor(.primary)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)

                        HStack(spacing: 8) {
                            Label("\(stats.totalAttempts)次", systemImage: "arrow.counterclockwise")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                            Label(String(format: "%.0fs", stats.averageTime), systemImage: "clock")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                            if let last = stats.lastAttempt {
                                Text(relativeTime(last))
                                    .font(.caption2)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }

                    Spacer()

                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                // Tags
                HStack(spacing: 4) {
                    ForEach(problem.tags.prefix(3), id: \.self) { tag in
                        Text(tag)
                            .font(.system(size: 9))
                            .foregroundColor(.apexMystery)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(Color.apexMystery.opacity(0.1))
                            .cornerRadius(4)
                    }
                    if problem.dualSolution != nil {
                        HStack(spacing: 2) {
                            Image(systemName: "bolt.fill")
                                .font(.system(size: 8))
                            Text("秒杀")
                                .font(.system(size: 9))
                        }
                        .foregroundColor(.apexLava)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Color.apexLava.opacity(0.1))
                        .cornerRadius(4)
                    }
                }
            }
            .padding(14)
            .background(Color.apexCardSurface)
            .cornerRadius(14)
        }
    }

    // MARK: - Empty States

    private var emptyStateNoRecords: some View {
        VStack(spacing: 16) {
            Image(systemName: "pencil.and.list.clipboard")
                .font(.system(size: 48))
                .foregroundColor(.secondary)
            Text("错题本是空的")
                .font(.headline)
                .foregroundColor(.primary)
            Text("在练习页遇到不会或做错的题，点底部『加入错题本』，它就会出现在这里供你复习")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(40)
    }

    private var emptyStateAllCorrect: some View {
        VStack(spacing: 16) {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 48))
                .foregroundColor(.apexEmerald)
            Text("错题本是空的")
                .font(.headline)
                .foregroundColor(.primary)
            Text("在练习页点『加入错题本』标记需要复习的题，集中攻克薄弱点")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(40)
    }

    // MARK: - Helpers

    private func groupByTag(_ problems: [Problem]) -> [String: [Problem]] {
        var result: [String: [Problem]] = [:]
        for problem in problems {
            let tag = problem.tags.first ?? "未分类"
            result[tag, default: []].append(problem)
        }
        return result
    }

    private func relativeTime(_ date: Date) -> String {
        let interval = Date().timeIntervalSince(date)
        if interval < 60 { return "刚刚" }
        if interval < 3600 { return "\(Int(interval / 60))分钟前" }
        if interval < 86400 { return "\(Int(interval / 3600))小时前" }
        return "\(Int(interval / 86400))天前"
    }
}

// MARK: - Stat Item

private struct StatItem: View {
    let value: String
    let label: String
    let color: Color

    var body: some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(color)
            Text(label)
                .font(.caption2)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Error Problem Detail View

struct ErrorProblemDetailView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var practiceManager = PracticeManager.shared
    let problem: Problem

    @State private var selectedAnswer: String?
    @State private var showSolution = false
    @State private var startTime = Date()

    private var stats: ProblemStats {
        practiceManager.stats(for: problem.id)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Stats header
                statsHeader

                // Problem content
                problemContent

                // Action
                if !showSolution {
                    submitButton
                } else {
                    solutionView
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 12)
            .padding(.bottom, 30)
        }
        .background(Color.apexBackground)
        .navigationTitle("重做错题")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    practiceManager.unflagError(problem.id)
                    dismiss()
                } label: {
                    Label("移出错题本", systemImage: "flag.slash")
                }
                .foregroundColor(.apexEmerald)
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("关闭") { dismiss() }
                    .foregroundColor(.secondary)
            }
        }
        .onAppear { startTime = Date() }
    }

    private var statsHeader: some View {
        HStack(spacing: 16) {
            VStack(spacing: 2) {
                Text("做过")
                    .font(.caption2)
                    .foregroundColor(.secondary)
                Text("\(stats.totalAttempts) 次")
                    .font(.caption)
                    .fontWeight(.bold)
            }
            VStack(spacing: 2) {
                Text("正确率")
                    .font(.caption2)
                    .foregroundColor(.secondary)
                Text(String(format: "%.0f%%", stats.accuracy * 100))
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(stats.accuracy >= 0.5 ? .apexEmerald : .apexLava)
            }
            VStack(spacing: 2) {
                Text("平均用时")
                    .font(.caption2)
                    .foregroundColor(.secondary)
                Text(String(format: "%.0fs", stats.averageTime))
                    .font(.caption)
                    .fontWeight(.bold)
            }
            Spacer()
        }
        .padding(14)
        .background(Color.apexCardSurface)
        .cornerRadius(12)
    }

    private var problemContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                DifficultyBar(level: problem.difficulty)
                Spacer()
                ForEach(problem.tags.prefix(2), id: \.self) { tag in
                    Text(tag)
                        .font(.caption2)
                        .foregroundColor(.apexMystery)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Color.apexMystery.opacity(0.1))
                        .cornerRadius(4)
                }
            }

            Text(problem.content.mathPretty)
                .font(.body)
                .foregroundColor(.primary)
                .lineSpacing(6)

            if let latex = problem.contentLatex {
                FormulaView(latex: latex, fontSize: 15)
            }

            if let options = problem.options {
                VStack(spacing: 8) {
                    ForEach(Array(options.enumerated()), id: \.offset) { index, option in
                        let labels = ["A", "B", "C", "D", "E", "F"]
                        OptionButton(
                            label: index < labels.count ? labels[index] : "\(index + 1)",
                            text: option,
                            isSelected: selectedAnswer == option,
                            isCorrect: showSolution ? option == problem.answer : nil
                        ) {
                            if !showSolution { selectedAnswer = option }
                        }
                    }
                }
            }
        }
        .padding(16)
        .background(Color.apexCardSurface)
        .cornerRadius(16)
    }

    @ViewBuilder
    private var submitButton: some View {
        if problem.options != nil {
            // 选择题：选项判分
            Button {
                let timeSpent = Date().timeIntervalSince(startTime)
                let isCorrect = selectedAnswer == problem.answer
                practiceManager.recordAnswer(
                    problemId: problem.id,
                    isCorrect: isCorrect,
                    userAnswer: selectedAnswer ?? "",
                    timeSpent: timeSpent,
                    usedHint: false
                )
                withAnimation { showSolution = true }
            } label: {
                Text(selectedAnswer != nil ? "提交答案" : "选择一个答案")
                    .font(.subheadline).fontWeight(.bold).foregroundColor(.white)
                    .frame(maxWidth: .infinity).padding(.vertical, 14)
                    .background(selectedAnswer != nil ? Color.apexStarBlue : Color.gray)
                    .cornerRadius(12)
            }
            .disabled(selectedAnswer == nil)
        } else {
            // 填空/计算/证明题：无法自动判分，直接查看答案与解析
            Button {
                withAnimation { showSolution = true }
            } label: {
                Text("查看答案与解析")
                    .font(.subheadline).fontWeight(.bold).foregroundColor(.white)
                    .frame(maxWidth: .infinity).padding(.vertical, 14)
                    .background(Color.apexStarBlue).cornerRadius(12)
            }
        }
    }

    private var solutionView: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Result banner
            if problem.options != nil {
                // 选择题：判对错
                let isCorrect = selectedAnswer == problem.answer
                HStack(spacing: 8) {
                    Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .font(.title2)
                        .foregroundColor(isCorrect ? .apexEmerald : .apexLava)
                    VStack(alignment: .leading, spacing: 2) {
                        Text(isCorrect ? "回答正确!" : "回答错误")
                            .font(.headline)
                            .foregroundColor(isCorrect ? .apexEmerald : .apexLava)
                        if !isCorrect {
                            Text("正确答案: \(problem.answer.mathPretty)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    Spacer()
                }
                .padding(14)
                .background((isCorrect ? Color.apexEmerald : Color.apexLava).opacity(0.1))
                .cornerRadius(12)
            } else {
                // 非选择题：只给参考答案，对错自评
                HStack(spacing: 8) {
                    Image(systemName: "key.fill")
                        .font(.title3).foregroundColor(.apexGold)
                    VStack(alignment: .leading, spacing: 2) {
                        Text("参考答案").font(.subheadline).fontWeight(.bold).foregroundColor(.apexGold)
                        Text(problem.answer.mathPretty).font(.subheadline).foregroundColor(.primary)
                    }
                    Spacer()
                }
                .padding(14)
                .background(Color.apexGold.opacity(0.1))
                .cornerRadius(12)
            }

            // Solution steps
            VStack(alignment: .leading, spacing: 10) {
                Text("解题步骤")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.apexStarBlue)

                ForEach(problem.solution.steps) { step in
                    HStack(alignment: .top, spacing: 8) {
                        Text("\(step.order)")
                            .font(.caption2)
                            .fontWeight(.bold)
                            .foregroundColor(.apexStarBlue)
                            .frame(width: 22, height: 22)
                            .background(Color.apexStarBlue.opacity(0.15))
                            .cornerRadius(11)
                        VStack(alignment: .leading, spacing: 4) {
                            Text(step.description.mathPretty)
                                .font(.subheadline)
                                .foregroundColor(.primary)
                            FormulaView(latex: step.latex, fontSize: 14)
                        }
                    }
                }
            }
            .padding(14)
            .background(Color.apexCardSurface)
            .cornerRadius(12)

            // Shortcut solution
            if let dual = problem.dualSolution {
                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 6) {
                        Image(systemName: "bolt.fill")
                            .foregroundColor(.apexLava)
                        Text("秒杀解法: \(dual.weaponUsed)")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.apexLava)
                        Spacer()
                        Text("\(String(format: "%.0f", dual.timeRatio))x")
                            .font(.caption)
                            .fontWeight(.black)
                            .foregroundColor(.apexGold)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(Color.apexGold.opacity(0.15))
                            .cornerRadius(4)
                    }
                    ForEach(dual.descentMethod.steps) { step in
                        HStack(alignment: .top, spacing: 8) {
                            Text("\(step.order)")
                                .font(.caption2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(width: 22, height: 22)
                                .background(Color.apexLava)
                                .cornerRadius(11)
                            VStack(alignment: .leading, spacing: 4) {
                                Text(step.description.mathPretty)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                                FormulaView(latex: step.latex, fontSize: 14)
                            }
                        }
                    }
                }
                .padding(14)
                .background(Color.apexCardSurface)
                .cornerRadius(12)
            }

            // Redo button
            Button {
                selectedAnswer = nil
                showSolution = false
                startTime = Date()
            } label: {
                HStack(spacing: 6) {
                    Image(systemName: "arrow.counterclockwise")
                    Text("再做一次")
                }
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.apexStarBlue)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .background(Color.apexStarBlue.opacity(0.1))
                .cornerRadius(12)
            }
        }
    }
}
