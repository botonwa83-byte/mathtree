import SwiftUI

struct ReviewView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var scheduler = ReviewScheduler.shared
    @StateObject private var practiceManager = PracticeManager.shared

    @State private var dueProblems: [Problem] = []
    @State private var currentIndex = 0
    @State private var selectedAnswer: String?
    @State private var answerRecorded = false
    @State private var lastAnswerCorrect: Bool?
    @State private var showSolution = false
    @State private var startTime = Date()
    @State private var elapsedTime: TimeInterval = 0
    @State private var timer: Timer?
    @State private var completedCount = 0

    var body: some View {
        NavigationStack {
            ZStack {
                Color.apexBackground.ignoresSafeArea()

                if dueProblems.isEmpty {
                    emptyState
                } else if currentIndex >= dueProblems.count {
                    completionState
                } else {
                    ScrollView {
                        VStack(spacing: 16) {
                            progressHeader
                            problemCard
                            if showSolution {
                                solutionCard
                                nextButton
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 12)
                        .padding(.bottom, 30)
                        .readableContentWidth()
                    }
                }
            }
            .navigationTitle("今日复习")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("关闭") { dismiss() }
                        .foregroundColor(.secondary)
                }
            }
            .onAppear { loadDueProblems(); startTimer() }
            .onDisappear { stopTimer() }
        }
    }

    // MARK: - Progress Header

    private var progressHeader: some View {
        VStack(spacing: 8) {
            HStack {
                Text("复习进度")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Spacer()
                Text("\(currentIndex + 1) / \(dueProblems.count)")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.apexLava)
            }

            // Progress bar
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.gray.opacity(0.15))
                        .frame(height: 6)
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.apexEmerald)
                        .frame(width: geo.size.width * CGFloat(completedCount) / CGFloat(max(dueProblems.count, 1)), height: 6)
                }
            }
            .frame(height: 6)

            HStack(spacing: 16) {
                Label("\(completedCount) 已完成", systemImage: "checkmark.circle")
                    .font(.caption2)
                    .foregroundColor(.apexEmerald)
                Spacer()

                // Timer
                HStack(spacing: 4) {
                    Image(systemName: "clock")
                        .font(.caption2)
                    Text(formatTime(elapsedTime))
                        .font(.system(size: 12, weight: .medium, design: .monospaced))
                }
                .foregroundColor(.secondary)
            }
        }
        .padding(14)
        .background(Color.apexCardSurface)
        .cornerRadius(14)
    }

    // MARK: - Problem Card

    private var problemCard: some View {
        let problem = dueProblems[currentIndex]
        let reviewItem = scheduler.reviewItem(for: problem.id)

        return VStack(alignment: .leading, spacing: 14) {
            // Review info
            HStack(spacing: 8) {
                DifficultyBar(level: problem.difficulty)
                Spacer()

                if let item = reviewItem {
                    HStack(spacing: 4) {
                        Image(systemName: "arrow.counterclockwise")
                            .font(.caption2)
                        Text("第\(item.totalReviews + 1)次复习")
                            .font(.caption2)
                    }
                    .foregroundColor(.apexMystery)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.apexMystery.opacity(0.1))
                    .cornerRadius(6)
                }

                if reviewItem?.isOverdue == true {
                    Text("逾期")
                        .font(.caption2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 3)
                        .background(Color.apexLava)
                        .cornerRadius(4)
                }
            }

            // Content
            Text(problem.content.mathPretty)
                .font(.body)
                .foregroundColor(.primary)
                .lineSpacing(6)
                .fixedSize(horizontal: false, vertical: true)

            if let latex = problem.contentLatex {
                FormulaView(latex: latex, fontSize: 15)
            }

            // Options
            if let options = problem.options {
                VStack(spacing: 8) {
                    ForEach(Array(options.enumerated()), id: \.offset) { index, option in
                        let labels = ["A", "B", "C", "D", "E", "F"]
                        OptionButton(
                            label: index < labels.count ? labels[index] : "\(index + 1)",
                            text: option,
                            isSelected: selectedAnswer == option,
                            isCorrect: answerRecorded ? option == problem.answer : nil
                        ) {
                            guard !answerRecorded else { return }
                            selectedAnswer = option
                            submitAnswer(option, for: problem)
                        }
                    }
                }
            }

            // Result banner
            if answerRecorded, let correct = lastAnswerCorrect {
                HStack(spacing: 8) {
                    Image(systemName: correct ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .foregroundColor(correct ? .apexEmerald : .apexLava)
                    VStack(alignment: .leading, spacing: 2) {
                        Text(correct ? "回答正确!" : "回答错误")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(correct ? .apexEmerald : .apexLava)
                        if !correct {
                            Text("正确答案: \(problem.answer.mathPretty)")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        if correct, let item = reviewItem {
                            let nextInterval = ReviewItem.intervals[min(item.correctStreak + 1, ReviewItem.intervals.count - 1)]
                            Text("下次复习: \(nextInterval)天后")
                                .font(.caption)
                                .foregroundColor(.apexEmerald)
                        } else if !correct {
                            Text("明天再复习")
                                .font(.caption)
                                .foregroundColor(.apexLava)
                        }
                    }
                    Spacer()
                }
                .padding(12)
                .background((correct ? Color.apexEmerald : Color.apexLava).opacity(0.1))
                .cornerRadius(12)
            }

            // Show solution button (if not yet answered)
            if !answerRecorded {
                Button {
                    submitSkip(for: problem)
                    withAnimation { showSolution = true }
                } label: {
                    Text("跳过，查看解析")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.apexStarBlue)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 13)
                        .background(Color.apexStarBlue.opacity(0.1))
                        .cornerRadius(12)
                }
            } else if !showSolution {
                Button {
                    withAnimation { showSolution = true }
                } label: {
                    Text("查看解析")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 13)
                        .background(Color.apexStarBlue)
                        .cornerRadius(12)
                }
            }
        }
        .padding(16)
        .background(Color.apexCardSurface)
        .cornerRadius(16)
    }

    // MARK: - Solution

    private var solutionCard: some View {
        let problem = dueProblems[currentIndex]

        return VStack(alignment: .leading, spacing: 12) {
            // Standard solution
            HStack(spacing: 6) {
                Image(systemName: "text.book.closed.fill")
                    .foregroundColor(.apexStarBlue)
                Text("解题步骤")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.apexStarBlue)
            }

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

            // Shortcut solution
            if let dual = problem.dualSolution {
                Divider().padding(.vertical, 4)

                HStack(spacing: 6) {
                    Image(systemName: "bolt.fill")
                        .foregroundColor(.apexLava)
                    Text("秒杀: \(dual.weaponUsed)")
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
        }
        .padding(16)
        .background(Color.apexCardSurface)
        .cornerRadius(16)
    }

    private var nextButton: some View {
        Button {
            withAnimation {
                completedCount += 1
                currentIndex += 1
                resetForNextProblem()
            }
        } label: {
            HStack(spacing: 6) {
                Image(systemName: currentIndex + 1 >= dueProblems.count ? "checkmark.circle.fill" : "arrow.right.circle.fill")
                Text(currentIndex + 1 >= dueProblems.count ? "完成复习" : "下一题")
            }
            .font(.subheadline)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(Color.apexEmerald)
            .cornerRadius(12)
        }
    }

    // MARK: - Empty / Complete States

    private var emptyState: some View {
        VStack(spacing: 16) {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 48))
                .foregroundColor(.apexEmerald)
            Text("今日无需复习")
                .font(.headline)
                .foregroundColor(.primary)
            Text("做题后系统会自动安排复习计划")
                .font(.subheadline)
                .foregroundColor(.secondary)

            let upcoming = scheduler.upcomingProblems().prefix(3)
            if !upcoming.isEmpty {
                VStack(alignment: .leading, spacing: 8) {
                    Text("即将复习")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.apexGold)
                    ForEach(Array(upcoming), id: \.problemId) { item in
                        if let problem = SampleData.problems.first(where: { $0.id == item.problemId }) {
                            HStack {
                                Text(problem.content.mathPretty)
                                    .font(.caption)
                                    .foregroundColor(.primary)
                                    .lineLimit(1)
                                Spacer()
                                Text("\(item.daysUntilReview)天后")
                                    .font(.caption2)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                .padding(14)
                .background(Color.apexCardSurface)
                .cornerRadius(12)
                .padding(.horizontal, 20)
                .padding(.top, 8)
            }
        }
        .padding(40)
    }

    private var completionState: some View {
        VStack(spacing: 20) {
            Image(systemName: "star.circle.fill")
                .font(.system(size: 56))
                .foregroundColor(.apexGold)
            Text("复习完成!")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            Text("今日已完成 \(completedCount) 道复习题")
                .font(.subheadline)
                .foregroundColor(.secondary)

            Button {
                dismiss()
            } label: {
                Text("返回")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(Color.apexEmerald)
                    .cornerRadius(12)
            }
            .padding(.horizontal, 40)
        }
        .padding(40)
    }

    // MARK: - Logic

    private func loadDueProblems() {
        let dueItems = scheduler.dueProblems()
        let allProblems = SampleData.problems
        dueProblems = dueItems.compactMap { item in
            allProblems.first { $0.id == item.problemId }
        }
    }

    private func submitAnswer(_ answer: String, for problem: Problem) {
        guard !answerRecorded else { return }
        stopTimer()
        let isCorrect = answer == problem.answer
        lastAnswerCorrect = isCorrect
        answerRecorded = true

        practiceManager.recordAnswer(
            problemId: problem.id,
            isCorrect: isCorrect,
            userAnswer: answer,
            timeSpent: elapsedTime,
            usedHint: false
        )
        scheduler.recordReview(problemId: problem.id, isCorrect: isCorrect)
    }

    private func submitSkip(for problem: Problem) {
        guard !answerRecorded else { return }
        stopTimer()
        lastAnswerCorrect = false
        answerRecorded = true

        practiceManager.recordAnswer(
            problemId: problem.id,
            isCorrect: false,
            userAnswer: "",
            timeSpent: elapsedTime,
            usedHint: false
        )
        scheduler.recordReview(problemId: problem.id, isCorrect: false)
    }

    private func resetForNextProblem() {
        selectedAnswer = nil
        answerRecorded = false
        lastAnswerCorrect = nil
        showSolution = false
        startTimer()
    }

    private func startTimer() {
        stopTimer()
        startTime = Date()
        elapsedTime = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            elapsedTime = Date().timeIntervalSince(startTime)
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
        elapsedTime = Date().timeIntervalSince(startTime)
    }

    private func formatTime(_ t: TimeInterval) -> String {
        let mins = Int(t) / 60
        let secs = Int(t) % 60
        return String(format: "%d:%02d", mins, secs)
    }
}
