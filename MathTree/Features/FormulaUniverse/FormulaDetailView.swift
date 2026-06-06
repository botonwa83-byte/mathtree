import SwiftUI

struct FormulaDetailView: View {
    @Environment(\.horizontalSizeClass) private var sizeClass
    let formula: Formula
    @State private var expandedSteps: Set<Int> = []
    @State private var currentStepIndex: Int = 0
    @State private var showProofSummary: Bool = false

    private var isIPad: Bool { sizeClass == .regular }
    private var cardPad: CGFloat { isIPad ? 24 : 16 }
    private var hPad: CGFloat { isIPad ? 32 : 16 }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                formulaPresentation
                intuitionSection
                relatedProblemsSection
                detailedExplanationSection
                proofStepsSection
                applicationsSection
                historySection
                dnaChainSection
                advancedSection
            }
            .padding(.horizontal, hPad)
            .padding(.top, 12)
            .padding(.bottom, 40)
            .frame(maxWidth: isIPad ? 800 : .infinity)
            .frame(maxWidth: .infinity)
        }
        .background(Color.apexBackground)
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Formula Presentation

    private var formulaPresentation: some View {
        VStack(alignment: .leading, spacing: 14) {
            // Badges row
            HStack(spacing: 6) {
                Text(formula.level.displayName)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(levelColor)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(levelColor.opacity(0.1))
                    .cornerRadius(8)

                Text(formula.category.displayName)
                    .font(.caption)
                    .foregroundColor(.secondary)

                Spacer()

                HStack(spacing: 4) {
                    Image(systemName: "target")
                    Text("高考相关度 \(Int(formula.gaokaoRelevance * 100))%")
                }
                .font(.caption)
                .foregroundColor(.apexLava)
            }

            Text(formula.name)
                .font(isIPad ? .largeTitle : .title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .fixedSize(horizontal: false, vertical: true)

            FormulaView(latex: formula.latex, fontSize: isIPad ? 15 : 14)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color.apexBackground.opacity(0.5))
                .cornerRadius(8)

            if !formula.tags.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(formula.tags, id: \.self) { tag in
                            Text(tag)
                                .font(.caption)
                                .foregroundColor(.apexStarBlue)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(Color.apexStarBlue.opacity(0.1))
                                .cornerRadius(8)
                        }
                    }
                }
            }
        }
        .padding(cardPad)
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

    // MARK: - Related Problems

    private var relatedProblemsSection: some View {
        let related = SampleData.problems.filter { problem in
            problem.formulaIds.contains(formula.id) ||
            problem.tags.contains(formula.category.displayName)
        }.prefix(5)

        return Group {
            if !related.isEmpty {
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "target")
                            .foregroundColor(.apexEmerald)
                        Text("相关练习题")
                            .font(.headline)
                            .foregroundColor(.apexEmerald)
                        Spacer()
                        Text("\(related.count) 道")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }

                    ForEach(Array(related)) { problem in
                        HStack(spacing: 10) {
                            DifficultyBar(level: problem.difficulty, compact: true)

                            Text(problem.content.mathPretty)
                                .font(.caption)
                                .foregroundColor(.primary)
                                .lineLimit(2)

                            Spacer()

                            if problem.dualSolution != nil {
                                Image(systemName: "bolt.fill")
                                    .font(.caption2)
                                    .foregroundColor(.apexLava)
                            }
                        }
                        .padding(10)
                        .background(Color.apexBackground.opacity(0.5))
                        .cornerRadius(10)
                    }

                    Text("去练习页筛选「\(formula.category.displayName)」可做更多相关题")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
                .padding(cardPad)
                .background(Color.apexCardSurface)
                .cornerRadius(16)
                .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
            }
        }
    }

    // MARK: - Intuition

    private var intuitionSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label("直觉理解", systemImage: "lightbulb.fill")
                .font(.headline)
                .foregroundColor(.apexGold)

            Text(formula.intuition)
                .font(.body)
                .foregroundColor(.primary.opacity(0.9))
                .lineSpacing(6)
                .fixedSize(horizontal: false, vertical: true)

            Text("不需要数学语言，用直觉感受这个公式的含义")
                .font(.caption)
                .foregroundColor(.secondary)
                .italic()
        }
        .padding(cardPad)
        .background(Color.apexCardSurface)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }

    // MARK: - Detailed Explanation

    private var detailedExplanationSection: some View {
        Group {
            if let explanation = formula.detailedExplanation {
                VStack(alignment: .leading, spacing: 10) {
                    Label("详细解释", systemImage: "book.fill")
                        .font(.headline)
                        .foregroundColor(.apexStarBlue)

                    Text(explanation)
                        .font(.body)
                        .foregroundColor(.primary.opacity(0.9))
                        .lineSpacing(6)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(cardPad)
                .background(Color.apexCardSurface)
                .cornerRadius(16)
                .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
            }
        }
    }

    // MARK: - Proof Steps

    private var proofStepsSection: some View {
        Group {
            if let detailedProof = formula.detailedProof, !detailedProof.isEmpty {
                detailedProofSection(detailedProof)
            } else if let steps = formula.proofSteps, !steps.isEmpty {
                simpleProofSection(steps)
            }
        }
    }

    private func detailedProofSection(_ detailedProof: [ProofStep]) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            // Header row
            HStack {
                Label("证明步骤", systemImage: "checkmark.seal.fill")
                    .font(.headline)
                    .foregroundColor(.apexEmerald)

                Spacer()

                Button {
                    showProofSummary.toggle()
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: showProofSummary ? "chevron.down" : "chevron.up")
                            .font(.caption)
                        Text("摘要")
                            .font(.caption)
                    }
                    .foregroundColor(.apexStarBlue)
                }
            }

            if showProofSummary {
                proofSummaryCard(detailedProof: detailedProof)
                    .transition(.opacity.combined(with: .scale))
            }

            // Step navigation
            HStack(spacing: 12) {
                Button {
                    if currentStepIndex > 0 {
                        withAnimation(.easeInOut(duration: 0.3)) { currentStepIndex -= 1 }
                    }
                } label: {
                    Image(systemName: "chevron.left.circle.fill")
                        .font(.title3)
                        .foregroundColor(.apexEmerald)
                }
                .disabled(currentStepIndex == 0)
                .opacity(currentStepIndex == 0 ? 0.3 : 1)

                Text("\(currentStepIndex + 1) / \(detailedProof.count)")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)

                Button {
                    if currentStepIndex < detailedProof.count - 1 {
                        withAnimation(.easeInOut(duration: 0.3)) { currentStepIndex += 1 }
                    }
                } label: {
                    Image(systemName: "chevron.right.circle.fill")
                        .font(.title3)
                        .foregroundColor(.apexEmerald)
                }
                .disabled(currentStepIndex == detailedProof.count - 1)
                .opacity(currentStepIndex == detailedProof.count - 1 ? 0.3 : 1)

                Spacer()

                Button {
                    expandedSteps = expandedSteps.isEmpty ? Set(detailedProof.map { $0.order }) : []
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: expandedSteps.isEmpty ? "chevron.down.circle" : "chevron.up.circle")
                            .font(.caption)
                        Text(expandedSteps.isEmpty ? "展开全部" : "折叠全部")
                            .font(.caption)
                    }
                    .foregroundColor(.apexMystery)
                }
            }

            // Steps list
            VStack(alignment: .leading, spacing: 12) {
                ForEach(Array(detailedProof.enumerated()), id: \.element.id) { index, step in
                    proofStepRow(step: step, index: index, total: detailedProof.count)
                }
            }
        }
        .padding(cardPad)
        .background(Color.apexCardSurface)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }

    private func proofStepRow(step: ProofStep, index: Int, total: Int) -> some View {
        let isActive = index == currentStepIndex
        let isExpanded = expandedSteps.contains(step.order) || isActive

        return VStack(alignment: .leading, spacing: 8) {
            Button {
                withAnimation(.easeInOut(duration: 0.3)) {
                    if expandedSteps.contains(step.order) {
                        expandedSteps.remove(step.order)
                    } else {
                        expandedSteps.insert(step.order)
                    }
                }
            } label: {
                HStack(alignment: .top, spacing: 10) {
                    ZStack {
                        Circle()
                            .fill(isActive ? Color.apexEmerald : Color.apexEmerald.opacity(0.1))
                            .frame(width: 32, height: 32)
                        Text("\(step.order)")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(isActive ? .white : .apexEmerald)
                    }
                    .scaleEffect(isActive ? 1.1 : 1.0)
                    .animation(.spring(), value: isActive)

                    VStack(alignment: .leading, spacing: 4) {
                        if let title = step.title {
                            Text(title)
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        if !isExpanded {
                            Text(step.explanation)
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .lineLimit(2)
                        }
                    }

                    Spacer()

                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }

            if isExpanded {
                VStack(alignment: .leading, spacing: 8) {
                    Text((step.content ?? step.explanation).mathPretty)
                        .font(.body)
                        .foregroundColor(.primary.opacity(0.85))
                        .lineSpacing(4)
                        .fixedSize(horizontal: false, vertical: true)
                        .transition(.opacity.combined(with: .slide))

                    if !step.latex.isEmpty {
                        FormulaView(latex: step.latex, fontSize: isIPad ? 14 : 12)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(Color.apexBackground.opacity(0.5))
                            .cornerRadius(6)
                            .transition(.opacity.combined(with: .scale))
                    }

                    // Hints row - wrap if needed
                    VStack(alignment: .leading, spacing: 6) {
                        if let visualHint = step.visualHint {
                            HStack(spacing: 6) {
                                Image(systemName: "eye")
                                    .font(.caption)
                                    .foregroundColor(.apexStarBlue)
                                Text(visualHint)
                                    .font(.caption)
                                    .foregroundColor(.apexStarBlue)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }

                        if let keyInsight = step.keyInsight {
                            HStack(spacing: 6) {
                                Image(systemName: "lightbulb")
                                    .font(.caption)
                                    .foregroundColor(.apexGold)
                                Text(keyInsight.mathPretty)
                                    .font(.caption)
                                    .foregroundColor(.apexGold)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                    }
                }
                .padding(.leading, 42)
            }

            if step.order < total {
                Divider()
                    .background(Color.apexEmerald.opacity(0.2))
                    .padding(.leading, 16)
            }
        }
    }

    private func simpleProofSection(_ steps: [String]) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            Label("证明步骤", systemImage: "checkmark.seal.fill")
                .font(.headline)
                .foregroundColor(.apexEmerald)

            VStack(alignment: .leading, spacing: 10) {
                ForEach(steps.indices, id: \.self) { index in
                    HStack(alignment: .top, spacing: 10) {
                        ZStack {
                            Circle()
                                .fill(Color.apexEmerald.opacity(0.1))
                                .frame(width: 28, height: 28)
                            Text("\(index + 1)")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.apexEmerald)
                        }
                        Text(steps[index])
                            .font(.body)
                            .foregroundColor(.primary.opacity(0.85))
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }
        }
        .padding(cardPad)
        .background(Color.apexCardSurface)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }

    private func proofSummaryCard(detailedProof: [ProofStep]) -> some View {
        let keyInsights = detailedProof.compactMap { $0.keyInsight }

        return VStack(alignment: .leading, spacing: 10) {
            Text("证明关键洞见")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.apexGold)

            VStack(alignment: .leading, spacing: 8) {
                ForEach(keyInsights, id: \.self) { insight in
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: "star.fill")
                            .font(.caption)
                            .foregroundColor(.apexGold)
                            .padding(.top, 2)
                        Text(insight)
                            .font(.caption)
                            .foregroundColor(.primary.opacity(0.85))
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }
        }
        .padding(14)
        .background(Color.apexGold.opacity(0.05))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.apexGold.opacity(0.2), lineWidth: 1)
        )
    }

    // MARK: - Applications

    private var applicationsSection: some View {
        Group {
            if let apps = formula.applications, !apps.isEmpty {
                VStack(alignment: .leading, spacing: 12) {
                    Label("应用场景", systemImage: "sparkles")
                        .font(.headline)
                        .foregroundColor(.apexMystery)

                    // Vertical list instead of HStack to avoid overflow
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(apps, id: \.self) { app in
                            HStack(spacing: 6) {
                                Image(systemName: "arrow.right")
                                    .font(.caption)
                                    .foregroundColor(.apexMystery.opacity(0.7))
                                Text(app)
                                    .font(.caption)
                                    .foregroundColor(.primary.opacity(0.9))
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.apexMystery.opacity(0.08))
                            .cornerRadius(10)
                        }
                    }
                }
                .padding(cardPad)
                .background(Color.apexCardSurface)
                .cornerRadius(16)
                .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
            }
        }
    }

    // MARK: - History

    private var historySection: some View {
        Group {
            if let history = formula.history {
                VStack(alignment: .leading, spacing: 10) {
                    Label("历史背景", systemImage: "clock")
                        .font(.headline)
                        .foregroundColor(.apexLava)

                    Text(history)
                        .font(.body)
                        .foregroundColor(.primary.opacity(0.85))
                        .lineSpacing(6)
                        .fixedSize(horizontal: false, vertical: true)
                        .italic()
                }
                .padding(cardPad)
                .background(Color.apexCardSurface)
                .cornerRadius(16)
                .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
            }
        }
    }

    // MARK: - DNA Chain

    private var dnaChainSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            Label("公式 DNA 链", systemImage: "waveform.path.ecg")
                .font(.headline)
                .foregroundColor(.apexEmerald)

            if isIPad {
                // iPad: horizontal layout
                dnaHorizontalLayout
            } else {
                // iPhone: vertical layout to avoid cramping
                dnaVerticalLayout
            }
        }
        .padding(cardPad)
        .background(Color.apexCardSurface)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }

    private var dnaHorizontalLayout: some View {
        HStack(alignment: .top, spacing: 0) {
            dnaColumn(title: "来自", nodes: prerequisiteNodes, color: .apexStarBlue)
            dnaArrow
            VStack(spacing: 8) {
                Text("当前").font(.caption2).foregroundColor(.secondary)
                DnaNode(title: formula.name, color: .apexEmerald, isCurrent: true)
            }
            .frame(maxWidth: .infinity)
            dnaArrow
            dnaColumn(title: "生出", nodes: derivationNodes, color: .apexLava)
        }
    }

    private var dnaVerticalLayout: some View {
        VStack(spacing: 16) {
            // Prerequisites
            VStack(alignment: .leading, spacing: 8) {
                Text("来自")
                    .font(.caption2)
                    .foregroundColor(.secondary)
                if prerequisiteNodes.isEmpty {
                    DnaNode(title: "公理", color: .gray)
                } else {
                    ForEach(prerequisiteNodes, id: \.self) { name in
                        DnaNode(title: name, color: .apexStarBlue)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            // Arrow
            Image(systemName: "arrow.down")
                .font(.caption)
                .foregroundColor(.apexEmerald.opacity(0.5))

            // Current
            VStack(spacing: 6) {
                Text("当前").font(.caption2).foregroundColor(.secondary)
                DnaNode(title: formula.name, color: .apexEmerald, isCurrent: true)
            }

            // Arrow
            Image(systemName: "arrow.down")
                .font(.caption)
                .foregroundColor(.apexEmerald.opacity(0.5))

            // Derivations
            VStack(alignment: .leading, spacing: 8) {
                Text("生出")
                    .font(.caption2)
                    .foregroundColor(.secondary)
                if derivationNodes.isEmpty {
                    DnaNode(title: "未知领域", color: .gray)
                } else {
                    ForEach(derivationNodes, id: \.self) { name in
                        DnaNode(title: name, color: .apexLava)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private func dnaColumn(title: String, nodes: [String], color: Color) -> some View {
        VStack(spacing: 8) {
            Text(title).font(.caption2).foregroundColor(.secondary)
            if nodes.isEmpty {
                DnaNode(title: title == "来自" ? "公理" : "未知领域", color: .gray)
            } else {
                ForEach(nodes, id: \.self) { name in
                    DnaNode(title: name, color: color)
                }
            }
        }
        .frame(maxWidth: .infinity)
    }

    private var dnaArrow: some View {
        VStack(spacing: 0) {
            Spacer().frame(height: 30)
            Image(systemName: "chevron.right.2")
                .font(.caption)
                .foregroundColor(.apexEmerald.opacity(0.5))
        }
        .frame(width: 28)
    }

    private var prerequisiteNodes: [String] {
        formula.prerequisites.compactMap { prereq in
            SampleData.formulas.first(where: { $0.id == prereq })?.name
        }
    }

    private var derivationNodes: [String] {
        formula.derivations.prefix(3).compactMap { deriv in
            SampleData.formulas.first(where: { $0.id == deriv })?.name
        }
    }

    // MARK: - Advanced Section

    private var advancedSection: some View {
        Group {
            if let advancedId = formula.advancedForm,
               !advancedId.isEmpty,
               let advancedFormula = SampleData.formulas.first(where: { $0.id == advancedId }) {
                VStack(alignment: .leading, spacing: 12) {
                    Label("超前视角", systemImage: "bolt.fill")
                        .font(.headline)
                        .foregroundColor(.apexGold)

                    Text("掌握当前公式后，可以进一步探索更高阶的形式：")
                        .font(.caption)
                        .foregroundColor(.secondary)

                    NavigationLink(destination: FormulaDetailView(formula: advancedFormula)) {
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(advancedFormula.name)
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.primary)

                                    HStack(spacing: 6) {
                                        Text(advancedFormula.level.displayName)
                                            .font(.caption2)
                                            .fontWeight(.medium)
                                            .foregroundColor(.apexGold)
                                            .padding(.horizontal, 6)
                                            .padding(.vertical, 2)
                                            .background(Color.apexGold.opacity(0.1))
                                            .cornerRadius(4)

                                        Text(advancedFormula.category.displayName)
                                            .font(.caption2)
                                            .foregroundColor(.secondary)
                                    }
                                }
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .font(.caption)
                                    .foregroundColor(.apexGold.opacity(0.6))
                            }

                            FormulaView(latex: advancedFormula.latex, fontSize: isIPad ? 14 : 12)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 2)
                                .background(Color.apexBackground.opacity(0.5))
                                .cornerRadius(6)

                            Text(advancedFormula.intuition)
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .lineSpacing(4)
                                .lineLimit(3)
                        }
                        .padding(14)
                        .background(Color.apexGold.opacity(0.06))
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.apexGold.opacity(0.2), lineWidth: 1)
                        )
                    }
                }
                .padding(cardPad)
                .background(
                    LinearGradient(
                        colors: [Color.apexGold.opacity(0.1), Color.apexCardSurface],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .cornerRadius(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.apexGold.opacity(0.3), lineWidth: 1)
                )
            }
        }
    }
}

// MARK: - DNA Node

struct DnaNode: View {
    let title: String
    let color: Color
    var isCurrent: Bool = false

    var body: some View {
        Text(title)
            .font(.system(size: 11, weight: .medium))
            .foregroundColor(isCurrent ? .white : color)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .frame(maxWidth: .infinity)
            .background(isCurrent ? color : color.opacity(0.1))
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(color.opacity(0.3), lineWidth: 1)
            )
    }
}
