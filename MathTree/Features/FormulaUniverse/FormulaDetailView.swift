import SwiftUI

struct FormulaDetailView: View {
    let formula: Formula

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                formulaPresentation
                intuitionSection
                dnaChainSection
                advancedSection
            }
            .padding(.horizontal, 20)
            .padding(.top, 12)
            .padding(.bottom, 40)
        }
        .background(Color.apexDeepBackground)
        .navigationBarTitleDisplayMode(.inline)
    }

    private var formulaPresentation: some View {
        VStack(spacing: 16) {
            HStack {
                Text(formula.level.displayName)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.apexDeepStar)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Color.apexDeepStar.opacity(0.1))
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
                .foregroundColor(.apexDeepActive)
            }

            Text(formula.name)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)

            FormulaView(latex: formula.latex, fontSize: 28)
                .frame(height: 80)
                .frame(maxWidth: .infinity)
                .background(Color.white.opacity(0.05))
                .cornerRadius(12)

            if !formula.tags.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(formula.tags, id: \.self) { tag in
                            Text(tag)
                                .font(.caption)
                                .foregroundColor(.apexDeepStar)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(Color.apexDeepStar.opacity(0.1))
                                .cornerRadius(8)
                        }
                    }
                }
            }
        }
        .padding(20)
        .background(Color.apexDeepSurface)
        .cornerRadius(20)
    }

    private var intuitionSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("直觉理解", systemImage: "lightbulb.fill")
                .font(.headline)
                .foregroundColor(.apexGold)

            Text(formula.intuition)
                .font(.body)
                .foregroundColor(.white.opacity(0.9))
                .lineSpacing(6)

            Text("不需要数学语言，用直觉感受这个公式的含义")
                .font(.caption)
                .foregroundColor(.secondary)
                .italic()
        }
        .padding(20)
        .background(Color.apexDeepSurface)
        .cornerRadius(20)
    }

    private var dnaChainSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Label("公式 DNA 链", systemImage: "waveform.path.ecg")
                .font(.headline)
                .foregroundColor(.apexDeepBrand)

            HStack(alignment: .top, spacing: 0) {
                // Prereqs
                VStack(spacing: 12) {
                    Text("来自")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    
                    if formula.prerequisites.isEmpty {
                        DnaNode(title: "公理", color: .gray)
                    } else {
                        ForEach(formula.prerequisites, id: \.self) { prereq in
                            DnaNode(title: prereq, color: .apexDeepStar)
                        }
                    }
                }
                .frame(maxWidth: .infinity)

                // Connector
                VStack(spacing: 0) {
                    Spacer().frame(height: 40)
                    Image(systemName: "chevron.right.2")
                        .foregroundColor(.apexDeepBrand.opacity(0.5))
                }
                .frame(width: 30)

                // Current
                VStack(spacing: 12) {
                    Text("当前")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    DnaNode(title: formula.name, color: .apexDeepBrand, isCurrent: true)
                }
                .frame(maxWidth: .infinity)

                // Connector
                VStack(spacing: 0) {
                    Spacer().frame(height: 40)
                    Image(systemName: "chevron.right.2")
                        .foregroundColor(.apexDeepBrand.opacity(0.5))
                }
                .frame(width: 30)

                // Derivations
                VStack(spacing: 12) {
                    Text("生出")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    
                    if formula.derivations.isEmpty {
                        DnaNode(title: "未知领域", color: .gray)
                    } else {
                        ForEach(formula.derivations.prefix(2), id: \.self) { deriv in
                            DnaNode(title: deriv, color: .apexDeepActive)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.vertical, 10)
        }
        .padding(20)
        .background(Color.apexDeepSurface)
        .cornerRadius(20)
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
                        colors: [Color.apexGold.opacity(0.1), Color.apexDeepSurface],
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
