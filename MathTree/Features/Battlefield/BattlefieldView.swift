import SwiftUI

/// 练习模块的高考章节分类：每个章节映射一组题目标签(交集匹配)，解决"大类名与题目标签对不上导致分类为空"的问题。
enum PracticeTopic: String, CaseIterable, Identifiable {
    case funcDeriv = "函数与导数"
    case trig = "三角函数"
    case sequence = "数列"
    case inequality = "不等式"
    case analytic = "解析几何"
    case solid = "立体几何"
    case vector = "平面向量"
    case probStat = "概率统计"
    case complex = "复数"
    case counting = "计数原理"
    case logicSet = "集合与逻辑"
    case polar = "极坐标与参数方程"
    case collegeWeapon = "大学秒杀"

    var id: String { rawValue }
    var displayName: String { rawValue }

    /// 该章节匹配的题目标签
    var tags: [String] {
        switch self {
        case .funcDeriv:  return ["函数","导数","对数","指数","对数运算","指对运算","对数方程","恒成立","零点","切线法","切线不等式","极值点偏移","对数不等式","抽象函数","参数范围","单调性"]
        case .trig:       return ["三角函数","三角","解三角形","半角公式","积化和差","和差化积","降幂","二倍角","差角公式","辅助角","射影定理"]
        case .sequence:   return ["数列","等差数列","等比数列","递推","裂项","错位相减","求和","不动点","分组求和","通项"]
        case .inequality: return ["不等式","不等式选讲","均值","柯西","权方和","线性规划","琴生","对勾函数","绝对值","恒成立"]
        case .analytic:   return ["解析几何","圆锥曲线","椭圆","双曲线","抛物线","直线","圆","离心率","焦点弦","焦点三角形","中点弦","渐近线","轨迹","定值","定点","直线与圆","切线","弦长","第二定义"]
        case .solid:      return ["立体几何","空间向量","二面角","线面角","异面直线","异面距离","外接球","内切球","棱柱","棱锥","圆锥","体积","补形","三垂线"]
        case .vector:     return ["向量","数量积","夹角"]
        case .probStat:   return ["概率","统计","期望","方差","分布列","二项分布","正态分布","超几何","贝叶斯","几何分布","条件概率","相关系数","回归","独立性检验","均匀分布","分层抽样","频率分布"]
        case .complex:    return ["复数","共轭","纯虚数","i的幂","三角形式","几何意义","实系数方程"]
        case .counting:   return ["计数","计数原理","排列","组合","二项式定理","组合恒等式","隔板法","插空法","捆绑法","错位排列","染色问题","几何计数","赋值法"]
        case .logicSet:   return ["集合","逻辑","充分必要","全称特称","特称命题","联结词","四种命题","逆否","子集","补集","命题否定"]
        case .polar:      return ["极坐标","参数方程"]
        case .collegeWeapon: return ["大学公式秒杀","洛必达","泰勒","拉格朗日中值","叉积","定积分","切线法"]
        }
    }

    /// 题目标签是否与本章节相交
    func matches(_ problemTags: [String]) -> Bool {
        let set = Set(problemTags)
        return tags.contains { set.contains($0) }
    }
}

struct BattlefieldView: View {
    @Environment(\.horizontalSizeClass) private var sizeClass
    @StateObject private var masteryManager = ProblemMasteryManager.shared
    @StateObject private var practiceManager = PracticeManager.shared
    @StateObject private var reviewScheduler = ReviewScheduler.shared
    @State private var problems: [Problem] = SampleData.problems
    @State private var currentIndex = 0
    @State private var showSolution = false
    @State private var selectedAnswer: String?
    @State private var selectedTopic: PracticeTopic?
    @State private var selectedDifficulty: DifficultyFilter = .all
    @State private var showDualView = false
    @State private var showDescendAnimation = false
    @State private var showProblemList = false
    @State private var answeredProblems = Set<Int>()
    @State private var solutionTab: SolutionTab = .insight
    @State private var hideMastered = true
    @State private var showMasteredConfirm = false
    @State private var problemStartTime = Date()
    @State private var elapsedTime: TimeInterval = 0
    @State private var timer: Timer?
    @State private var answerRecorded = false
    @State private var lastAnswerCorrect: Bool?

    enum SolutionTab: String, CaseIterable, Identifiable {
        case insight = "解题思路"
        case standard = "标准解法"
        case descend = "秒杀解法"
        case compare = "对比"
        var id: String { rawValue }
    }

    enum DifficultyFilter: String, CaseIterable, Identifiable {
        case all = "全部难度"
        case easy = "简单"
        case medium = "中等"
        case hard = "困难"

        var id: String { rawValue }

        func matches(_ difficulty: Double) -> Bool {
            switch self {
            case .all: return true
            case .easy: return difficulty < 0.5
            case .medium: return difficulty >= 0.5 && difficulty < 0.7
            case .hard: return difficulty >= 0.7
            }
        }
    }

    var filteredProblems: [Problem] {
        problems.filter { problem in
            let topicMatch = selectedTopic == nil || selectedTopic!.matches(problem.tags)
            let difficultyMatch = selectedDifficulty.matches(problem.difficulty)
            let masteryMatch = !hideMastered || !masteryManager.isMastered(problem.id)
            return topicMatch && difficultyMatch && masteryMatch
        }
    }

    private var safeCurrentIndex: Int {
        guard !filteredProblems.isEmpty else { return 0 }
        return min(currentIndex, filteredProblems.count - 1)
    }

    private var isIPad: Bool { sizeClass == .regular }
    private var cardPadding: CGFloat { isIPad ? 28 : 16 }
    private var hPadding: CGFloat { isIPad ? 40 : 16 }

    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    VStack(spacing: 16) {
                        battleHeader
                        filterSection

                        if !filteredProblems.isEmpty {
                            problemCard

                            if showSolution || showDualView {
                                solutionSection
                                masteryCard
                                nextProblemButton
                            }
                        } else {
                            emptyState
                        }
                    }
                    .padding(.horizontal, hPadding)
                    .padding(.top, 12)
                    .padding(.bottom, 30)
                    .frame(maxWidth: isIPad ? 800 : .infinity)
                    .frame(maxWidth: .infinity)
                }
                .background(Color.apexBackground)
                .navigationTitle("实战训练")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showProblemList = true
                        } label: {
                            Image(systemName: "list.bullet")
                        }
                    }
                }

                if showDescendAnimation, !filteredProblems.isEmpty {
                    DescendAnimationView(
                        title: "维度拉升",
                        subtitle: "目标：\(filteredProblems[safeCurrentIndex].dualSolution?.weaponUsed ?? "高维武器")",
                        isPresented: $showDescendAnimation
                    )
                    .transition(.opacity)
                    .zIndex(100)
                }
            }
            .sheet(isPresented: $showProblemList) {
                problemListView
            }
            .onAppear { startTimer() }
            .onDisappear { stopTimer() }
        }
    }

    // MARK: - Filter Section

    private var filterSection: some View {
        VStack(spacing: 12) {
            // Topic chips - horizontal scroll
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    TopicChip(title: "全部", isSelected: selectedTopic == nil) {
                        selectedTopic = nil
                        currentIndex = 0
                    }
                    ForEach(PracticeTopic.allCases) { topic in
                        TopicChip(title: topic.displayName, isSelected: selectedTopic == topic) {
                            selectedTopic = topic
                            currentIndex = 0
                        }
                    }
                }
            }

            // Difficulty chips - horizontal scroll for small screens
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(DifficultyFilter.allCases, id: \.self) { filter in
                        DifficultyChip(title: filter.rawValue, isSelected: selectedDifficulty == filter) {
                            selectedDifficulty = filter
                            currentIndex = 0
                        }
                    }
                }
            }

            // Nav buttons - scroll when needed
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    Button {
                        guard !filteredProblems.isEmpty else { return }
                        currentIndex = Int.random(in: 0..<filteredProblems.count)
                        resetState()
                    } label: {
                        Label("随机选题", systemImage: "shuffle")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.apexStarBlue)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 8)
                            .background(Color.apexStarBlue.opacity(0.1))
                            .cornerRadius(12)
                    }

                    Button { goToNextProblem() } label: {
                        Label("下一题", systemImage: "arrow.right")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.apexEmerald)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 8)
                            .background(Color.apexEmerald.opacity(0.1))
                            .cornerRadius(12)
                    }

                    Button {
                        if currentIndex > 0 {
                            currentIndex -= 1
                            resetState()
                        }
                    } label: {
                        Label("上一题", systemImage: "arrow.left")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.apexMystery)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 8)
                            .background(Color.apexMystery.opacity(0.1))
                            .cornerRadius(12)
                    }
                }
            }
        }
    }

    // MARK: - Problem List

    private var problemListView: some View {
        NavigationStack {
            List {
                // Active problems
                Section(header: Text("待练习 (\(filteredProblems.count) 道)")) {
                    ForEach(Array(filteredProblems.enumerated()), id: \.element.id) { index, problem in
                        problemListRow(problem: problem, index: index, isMastered: false)
                    }
                }

                // Mastered problems section
                let allFiltered = problems.filter { p in
                    let topicMatch = selectedTopic == nil || selectedTopic!.matches(p.tags)
                    let difficultyMatch = selectedDifficulty.matches(p.difficulty)
                    return topicMatch && difficultyMatch && masteryManager.isMastered(p.id)
                }
                if !allFiltered.isEmpty {
                    Section(header: Text("已掌握 (\(allFiltered.count) 道)")) {
                        ForEach(allFiltered, id: \.id) { problem in
                            problemListRow(problem: problem, index: nil, isMastered: true)
                        }
                    }
                }
            }
            .navigationTitle("选题列表")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private func problemListRow(problem: Problem, index: Int?, isMastered: Bool) -> some View {
        Button {
            if let idx = index {
                currentIndex = idx
            } else {
                // For mastered problems, find in unfiltered and switch to show-all
                hideMastered = false
                if let newIdx = filteredProblems.firstIndex(where: { $0.id == problem.id }) {
                    currentIndex = newIdx
                }
            }
            showProblemList = false
            resetState()
        } label: {
            HStack(alignment: .top, spacing: 12) {
                ZStack {
                    Circle()
                        .fill(isMastered ? Color.apexEmerald.opacity(0.2) : (index.map { answeredProblems.contains($0) } ?? false ? Color.apexGold.opacity(0.2) : Color.gray.opacity(0.1)))
                        .frame(width: 36, height: 36)
                    if isMastered {
                        Image(systemName: "checkmark.seal.fill")
                            .font(.caption)
                            .foregroundColor(.apexEmerald)
                    } else if let idx = index, answeredProblems.contains(idx) {
                        Image(systemName: "checkmark")
                            .font(.caption)
                            .foregroundColor(.apexGold)
                    } else if let idx = index {
                        Text("\(idx + 1)")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                    }
                }
                VStack(alignment: .leading, spacing: 4) {
                    Text(problem.content.mathPretty)
                        .font(.subheadline)
                        .foregroundColor(isMastered ? .secondary : .primary)
                        .lineLimit(2)
                    HStack(spacing: 8) {
                        DifficultyBar(level: problem.difficulty, compact: true)
                        if let year = problem.gaokaoYear {
                            Text("\(year)")
                                .font(.caption)
                                .foregroundColor(.apexLava)
                        }
                        if problem.dualSolution != nil {
                            Image(systemName: "bolt.fill")
                                .font(.caption2)
                                .foregroundColor(.apexLava)
                        }
                    }
                }
                Spacer()
                if isMastered {
                    Button {
                        masteryManager.unmarkMastered(problem.id)
                    } label: {
                        Text("取消")
                            .font(.caption2)
                            .foregroundColor(.apexLava)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 3)
                            .background(Color.apexLava.opacity(0.1))
                            .cornerRadius(4)
                    }
                    .buttonStyle(.plain)
                } else {
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        }
    }

    // MARK: - Header

    private var battleHeader: some View {
        VStack(spacing: 8) {
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text("实战训练")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    Text("精准打击薄弱环节")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
                Spacer()
                HStack(spacing: 2) {
                    Text("\(safeCurrentIndex + 1)")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.apexLava)
                    Text("/ \(filteredProblems.count)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }

            HStack(spacing: 12) {
                // Mastered count
                HStack(spacing: 4) {
                    Image(systemName: "checkmark.seal.fill")
                        .font(.caption2)
                        .foregroundColor(.apexEmerald)
                    Text("已掌握 \(masteryManager.masteredCount)")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }

                Spacer()

                // Hide mastered toggle
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        hideMastered.toggle()
                        currentIndex = 0
                    }
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: hideMastered ? "eye.slash" : "eye")
                            .font(.caption2)
                        Text(hideMastered ? "已隐藏掌握题" : "显示全部")
                            .font(.caption2)
                    }
                    .foregroundColor(hideMastered ? .apexGold : .secondary)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(hideMastered ? Color.apexGold.opacity(0.1) : Color.clear)
                    .cornerRadius(8)
                }
            }
        }
        .padding(.horizontal, cardPadding)
        .padding(.vertical, 10)
        .background(Color.apexCardSurface)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.03), radius: 4, y: 2)
    }

    // MARK: - Next Problem Button

    private var nextProblemButton: some View {
        Button {
            withAnimation { goToNextProblem() }
        } label: {
            HStack(spacing: 6) {
                Image(systemName: "arrow.right.circle.fill")
                    .font(.subheadline)
                Text("下一题")
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

    // MARK: - Mastery Card

    private var masteryCard: some View {
        let problem = filteredProblems[safeCurrentIndex]
        let isMastered = masteryManager.isMastered(problem.id)

        return VStack(spacing: 12) {
            // 题卡 header
            HStack(spacing: 8) {
                Image(systemName: "rectangle.on.rectangle.angled")
                    .font(.caption)
                    .foregroundColor(.apexMystery)
                Text("题卡")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Spacer()

                // Tags
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 4) {
                        ForEach(problem.tags.prefix(3), id: \.self) { tag in
                            Text(tag)
                                .font(.caption2)
                                .foregroundColor(.apexMystery)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 2)
                                .background(Color.apexMystery.opacity(0.1))
                                .cornerRadius(4)
                        }
                    }
                }
            }

            Divider()

            // Problem info row
            HStack(spacing: 16) {
                VStack(spacing: 2) {
                    Text("难度")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    Text(String(format: "%.0f%%", problem.difficulty * 100))
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(problem.difficulty >= 0.7 ? .apexLava : problem.difficulty >= 0.5 ? .apexGold : .apexEmerald)
                }
                VStack(spacing: 2) {
                    Text("参考时间")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    Text("\(Int(problem.averageTime))s")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }
                if let dual = problem.dualSolution {
                    VStack(spacing: 2) {
                        Text("秒杀加速")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                        Text("\(String(format: "%.0f", dual.timeRatio))x")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.apexLava)
                    }
                }
                if let year = problem.gaokaoYear {
                    VStack(spacing: 2) {
                        Text("来源")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                        Text("\(year)高考")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.apexLava)
                    }
                }
                Spacer()
            }

            // Related formulas
            if !problem.formulaIds.isEmpty {
                HStack(spacing: 4) {
                    Image(systemName: "function")
                        .font(.caption2)
                        .foregroundColor(.apexStarBlue)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 4) {
                            ForEach(problem.formulaIds.prefix(4), id: \.self) { fid in
                                if let formula = SampleData.formulas.first(where: { $0.id == fid }) {
                                    Text(formula.name)
                                        .font(.caption2)
                                        .foregroundColor(.apexStarBlue)
                                        .padding(.horizontal, 6)
                                        .padding(.vertical, 2)
                                        .background(Color.apexStarBlue.opacity(0.08))
                                        .cornerRadius(4)
                                }
                            }
                        }
                    }
                }
            }

            Divider()

            // Mastery action
            Button {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    masteryManager.toggleMastery(problem.id)
                    if masteryManager.isMastered(problem.id) {
                        showMasteredConfirm = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            showMasteredConfirm = false
                        }
                    }
                }
            } label: {
                HStack(spacing: 8) {
                    Image(systemName: isMastered ? "checkmark.seal.fill" : "seal")
                        .font(.subheadline)
                    Text(isMastered ? "已掌握 (点击取消)" : "标记为已掌握")
                        .font(.subheadline)
                        .fontWeight(.medium)
                }
                .foregroundColor(isMastered ? .white : .apexEmerald)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(isMastered ? Color.apexEmerald : Color.apexEmerald.opacity(0.1))
                .cornerRadius(12)
            }

            if isMastered && hideMastered {
                Text("下次刷题时将自动跳过此题")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
        }
        .padding(cardPadding)
        .background(Color.apexCardSurface)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.04), radius: 6, y: 3)
        .overlay(
            Group {
                if showMasteredConfirm {
                    VStack(spacing: 8) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.apexEmerald)
                        Text("已标记掌握")
                            .font(.headline)
                            .foregroundColor(.apexEmerald)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.apexCardSurface.opacity(0.95))
                    .cornerRadius(16)
                    .transition(.scale.combined(with: .opacity))
                }
            }
        )
    }

    private func goToNextProblem() {
        answeredProblems.insert(currentIndex)
        resetState()
        if currentIndex < filteredProblems.count - 1 {
            currentIndex += 1
        } else {
            currentIndex = 0
        }
    }

    private func resetState() {
        selectedAnswer = nil
        showSolution = false
        showDualView = false
        solutionTab = .insight
        answerRecorded = false
        lastAnswerCorrect = nil
        startTimer()
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
        reviewScheduler.recordReview(problemId: problem.id, isCorrect: isCorrect)
        StreakManager.shared.recordActivity()
        // 选择题答错=确定性错误，自动收入错题本(非选择题不自动判错，由用户标注)
        if !isCorrect { practiceManager.flagError(problem.id) }
    }

    /// 查看解析：不判对错(填空/计算/证明题无法自动判分)，仅停表展开解析。是否错题由用户自行标注。
    private func recordSkip(for problem: Problem) {
        guard !answerRecorded else { return }
        stopTimer()
        answerRecorded = true
        lastAnswerCorrect = nil
    }

    private func startTimer() {
        stopTimer()
        problemStartTime = Date()
        elapsedTime = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            elapsedTime = Date().timeIntervalSince(problemStartTime)
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
        elapsedTime = Date().timeIntervalSince(problemStartTime)
    }

    private func formatTime(_ t: TimeInterval) -> String {
        let mins = Int(t) / 60
        let secs = Int(t) % 60
        return String(format: "%d:%02d", mins, secs)
    }

    // MARK: - Problem Card

    private var problemCard: some View {
        let problem = filteredProblems[safeCurrentIndex]
        return VStack(alignment: .leading, spacing: 14) {
            // Difficulty + timer + year tag row
            HStack {
                DifficultyBar(level: problem.difficulty)

                Spacer()

                // Timer
                HStack(spacing: 4) {
                    Image(systemName: "clock")
                        .font(.caption2)
                    Text(formatTime(elapsedTime))
                        .font(.system(size: 13, weight: .medium, design: .monospaced))
                }
                .foregroundColor(elapsedTime > problem.averageTime ? .apexLava : .secondary)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background((elapsedTime > problem.averageTime ? Color.apexLava : Color.gray).opacity(0.1))
                .cornerRadius(6)

                if let year = problem.gaokaoYear {
                    Text("\(year)高考")
                        .font(.caption)
                        .foregroundColor(.apexLava)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.apexLava.opacity(0.1))
                        .cornerRadius(6)
                }
            }

            // Problem content
            Text(problem.content.mathPretty)
                .font(.body)
                .foregroundColor(.primary)
                .lineSpacing(6)
                .fixedSize(horizontal: false, vertical: true)

            // LaTeX formula
            if let latex = problem.contentLatex {
                FormulaView(latex: latex, fontSize: isIPad ? 16 : 15)
            }

            // Options
            if let options = problem.options {
                VStack(spacing: 8) {
                    ForEach(Array(options.enumerated()), id: \.offset) { index, option in
                        OptionButton(
                            label: optionLabel(for: index),
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

            // Answer result banner
            if answerRecorded, let correct = lastAnswerCorrect {
                VStack(spacing: 8) {
                    HStack(spacing: 8) {
                        Image(systemName: correct ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .foregroundColor(correct ? .apexEmerald : .apexLava)
                        Text(correct ? "回答正确!" : "回答错误，正确答案: \(problem.answer.mathPretty)")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(correct ? .apexEmerald : .apexLava)
                        Spacer()
                        Text(formatTime(elapsedTime))
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }

                    // Shortcut teaser
                    if let dual = problem.dualSolution {
                        let shortcutTime = problem.averageTime / dual.timeRatio
                        HStack(spacing: 6) {
                            Image(systemName: "bolt.fill")
                                .font(.caption2)
                                .foregroundColor(.apexGold)
                            if elapsedTime > shortcutTime {
                                Text("秒杀解法只需 \(Int(shortcutTime))s，比你快 \(String(format: "%.1f", elapsedTime / shortcutTime))x")
                                    .font(.caption)
                                    .foregroundColor(.apexGold)
                            } else {
                                Text("你的速度已达秒杀级别!")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.apexEmerald)
                            }
                            Spacer()
                            Button {
                                withAnimation {
                                    showSolution = true
                                    showDualView = false
                                    solutionTab = .compare
                                }
                            } label: {
                                Text("查看对比")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.apexLava)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(Color.apexLava.opacity(0.1))
                                    .cornerRadius(6)
                            }
                        }
                    }
                }
                .padding(12)
                .background((correct ? Color.apexEmerald : Color.apexLava).opacity(0.1))
                .cornerRadius(12)
            }

            // Action buttons
            HStack(spacing: 10) {
                Button {
                    if !answerRecorded {
                        // Record as skipped (viewed solution without answering)
                        recordSkip(for: problem)
                    }
                    withAnimation(.easeInOut(duration: 0.3)) {
                        showSolution = true
                        showDualView = false
                        solutionTab = .insight
                    }
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

                if problem.dualSolution != nil {
                    Button {
                        if !answerRecorded {
                            recordSkip(for: problem)
                        }
                        withAnimation(.easeInOut(duration: 0.3)) {
                            showDualView = true
                            showSolution = false
                            solutionTab = .descend
                            showDescendAnimation = true
                        }
                    } label: {
                        HStack(spacing: 4) {
                            Image(systemName: "bolt.fill")
                                .font(.caption)
                            Text("降维秒杀")
                        }
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.apexLava)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 13)
                        .background(Color.apexLava.opacity(0.1))
                        .cornerRadius(12)
                    }
                }
            }

            // 标记错题：由用户自行判断对错后加入/移出错题本
            Button {
                practiceManager.toggleError(problem.id)
            } label: {
                let flagged = practiceManager.isFlaggedError(problem.id)
                HStack(spacing: 6) {
                    Image(systemName: flagged ? "flag.fill" : "flag")
                    Text(flagged ? "已加入错题本" : "加入错题本")
                }
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(flagged ? .apexGold : .secondary)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 11)
                .background((flagged ? Color.apexGold : Color.gray).opacity(0.12))
                .cornerRadius(12)
            }
        }
        .padding(cardPadding)
        .background(Color.apexCardSurface)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.04), radius: 6, y: 3)
    }

    // MARK: - Unified Solution Section

    private var solutionSection: some View {
        let problem = filteredProblems[safeCurrentIndex]
        let hasDual = problem.dualSolution != nil

        return VStack(spacing: 0) {
            // Tab bar
            solutionTabBar(hasDual: hasDual)

            // Tab content
            VStack(alignment: .leading, spacing: 0) {
                switch solutionTab {
                case .insight:
                    insightTabContent(problem: problem)
                case .standard:
                    if let dual = problem.dualSolution {
                        standardTabContent(solution: dual.standardMethod)
                    } else {
                        stepsContent(steps: problem.solution.steps, accent: .apexStarBlue, isBold: false)
                    }
                case .descend:
                    if let dual = problem.dualSolution {
                        descendTabContent(dual: dual)
                    }
                case .compare:
                    if let dual = problem.dualSolution {
                        compareTabContent(problem: problem, dual: dual)
                    }
                }
            }
            .padding(cardPadding)
        }
        .background(Color.apexCardSurface)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.05), radius: 10, y: 5)
    }

    private func solutionTabBar(hasDual: Bool) -> some View {
        let tabs: [SolutionTab] = hasDual ? SolutionTab.allCases : [.insight, .standard]
        return HStack(spacing: 0) {
            ForEach(tabs) { tab in
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) { solutionTab = tab }
                } label: {
                    VStack(spacing: 5) {
                        HStack(spacing: 4) {
                            if tab == .descend {
                                Image(systemName: "bolt.fill")
                                    .font(.system(size: 11))
                            } else if tab == .compare {
                                Image(systemName: "arrow.left.arrow.right")
                                    .font(.system(size: 11))
                            }
                            Text(tab.rawValue)
                                .font(.subheadline)
                                .fontWeight(solutionTab == tab ? .bold : .regular)
                        }
                        .foregroundColor(solutionTab == tab ? tabAccent(tab) : .secondary)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)

                        Rectangle()
                            .fill(solutionTab == tab ? tabAccent(tab) : Color.clear)
                            .frame(height: 2.5)
                            .cornerRadius(1)
                    }
                }
            }
        }
        .background(Color.apexCardSurface)
    }

    private func tabAccent(_ tab: SolutionTab) -> Color {
        switch tab {
        case .insight: return .apexGold
        case .standard: return .apexStarBlue
        case .descend: return .apexLava
        case .compare: return .apexMystery
        }
    }

    // MARK: - Tab: 解题思路

    private func insightTabContent(problem: Problem) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            // Key insight
            HStack(spacing: 6) {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(.apexGold)
                    .font(.body)
                Text("解题关键")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.apexGold)
            }

            Text(problem.solution.keyInsight.mathPretty)
                .font(.subheadline)
                .foregroundColor(.primary.opacity(0.9))
                .lineSpacing(6)
                .fixedSize(horizontal: false, vertical: true)

            // Common mistakes
            if !problem.solution.commonMistakes.isEmpty {
                Divider().padding(.vertical, 4)
                HStack(spacing: 6) {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .font(.caption)
                        .foregroundColor(.apexLava.opacity(0.8))
                    Text("常见错误")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.apexLava.opacity(0.8))
                }
                ForEach(problem.solution.commonMistakes, id: \.self) { mistake in
                    HStack(alignment: .top, spacing: 6) {
                        Text("•")
                            .font(.caption)
                            .foregroundColor(.apexLava.opacity(0.6))
                        Text(mistake)
                            .font(.subheadline)
                            .foregroundColor(.primary.opacity(0.7))
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }

            // Hints
            if !problem.hints.isEmpty {
                Divider().padding(.vertical, 4)
                HStack(spacing: 6) {
                    Image(systemName: "hand.point.right.fill")
                        .font(.caption)
                        .foregroundColor(.apexEmerald)
                    Text("提示")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.apexEmerald)
                }
                ForEach(Array(problem.hints.enumerated()), id: \.offset) { idx, hint in
                    HStack(alignment: .top, spacing: 6) {
                        Text("\(idx + 1).")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.apexEmerald)
                            .frame(width: 18, alignment: .trailing)
                        Text(hint)
                            .font(.subheadline)
                            .foregroundColor(.primary.opacity(0.7))
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }

            // Detailed explanation from dual solution
            if let dual = problem.dualSolution, let explanation = dual.detailedExplanation {
                Divider().padding(.vertical, 4)
                DisclosureGroup {
                    Text(explanation)
                        .font(.subheadline)
                        .foregroundColor(.primary.opacity(0.75))
                        .lineSpacing(5)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.top, 6)
                } label: {
                    HStack(spacing: 5) {
                        Image(systemName: "book.fill")
                            .font(.caption)
                            .foregroundColor(.apexGold)
                        Text("深度解析")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.apexGold)
                    }
                }
                .tint(.apexGold)
            }
        }
    }

    // MARK: - Tab: 标准解法

    private func standardTabContent(solution: SolutionPath) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(spacing: 6) {
                Image(systemName: "text.book.closed.fill")
                    .font(.subheadline)
                    .foregroundColor(.apexStarBlue)
                Text("标准解法")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.apexStarBlue)
            }

            stepsContent(steps: solution.steps, accent: .apexStarBlue, isBold: false)

            if !solution.commonMistakes.isEmpty {
                Divider().padding(.vertical, 4)
                ForEach(solution.commonMistakes, id: \.self) { mistake in
                    HStack(alignment: .top, spacing: 6) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 12))
                            .foregroundColor(.apexLava.opacity(0.6))
                        Text(mistake)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
    }

    // MARK: - Tab: 秒杀解法

    private func descendTabContent(dual: DualSolution) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            // Weapon badge
            HStack(spacing: 10) {
                Image(systemName: "bolt.circle.fill")
                    .font(.body)
                    .foregroundColor(.apexLava)
                VStack(alignment: .leading, spacing: 2) {
                    Text("秒杀解法")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(.apexLava)
                    Text(dual.weaponUsed)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Spacer()
                Text("\(String(format: "%.0f", dual.timeRatio))x")
                    .font(.caption)
                    .fontWeight(.black)
                    .foregroundColor(.apexGold)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.apexGold.opacity(0.15))
                    .cornerRadius(6)
            }

            stepsContent(steps: dual.descentMethod.steps, accent: .apexLava, isBold: true)

            if !dual.descentMethod.commonMistakes.isEmpty {
                Divider().padding(.vertical, 4)
                ForEach(dual.descentMethod.commonMistakes, id: \.self) { mistake in
                    HStack(alignment: .top, spacing: 6) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 12))
                            .foregroundColor(.apexLava.opacity(0.6))
                        Text(mistake)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
    }

    // MARK: - Tab: 对比

    private func compareTabContent(problem: Problem, dual: DualSolution) -> some View {
        let standardSteps = dual.standardMethod.steps.count
        let descentSteps = dual.descentMethod.steps.count
        let savedTime = problem.averageTime * (1 - 1.0 / dual.timeRatio)

        return VStack(alignment: .leading, spacing: 18) {
            // Header
            HStack(spacing: 8) {
                Image(systemName: "arrow.left.arrow.right")
                    .foregroundColor(.apexMystery)
                Text("解法对比")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.apexMystery)
                Spacer()
                Text(dual.weaponUsed)
                    .font(.caption)
                    .foregroundColor(.apexLava)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
                    .background(Color.apexLava.opacity(0.1))
                    .cornerRadius(6)
            }

            // Steps comparison bar
            VStack(spacing: 8) {
                Text("步骤数")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)

                HStack(spacing: 12) {
                    // Standard
                    VStack(spacing: 4) {
                        Text("标准")
                            .font(.caption2)
                            .foregroundColor(.apexStarBlue)
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.apexStarBlue.opacity(0.15))
                                .frame(height: 44)
                            Text("\(standardSteps) 步")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.apexStarBlue)
                        }
                    }
                    .frame(maxWidth: .infinity)

                    Image(systemName: "arrow.right")
                        .font(.caption)
                        .foregroundColor(.secondary)

                    // Descent
                    VStack(spacing: 4) {
                        Text("秒杀")
                            .font(.caption2)
                            .foregroundColor(.apexLava)
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.apexLava.opacity(0.15))
                                .frame(height: 44)
                            Text("\(descentSteps) 步")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.apexLava)
                        }
                    }
                    .frame(maxWidth: .infinity)
                }

                // Reduction indicator
                if standardSteps > descentSteps {
                    HStack(spacing: 4) {
                        Image(systemName: "arrow.down.circle.fill")
                            .font(.caption)
                            .foregroundColor(.apexEmerald)
                        Text("减少 \(standardSteps - descentSteps) 步 (\(Int(Double(standardSteps - descentSteps) / Double(standardSteps) * 100))%)")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.apexEmerald)
                    }
                }
            }
            .padding(14)
            .background(Color.apexBackground.opacity(0.5))
            .cornerRadius(14)

            // Time comparison
            VStack(spacing: 8) {
                Text("时间对比")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)

                HStack(spacing: 0) {
                    // Standard bar
                    VStack(spacing: 4) {
                        Text("标准解法")
                            .font(.caption2)
                            .foregroundColor(.apexStarBlue)
                        GeometryReader { geo in
                            RoundedRectangle(cornerRadius: 6)
                                .fill(Color.apexStarBlue.opacity(0.3))
                                .frame(width: geo.size.width, height: 28)
                                .overlay(
                                    Text("\(Int(problem.averageTime))s")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.apexStarBlue)
                                )
                        }
                        .frame(height: 28)
                    }
                    .frame(maxWidth: .infinity)

                    Spacer().frame(width: 8)

                    // Descent bar (shorter proportionally)
                    VStack(spacing: 4) {
                        Text("秒杀解法")
                            .font(.caption2)
                            .foregroundColor(.apexLava)
                        GeometryReader { geo in
                            HStack {
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(Color.apexLava)
                                    .frame(width: geo.size.width / CGFloat(dual.timeRatio), height: 28)
                                    .overlay(
                                        Text("\(Int(problem.averageTime / dual.timeRatio))s")
                                            .font(.caption)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    )
                                Spacer()
                            }
                        }
                        .frame(height: 28)
                    }
                    .frame(maxWidth: .infinity)
                }

                HStack(spacing: 4) {
                    Image(systemName: "clock.arrow.circlepath")
                        .font(.caption)
                        .foregroundColor(.apexGold)
                    Text("节省约 \(Int(savedTime)) 秒 (加速 \(String(format: "%.1f", dual.timeRatio))x)")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.apexGold)
                }
            }
            .padding(14)
            .background(Color.apexBackground.opacity(0.5))
            .cornerRadius(14)

            // Side-by-side key insights
            VStack(spacing: 8) {
                Text("思路对比")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)

                HStack(alignment: .top, spacing: 10) {
                    // Standard insight
                    VStack(alignment: .leading, spacing: 6) {
                        HStack(spacing: 4) {
                            Circle()
                                .fill(Color.apexStarBlue)
                                .frame(width: 8, height: 8)
                            Text("标准思路")
                                .font(.caption2)
                                .fontWeight(.bold)
                                .foregroundColor(.apexStarBlue)
                        }
                        Text(dual.standardMethod.keyInsight.mathPretty)
                            .font(.caption)
                            .foregroundColor(.primary.opacity(0.8))
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding(10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.apexStarBlue.opacity(0.06))
                    .cornerRadius(10)

                    // Descent insight
                    VStack(alignment: .leading, spacing: 6) {
                        HStack(spacing: 4) {
                            Circle()
                                .fill(Color.apexLava)
                                .frame(width: 8, height: 8)
                            Text("秒杀思路")
                                .font(.caption2)
                                .fontWeight(.bold)
                                .foregroundColor(.apexLava)
                        }
                        Text(dual.descentMethod.keyInsight.mathPretty)
                            .font(.caption)
                            .foregroundColor(.primary.opacity(0.8))
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding(10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.apexLava.opacity(0.06))
                    .cornerRadius(10)
                }
            }

            // Your time vs reference
            if answerRecorded {
                Divider()
                HStack(spacing: 12) {
                    VStack(spacing: 2) {
                        Text("你的用时")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                        Text(formatTime(elapsedTime))
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(elapsedTime <= problem.averageTime / dual.timeRatio ? .apexEmerald : elapsedTime <= problem.averageTime ? .apexGold : .apexLava)
                    }
                    VStack(spacing: 2) {
                        Text("标准参考")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                        Text("\(Int(problem.averageTime))s")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.apexStarBlue)
                    }
                    VStack(spacing: 2) {
                        Text("秒杀参考")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                        Text("\(Int(problem.averageTime / dual.timeRatio))s")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.apexLava)
                    }
                    Spacer()
                    if elapsedTime <= problem.averageTime / dual.timeRatio {
                        Text("秒杀级!")
                            .font(.caption)
                            .fontWeight(.black)
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(Color.apexLava)
                            .cornerRadius(8)
                    }
                }
            }
        }
    }

    // MARK: - Shared Steps Renderer

    private func stepsContent(steps: [SolutionStep], accent: Color, isBold: Bool) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            ForEach(steps) { step in
                HStack(alignment: .top, spacing: 10) {
                    Text("\(step.order)")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(isBold ? .white : accent)
                        .frame(width: 26, height: 26)
                        .background(isBold ? accent : accent.opacity(0.15))
                        .cornerRadius(13)

                    VStack(alignment: .leading, spacing: 6) {
                        Text(step.description.mathPretty)
                            .font(.subheadline)
                            .fontWeight(isBold ? .semibold : .regular)
                            .foregroundColor(.primary)
                            .lineSpacing(4)
                            .fixedSize(horizontal: false, vertical: true)

                        FormulaView(latex: step.latex, fontSize: isIPad ? 16 : 15)

                        if !step.annotation.isEmpty {
                            Text(step.annotation)
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .lineSpacing(3)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                }
            }
        }
    }

    // MARK: - Empty State

    private var emptyState: some View {
        VStack(spacing: 16) {
            Image(systemName: "bookmark.slash")
                .font(.system(size: 48))
                .foregroundColor(.secondary)
            Text("暂无匹配的题目")
                .font(.headline)
                .foregroundColor(.primary)
            Text("尝试调整筛选条件")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(40)
        .background(Color.apexCardSurface)
        .cornerRadius(20)
    }

    private func optionLabel(for index: Int) -> String {
        let labels = ["A", "B", "C", "D", "E", "F"]
        return index < labels.count ? labels[index] : "\(index + 1)"
    }
}

// MARK: - Reusable Components

struct TopicChip: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.caption)
                .fontWeight(isSelected ? .bold : .regular)
                .foregroundColor(isSelected ? .white : .secondary)
                .padding(.horizontal, 14)
                .padding(.vertical, 8)
                .background(isSelected ? Color.apexStarBlue : Color.apexCardSurface)
                .cornerRadius(14)
                .shadow(color: isSelected ? Color.apexStarBlue.opacity(0.3) : .clear, radius: 4, y: 2)
        }
    }
}

struct DifficultyChip: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.caption)
                .fontWeight(isSelected ? .bold : .regular)
                .foregroundColor(isSelected ? .white : .secondary)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(isSelected ? Color.apexGold : Color.apexCardSurface)
                .cornerRadius(12)
        }
    }
}

struct DifficultyBar: View {
    let level: Double
    let compact: Bool

    init(level: Double, compact: Bool = false) {
        self.level = level
        self.compact = compact
    }

    var body: some View {
        HStack(spacing: compact ? 2 : 3) {
            ForEach(0..<5) { index in
                RoundedRectangle(cornerRadius: 2)
                    .fill(index < Int(level * 5) ? difficultyColor : Color.gray.opacity(0.2))
                    .frame(width: compact ? 8 : 12, height: compact ? 4 : 6)
            }
        }
    }

    private var difficultyColor: Color {
        if level < 0.4 { return .apexEmerald }
        if level < 0.7 { return .apexGold }
        return .apexLava
    }
}

struct OptionButton: View {
    let label: String
    let text: String
    let isSelected: Bool
    let isCorrect: Bool?
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 10) {
                ZStack {
                    Circle()
                        .fill(backgroundColor)
                        .frame(width: 28, height: 28)
                    Text(label)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(textColor)
                }
                Text(text)
                    .font(.subheadline)
                    .foregroundColor(isSelected ? textColor : .primary)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.leading)
                Spacer()
                if let correct = isCorrect {
                    Image(systemName: correct ? "checkmark" : "xmark")
                        .font(.caption)
                        .foregroundColor(correct ? .apexEmerald : .apexLava)
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .background(isSelected ? backgroundColor.opacity(0.15) : Color.apexBackground.opacity(0.5))
            .cornerRadius(12)
        }
    }

    private var backgroundColor: Color {
        if let correct = isCorrect {
            return correct ? .apexEmerald : .apexLava
        }
        return isSelected ? .apexStarBlue : .gray.opacity(0.1)
    }

    private var textColor: Color {
        if isCorrect != nil { return .white }
        return isSelected ? .white : .secondary
    }
}
