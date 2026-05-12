import SwiftUI

struct FormulaDetailView: View {
    let formula: Formula
    @State private var expandedSteps: Set<Int> = []
    @State private var currentStepIndex: Int = 0
    @State private var showProofSummary: Bool = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                formulaPresentation
                intuitionSection
                detailedExplanationSection
                proofStepsSection
                applicationsSection
                historySection
                interactiveSandbox
                dnaChainSection
                advancedSection
            }
            .padding(.horizontal, 20)
            .padding(.top, 12)
            .padding(.bottom, 40)
        }
        .background(Color.apexBackground)
        .navigationBarTitleDisplayMode(.inline)
    }

    private var interactiveSandbox: some View {
        VStack(alignment: .leading, spacing: 16) {
            Label("互动实验室", systemImage: "hand.tap.fill")
                .font(.headline)
                .foregroundColor(.apexStarBlue)

            VStack(alignment: .leading, spacing: 12) {
                Text("在这个实验室，你可以动态调整参数，直观感受公式的变化。")
                    .font(.caption)
                    .foregroundColor(.secondary)

                // Mock Interactive Area
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.apexBackground.opacity(0.5))
                        .frame(height: 160)
                    
                    VStack(spacing: 20) {
                        Text("参数控制 (演示)")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                        
                        HStack {
                            Text("a = 1.0")
                                .font(.system(.caption, design: .monospaced))
                            Slider(value: .constant(0.5))
                                .tint(.apexStarBlue)
                        }
                        
                        Text("图形实时预览区")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.apexStarBlue)
                    }
                    .padding(20)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.apexStarBlue.opacity(0.1), lineWidth: 1)
                )
            }
        }
        .padding(20)
        .background(Color.apexCardSurface)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }

    private var formulaPresentation: some View {
        VStack(spacing: 16) {
            HStack {
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
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)

            FormulaView(latex: formula.latex, fontSize: 28)
                .frame(height: 80)
                .frame(maxWidth: .infinity)
                .background(Color.apexBackground.opacity(0.5))
                .cornerRadius(12)

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
        .padding(20)
        .background(Color.apexCardSurface)
        .cornerRadius(20)
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

    private var intuitionSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("直觉理解", systemImage: "lightbulb.fill")
                .font(.headline)
                .foregroundColor(.apexGold)

            Text(formula.intuition)
                .font(.body)
                .foregroundColor(.primary.opacity(0.9))
                .lineSpacing(6)

            Text("不需要数学语言，用直觉感受这个公式的含义")
                .font(.caption)
                .foregroundColor(.secondary)
                .italic()
        }
        .padding(20)
        .background(Color.apexCardSurface)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }

    private var detailedExplanationSection: some View {
        Group {
            if let explanation = formula.detailedExplanation {
                VStack(alignment: .leading, spacing: 12) {
                    Label("详细解释", systemImage: "book.fill")
                        .font(.headline)
                        .foregroundColor(.apexStarBlue)

                    Text(explanation)
                        .font(.body)
                        .foregroundColor(.primary.opacity(0.9))
                        .lineSpacing(8)
                }
                .padding(20)
                .background(Color.apexCardSurface)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
            }
        }
    }

    private var proofStepsSection: some View {
        Group {
            if let detailedProof = formula.detailedProof, !detailedProof.isEmpty {
                VStack(alignment: .leading, spacing: 16) {
                    HStack(alignment: .center, spacing: 16) {
                        Label("证明步骤", systemImage: "checkmark.seal.fill")
                            .font(.headline)
                            .foregroundColor(.apexEmerald)
                        
                        Spacer()
                        
                        Button(action: {
                            showProofSummary.toggle()
                        }) {
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
                    
                    HStack(spacing: 8) {
                        Button(action: {
                            if currentStepIndex > 0 {
                                withAnimation(.easeInOut(duration: 0.3)) {
                                    currentStepIndex -= 1
                                }
                            }
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.title)
                        }
                        .disabled(currentStepIndex == 0)
                        .opacity(currentStepIndex == 0 ? 0.3 : 1)
                        
                        Text("\(currentStepIndex + 1) / \(detailedProof.count)")
                            .font(.caption)
                            .fontWeight(.medium)
                            .foregroundColor(.secondary)
                        
                        Button(action: {
                            if currentStepIndex < detailedProof.count - 1 {
                                withAnimation(.easeInOut(duration: 0.3)) {
                                    currentStepIndex += 1
                                }
                            }
                        }) {
                            Image(systemName: "chevron.right")
                                .font(.title)
                        }
                        .disabled(currentStepIndex == detailedProof.count - 1)
                        .opacity(currentStepIndex == detailedProof.count - 1 ? 0.3 : 1)
                        
                        Spacer()
                        
                        Button(action: {
                            expandedSteps = expandedSteps.isEmpty ? Set(detailedProof.map { $0.order }) : []
                        }) {
                            HStack(spacing: 4) {
                                Image(systemName: expandedSteps.isEmpty ? "chevron.down.circle" : "chevron.up.circle")
                                    .font(.caption)
                                Text(expandedSteps.isEmpty ? "展开全部" : "折叠全部")
                                    .font(.caption)
                            }
                            .foregroundColor(.apexMystery)
                        }
                    }
                    .padding(.horizontal, 8)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        ForEach(Array(detailedProof.enumerated()), id: \.element.id) { index, step in
                            let isActive = index == currentStepIndex
                            let isExpanded = expandedSteps.contains(step.order) || isActive
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Button(action: {
                                    withAnimation(.easeInOut(duration: 0.3)) {
                                        if expandedSteps.contains(step.order) {
                                            expandedSteps.remove(step.order)
                                        } else {
                                            expandedSteps.insert(step.order)
                                        }
                                    }
                                }) {
                                    HStack(alignment: .top, spacing: 12) {
                                        ZStack {
                                            Circle()
                                                .fill(isActive ? Color.apexEmerald : Color.apexEmerald.opacity(0.1))
                                                .frame(width: 36, height: 36)
                                            Text("\(step.order)")
                                                .font(.caption)
                                                .fontWeight(.bold)
                                                .foregroundColor(isActive ? .white : .apexEmerald)
                                        }
                                        .padding(.top, 4)
                                        .scaleEffect(isActive ? 1.1 : 1.0)
                                        .animation(.spring(), value: isActive)
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            if let title = step.title {
                                                Text(title)
                                                    .font(.subheadline)
                                                    .fontWeight(.bold)
                                                    .foregroundColor(.primary)
                                            }
                                            if !isExpanded {
                                                Text(step.explanation)
                                                    .font(.caption)
                                                    .foregroundColor(.secondary)
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
                                        if let content = step.content {
                                            Text(content)
                                                .font(.body)
                                                .foregroundColor(.primary.opacity(0.85))
                                                .lineSpacing(4)
                                                .transition(.opacity.combined(with: .slide))
                                        } else {
                                            Text(step.explanation)
                                                .font(.body)
                                                .foregroundColor(.primary.opacity(0.85))
                                                .lineSpacing(4)
                                                .transition(.opacity.combined(with: .slide))
                                        }
                                        
                                        if !step.latex.isEmpty {
                                            FormulaView(latex: step.latex, fontSize: 18)
                                                .frame(height: 40)
                                                .frame(maxWidth: .infinity)
                                                .background(Color.apexBackground.opacity(0.5))
                                                .cornerRadius(8)
                                                .transition(.opacity.combined(with: .scale))
                                        }
                                        
                                        HStack(spacing: 16) {
                                            if let visualHint = step.visualHint {
                                                HStack(spacing: 6) {
                                                    Image(systemName: "eye")
                                                        .font(.caption)
                                                        .foregroundColor(.apexStarBlue)
                                                    Text(visualHint)
                                                        .font(.caption)
                                                        .foregroundColor(.apexStarBlue)
                                                }
                                                .transition(.opacity)
                                            }
                                            
                                            if let keyInsight = step.keyInsight {
                                                HStack(spacing: 6) {
                                                    Image(systemName: "lightbulb")
                                                        .font(.caption)
                                                        .foregroundColor(.apexGold)
                                                    Text(keyInsight)
                                                        .font(.caption)
                                                        .foregroundColor(.apexGold)
                                                }
                                                .transition(.opacity)
                                            }
                                        }
                                    }
                                    .padding(.leading, 48)
                                }
                                
                                if step.order < detailedProof.count {
                                    Divider()
                                        .background(Color.apexEmerald.opacity(0.2))
                                        .padding(.leading, 18)
                                }
                            }
                        }
                    }
                }
                .padding(20)
                .background(Color.apexCardSurface)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
            } else if let steps = formula.proofSteps, !steps.isEmpty {
                VStack(alignment: .leading, spacing: 16) {
                    Label("证明步骤", systemImage: "checkmark.seal.fill")
                        .font(.headline)
                        .foregroundColor(.apexEmerald)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(steps.indices, id: \.self) { index in
                            HStack(alignment: .top, spacing: 12) {
                                ZStack {
                                    Circle()
                                        .fill(Color.apexEmerald.opacity(0.1))
                                        .frame(width: 32, height: 32)
                                    Text("\(index + 1)")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.apexEmerald)
                                }
                                Text(steps[index])
                                    .font(.body)
                                    .foregroundColor(.primary.opacity(0.85))
                            }
                        }
                    }
                }
                .padding(20)
                .background(Color.apexCardSurface)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
            }
        }
    }
    
    private func proofSummaryCard(detailedProof: [ProofStep]) -> some View {
        let keyInsights = detailedProof.compactMap { $0.keyInsight }
        
        return VStack(alignment: .leading, spacing: 12) {
            Text("💡 证明关键洞见")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.apexGold)
            
            VStack(spacing: 8) {
                ForEach(keyInsights, id: \.self) { insight in
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: "star.fill")
                            .font(.caption)
                            .foregroundColor(.apexGold)
                            .padding(.top, 2)
                        Text(insight)
                            .font(.caption)
                            .foregroundColor(.primary.opacity(0.85))
                    }
                }
            }
        }
        .padding(16)
        .background(Color.apexGold.opacity(0.05))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.apexGold.opacity(0.2), lineWidth: 1)
        )
    }

    private var applicationsSection: some View {
        Group {
            if let apps = formula.applications, !apps.isEmpty {
                VStack(alignment: .leading, spacing: 16) {
                    Label("应用场景", systemImage: "sparkles")
                        .font(.headline)
                        .foregroundColor(.apexMystery)

                    HStack(spacing: 8) {
                        ForEach(apps, id: \.self) { app in
                            HStack(spacing: 6) {
                                Image(systemName: "arrow.right")
                                    .font(.caption)
                                    .foregroundColor(.apexMystery.opacity(0.7))
                                Text(app)
                                    .font(.caption)
                                    .foregroundColor(.primary.opacity(0.9))
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Color.apexMystery.opacity(0.08))
                            .cornerRadius(12)
                        }
                    }
                }
                .padding(20)
                .background(Color.apexCardSurface)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
            }
        }
    }

    private var historySection: some View {
        Group {
            if let history = formula.history {
                VStack(alignment: .leading, spacing: 12) {
                    Label("历史背景", systemImage: "clock")
                        .font(.headline)
                        .foregroundColor(.apexLava)

                    Text(history)
                        .font(.body)
                        .foregroundColor(.primary.opacity(0.85))
                        .lineSpacing(6)
                        .italic()
                }
                .padding(20)
                .background(Color.apexCardSurface)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
            }
        }
    }

    private var dnaChainSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Label("公式 DNA 链", systemImage: "waveform.path.ecg")
                .font(.headline)
                .foregroundColor(.apexEmerald)

            HStack(alignment: .top, spacing: 0) {
                VStack(spacing: 12) {
                    Text("来自")
                        .font(.caption2)
                        .foregroundColor(.secondary)

                    if formula.prerequisites.isEmpty {
                        DnaNode(title: "公理", color: .gray)
                    } else {
                        ForEach(formula.prerequisites, id: \.self) { prereq in
                            if let prereqFormula = SampleData.formulas.first(where: { $0.id == prereq }) {
                                DnaNode(title: prereqFormula.name, color: .apexStarBlue)
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)

                VStack(spacing: 0) {
                    Spacer().frame(height: 40)
                    Image(systemName: "chevron.right.2")
                        .foregroundColor(.apexEmerald.opacity(0.5))
                }
                .frame(width: 30)

                VStack(spacing: 12) {
                    Text("当前")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    DnaNode(title: formula.name, color: .apexEmerald, isCurrent: true)
                }
                .frame(maxWidth: .infinity)

                VStack(spacing: 0) {
                    Spacer().frame(height: 40)
                    Image(systemName: "chevron.right.2")
                        .foregroundColor(.apexEmerald.opacity(0.5))
                }
                .frame(width: 30)

                VStack(spacing: 12) {
                    Text("生出")
                        .font(.caption2)
                        .foregroundColor(.secondary)

                    if formula.derivations.isEmpty {
                        DnaNode(title: "未知领域", color: .gray)
                    } else {
                        ForEach(formula.derivations.prefix(2), id: \.self) { deriv in
                            if let derivFormula = SampleData.formulas.first(where: { $0.id == deriv }) {
                                DnaNode(title: derivFormula.name, color: .apexLava)
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.vertical, 10)
        }
        .padding(20)
        .background(Color.apexCardSurface)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }

    private var advancedSection: some View {
        Group {
            if let advancedId = formula.advancedForm {
                VStack(alignment: .leading, spacing: 12) {
                    Label("超前视角", systemImage: "bolt.fill")
                        .font(.headline)
                        .foregroundColor(.apexGold)

                    Text("这个公式背后的高阶理论")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    HStack(spacing: 8) {
                        Image(systemName: "lock.open.fill")
                            .foregroundColor(.apexGold)
                        Text("高阶形式: \(advancedId)")
                            .font(.subheadline)
                            .foregroundColor(.apexGold)
                    }
                    .padding(12)
                    .background(Color.apexGold.opacity(0.1))
                    .cornerRadius(10)
                }
                .padding(20)
                .background(
                    LinearGradient(
                        colors: [Color.apexGold.opacity(0.1), Color.apexCardSurface],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.apexGold.opacity(0.3), lineWidth: 1)
                )
            }
        }
    }
}

struct DnaNode: View {
    let title: String
    let color: Color
    var isCurrent: Bool = false

    var body: some View {
        Text(title)
            .font(.system(size: 10, weight: .medium))
            .foregroundColor(isCurrent ? .white : color)
            .padding(.horizontal, 8)
            .padding(.vertical, 6)
            .frame(maxWidth: .infinity)
            .background(isCurrent ? color : color.opacity(0.1))
            .cornerRadius(6)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(color.opacity(0.3), lineWidth: 1)
            )
    }
}
