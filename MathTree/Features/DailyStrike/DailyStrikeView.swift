import SwiftUI

struct DailyStrikeView: View {
    @Environment(\.dismiss) var dismiss
    @State private var currentStrike = SampleData.dailyStrikes.randomElement() ?? DailyStrike(type: "思维", question: "暂无题目", answer: "敬请期待", detail: nil)
    @State private var showAnswer = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color.apexBackground.ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 24) {
                        strikeIcon
                        questionCard
                        if showAnswer {
                            answerCard
                        }
                        actionButton
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 40)
                    .readableContentWidth()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("关闭") { dismiss() }
                        .foregroundColor(.secondary)
                }
            }
        }
    }

    private var strikeIcon: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(Color.apexLava.opacity(0.15))
                    .frame(width: 80, height: 80)
                Image(systemName: "bolt.fill")
                    .font(.system(size: 36))
                    .foregroundColor(.apexLava)
            }

            Text("每日一击")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)

            Text(currentStrike.type)
                .font(.caption)
                .foregroundColor(.apexLava)
                .padding(.horizontal, 12)
                .padding(.vertical, 4)
                .background(Color.apexLava.opacity(0.1))
                .cornerRadius(12)
        }
    }

    private var questionCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(currentStrike.question)
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.primary)
                .lineSpacing(8)
                .multilineTextAlignment(.leading)
        }
        .padding(24)
        .background(Color.apexCardSurface)
        .cornerRadius(20)
    }

    private var answerCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(.apexGold)
                Text("揭晓")
                    .font(.headline)
                    .foregroundColor(.apexGold)
            }

            Text(currentStrike.answer.mathPretty)
                .font(.body)
                .foregroundColor(.primary)
                .lineSpacing(6)

            if let detail = currentStrike.detail {
                Divider()
                Text(detail)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineSpacing(4)
            }
        }
        .padding(24)
        .background(
            LinearGradient(
                colors: [Color.apexGold.opacity(0.1), Color.apexCardSurface],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(20)
    }

    private var actionButton: some View {
        Button {
            withAnimation(.spring(response: 0.5)) {
                if showAnswer {
                    if let next = SampleData.dailyStrikes.randomElement() {
                        currentStrike = next
                    }
                    showAnswer = false
                } else {
                    showAnswer = true
                }
            }
        } label: {
            Text(showAnswer ? "下一击" : "揭晓答案")
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(Color.apexLava)
                .cornerRadius(20)
        }
    }
}

struct DailyStrike: Identifiable {
    let id = UUID()
    let type: String
    let question: String
    let answer: String
    let detail: String?
}
