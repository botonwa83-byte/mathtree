import SwiftUI

struct CommandCenterView: View {
    @EnvironmentObject var profile: StudentProfile
    @State private var showDailyStrike = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    dailyStrikeCard
                    streakCard
                    weaponRecommendation
                    quickActions
                    gaokaoScoreCard
                }
                .padding(.horizontal, 20)
                .padding(.top, 12)
            }
            .background(Color.apexBackground)
            .navigationTitle("MathTree")
            .sheet(isPresented: $showDailyStrike) {
                DailyStrikeView()
            }
        }
    }

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
                    Text("点击查看")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Image(systemName: "chevron.right")
                        .foregroundColor(.secondary)
                }

                Text("如果将一张纸对折42次，它的厚度是否能到达月球？")
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
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
        }
    }

    private var streakCard: some View {
        HStack(spacing: 20) {
            StatBubble(value: "\(profile.streak)", unit: "天", label: "连续打击", color: .levelElementary)
            StatBubble(value: "\(profile.totalProblems)", unit: "道", label: "已歼灭", color: .levelMiddle)
            StatBubble(value: "\(Int(profile.accuracy * 100))%", unit: "", label: "精准度", color: .levelHigh)
        }
        .padding(20)
        .background(Color.apexCardSurface)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }

    private var weaponRecommendation: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "wand.and.stars")
                    .foregroundColor(.apexMystery)
                Text("推荐武器")
                    .font(.headline)
                    .foregroundColor(.primary)
            }

            HStack(spacing: 16) {
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(colors: [.apexLava.opacity(0.3), .apexGold.opacity(0.3)],
                                           startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        .frame(width: 56, height: 56)
                    Image(systemName: "function")
                        .font(.title2)
                        .foregroundColor(.apexLava)
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text("求导刃")
                        .font(.headline)
                        .foregroundColor(.primary)
                    Text("第二阶 · 快刀")
                        .font(.caption)
                        .foregroundColor(.apexLava)
                    Text("可秒杀：函数极值、切线方程等")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
            }
        }
        .padding(20)
        .background(Color.apexCardSurface)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }

    private var quickActions: some View {
        HStack(spacing: 12) {
            QuickActionButton(icon: "target", title: "战场", subtitle: "高考实战", color: .levelHigh)
            QuickActionButton(icon: "magnifyingglass.circle.fill", title: "悬案室", subtitle: "数学争议", color: .levelUniversity)
            QuickActionButton(icon: "aqi.medium", title: "宇宙", subtitle: "知识图谱", color: .levelMiddle)
        }
    }

    private var gaokaoScoreCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("高考预测得分")
                    .font(.headline)
                    .foregroundColor(.primary)
                Spacer()
                Text("目标：150分")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            HStack(alignment: .lastTextBaseline, spacing: 8) {
                Text("\(Int(profile.predictedGaokaoScore))")
                    .font(.system(size: 48, weight: .bold, design: .rounded))
                    .foregroundStyle(
                        LinearGradient(colors: [.levelElementary, .levelMiddle],
                                       startPoint: .leading, endPoint: .trailing)
                    )
                Text("/ 150 分")
                    .font(.title3)
                    .foregroundColor(.secondary)
            }

            ProgressView(value: profile.predictedGaokaoScore / 150)
                .tint(.levelElementary)
        }
        .padding(20)
        .background(Color.apexCardSurface)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }
}

struct StatBubble: View {
    let value: String
    let unit: String
    let label: String
    let color: Color

    var body: some View {
        VStack(spacing: 4) {
            HStack(alignment: .lastTextBaseline, spacing: 2) {
                Text(value)
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(color)
                if !unit.isEmpty {
                    Text(unit)
                        .font(.caption)
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

struct QuickActionButton: View {
    let icon: String
    let title: String
    let subtitle: String
    let color: Color

    var body: some View {
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
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.04), radius: 6, y: 3)
    }
}
