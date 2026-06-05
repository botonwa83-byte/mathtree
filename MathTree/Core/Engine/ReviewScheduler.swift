import Foundation

struct ReviewItem: Codable, Identifiable {
    var id: String { problemId }
    let problemId: String
    var nextReviewDate: Date
    var currentInterval: Int  // days
    var correctStreak: Int
    var totalReviews: Int

    static let intervals = [1, 3, 7, 15, 30, 60]

    var isDueToday: Bool {
        nextReviewDate <= Date()
    }

    var isOverdue: Bool {
        let calendar = Calendar.current
        let dueDay = calendar.startOfDay(for: nextReviewDate)
        let today = calendar.startOfDay(for: Date())
        return dueDay < today
    }

    var daysUntilReview: Int {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let dueDay = calendar.startOfDay(for: nextReviewDate)
        return calendar.dateComponents([.day], from: today, to: dueDay).day ?? 0
    }
}

class ReviewScheduler: ObservableObject {
    static let shared = ReviewScheduler()

    private let storageKey = "review_schedule_v1"

    @Published private(set) var items: [String: ReviewItem] = [:]

    init() {
        loadItems()
    }

    // MARK: - Schedule Management

    /// Called after answering a problem. Updates or creates review schedule.
    func recordReview(problemId: String, isCorrect: Bool) {
        var item = items[problemId] ?? ReviewItem(
            problemId: problemId,
            nextReviewDate: Date(),
            currentInterval: 0,
            correctStreak: 0,
            totalReviews: 0
        )

        item.totalReviews += 1

        if isCorrect {
            item.correctStreak += 1
            // Move to next interval
            let intervalIndex = min(item.correctStreak, ReviewItem.intervals.count - 1)
            item.currentInterval = ReviewItem.intervals[intervalIndex]
        } else {
            // Reset to shortest interval
            item.correctStreak = 0
            item.currentInterval = ReviewItem.intervals[0]
        }

        item.nextReviewDate = Calendar.current.date(
            byAdding: .day,
            value: item.currentInterval,
            to: Date()
        ) ?? Date()

        items[problemId] = item
        saveItems()
    }

    // MARK: - Queries

    /// Problems due for review today (or overdue)
    func dueProblems() -> [ReviewItem] {
        items.values
            .filter(\.isDueToday)
            .sorted { item1, item2 in
                // Overdue items first, then by streak (weakest first)
                if item1.isOverdue != item2.isOverdue { return item1.isOverdue }
                return item1.correctStreak < item2.correctStreak
            }
    }

    var dueCount: Int {
        items.values.filter(\.isDueToday).count
    }

    /// Problems scheduled for future review
    func upcomingProblems() -> [ReviewItem] {
        items.values
            .filter { !$0.isDueToday }
            .sorted { $0.nextReviewDate < $1.nextReviewDate }
    }

    func reviewItem(for problemId: String) -> ReviewItem? {
        items[problemId]
    }

    /// Total problems in the review system
    var totalScheduled: Int { items.count }

    // MARK: - Persistence

    private func saveItems() {
        guard let data = try? JSONEncoder().encode(items) else { return }
        UserDefaults.standard.set(data, forKey: storageKey)
    }

    private func loadItems() {
        guard let data = UserDefaults.standard.data(forKey: storageKey),
              let decoded = try? JSONDecoder().decode([String: ReviewItem].self, from: data) else { return }
        items = decoded
    }
}
