import Foundation
import SwiftUI

struct AnswerRecord: Codable, Identifiable {
    let id: UUID
    let problemId: String
    let timestamp: Date
    let isCorrect: Bool
    let userAnswer: String
    let timeSpent: TimeInterval
    let usedHint: Bool

    init(problemId: String, isCorrect: Bool, userAnswer: String, timeSpent: TimeInterval, usedHint: Bool) {
        self.id = UUID()
        self.problemId = problemId
        self.timestamp = Date()
        self.isCorrect = isCorrect
        self.userAnswer = userAnswer
        self.timeSpent = timeSpent
        self.usedHint = usedHint
    }
}

struct ProblemStats {
    let problemId: String
    let totalAttempts: Int
    let correctCount: Int
    let lastAttempt: Date?
    let averageTime: TimeInterval

    var accuracy: Double {
        guard totalAttempts > 0 else { return 0 }
        return Double(correctCount) / Double(totalAttempts)
    }

    var isWeak: Bool { totalAttempts >= 2 && accuracy < 0.5 }
}

struct TagStats: Identifiable {
    var id: String { tag }
    let tag: String
    let totalAttempts: Int
    let correctCount: Int
    let problemCount: Int

    var accuracy: Double {
        guard totalAttempts > 0 else { return 0 }
        return Double(correctCount) / Double(totalAttempts)
    }

    var isWeak: Bool { totalAttempts >= 3 && accuracy < 0.6 }
}

class PracticeManager: ObservableObject {
    static let shared = PracticeManager()

    private let storageKey = "practice_records_v1"
    private let maxRecords = 5000

    @Published private(set) var records: [AnswerRecord] = []

    /// 用户手动标注的错题集合(错题本以此为准)。
    @Published private(set) var flaggedErrorIds: Set<String> = []
    private let flagKey = "flagged_errors_v1"

    init() {
        loadRecords()
        loadFlags()
    }

    // MARK: - 手动标注错题

    func isFlaggedError(_ problemId: String) -> Bool { flaggedErrorIds.contains(problemId) }

    func flagError(_ problemId: String) {
        if flaggedErrorIds.insert(problemId).inserted { saveFlags() }
    }

    func unflagError(_ problemId: String) {
        if flaggedErrorIds.remove(problemId) != nil { saveFlags() }
    }

    func toggleError(_ problemId: String) {
        if flaggedErrorIds.contains(problemId) { unflagError(problemId) } else { flagError(problemId) }
    }

    /// 错题本：用户标注的题(按标注/难度排序由调用方处理)。
    func flaggedProblems(from problems: [Problem]) -> [Problem] {
        problems.filter { flaggedErrorIds.contains($0.id) }
    }

    private func saveFlags() {
        UserDefaults.standard.set(Array(flaggedErrorIds), forKey: flagKey)
    }

    private func loadFlags() {
        flaggedErrorIds = Set(UserDefaults.standard.stringArray(forKey: flagKey) ?? [])
    }

    // MARK: - Record

    func recordAnswer(problemId: String, isCorrect: Bool, userAnswer: String, timeSpent: TimeInterval, usedHint: Bool) {
        let record = AnswerRecord(
            problemId: problemId,
            isCorrect: isCorrect,
            userAnswer: userAnswer,
            timeSpent: timeSpent,
            usedHint: usedHint
        )
        records.append(record)

        // Trim old records if needed
        if records.count > maxRecords {
            records = Array(records.suffix(maxRecords))
        }

        saveRecords()

        // Sync mastery: if answered correctly 3+ times in a row, auto-mark mastered
        let recentForProblem = records.filter { $0.problemId == problemId }.suffix(3)
        if recentForProblem.count >= 3 && recentForProblem.allSatisfy({ $0.isCorrect }) {
            ProblemMasteryManager.shared.markMastered(problemId)
        }
    }

    // MARK: - Query: Single Problem

    func stats(for problemId: String) -> ProblemStats {
        let problemRecords = records.filter { $0.problemId == problemId }
        return ProblemStats(
            problemId: problemId,
            totalAttempts: problemRecords.count,
            correctCount: problemRecords.filter(\.isCorrect).count,
            lastAttempt: problemRecords.last?.timestamp,
            averageTime: problemRecords.isEmpty ? 0 : problemRecords.map(\.timeSpent).reduce(0, +) / Double(problemRecords.count)
        )
    }

    // MARK: - Query: Wrong Problems (Error Book)

    func wrongProblems() -> [String] {
        // Problems where the last attempt was wrong, or accuracy < 50%
        var latestResult: [String: Bool] = [:]
        for record in records {
            latestResult[record.problemId] = record.isCorrect
        }

        // Include problems where latest answer is wrong
        let wrongLatest = latestResult.filter { !$0.value }.map(\.key)

        // Also include problems with low accuracy (attempted 2+ times)
        let lowAccuracy = Set(records.map(\.problemId)).filter { pid in
            let s = stats(for: pid)
            return s.totalAttempts >= 2 && s.accuracy < 0.5
        }

        return Array(Set(wrongLatest).union(lowAccuracy))
    }

    func wrongProblemsSorted(from problems: [Problem]) -> [Problem] {
        let wrongIds = Set(wrongProblems())
        return problems
            .filter { wrongIds.contains($0.id) }
            .sorted { p1, p2 in
                let s1 = stats(for: p1.id)
                let s2 = stats(for: p2.id)
                // Sort by accuracy (lowest first), then by most recent
                if s1.accuracy != s2.accuracy { return s1.accuracy < s2.accuracy }
                return (s1.lastAttempt ?? .distantPast) > (s2.lastAttempt ?? .distantPast)
            }
    }

    // MARK: - Query: Tag Stats (Weak Points)

    func tagStats(from problems: [Problem]) -> [TagStats] {
        // Build tag -> problem IDs mapping
        var tagProblems: [String: Set<String>] = [:]
        for problem in problems {
            for tag in problem.tags {
                tagProblems[tag, default: []].insert(problem.id)
            }
        }

        return tagProblems.map { tag, problemIds in
            let tagRecords = records.filter { problemIds.contains($0.problemId) }
            return TagStats(
                tag: tag,
                totalAttempts: tagRecords.count,
                correctCount: tagRecords.filter(\.isCorrect).count,
                problemCount: problemIds.count
            )
        }
        .filter { $0.totalAttempts > 0 }
        .sorted { $0.accuracy < $1.accuracy }
    }

    func weakTags(from problems: [Problem]) -> [TagStats] {
        tagStats(from: problems).filter(\.isWeak)
    }

    // MARK: - Query: Overall Stats

    var totalAnswered: Int { records.count }

    var totalCorrect: Int { records.filter(\.isCorrect).count }

    var overallAccuracy: Double {
        guard totalAnswered > 0 else { return 0 }
        return Double(totalCorrect) / Double(totalAnswered)
    }

    var todayAnswered: Int {
        let today = Calendar.current.startOfDay(for: Date())
        return records.filter { $0.timestamp >= today }.count
    }

    var todayCorrect: Int {
        let today = Calendar.current.startOfDay(for: Date())
        return records.filter { $0.timestamp >= today && $0.isCorrect }.count
    }

    // MARK: - Persistence

    private func saveRecords() {
        guard let data = try? JSONEncoder().encode(records) else { return }
        UserDefaults.standard.set(data, forKey: storageKey)
    }

    private func loadRecords() {
        guard let data = UserDefaults.standard.data(forKey: storageKey),
              let decoded = try? JSONDecoder().decode([AnswerRecord].self, from: data) else { return }
        records = decoded
    }

    func clearAllRecords() {
        records = []
        saveRecords()
    }
}
