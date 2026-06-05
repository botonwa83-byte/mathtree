import Foundation

struct Achievement: Identifiable {
    let id: String
    let title: String
    let icon: String
    let description: String
    let isUnlocked: Bool
}

class StreakManager: ObservableObject {
    static let shared = StreakManager()

    private let streakKey = "streak_data_v1"
    private let examDateKey = "gaokao_target_date"

    @Published var currentStreak: Int = 0
    @Published var longestStreak: Int = 0
    @Published var lastActiveDate: Date?
    @Published var gaokaoDate: Date?

    init() {
        load()
        checkStreak()
    }

    // MARK: - Streak

    func recordActivity() {
        let today = Calendar.current.startOfDay(for: Date())

        if let last = lastActiveDate {
            let lastDay = Calendar.current.startOfDay(for: last)
            if lastDay == today {
                return // Already recorded today
            }
            let daysBetween = Calendar.current.dateComponents([.day], from: lastDay, to: today).day ?? 0
            if daysBetween == 1 {
                currentStreak += 1
            } else {
                currentStreak = 1
            }
        } else {
            currentStreak = 1
        }

        lastActiveDate = today
        longestStreak = max(longestStreak, currentStreak)
        save()
    }

    private func checkStreak() {
        guard let last = lastActiveDate else { return }
        let today = Calendar.current.startOfDay(for: Date())
        let lastDay = Calendar.current.startOfDay(for: last)
        let daysBetween = Calendar.current.dateComponents([.day], from: lastDay, to: today).day ?? 0
        if daysBetween > 1 {
            currentStreak = 0
            save()
        }
    }

    var isActiveToday: Bool {
        guard let last = lastActiveDate else { return false }
        return Calendar.current.isDateInToday(last)
    }

    // MARK: - Gaokao Countdown

    func setGaokaoDate(_ date: Date) {
        gaokaoDate = date
        save()
    }

    var daysUntilGaokao: Int? {
        guard let date = gaokaoDate else { return nil }
        let today = Calendar.current.startOfDay(for: Date())
        let target = Calendar.current.startOfDay(for: date)
        return Calendar.current.dateComponents([.day], from: today, to: target).day
    }

    // MARK: - Achievements

    func achievements() -> [Achievement] {
        let pm = PracticeManager.shared
        let rm = ReviewScheduler.shared

        return [
            Achievement(id: "first_10", title: "初出茅庐", icon: "flame", description: "累计做题10道", isUnlocked: pm.totalAnswered >= 10),
            Achievement(id: "first_50", title: "身经百战", icon: "flame.fill", description: "累计做题50道", isUnlocked: pm.totalAnswered >= 50),
            Achievement(id: "first_100", title: "百炼成钢", icon: "star.fill", description: "累计做题100道", isUnlocked: pm.totalAnswered >= 100),
            Achievement(id: "accuracy_70", title: "稳定发挥", icon: "target", description: "总正确率>=70%", isUnlocked: pm.totalAnswered >= 10 && pm.overallAccuracy >= 0.7),
            Achievement(id: "accuracy_90", title: "精准打击", icon: "scope", description: "总正确率>=90%", isUnlocked: pm.totalAnswered >= 20 && pm.overallAccuracy >= 0.9),
            Achievement(id: "streak_3", title: "三日不辍", icon: "calendar.badge.checkmark", description: "连续打卡3天", isUnlocked: longestStreak >= 3),
            Achievement(id: "streak_7", title: "一周坚持", icon: "calendar.badge.clock", description: "连续打卡7天", isUnlocked: longestStreak >= 7),
            Achievement(id: "streak_30", title: "月度战神", icon: "crown.fill", description: "连续打卡30天", isUnlocked: longestStreak >= 30),
            Achievement(id: "review_10", title: "温故知新", icon: "brain.head.profile", description: "复习10道题", isUnlocked: rm.items.values.reduce(0) { $0 + $1.totalReviews } >= 10),
            Achievement(id: "no_wrong", title: "零失误日", icon: "checkmark.seal.fill", description: "一天做10+题全对", isUnlocked: pm.todayAnswered >= 10 && pm.todayCorrect == pm.todayAnswered),
        ]
    }

    var unlockedCount: Int {
        achievements().filter(\.isUnlocked).count
    }

    // MARK: - Persistence

    private func save() {
        let data: [String: Any] = [
            "currentStreak": currentStreak,
            "longestStreak": longestStreak,
            "lastActiveDate": lastActiveDate?.timeIntervalSince1970 ?? 0
        ]
        UserDefaults.standard.set(data, forKey: streakKey)
        if let date = gaokaoDate {
            UserDefaults.standard.set(date.timeIntervalSince1970, forKey: examDateKey)
        }
    }

    private func load() {
        if let data = UserDefaults.standard.dictionary(forKey: streakKey) {
            currentStreak = data["currentStreak"] as? Int ?? 0
            longestStreak = data["longestStreak"] as? Int ?? 0
            if let ts = data["lastActiveDate"] as? Double, ts > 0 {
                lastActiveDate = Date(timeIntervalSince1970: ts)
            }
        }
        let examTs = UserDefaults.standard.double(forKey: examDateKey)
        if examTs > 0 {
            gaokaoDate = Date(timeIntervalSince1970: examTs)
        }
    }
}
