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
                    learningRoadmap
                    weaknessAnalysisCard
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

    private var learningRoadmap: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "map.fill")
                    .foregroundColor(.apexLava)
                Text("学习路线图")
                    .font(.headline)
                    .foregroundColor(.primary)
                Spacer()
                Text("距离目标 30%")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            VStack(spacing: 0) {
                ForEach(Array(profile.learningPath.enumerated()), id: \.offset) { index, formulaId in
                    let formula = SampleData.formulas.first(where: { $0.id == formulaId })
                    HStack(spacing: 16) {
                        // Node
                        VStack(spacing: 0) {
                            ZStack {
                                Circle()
                                    .fill(index == 0 ? Color.apexLava : Color.gray.opacity(0.1))
                                    .frame(width: 32, height: 32)
                                
                                if index == 0 {
                                    Image(systemName: "play.fill")
                                        .font(.system(size: 12))
                                        .foregroundColor(.white)
                                } else {
                                    Image(systemName: "lock.fill")
                                        .font(.system(size: 12))
                                        .foregroundColor(.gray)
                                }
                            }
                            
                            if index < profile.learningPath.count - 1 {
                                Rectangle()
                                    .fill(Color.gray.opacity(0.1))
                                    .frame(width: 2, height: 40)
                            }
                        }

                        // Info
                        VStack(alignment: .leading, spacing: 4) {
                            Text(formula?.name ?? "未知知识点")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundColor(index == 0 ? .primary : .secondary)
                            Text(index == 0 ? "当前攻克中" : "待解锁")
                                .font(.caption2)
                                .foregroundColor(index == 0 ? .apexLava : .secondary)
                        }
                        
                        Spacer()
                        
                        if index == 0 {
                            Button("开始学习") {
                                // Action to jump to formula detail
                            }
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.apexLava)
                            .cornerRadius(12)
                        }
                    }
                }
            }
        }
        .padding(24)
        .background(Color.apexCardSurface)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }

    private var weaknessAnalysisCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "chart.pie.fill")
                    .foregroundColor(.apexEmerald)
                Text("薄弱环节分析")
                    .font(.headline)
                    .foregroundColor(.primary)
            }

            Text("你在「\(profile.weaknessAreas.keys.first?.displayName ?? "数学")」领域的错误率较高，建议针对性练习。")
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(2)

            HStack(spacing: 12) {
                ForEach(Array(profile.weaknessAreas.keys.prefix(2)), id: \.self) { category in
                    HStack {
                        Text(category.displayName)
                            .font(.caption2)
                            .fontWeight(.bold)
                            .foregroundColor(.apexEmerald)
                        Spacer()
                        Text("\(Int((profile.weaknessAreas[category] ?? 0) * 100))%")
                            .font(.caption2)
                            .foregroundColor(.apexDanger)
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(Color.apexEmerald.opacity(0.1))
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity)
                }
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
