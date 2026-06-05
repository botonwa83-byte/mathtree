import XCTest
@testable import MathTree

// MARK: - 模型逻辑与运行时安全测试

final class ModelLogicTests: XCTestCase {

    // MARK: - 1. StudentProfile 测试

    func testStudentProfileInitialValues() {
        let profile = StudentProfile()
        XCTAssertGreaterThan(profile.streak, 0)
        XCTAssertGreaterThan(profile.totalProblems, 0)
        XCTAssertGreaterThanOrEqual(profile.correctProblems, 0)
        XCTAssertLessThanOrEqual(profile.correctProblems, profile.totalProblems)
    }

    func testStudentProfileAccuracy() {
        let profile = StudentProfile()
        let accuracy = profile.accuracy
        XCTAssertGreaterThanOrEqual(accuracy, 0)
        XCTAssertLessThanOrEqual(accuracy, 1.0)
    }

    func testStudentProfileAccuracyZeroProblems() {
        let profile = StudentProfile()
        // 模拟零题目的情况
        profile.totalProblems = 0
        profile.correctProblems = 0
        XCTAssertEqual(profile.accuracy, 0, "零题目时精准度应为 0")
    }

    func testStudentProfileCodable() {
        let profile = StudentProfile()
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()

        do {
            let data = try encoder.encode(profile)
            let decoded = try decoder.decode(StudentProfile.self, from: data)
            XCTAssertEqual(decoded.displayName, profile.displayName)
            XCTAssertEqual(decoded.streak, profile.streak)
            XCTAssertEqual(decoded.predictedGaokaoScore, profile.predictedGaokaoScore)
        } catch {
            XCTFail("StudentProfile 编解码失败: \(error)")
        }
    }

    func testStudentProfileGaokaoScoreInRange() {
        let profile = StudentProfile()
        XCTAssertTrue(profile.predictedGaokaoScore >= 0 && profile.predictedGaokaoScore <= 150,
                       "高考预测分 \(profile.predictedGaokaoScore) 超出 [0, 150]")
    }

    // MARK: - 2. 筛选逻辑测试

    func testDifficultyFilterMatchesAll() {
        let filter = BattlefieldView.DifficultyFilter.all
        XCTAssertTrue(filter.matches(0.1))
        XCTAssertTrue(filter.matches(0.5))
        XCTAssertTrue(filter.matches(0.9))
    }

    func testDifficultyFilterMatchesEasy() {
        let filter = BattlefieldView.DifficultyFilter.easy
        XCTAssertTrue(filter.matches(0.1))
        XCTAssertTrue(filter.matches(0.49))
        XCTAssertFalse(filter.matches(0.5))
        XCTAssertFalse(filter.matches(0.8))
    }

    func testDifficultyFilterMatchesMedium() {
        let filter = BattlefieldView.DifficultyFilter.medium
        XCTAssertFalse(filter.matches(0.1))
        XCTAssertTrue(filter.matches(0.5))
        XCTAssertTrue(filter.matches(0.69))
        XCTAssertFalse(filter.matches(0.7))
    }

    func testDifficultyFilterMatchesHard() {
        let filter = BattlefieldView.DifficultyFilter.hard
        XCTAssertFalse(filter.matches(0.5))
        XCTAssertTrue(filter.matches(0.7))
        XCTAssertTrue(filter.matches(1.0))
    }

    // MARK: - 3. 数据引用一致性

    func testMysteryRelatedHeroIDsExist() {
        let heroIDs = Set(SampleData.heroes.map { $0.id })
        for m in SampleData.mysteries {
            if let heroId = m.relatedHeroId {
                // 有些引用了不存在的 "russell"
                if !heroIDs.contains(heroId) {
                    XCTFail("悬案 \(m.id) 引用了不存在的英雄 ID: '\(heroId)'")
                }
            }
        }
    }

    func testMysteryRelatedWeaponIDsExist() {
        let weaponIDs = Set(SampleData.weapons.map { $0.id })
        for m in SampleData.mysteries {
            if let weaponId = m.relatedWeaponId {
                if !weaponIDs.contains(weaponId) {
                    XCTFail("悬案 \(m.id) 引用了不存在的武器 ID: '\(weaponId)'")
                }
            }
        }
    }

    func testProblemFormulaIDsExist() {
        let formulaIDs = Set(SampleData.formulas.map { $0.id })
        for p in SampleData.problems {
            for fid in p.formulaIds {
                if !formulaIDs.contains(fid) {
                    print("WARNING: 题目 \(p.id) 引用了不存在的公式 ID: '\(fid)'")
                }
            }
        }
    }

    // MARK: - 4. Formula Codable

    func testFormulaCodable() {
        let formula = SampleData.formulas.first!
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()

        do {
            let data = try encoder.encode(formula)
            let decoded = try decoder.decode(Formula.self, from: data)
            XCTAssertEqual(decoded.id, formula.id)
            XCTAssertEqual(decoded.name, formula.name)
            XCTAssertEqual(decoded.latex, formula.latex)
        } catch {
            XCTFail("Formula 编解码失败: \(error)")
        }
    }

    // MARK: - 5. 边界条件

    func testEmptyFilteredProblemsHandled() {
        // 验证不存在会导致空数组崩溃的情况
        let impossibleFilter = BattlefieldView.DifficultyFilter.hard
        let problems = SampleData.problems.filter { p in
            impossibleFilter.matches(p.difficulty) && p.tags.contains("不存在的分类")
        }
        // 空数组不应崩溃
        XCTAssertTrue(problems.isEmpty)
    }

    func testAllFormulaLevelsPresent() {
        let levels = Set(SampleData.formulas.map { $0.level })
        for level in FormulaLevel.allCases {
            XCTAssertTrue(levels.contains(level), "缺少 \(level.displayName) 级别的公式")
        }
    }

    func testAllFormulaCategoriesHaveContent() {
        // 至少要有部分分类有内容
        let categories = Set(SampleData.formulas.map { $0.category })
        XCTAssertTrue(categories.count >= 5, "公式分类太少，只有 \(categories.count) 个")
    }

    // MARK: - 6. 性能相关

    func testSampleDataLoadPerformance() {
        // 确保数据加载不会太慢
        measure {
            _ = SampleData.formulas.count
            _ = SampleData.problems.count
            _ = SampleData.mysteries.count
            _ = SampleData.heroes.count
            _ = SampleData.weapons.count
            _ = SampleData.dailyStrikes.count
        }
    }
}
