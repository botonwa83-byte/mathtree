import SwiftUI

// MARK: - 秒杀殿堂（产品灵魂）
// 由探索首页的灵魂 Hero 进入。结构：英雄区 → 武器库 → 历年压轴战例。
// 自身不包裹 NavigationStack（由调用方的 NavigationStack 提供导航）。

struct SecondKillView: View {
    @StateObject private var purchase = PurchaseManager.shared
    @State private var showPaywall = false

    private var cases: [SecondKillCase] { SampleData.secondKillCases }

    private var weapons: [KillWeapon] {
        // 按"战例中实际出现"的武器排序，且去重保持稳定
        var seen = Set<String>()
        return cases.compactMap { c in
            guard !seen.contains(c.weapon.id) else { return nil }
            seen.insert(c.weapon.id); return c.weapon
        }
    }

    /// 前 N 把武器免费（稳定 Set，不随刷新变化）
    private var freeWeaponIDs: Set<String> {
        Set(weapons.prefix(PurchaseManager.freeWeaponCount).map(\.id))
    }

    private func isLocked(_ weapon: KillWeapon) -> Bool {
        !purchase.isUnlocked && !freeWeaponIDs.contains(weapon.id)
    }

    private func cases(for weapon: KillWeapon) -> [SecondKillCase] {
        cases.filter { $0.weapon == weapon }
    }

    /// 精选对决：按省时倍数取最震撼的前 6 道（首页只给"尝鲜"，全部走"全部战例"页）。
    private var featuredCases: [SecondKillCase] {
        Array(cases.sorted { $0.speedup > $1.speedup }.prefix(6))
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 22) {
                heroHeader
                creedBanner
                featuredSection
                arsenalSection
                originNote
            }
            .padding(.horizontal, 20)
            .padding(.top, 8)
            .padding(.bottom, 32)
            .readableContentWidth()
        }
        .background(Color.apexBackground)
        .navigationTitle("降维打击")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showPaywall) { SKPaywallView() }
    }

    // MARK: 英雄区

    private var heroHeader: some View {
        VStack(spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: "bolt.fill")
                    .font(.title2)
                    .foregroundColor(.white)
                Text("秒杀殿堂")
                    .font(.system(size: 26, weight: .black, design: .rounded))
                    .foregroundColor(.white)
            }
            Text("用高维数学俯瞰高考压轴")
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.9))

            HStack(spacing: 0) {
                heroStat("\(cases.count)", "压轴战例")
                heroDivider
                heroStat("\(weapons.count)", "秒杀武器")
                heroDivider
                heroStat("2", "解法对决")
            }
            .padding(.top, 4)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 26)
        .padding(.horizontal, 16)
        .background(
            LinearGradient(
                colors: [Color.apexLava, Color.apexMystery],
                startPoint: .topLeading, endPoint: .bottomTrailing
            )
        )
        .cornerRadius(24)
        .shadow(color: Color.apexLava.opacity(0.25), radius: 14, y: 8)
    }

    private func heroStat(_ value: String, _ label: String) -> some View {
        VStack(spacing: 3) {
            Text(value)
                .font(.system(size: 24, weight: .black, design: .rounded))
                .foregroundColor(.white)
            Text(label)
                .font(.caption2)
                .foregroundColor(.white.opacity(0.85))
        }
        .frame(maxWidth: .infinity)
    }

    private var heroDivider: some View {
        Rectangle().fill(Color.white.opacity(0.25)).frame(width: 1, height: 28)
    }

    // MARK: 使用守则

    private var creedBanner: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: "exclamationmark.shield.fill")
                .foregroundColor(.apexGold)
            VStack(alignment: .leading, spacing: 3) {
                Text("秒杀使用守则")
                    .font(.subheadline).fontWeight(.bold)
                    .foregroundColor(.primary)
                Text("超纲武器（洛必达/泰勒/中值…）选择填空可直接秒；大题用来先秒出答案、再倒推标准步骤。每道战例都标注了能否直接书写。")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(14)
        .background(Color.apexGold.opacity(0.1))
        .cornerRadius(14)
    }

    // MARK: 武器库

    private var arsenalSection: some View {
        let descent = weapons.filter { !$0.isExamTechnique }
        let technique = weapons.filter { $0.isExamTechnique }
        return VStack(alignment: .leading, spacing: 16) {
            sectionHeader(icon: "shippingbox.fill", title: "武器库", subtitle: "按工具组织，认信号、掏武器")

            weaponGroup(title: "降维武器 · 高维秒压轴", subtitle: "大学知识 / 纲内深用，攻函数导数等压轴大题", weapons: descent)

            weaponGroup(title: "选择题技巧 · 考场抢分", subtitle: "不超纲、学校讲得浅，选填直接秒答案", weapons: technique)
        }
    }

    private func weaponGroup(title: String, subtitle: String, weapons: [KillWeapon]) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading, spacing: 1) {
                Text(title).font(.subheadline).fontWeight(.bold).foregroundColor(.primary)
                Text(subtitle).font(.caption2).foregroundColor(.secondary)
            }
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)], spacing: 12) {
                ForEach(weapons) { weapon in
                    if isLocked(weapon) {
                        // 已锁：显示加锁卡片，点击弹出付费墙
                        Button { showPaywall = true } label: {
                            SKWeaponCard(weapon: weapon, count: cases(for: weapon).count, locked: true)
                        }
                        .buttonStyle(.plain)
                    } else {
                        // 已解锁：正常进入详情
                        NavigationLink {
                            KillWeaponDetailView(weapon: weapon, cases: cases(for: weapon))
                        } label: {
                            SKWeaponCard(weapon: weapon, count: cases(for: weapon).count, locked: false)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
    }

    // MARK: 战例

    private var featuredSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            // 标题行 + "全部"入口
            HStack(spacing: 8) {
                Image(systemName: "bolt.fill").foregroundColor(.apexLava)
                VStack(alignment: .leading, spacing: 1) {
                    Text("精选对决").font(.headline).foregroundColor(.primary)
                    Text("省时最震撼的几道 · 常规法 vs 降维秒杀")
                        .font(.caption2).foregroundColor(.secondary)
                }
                Spacer()
                NavigationLink {
                    AllCasesView(cases: cases)
                } label: {
                    HStack(spacing: 2) {
                        Text("全部 \(cases.count) 道").font(.caption).fontWeight(.semibold)
                        Image(systemName: "chevron.right").font(.caption2)
                    }
                    .foregroundColor(.apexLava)
                }
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(featuredCases) { c in
                        NavigationLink {
                            KillDuelView(killCase: c)
                        } label: {
                            SKFeaturedCard(killCase: c)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.vertical, 2)
            }
        }
    }

    private var originNote: some View {
        Text("题型源自近二十年高考压轴高频题型，部分为改编；不臆造具体年份卷号。")
            .font(.caption2)
            .foregroundColor(.secondary)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity)
            .padding(.top, 4)
    }

    private func sectionHeader(icon: String, title: String, subtitle: String) -> some View {
        HStack(spacing: 8) {
            Image(systemName: icon).foregroundColor(.apexLava)
            VStack(alignment: .leading, spacing: 1) {
                Text(title).font(.headline).foregroundColor(.primary)
                Text(subtitle).font(.caption2).foregroundColor(.secondary)
            }
            Spacer()
        }
    }
}

// MARK: - 武器卡

private struct SKWeaponCard: View {
    let weapon: KillWeapon
    let count: Int
    var locked: Bool = false

    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(weapon.tint.opacity(locked ? 0.08 : 0.15))
                            .frame(width: 40, height: 40)
                        Image(systemName: weapon.icon)
                            .font(.title3)
                            .foregroundColor(weapon.tint.opacity(locked ? 0.4 : 1))
                    }
                    Spacer()
                    if locked {
                        Image(systemName: "lock.fill")
                            .font(.caption)
                            .foregroundColor(.secondary.opacity(0.7))
                            .padding(.horizontal, 6).padding(.vertical, 2)
                            .background(Color.secondary.opacity(0.08))
                            .cornerRadius(5)
                    } else {
                        Text(weapon.inSyllabus ? "纲内" : "超纲")
                            .font(.system(size: 9, weight: .bold))
                            .foregroundColor(weapon.inSyllabus ? .apexEmerald : .apexMystery)
                            .padding(.horizontal, 6).padding(.vertical, 2)
                            .background((weapon.inSyllabus ? Color.apexEmerald : Color.apexMystery).opacity(0.12))
                            .cornerRadius(5)
                    }
                }
                Text(weapon.displayName)
                    .font(.subheadline).fontWeight(.bold)
                    .foregroundColor(locked ? .secondary : .primary)
                    .lineLimit(1).minimumScaleFactor(0.8)
                Text(locked ? "解锁后可查看" : weapon.tagline)
                    .font(.caption2)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("\(count) 道战例")
                    .font(.system(size: 10, weight: .semibold))
                    .foregroundColor(locked ? .secondary.opacity(0.5) : weapon.tint)
            }
            .padding(14)
            .frame(maxWidth: .infinity, minHeight: 130, alignment: .topLeading)
            .background(Color.apexCardSurface.opacity(locked ? 0.6 : 1))
            .cornerRadius(16)
            .shadow(color: .black.opacity(locked ? 0.02 : 0.05), radius: 6, y: 3)
        }
    }
}

// MARK: - 战例行

private struct SKCaseRow: View {
    let killCase: SecondKillCase

    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(killCase.weapon.tint.opacity(0.15))
                    .frame(width: 44, height: 44)
                Image(systemName: killCase.weapon.icon)
                    .foregroundColor(killCase.weapon.tint)
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(killCase.title)
                    .font(.subheadline).fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack(spacing: 6) {
                    Text(killCase.weapon.displayName)
                        .font(.system(size: 10, weight: .semibold))
                        .foregroundColor(killCase.weapon.tint)
                        .padding(.horizontal, 6).padding(.vertical, 2)
                        .background(killCase.weapon.tint.opacity(0.12))
                        .cornerRadius(5)
                    Label("\(Int(killCase.speedup.rounded()))×", systemImage: "bolt.fill")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(.apexLava)
                }
            }
            Image(systemName: "chevron.right")
                .font(.caption).foregroundColor(.secondary)
        }
        .padding(14)
        .background(Color.apexCardSurface)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.04), radius: 5, y: 2)
    }
}

// MARK: - 精选对决卡（横滑用，紧凑固定宽）

private struct SKFeaturedCard: View {
    let killCase: SecondKillCase

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(killCase.weapon.tint.opacity(0.15))
                        .frame(width: 36, height: 36)
                    Image(systemName: killCase.weapon.icon)
                        .foregroundColor(killCase.weapon.tint)
                }
                Spacer()
                HStack(spacing: 3) {
                    Image(systemName: "bolt.fill")
                    Text("\(Int(killCase.speedup.rounded()))×")
                }
                .font(.system(size: 12, weight: .black, design: .rounded))
                .foregroundColor(.white)
                .padding(.horizontal, 8).padding(.vertical, 3)
                .background(Color.apexLava)
                .cornerRadius(Radius.chip)
            }

            Text(killCase.title)
                .font(.subheadline).fontWeight(.bold)
                .foregroundColor(.primary)
                .lineLimit(3)
                .frame(maxWidth: .infinity, alignment: .leading)

            Spacer(minLength: 0)

            Text(killCase.weapon.displayName)
                .font(.caption2).fontWeight(.semibold)
                .foregroundColor(killCase.weapon.tint)
                .lineLimit(1)
        }
        .padding(14)
        .frame(width: 190, height: 158, alignment: .topLeading)
        .background(Color.apexCardSurface)
        .cornerRadius(Radius.card)
        .cardShadow()
    }
}

// MARK: - 全部压轴战例（独立列表页，懒加载 + 分组筛选）

struct AllCasesView: View {
    let cases: [SecondKillCase]
    @State private var filter: CaseFilter = .all

    enum CaseFilter: String, CaseIterable, Identifiable {
        case all = "全部"
        case descent = "降维武器"
        case technique = "选择题技巧"
        var id: String { rawValue }
    }

    private var shown: [SecondKillCase] {
        switch filter {
        case .all:       return cases
        case .descent:   return cases.filter { !$0.weapon.isExamTechnique }
        case .technique: return cases.filter { $0.weapon.isExamTechnique }
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            // 分组筛选
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(CaseFilter.allCases) { f in
                        let selected = filter == f
                        Button {
                            filter = f
                        } label: {
                            Text(f.rawValue)
                                .font(.caption).fontWeight(.semibold)
                                .foregroundColor(selected ? .white : .apexLava)
                                .padding(.horizontal, 14).padding(.vertical, 7)
                                .background(selected ? Color.apexLava : Color.apexLava.opacity(0.1))
                                .cornerRadius(Radius.chip)
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
            }

            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(shown) { c in
                        NavigationLink {
                            KillDuelView(killCase: c)
                        } label: {
                            SKCaseRow(killCase: c)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 4)
                .padding(.bottom, 32)
                .readableContentWidth()
            }
        }
        .background(Color.apexBackground)
        .navigationTitle("全部压轴战例 · \(shown.count)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - 武器详情

struct KillWeaponDetailView: View {
    let weapon: KillWeapon
    let cases: [SecondKillCase]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                // 头部
                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 12) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 14)
                                .fill(weapon.tint.opacity(0.18))
                                .frame(width: 56, height: 56)
                            Image(systemName: weapon.icon)
                                .font(.title)
                                .foregroundColor(weapon.tint)
                        }
                        VStack(alignment: .leading, spacing: 4) {
                            Text(weapon.displayName)
                                .font(.title3).fontWeight(.bold)
                            Text(weapon.inSyllabus ? "纲内深用技巧" : "大学超纲利器")
                                .font(.caption)
                                .foregroundColor(weapon.inSyllabus ? .apexEmerald : .apexMystery)
                        }
                    }
                    Text(weapon.tagline)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                infoBlock(icon: "lightbulb.fill", color: .apexGold, title: "原理 · 为什么能降维", body: weapon.principle)
                infoBlock(icon: "scope", color: .apexStarBlue, title: "触发信号 · 何时掏出它", body: weapon.signal)

                // 使用守则
                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: weapon.examSafe ? "checkmark.seal.fill" : "exclamationmark.triangle.fill")
                        .foregroundColor(weapon.examSafe ? .apexEmerald : .apexGold)
                    Text(weapon.examNote)
                        .font(.caption)
                        .foregroundColor(.primary)
                }
                .padding(14)
                .background((weapon.examSafe ? Color.apexEmerald : Color.apexGold).opacity(0.1))
                .cornerRadius(14)

                // 战例
                Text("经典战例")
                    .font(.headline)
                    .padding(.top, 4)
                ForEach(cases) { c in
                    NavigationLink {
                        KillDuelView(killCase: c)
                    } label: {
                        SKCaseRow(killCase: c)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(20)
            .readableContentWidth()
        }
        .background(Color.apexBackground)
        .navigationTitle(weapon.displayName)
        .navigationBarTitleDisplayMode(.inline)
    }

    private func infoBlock(icon: String, color: Color, title: String, body: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 6) {
                Image(systemName: icon).foregroundColor(color)
                Text(title).font(.subheadline).fontWeight(.bold)
            }
            Text(body)
                .font(.callout)
                .foregroundColor(.secondary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(Color.apexCardSurface)
        .cornerRadius(16)
    }
}

// MARK: - 双解对决（震撼对比）

struct KillDuelView: View {
    let killCase: SecondKillCase

    @State private var revealed = false
    @State private var showStandard = false

    private var dual: DualSolution? { killCase.problem.dualSolution }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                problemCard
                signalChip
                duelMeter
                killSection
                standardSection
                if let note = examNoteForWeapon { creed(note) }
                mistakesSection
            }
            .padding(20)
            .readableContentWidth()
        }
        .background(Color.apexBackground)
        .navigationTitle("解法对决")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            withAnimation(.easeOut(duration: 1.1).delay(0.25)) { revealed = true }
        }
    }

    // 题目
    private var problemCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 6) {
                Text(killCase.weapon.displayName)
                    .font(.system(size: 11, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 8).padding(.vertical, 3)
                    .background(killCase.weapon.tint)
                    .cornerRadius(6)
                Text(killCase.source)
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
            Text(killCase.title)
                .font(.headline)
                .foregroundColor(.primary)
            Text(killCase.problem.content.mathPretty)
                .font(.callout)
                .foregroundColor(.primary)
                .fixedSize(horizontal: false, vertical: true)
            if let latex = killCase.problem.contentLatex {
                FormulaView(latex: latex, displayMode: true, fontSize: 17)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(18)
        .background(Color.apexCardSurface)
        .cornerRadius(18)
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }

    private var signalChip: some View {
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: "scope").foregroundColor(.apexStarBlue).font(.caption)
            VStack(alignment: .leading, spacing: 2) {
                Text("识别信号").font(.caption2).fontWeight(.bold).foregroundColor(.apexStarBlue)
                Text(killCase.signal).font(.caption).foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(12)
        .background(Color.apexStarBlue.opacity(0.08))
        .cornerRadius(12)
    }

    // 震撼对比仪表
    private var duelMeter: some View {
        VStack(spacing: 14) {
            HStack {
                Text("解法对决")
                    .font(.subheadline).fontWeight(.bold)
                Spacer()
                HStack(spacing: 4) {
                    Image(systemName: "bolt.fill")
                    Text("省时 \(Int(killCase.speedup.rounded()))×")
                }
                .font(.system(size: 13, weight: .black, design: .rounded))
                .foregroundColor(.white)
                .padding(.horizontal, 10).padding(.vertical, 4)
                .background(Color.apexLava)
                .cornerRadius(8)
            }

            meterRow(
                label: "常规法",
                detail: "约 \(killCase.standardMinutes) 分钟 · \(dual?.standardMethod.steps.count ?? 0) 步",
                fraction: 1.0,
                color: .secondary,
                icon: "tortoise.fill"
            )
            meterRow(
                label: "降维秒杀",
                detail: "约 \(killCase.killSeconds) 秒 · \(dual?.descentMethod.steps.count ?? 0) 步",
                fraction: max(0.06, 1.0 / killCase.speedup),
                color: killCase.weapon.tint,
                icon: "hare.fill"
            )
        }
        .padding(16)
        .background(Color.apexCardSurface)
        .cornerRadius(18)
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }

    private func meterRow(label: String, detail: String, fraction: CGFloat, color: Color, icon: String) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack(spacing: 6) {
                Image(systemName: icon).font(.caption).foregroundColor(color)
                Text(label).font(.caption).fontWeight(.bold).foregroundColor(.primary)
                Spacer()
                Text(detail).font(.caption2).foregroundColor(.secondary)
            }
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.gray.opacity(0.15))
                        .frame(height: 10)
                    RoundedRectangle(cornerRadius: 5)
                        .fill(color)
                        .frame(width: geo.size.width * (revealed ? fraction : 0), height: 10)
                }
            }
            .frame(height: 10)
        }
    }

    // 降维秒杀（默认展开，主角）
    private var killSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: "bolt.fill").foregroundColor(killCase.weapon.tint)
                Text("降维秒杀")
                    .font(.headline).foregroundColor(.primary)
                Spacer()
                Text(killCase.weapon.displayName)
                    .font(.caption2).foregroundColor(killCase.weapon.tint)
            }
            if let steps = dual?.descentMethod.steps {
                ForEach(steps) { step in
                    stepView(step, accent: killCase.weapon.tint)
                }
            }
            if let key = dual?.descentMethod.keyInsight {
                insightLine(key, color: killCase.weapon.tint)
            }
        }
        .padding(18)
        .background(
            LinearGradient(colors: [killCase.weapon.tint.opacity(0.08), Color.apexCardSurface],
                           startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .cornerRadius(18)
        .overlay(RoundedRectangle(cornerRadius: 18).stroke(killCase.weapon.tint.opacity(0.3), lineWidth: 1))
    }

    // 常规法（默认折叠，对比用）
    private var standardSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Button {
                withAnimation(.easeInOut(duration: 0.25)) { showStandard.toggle() }
            } label: {
                HStack(spacing: 8) {
                    Image(systemName: "tortoise.fill").foregroundColor(.secondary)
                    Text("常规法")
                        .font(.headline).foregroundColor(.primary)
                    Text("(\(dual?.standardMethod.steps.count ?? 0) 步)")
                        .font(.caption).foregroundColor(.secondary)
                    Spacer()
                    Image(systemName: showStandard ? "chevron.up" : "chevron.down")
                        .font(.caption).foregroundColor(.secondary)
                }
            }
            if showStandard {
                if let steps = dual?.standardMethod.steps {
                    ForEach(steps) { step in
                        stepView(step, accent: .secondary)
                    }
                }
                if let key = dual?.standardMethod.keyInsight {
                    insightLine(key, color: .secondary)
                }
            }
        }
        .padding(18)
        .background(Color.apexCardSurface)
        .cornerRadius(18)
        .shadow(color: .black.opacity(0.04), radius: 6, y: 3)
    }

    private func stepView(_ step: SolutionStep, accent: Color) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(alignment: .top, spacing: 8) {
                Text("\(step.order)")
                    .font(.system(size: 11, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 18, height: 18)
                    .background(Circle().fill(accent))
                Text(step.description.mathPretty)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            if !step.latex.isEmpty {
                FormulaView(latex: step.latex, displayMode: true, fontSize: 16)
                    .padding(.leading, 26)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func insightLine(_ text: String, color: Color) -> some View {
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: "key.fill").font(.caption).foregroundColor(color)
            Text(text).font(.caption).foregroundColor(.secondary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(.top, 4)
    }

    private var examNoteForWeapon: String? { killCase.weapon.examNote }

    private func creed(_ note: String) -> some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: killCase.weapon.examSafe ? "checkmark.seal.fill" : "exclamationmark.triangle.fill")
                .foregroundColor(killCase.weapon.examSafe ? .apexEmerald : .apexGold)
            VStack(alignment: .leading, spacing: 3) {
                Text("能否写进高考大题？")
                    .font(.caption).fontWeight(.bold).foregroundColor(.primary)
                Text(note).font(.caption).foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(14)
        .background((killCase.weapon.examSafe ? Color.apexEmerald : Color.apexGold).opacity(0.1))
        .cornerRadius(14)
    }

    private var mistakesSection: some View {
        let mistakes = dual?.standardMethod.commonMistakes ?? []
        return Group {
            if !mistakes.isEmpty {
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 6) {
                        Image(systemName: "xmark.octagon.fill").foregroundColor(.apexDanger).font(.caption)
                        Text("常见陷阱").font(.subheadline).fontWeight(.bold)
                    }
                    ForEach(Array(mistakes.enumerated()), id: \.offset) { _, m in
                        HStack(alignment: .top, spacing: 8) {
                            Text("·").foregroundColor(.apexDanger)
                            Text(m.mathPretty).font(.caption).foregroundColor(.secondary)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(16)
                .background(Color.apexDanger.opacity(0.07))
                .cornerRadius(14)
            }
        }
    }
}
