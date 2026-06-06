import Foundation
import SwiftUI

class ProblemMasteryManager: ObservableObject {
    static let shared = ProblemMasteryManager()

    private let masteredKey = "mastered_problem_ids"

    @Published var masteredIds: Set<String> {
        didSet { save() }
    }

    init() {
        let saved = UserDefaults.standard.stringArray(forKey: masteredKey) ?? []
        self.masteredIds = Set(saved)
    }

    private func save() {
        UserDefaults.standard.set(Array(masteredIds), forKey: masteredKey)
    }

    func isMastered(_ problemId: String) -> Bool {
        masteredIds.contains(problemId)
    }

    func toggleMastery(_ problemId: String) {
        if masteredIds.contains(problemId) {
            masteredIds.remove(problemId)
        } else {
            masteredIds.insert(problemId)
        }
    }

    func markMastered(_ problemId: String) {
        masteredIds.insert(problemId)
    }

    func unmarkMastered(_ problemId: String) {
        masteredIds.remove(problemId)
    }

    var masteredCount: Int { masteredIds.count }
}
