import SwiftUI

struct MysteryDetailView: View {
    let mystery: MathMystery
    @State private var userVote: Bool?
    @State private var expandedArgIndex: Int?
    @State private var showProof = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                headerSection
                premiseSection
                argumentsSection

                if showProof {
                    proofSection
                }

                verdictSection
                votingSection
                historySection
            }
            .padding(.horizontal, 20)
            .padding(.top, 12)
            .padding(.bottom, 40)
        }
        .background(Color.mysteryBackground)
        .navigationBarTitleDisplayMode(.inline)
    }

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(mystery.category.displayName)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.apexMystery)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Color.apexMystery.opacity(0.1))
                    .cornerRadius(8)

                Spacer()

                HStack(spacing: 2) {
                    ForEach(0..<mystery.shockRating, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .font(.system(size: 10))
                            .foregroundColor(.apexGold)
                    }
                }
            }

            Text(mystery.title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
        }
    }

    private var premiseSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label("案情", systemImage: "doc.text.fill")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.apexMystery)

            Text(mystery.premise)
                .font(.body)
                .foregroundColor(.primary)
                .lineSpacing(6)
        }
        .padding(20)
        .background(Color.mysteryPaper.opacity(0.5))
        .cornerRadius(20)
    }

    private var argumentsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("各方论证", systemImage: "bubble.left.and.bubble.right.fill")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.apexMystery)

            ForEach(Array(mystery.arguments.enumerated()), id: \.offset) { index, argument in
                VStack(alignment: .leading, spacing: 8) {
                    Button {
                        withAnimation {
                            expandedArgIndex = expandedArgIndex == index ? nil : index
                        }
                    } label: {
                        HStack {
                            if let correct = argument.isCorrect {
                                Image(systemName: correct ? "checkmark.circle.fill" : "xmark.circle.fill")
                                    .foregroundColor(correct ? .apexEmerald : .apexDanger)
                            }
                            Text(argument.title)
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundColor(.primary)
                            Spacer()
                            Image(systemName: expandedArgIndex == index ? "chevron.up" : "chevron.down")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }

                    if expandedArgIndex == index {
                        Text(argument.content)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .lineSpacing(4)
                            .padding(.leading, 28)
                    }
                }
                .padding(16)
                .background(Color.apexCardSurface)
                .cornerRadius(14)
                .shadow(color: .black.opacity(0.03), radius: 4, y: 2)
            }

            Button {
                withAnimation { showProof.toggle() }
            } label: {
                HStack {
                    Image(systemName: "function")
                    Text(showProof ? "收起证明" : "展开数学证明")
                }
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(.apexMystery)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .background(Color.apexMystery.opacity(0.08))
                .cornerRadius(14)
            }
        }
    }

    private var proofSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("数学证明", systemImage: "checkmark.seal.fill")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.apexEmerald)

            ForEach(mystery.proofSteps) { step in
                HStack(alignment: .top, spacing: 12) {
                    Text("\(step.order)")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 24, height: 24)
                        .background(Color.apexEmerald)
                        .cornerRadius(12)

                    VStack(alignment: .leading, spacing: 4) {
                        FormulaView(latex: step.latex, fontSize: 18)
                            .frame(height: 40)
                        Text(step.explanation)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .padding(20)
        .background(Color.apexCardSurface)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }

    private var verdictSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label("结论", systemImage: "checkmark.shield.fill")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.apexEmerald)

            Text(mystery.verdict)
                .font(.body)
                .foregroundColor(.primary)
                .lineSpacing(6)
        }
        .padding(20)
        .background(Color.apexEmerald.opacity(0.08))
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.apexEmerald.opacity(0.2), lineWidth: 1)
        )
    }

    private var votingSection: some View {
        VStack(spacing: 16) {
            Text("你怎么看？")
                .font(.headline)
                .foregroundColor(.primary)

            HStack(spacing: 16) {
                VoteButton(title: "认同", count: mystery.votes.agreeCount, color: .apexEmerald, isSelected: userVote == true) {
                    userVote = true
                }
                VoteButton(title: "存疑", count: mystery.votes.disagreeCount, color: .apexDanger, isSelected: userVote == false) {
                    userVote = false
                }
            }
        }
        .padding(20)
        .background(Color.apexCardSurface)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }

    private var historySection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label("历史故事", systemImage: "book.fill")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.apexGold)

            Text(mystery.historicalContext)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineSpacing(6)
        }
        .padding(20)
        .background(Color.mysteryPaper.opacity(0.4))
        .cornerRadius(20)
    }
}

struct VoteButton: View {
    let title: String
    let count: Int
    let color: Color
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(isSelected ? .white : color)
                Text("\(count)")
                    .font(.caption)
                    .foregroundColor(isSelected ? .white.opacity(0.8) : .secondary)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(isSelected ? color : color.opacity(0.08))
            .cornerRadius(14)
        }
    }
}
