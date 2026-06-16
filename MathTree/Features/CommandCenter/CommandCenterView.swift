import SwiftUI

struct CommandCenterView: View {
    @EnvironmentObject var profile: StudentProfile
    @Binding var selectedTab: Int
    @StateObject private var streakManager = StreakManager.shared
    @ObservedObject private var purchase = PurchaseManager.shared
    @State private var showPaywall = false
    @State private var showDailyStrike = false
    @State private var showReview = false
    @State private var showDatePicker = false
    @State private var selectedFormula: Formula?
    @State private var expandedLevel: FormulaLevel?

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: Spacing.xl) {
                    // 品牌入口
                    secondKillHero

                    // 完整版解锁入口（未解锁时显示）
                    if !purchase.isUnlocked {
                        unlockCard
                    }

                    // 今日 — 行动区
                    sectionHeader("今日")
                    countdownAndStreakCard
                    dailyTasksCard
                    dailyStrikeCard

                    // 我的进度
                    sectionHeader("我的进度")
                    practiceStatsCard
                    achievementsCard
                    knowledgeCoverageCard
                    gaokaoReadinessCard

                    // 题库与路线
                    sectionHeader("题库与路线")
                    contentOverviewCard
                    learningRoadmap
                    quickActions
                }
                .padding(.horizontal, Spacing.xl)
                .padding(.top, Spacing.md)
                .padding(.bottom, Spacing.xxl)
                .readableContentWidth()
            }
            .background(Color.apexBackground)
            .navigationTitle("MathTree")
            .sheet(isPresented: $showPaywall) {
                SKPaywallView()
            }
            .sheet(isPresented: $showDailyStrike) {
                DailyStrikeView()
            }
            .sheet(isPresented: $showReview) {
                ReviewView()
            }
            .sheet(isPresented: $showDatePicker) {
                GaokaoDatePickerView(streakManager: streakManager, isPresented: $showDatePicker)
            }
            .sheet(item: $selectedFormula) { formula in
                NavigationStack {
                    FormulaDetailView(formula: formula)
                }
            }
        }
    }

    // MARK: - 区块标题

    private func sectionHeader(_ title: String) -> some View {
        HStack {
            Text(title)
                .font(.title3.weight(.bold))
                .foregroundColor(.primary)
            Spacer()
        }
        .padding(.top, Spacing.xs)
    }

    // MARK: - 秒杀殿堂（产品灵魂入口）

    private var secondKillHero: some View {
        NavigationLink {
            SecondKillView()
        } label: {
            VStack(alignment: .leading, spacing: 12) {
                HStack(spacing: 8) {
                    Image(systemName: "bolt.fill")
                        .font(.title3)
                        .foregroundColor(.white)
                    Text("秒杀殿堂")
                        .font(.system(size: 20, weight: .black, design: .rounded))
                        .foregroundColor(.white)
                    Spacer()
                    Text("\(SampleData.secondKillCases.count) 道压轴")
                        .font(.caption2)
                        .foregroundColor(.white.opacity(0.9))
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.9))
                }

                Text("用高维数学俯瞰高考压轴 · 常规法 vs 降维秒杀")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.92))

                HStack(spacing: 8) {
                    ForEach(["二次求导", "洛必达", "泰勒展开", "极值点偏移"], id: \.self) { w in
                        Text(w)
                            .font(.system(size: 10, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 8).padding(.vertical, 3)
                            .background(Color.white.opacity(0.18))
                            .cornerRadius(7)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(20)
            .background(
                LinearGradient(
                    colors: [Color.apexLava, Color.apexMystery],
                    startPoint: .topLeading, endPoint: .bottomTrailing
                )
            )
            .cornerRadius(Radius.hero)
            .shadow(color: Color.apexLava.opacity(0.3), radius: 14, y: 8)
        }
        .buttonStyle(.plain)
    }

    // MARK: - 完整版解锁入口

    private var unlockCard: some View {
        Button {
            showPaywall = true
        } label: {
            HStack(spacing: 14) {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.apexGold.opacity(0.15))
                        .frame(width: 46, height: 46)
                    Image(systemName: "crown.fill")
                        .font(.title3)
                        .foregroundColor(.apexGold)
                }
                VStack(alignment: .leading, spacing: 3) {
                    Text("解锁完整版")
                        .font(.headline).foregroundColor(.primary)
                    Text("一次买断 · 全部 \(SampleData.secondKillCases.count) 道压轴战例与降维武器")
                        .font(.caption).foregroundColor(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
                Spacer()
                HStack(spacing: 4) {
                    Text(purchase.product?.displayPrice ?? "¥18")
                        .font(.subheadline).fontWeight(.bold).foregroundColor(.apexLava)
                    Image(systemName: "chevron.right")
                        .font(.caption).foregroundColor(.secondary)
                }
            }
            .padding(16)
            .frame(maxWidth: .infinity)
            .background(Color.apexCardSurface)
            .cornerRadius(Radius.card)
            .overlay(
                RoundedRectangle(cornerRadius: Radius.card)
                    .stroke(Color.apexGold.opacity(0.35), lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
    }

    // MARK: - Countdown + Streak

    private var countdownAndStreakCard: some View {
        HStack(spacing: 12) {
            // Gaokao countdown
            Button {
                showDatePicker = true
            } label: {
                VStack(spacing: 6) {
                    if let days = streakManager.daysUntilGaokao, days >= 0 {
                        Text("\(days)")
                            .font(.system(size: 32, weight: .black, design: .rounded))
                            .foregroundColor(days <= 30 ? .apexLava : .apexStarBlue)
                        Text("天后高考")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    } else {
                        Image(systemName: "calendar.badge.plus")
                            .font(.title2)
                            .foregroundColor(.apexStarBlue)
                        Text("设置高考日期")
                            .font(.caption2)
                            .foregroundColor(.apexStarBlue)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 18)
                .background(Color.apexCardSurface)
                .cornerRadius(Radius.card)
            }

            // Streak
            VStack(spacing: 6) {
                HStack(spacing: 4) {
                    Image(systemName: "flame.fill")
                        .foregroundColor(streakManager.currentStreak > 0 ? .orange : .gray)
                    Text("\(streakManager.currentStreak)")
                        .font(.system(size: 32, weight: .black, design: .rounded))
                        .foregroundColor(streakManager.currentStreak > 0 ? .orange : .gray)
                }
                Text("连续打卡")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 18)
            .background(Color.apexCardSurface)
            .cornerRadius(Radius.card)

            // Today stats
            VStack(spacing: 6) {
                let pm = PracticeManager.shared
                Text("\(pm.todayAnswered)")
                    .font(.system(size: 32, weight: .black, design: .rounded))
                    .foregroundColor(pm.todayAnswered >= 10 ? .apexEmerald : .apexGold)
                Text("今日做题")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 18)
            .background(Color.apexCardSurface)
            .cornerRadius(Radius.card)
        }
    }

    // MARK: - Daily Tasks

    private var dailyTasksCard: some View {
        let pm = PracticeManager.shared
        let scheduler = ReviewScheduler.shared
        let dueCount = scheduler.dueCount
        let todayDone = pm.todayAnswered
        let wrongCount = pm.wrongProblems().count
        let targetProblems = 10

        // Calculate task progress
        let tasks: [(icon: String, text: String, done: Bool, color: Color)] = [
            ("arrow.counterclockwise", "复习 \(dueCount) 道待复习题", dueCount == 0 && scheduler.totalScheduled > 0, .apexLava),
            ("pencil.line", "今日做题 \(todayDone)/\(targetProblems)", todayDone >= targetProblems, .apexStarBlue),
            ("exclamationmark.triangle", "攻克 \(min(wrongCount, 3)) 道错题", wrongCount == 0, .apexGold),
        ]

        let completedTasks = tasks.filter(\.done).count

        return VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "checklist")
                    .foregroundColor(.apexEmerald)
                Text("今日任务")
                    .font(.headline)
                    .foregroundColor(.primary)
                Spacer()
                Text("\(completedTasks)/\(tasks.count)")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(completedTasks == tasks.count ? .apexEmerald : .secondary)
            }

            // Progress bar
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.gray.opacity(0.15))
                        .frame(height: 6)
                    RoundedRectangle(cornerRadius: 4)
                        .fill(completedTasks == tasks.count ? Color.apexEmerald : Color.apexGold)
                        .frame(width: geo.size.width * CGFloat(completedTasks) / CGFloat(tasks.count), height: 6)
                }
            }
            .frame(height: 6)

            ForEach(Array(tasks.enumerated()), id: \.offset) { _, task in
                HStack(spacing: 10) {
                    Image(systemName: task.done ? "checkmark.circle.fill" : "circle")
                        .font(.subheadline)
                        .foregroundColor(task.done ? .apexEmerald : task.color)
                    Text(task.text)
                        .font(.subheadline)
                        .foregroundColor(task.done ? .secondary : .primary)
                        .strikethrough(task.done, color: .secondary)
                    Spacer()
                }
            }

            // Action button
            if dueCount > 0 {
                Button {
                    showReview = true
                } label: {
                    HStack(spacing: 6) {
                        Image(systemName: "play.fill")
                            .font(.caption)
                        Text("开始复习")
                    }
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(Color.apexLava)
                    .cornerRadius(12)
                }
            } else if todayDone < targetProblems {
                Button {
                    selectedTab = 1
                } label: {
                    HStack(spacing: 6) {
                        Image(systemName: "play.fill")
                            .font(.caption)
                        Text("开始做题")
                    }
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(Color.apexStarBlue)
                    .cornerRadius(12)
                }
            }
        }
        .padding(20)
        .background(Color.apexCardSurface)
        .cornerRadius(Radius.card)
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }

    // MARK: - Achievements

    private var achievementsCard: some View {
        let achievements = streakManager.achievements()
        let unlocked = achievements.filter(\.isUnlocked)
        let locked = achievements.filter { !$0.isUnlocked }

        return Group {
            if PracticeManager.shared.totalAnswered > 0 {
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "trophy.fill")
                            .foregroundColor(.apexGold)
                        Text("成就")
                            .font(.headline)
                            .foregroundColor(.primary)
                        Spacer()
                        Text("\(unlocked.count)/\(achievements.count)")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.apexGold)
                    }

                    // Unlocked
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(unlocked) { a in
                                VStack(spacing: 6) {
                                    ZStack {
                                        Circle()
                                            .fill(Color.apexGold.opacity(0.15))
                                            .frame(width: 44, height: 44)
                                        Image(systemName: a.icon)
                                            .font(.title3)
                                            .foregroundColor(.apexGold)
                                    }
                                    Text(a.title)
                                        .font(.caption2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.primary)
                                    Text(a.description)
                                        .font(.system(size: 9))
                                        .foregroundColor(.secondary)
                                }
                                .frame(width: 80)
                            }

                            // Next locked achievements (show 2)
                            ForEach(locked.prefix(2)) { a in
                                VStack(spacing: 6) {
                                    ZStack {
                                        Circle()
                                            .fill(Color.gray.opacity(0.1))
                                            .frame(width: 44, height: 44)
                                        Image(systemName: "lock.fill")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                    Text(a.title)
                                        .font(.caption2)
                                        .foregroundColor(.gray)
                                    Text(a.description)
                                        .font(.system(size: 9))
                                        .foregroundColor(.gray)
                                }
                                .frame(width: 80)
                            }
                        }
                    }
                }
                .padding(20)
                .background(Color.apexCardSurface)
                .cornerRadius(Radius.card)
                .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
            }
        }
    }

    // MARK: - Daily Strike

    private var dailyStrikeCard: some View {
        Button {
            showDailyStrike = true
        } label: {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Image(systemName: "sparkle")
                        .foregroundColor(.apexGold)
                        .font(.title2)
                    Text("每日一击")
                        .font(.headline)
                        .foregroundColor(.primary)
                    Spacer()
                    Text("点击挑战")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Image(systemName: "chevron.right")
                        .foregroundColor(.secondary)
                }

                Text(SampleData.dailyStrikes.randomElement()?.question ?? "今日暂无题目")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
            .padding(20)
            .background(
                LinearGradient(
                    colors: [Color.apexGold.opacity(0.15), Color.apexCardSurface],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .cornerRadius(Radius.card)
            .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
        }
    }

    // MARK: - Content Overview (real data)

    private var contentOverviewCard: some View {
        let formulaCount = SampleData.formulas.count
        let problemCount = SampleData.problems.count
        let heroCount = SampleData.heroes.count
        let mysteryCount = SampleData.mysteries.count
        let masteredCount = ProblemMasteryManager.shared.masteredCount

        return VStack(spacing: 12) {
            HStack(spacing: 0) {
                StatBubble(value: "\(formulaCount)", unit: "个", label: "公式", color: .apexStarBlue) {
                    selectedTab = 4
                }
                StatBubble(value: "\(problemCount)", unit: "道", label: "练习题", color: .apexEmerald) {
                    selectedTab = 1
                }
                StatBubble(value: "\(mysteryCount)", unit: "个", label: "数学悬案", color: .apexMystery) {
                    selectedTab = 3
                }
                StatBubble(value: "\(heroCount)", unit: "位", label: "数学家", color: .apexGold) {
                    selectedTab = 5
                }
            }

            if masteredCount > 0 {
                HStack(spacing: 6) {
                    Image(systemName: "checkmark.seal.fill")
                        .font(.caption2)
                        .foregroundColor(.apexEmerald)
                    Text("已掌握 \(masteredCount)/\(problemCount) 道题")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Spacer()
                    // Progress bar
                    GeometryReader { geo in
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 2)
                                .fill(Color.gray.opacity(0.15))
                                .frame(height: 4)
                            RoundedRectangle(cornerRadius: 2)
                                .fill(Color.apexEmerald)
                                .frame(width: geo.size.width * CGFloat(masteredCount) / CGFloat(max(problemCount, 1)), height: 4)
                        }
                    }
                    .frame(width: 60, height: 4)
                }
                .padding(.horizontal, 16)
            }
        }
        .padding(.vertical, 18)
        .padding(.horizontal, 8)
        .background(Color.apexCardSurface)
        .cornerRadius(Radius.card)
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }

    // MARK: - Learning Roadmap (real formula structure)

    private var learningRoadmap: some View {
        let levelGroups = groupFormulasByLevel()

        return VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "map.fill")
                    .foregroundColor(.apexLava)
                Text("学习路线图")
                    .font(.headline)
                    .foregroundColor(.primary)
                Spacer()
                Text("共 \(SampleData.formulas.count) 个知识点")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Text("按难度递进，从基础到进阶，点击展开查看各级别公式")
                .font(.caption)
                .foregroundColor(.secondary)

            VStack(spacing: 0) {
                ForEach(Array(levelGroups.enumerated()), id: \.element.level) { index, group in
                    levelRow(group: group, index: index, total: levelGroups.count)
                }
            }
        }
        .padding(Spacing.xxl)
        .background(Color.apexCardSurface)
        .cornerRadius(Radius.card)
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }

    private func levelRow(group: LevelGroup, index: Int, total: Int) -> some View {
        let isExpanded = expandedLevel == group.level

        return VStack(spacing: 0) {
            Button {
                withAnimation(.easeInOut(duration: 0.25)) {
                    expandedLevel = isExpanded ? nil : group.level
                }
            } label: {
                HStack(spacing: 14) {
                    // Level node
                    VStack(spacing: 0) {
                        ZStack {
                            Circle()
                                .fill(group.color)
                                .frame(width: 36, height: 36)
                            Text("\(group.formulas.count)")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }

                        if index < total - 1 {
                            Rectangle()
                                .fill(group.color.opacity(0.3))
                                .frame(width: 2, height: isExpanded ? 0 : 32)
                        }
                    }

                    VStack(alignment: .leading, spacing: 3) {
                        Text(group.level.displayName)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)

                        Text("\(group.formulas.count) 个公式 · \(group.categories.joined(separator: "、"))")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .lineLimit(1)
                    }

                    Spacer()

                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }

            // Expanded formula list
            if isExpanded {
                VStack(spacing: 6) {
                    ForEach(group.formulas) { formula in
                        Button {
                            selectedFormula = formula
                        } label: {
                            HStack(spacing: 10) {
                                Circle()
                                    .fill(group.color.opacity(0.15))
                                    .frame(width: 8, height: 8)

                                Text(formula.name)
                                    .font(.subheadline)
                                    .foregroundColor(.primary)

                                Spacer()

                                if formula.gaokaoRelevance > 0.7 {
                                    Text("高考重点")
                                        .font(.system(size: 9))
                                        .foregroundColor(.apexLava)
                                        .padding(.horizontal, 6)
                                        .padding(.vertical, 2)
                                        .background(Color.apexLava.opacity(0.1))
                                        .cornerRadius(4)
                                }

                                Image(systemName: "chevron.right")
                                    .font(.system(size: 10))
                                    .foregroundColor(.secondary)
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                            .background(Color.apexBackground.opacity(0.5))
                            .cornerRadius(10)
                        }
                    }
                }
                .padding(.leading, 50)
                .padding(.top, 6)
                .padding(.bottom, 12)

                if index < total - 1 {
                    HStack {
                        Rectangle()
                            .fill(group.color.opacity(0.3))
                            .frame(width: 2, height: 20)
                            .padding(.leading, 17)
                        Spacer()
                    }
                }
            }
        }
    }

    // MARK: - Knowledge Coverage (real category data)

    private var knowledgeCoverageCard: some View {
        let categories = categoryStats()

        return VStack(alignment: .leading, spacing: 14) {
            HStack {
                Image(systemName: "chart.bar.fill")
                    .foregroundColor(.apexEmerald)
                Text("知识点分布")
                    .font(.headline)
                    .foregroundColor(.primary)
            }

            Text("各分类公式与练习题覆盖情况")
                .font(.caption)
                .foregroundColor(.secondary)

            VStack(spacing: 10) {
                ForEach(categories, id: \.category) { stat in
                    HStack(spacing: 10) {
                        Text(stat.category.displayName)
                            .font(.caption)
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                            .frame(width: 65, alignment: .leading)

                        // Formula bar
                        GeometryReader { geo in
                            let maxFormulas = categories.map(\.formulaCount).max() ?? 1
                            let width = CGFloat(stat.formulaCount) / CGFloat(maxFormulas) * geo.size.width
                            RoundedRectangle(cornerRadius: 3)
                                .fill(stat.barColor)
                                .frame(width: max(width, 4), height: 14)
                        }
                        .frame(height: 14)

                        Text("\(stat.formulaCount)式")
                            .font(.system(size: 10, design: .monospaced))
                            .foregroundColor(.secondary)
                            .frame(width: 32, alignment: .trailing)

                        Text("\(stat.problemCount)题")
                            .font(.system(size: 10, design: .monospaced))
                            .foregroundColor(stat.problemCount > 0 ? .apexEmerald : .secondary.opacity(0.5))
                            .frame(width: 32, alignment: .trailing)
                    }
                }
            }

            // Summary
            let totalFormulas = categories.reduce(0) { $0 + $1.formulaCount }
            let coveredCategories = categories.filter { $0.problemCount > 0 }.count
            HStack {
                Text("共 \(totalFormulas) 个公式")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Spacer()
                Text("\(coveredCategories)/\(categories.count) 个分类有练习题")
                    .font(.caption)
                    .foregroundColor(coveredCategories == categories.count ? .apexEmerald : .apexGold)
            }
            .padding(.top, 4)
        }
        .padding(20)
        .background(Color.apexCardSurface)
        .cornerRadius(Radius.card)
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }

    // MARK: - Gaokao Readiness (based on real formula relevance)

    private var gaokaoReadinessCard: some View {
        let highSchoolFormulas = SampleData.formulas.filter { $0.level == .high }
        let highRelevance = highSchoolFormulas.filter { $0.gaokaoRelevance >= 0.7 }
        let medRelevance = highSchoolFormulas.filter { $0.gaokaoRelevance >= 0.4 && $0.gaokaoRelevance < 0.7 }
        let problemsWithDual = SampleData.problems.filter { $0.dualSolution != nil }

        return VStack(alignment: .leading, spacing: 14) {
            HStack {
                Image(systemName: "graduationcap.fill")
                    .foregroundColor(.apexLava)
                Text("高考知识储备")
                    .font(.headline)
                    .foregroundColor(.primary)
            }

            VStack(spacing: 10) {
                GaokaoStatRow(
                    icon: "star.fill",
                    label: "高频考点公式",
                    value: "\(highRelevance.count) 个",
                    detail: "相关度 >= 70%",
                    color: .apexLava
                )
                GaokaoStatRow(
                    icon: "circle.hexagongrid.fill",
                    label: "中频考点公式",
                    value: "\(medRelevance.count) 个",
                    detail: "相关度 40%-70%",
                    color: .apexGold
                )
                GaokaoStatRow(
                    icon: "bolt.fill",
                    label: "降维秒杀题",
                    value: "\(problemsWithDual.count) 道",
                    detail: "含标准+秒杀双解法",
                    color: .apexMystery
                )
                GaokaoStatRow(
                    icon: "doc.text.fill",
                    label: "高中总公式",
                    value: "\(highSchoolFormulas.count) 个",
                    detail: "覆盖代数/几何/三角/概率",
                    color: .apexStarBlue
                )
            }

            Button {
                selectedTab = 1
            } label: {
                HStack {
                    Image(systemName: "arrow.right.circle.fill")
                    Text("开始高考专项练习")
                }
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 13)
                .background(Color.apexLava)
                .cornerRadius(14)
            }
        }
        .padding(20)
        .background(Color.apexCardSurface)
        .cornerRadius(Radius.card)
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }

    // MARK: - Practice Stats Card

    private var practiceStatsCard: some View {
        let pm = PracticeManager.shared
        let wrongCount = pm.wrongProblems().count
        let weakTags = pm.weakTags(from: SampleData.problems)

        return Group {
            if pm.totalAnswered > 0 {
                VStack(alignment: .leading, spacing: 14) {
                    HStack {
                        Image(systemName: "chart.line.uptrend.xyaxis")
                            .foregroundColor(.apexStarBlue)
                        Text("做题统计")
                            .font(.headline)
                            .foregroundColor(.primary)
                        Spacer()
                        Button {
                            selectedTab = 2
                        } label: {
                            Text("错题本")
                                .font(.caption)
                                .foregroundColor(.apexLava)
                        }
                    }

                    HStack(spacing: 0) {
                        VStack(spacing: 4) {
                            Text("\(pm.todayAnswered)")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .foregroundColor(.apexStarBlue)
                            Text("今日做题")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                        }
                        .frame(maxWidth: .infinity)

                        VStack(spacing: 4) {
                            Text(String(format: "%.0f%%", pm.overallAccuracy * 100))
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .foregroundColor(pm.overallAccuracy >= 0.6 ? .apexEmerald : .apexLava)
                            Text("总正确率")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                        }
                        .frame(maxWidth: .infinity)

                        VStack(spacing: 4) {
                            Text("\(wrongCount)")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .foregroundColor(wrongCount > 0 ? .apexLava : .apexEmerald)
                            Text("错题")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                        }
                        .frame(maxWidth: .infinity)

                        VStack(spacing: 4) {
                            Text("\(pm.totalAnswered)")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .foregroundColor(.apexGold)
                            Text("总做题")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                        }
                        .frame(maxWidth: .infinity)
                    }

                    // Weak tags
                    if !weakTags.isEmpty {
                        Divider()
                        HStack(spacing: 6) {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .font(.caption)
                                .foregroundColor(.apexLava)
                            Text("薄弱知识点")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.apexLava)
                        }

                        ForEach(weakTags.prefix(3)) { tag in
                            HStack(spacing: 8) {
                                Text(tag.tag)
                                    .font(.caption)
                                    .foregroundColor(.primary)
                                Spacer()
                                Text(String(format: "%.0f%%", tag.accuracy * 100))
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.apexLava)
                                // Mini progress bar
                                GeometryReader { geo in
                                    ZStack(alignment: .leading) {
                                        RoundedRectangle(cornerRadius: 2)
                                            .fill(Color.gray.opacity(0.15))
                                            .frame(height: 4)
                                        RoundedRectangle(cornerRadius: 2)
                                            .fill(tag.accuracy >= 0.5 ? Color.apexGold : Color.apexLava)
                                            .frame(width: geo.size.width * tag.accuracy, height: 4)
                                    }
                                }
                                .frame(width: 50, height: 4)
                            }
                        }
                    }
                }
                .padding(20)
                .background(Color.apexCardSurface)
                .cornerRadius(Radius.card)
                .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
            }
        }
    }

    // MARK: - Quick Actions

    private var quickActions: some View {
        HStack(spacing: 12) {
            QuickActionButton(icon: "target", title: "练习", subtitle: "高考实战", color: .levelHigh) {
                selectedTab = 1
            }
            QuickActionButton(icon: "exclamationmark.triangle", title: "错题", subtitle: "薄弱攻克", color: .apexLava) {
                selectedTab = 2
            }
            QuickActionButton(icon: "aqi.medium", title: "公式", subtitle: "知识图谱", color: .levelMiddle) {
                selectedTab = 4
            }
        }
    }

    // MARK: - Data Helpers

    private struct LevelGroup: Identifiable {
        var id: String { level.rawValue }
        let level: FormulaLevel
        let formulas: [Formula]
        let color: Color
        let categories: [String]
    }

    private func groupFormulasByLevel() -> [LevelGroup] {
        let order: [FormulaLevel] = [.elementary, .middle, .high, .university, .advanced]
        let colors: [FormulaLevel: Color] = [
            .elementary: .levelElementary,
            .middle: .levelMiddle,
            .high: .levelHigh,
            .university: .levelUniversity,
            .advanced: .levelAdvanced
        ]

        return order.compactMap { level in
            let formulas = SampleData.formulas.filter { $0.level == level }
            guard !formulas.isEmpty else { return nil }
            let cats = Array(Set(formulas.map { $0.category.displayName })).sorted()
            return LevelGroup(
                level: level,
                formulas: formulas,
                color: colors[level] ?? .gray,
                categories: cats
            )
        }
    }

    private struct CategoryStat {
        let category: FormulaCategory
        let formulaCount: Int
        let problemCount: Int
        let barColor: Color
    }

    private func categoryStats() -> [CategoryStat] {
        let colors: [FormulaCategory: Color] = [
            .algebra: .apexStarBlue,
            .geometry: .apexEmerald,
            .trigonometry: .apexLava,
            .calculus: .apexMystery,
            .linearAlgebra: .apexGold,
            .probability: .levelElementary,
            .sequences: .levelMiddle,
            .complexNumbers: .rainbowIndigo,
            .inequalities: .rainbowOrange,
            .conicSections: .rainbowTeal
        ]

        return FormulaCategory.allCases
            .map { cat in
                let fCount = SampleData.formulas.filter { $0.category == cat }.count
                let pCount = SampleData.problems.filter { $0.tags.contains(cat.displayName) }.count
                return CategoryStat(
                    category: cat,
                    formulaCount: fCount,
                    problemCount: pCount,
                    barColor: colors[cat] ?? .gray
                )
            }
            .filter { $0.formulaCount > 0 }
            .sorted { $0.formulaCount > $1.formulaCount }
    }
}

// MARK: - Subviews

struct StatBubble: View {
    let value: String
    let unit: String
    let label: String
    let color: Color
    var action: (() -> Void)?

    var body: some View {
        Button {
            action?()
        } label: {
            VStack(spacing: 5) {
                HStack(alignment: .lastTextBaseline, spacing: 2) {
                    Text(value)
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .foregroundColor(color)
                    if !unit.isEmpty {
                        Text(unit)
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                }
                Text(label)
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct GaokaoStatRow: View {
    let icon: String
    let label: String
    let value: String
    let detail: String
    let color: Color

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.subheadline)
                .foregroundColor(color)
                .frame(width: 24)

            VStack(alignment: .leading, spacing: 2) {
                Text(label)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                Text(detail)
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Text(value)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(color)
        }
        .padding(.vertical, 6)
    }
}

struct QuickActionButton: View {
    let icon: String
    let title: String
    let subtitle: String
    let color: Color
    var action: (() -> Void)?

    var body: some View {
        Button {
            action?()
        } label: {
            VStack(spacing: 8) {
                ZStack {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(color.opacity(0.12))
                        .frame(height: 56)
                    Image(systemName: icon)
                        .font(.title2)
                        .foregroundColor(color)
                }
                Text(title)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                Text(subtitle)
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(Color.apexCardSurface)
            .cornerRadius(Radius.card)
            .shadow(color: .black.opacity(0.04), radius: 6, y: 3)
        }
    }
}

// MARK: - Gaokao Date Picker

struct GaokaoDatePickerView: View {
    @ObservedObject var streakManager: StreakManager
    @Binding var isPresented: Bool
    @State private var selectedDate: Date = {
        // Default: next June 7
        let cal = Calendar.current
        var comps = cal.dateComponents([.year], from: Date())
        comps.month = 6
        comps.day = 7
        let thisYear = cal.date(from: comps) ?? Date()
        return thisYear > Date() ? thisYear : cal.date(byAdding: .year, value: 1, to: thisYear) ?? Date()
    }()

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Image(systemName: "graduationcap.fill")
                    .font(.system(size: 48))
                    .foregroundColor(.apexLava)

                Text("设置高考日期")
                    .font(.title2)
                    .fontWeight(.bold)

                DatePicker("高考日期", selection: $selectedDate, in: Date()..., displayedComponents: .date)
                    .datePickerStyle(.graphical)
                    .tint(.apexLava)

                Button {
                    streakManager.setGaokaoDate(selectedDate)
                    isPresented = false
                } label: {
                    Text("确定")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(Color.apexLava)
                        .cornerRadius(14)
                }

                Spacer()
            }
            .padding(Spacing.xxl)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("取消") { isPresented = false }
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}
