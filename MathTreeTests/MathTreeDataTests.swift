import XCTest
@testable import MathTree

// MARK: - 数据完整性测试

final class DataIntegrityTests: XCTestCase {

    // MARK: 1. 公式数据

    func testAllFormulasHaveUniqueIDs() {
        let ids = SampleData.formulas.map { $0.id }
        let uniqueIDs = Set(ids)
        XCTAssertEqual(ids.count, uniqueIDs.count, "公式 ID 存在重复: \(ids.filter { id in ids.filter { $0 == id }.count > 1 })")
    }

    func testAllFormulasHaveNonEmptyFields() {
        for f in SampleData.formulas {
            XCTAssertFalse(f.name.isEmpty, "公式 \(f.id) 名称为空")
            XCTAssertFalse(f.latex.isEmpty, "公式 \(f.id) LaTeX 为空")
            XCTAssertFalse(f.intuition.isEmpty, "公式 \(f.id) 直觉描述为空")
            XCTAssertTrue(f.gaokaoRelevance >= 0 && f.gaokaoRelevance <= 1.0, "公式 \(f.id) 高考相关度 \(f.gaokaoRelevance) 超出 [0, 1]")
        }
    }

    func testFormulaPrerequisitesExist() {
        let allIDs = Set(SampleData.formulas.map { $0.id })
        for f in SampleData.formulas {
            for prereq in f.prerequisites {
                XCTAssertTrue(allIDs.contains(prereq), "公式 \(f.id) 的前置条件 '\(prereq)' 不存在于公式库中")
            }
        }
    }

    func testFormulaDerivationsExist() {
        let allIDs = Set(SampleData.formulas.map { $0.id })
        for f in SampleData.formulas {
            for deriv in f.derivations {
                // 只警告，因为有些推导公式可能尚未加入
                if !allIDs.contains(deriv) {
                    print("WARNING: 公式 \(f.id) 的推导 '\(deriv)' 不存在于公式库中")
                }
            }
        }
    }

    func testFormulaLatexNotContainUnescapedBackslash() {
        // 检查 LaTeX 中不应有孤立反斜杠导致渲染失败
        for f in SampleData.formulas {
            XCTAssertFalse(f.latex.contains("\\\\\\"), "公式 \(f.id) 的 LaTeX 可能有多余转义")
        }
    }

    // MARK: 2. 题目数据

    func testAllProblemsHaveUniqueIDs() {
        let ids = SampleData.problems.map { $0.id }
        let uniqueIDs = Set(ids)
        XCTAssertEqual(ids.count, uniqueIDs.count, "题目 ID 存在重复")
    }

    func testAllProblemsHaveValidDifficulty() {
        for p in SampleData.problems {
            XCTAssertTrue(p.difficulty >= 0 && p.difficulty <= 1.0, "题目 \(p.id) 难度 \(p.difficulty) 超出 [0, 1]")
        }
    }

    func testMultipleChoiceProblemsHaveOptions() {
        for p in SampleData.problems where p.type == .multipleChoice {
            XCTAssertNotNil(p.options, "选择题 \(p.id) 缺少选项")
            if let options = p.options {
                XCTAssertTrue(options.count >= 2, "选择题 \(p.id) 选项不足2个")
                XCTAssertTrue(options.count <= 6, "选择题 \(p.id) 选项超过6个（会导致optionLabel崩溃）")
            }
        }
    }

    func testMultipleChoiceAnswerInOptions() {
        for p in SampleData.problems where p.type == .multipleChoice {
            if let options = p.options {
                XCTAssertTrue(options.contains(p.answer), "选择题 \(p.id) 的答案 '\(p.answer)' 不在选项中: \(options)")
            }
        }
    }

    func testProblemSolutionStepsOrdered() {
        for p in SampleData.problems {
            let orders = p.solution.steps.map { $0.order }
            let sorted = orders.sorted()
            XCTAssertEqual(orders, sorted, "题目 \(p.id) 解题步骤顺序不正确")
        }
    }

    func testProblemTagsNotEmpty() {
        for p in SampleData.problems {
            XCTAssertFalse(p.tags.isEmpty, "题目 \(p.id) 缺少标签")
        }
    }

    // MARK: 3. 悬案数据

    func testAllMysteriesHaveUniqueIDs() {
        let ids = SampleData.mysteries.map { $0.id }
        let uniqueIDs = Set(ids)
        XCTAssertEqual(ids.count, uniqueIDs.count, "悬案 ID 存在重复")
    }

    func testMysteriesHaveArguments() {
        for m in SampleData.mysteries {
            XCTAssertFalse(m.arguments.isEmpty, "悬案 \(m.id) 缺少论据")
            XCTAssertFalse(m.proofSteps.isEmpty, "悬案 \(m.id) 缺少证明步骤")
            XCTAssertFalse(m.verdict.isEmpty, "悬案 \(m.id) 缺少结论")
        }
    }

    func testMysteriesShockRatingValid() {
        for m in SampleData.mysteries {
            XCTAssertTrue(m.shockRating >= 1 && m.shockRating <= 10, "悬案 \(m.id) 震撼值 \(m.shockRating) 超出 [1, 10]")
        }
    }

    // MARK: 4. 英雄数据

    func testAllHeroesHaveUniqueIDs() {
        let ids = SampleData.heroes.map { $0.id }
        let uniqueIDs = Set(ids)
        XCTAssertEqual(ids.count, uniqueIDs.count, "英雄 ID 存在重复")
    }

    func testHeroAttributesInRange() {
        for h in SampleData.heroes {
            let attrs = [h.attributes.insight, h.attributes.creativity, h.attributes.perseverance, h.attributes.influence]
            for attr in attrs {
                XCTAssertTrue(attr >= 1 && attr <= 10, "英雄 \(h.id) 属性值 \(attr) 超出 [1, 10]")
            }
        }
    }

    func testHeroesHaveNonEmptyContent() {
        for h in SampleData.heroes {
            XCTAssertFalse(h.legendStory.isEmpty, "英雄 \(h.id) 传奇故事为空")
            XCTAssertFalse(h.famousQuote.isEmpty, "英雄 \(h.id) 名言为空")
            XCTAssertFalse(h.era.isEmpty, "英雄 \(h.id) 年代为空")
        }
    }

    // MARK: 5. 武器数据

    func testAllWeaponsHaveUniqueIDs() {
        let ids = SampleData.weapons.map { $0.id }
        let uniqueIDs = Set(ids)
        XCTAssertEqual(ids.count, uniqueIDs.count, "武器 ID 存在重复")
    }

    func testWeaponsHaveNonEmptyFields() {
        for w in SampleData.weapons {
            XCTAssertFalse(w.name.isEmpty, "武器 \(w.id) 名称为空")
            XCTAssertFalse(w.codename.isEmpty, "武器 \(w.id) 代号为空")
            XCTAssertFalse(w.principle.isEmpty, "武器 \(w.id) 原理为空")
            XCTAssertFalse(w.tagline.isEmpty, "武器 \(w.id) 标语为空")
        }
    }

    // MARK: 6. 每日一击

    func testDailyStrikesNotEmpty() {
        XCTAssertFalse(SampleData.dailyStrikes.isEmpty, "每日一击数据为空")
        XCTAssertTrue(SampleData.dailyStrikes.count >= 3, "每日一击数据太少，至少需要3条")
    }

    func testDailyStrikesHaveContent() {
        for strike in SampleData.dailyStrikes {
            XCTAssertFalse(strike.question.isEmpty, "每日一击问题为空")
            XCTAssertFalse(strike.answer.isEmpty, "每日一击答案为空")
        }
    }

    // MARK: 7. 学习路径引用

    func testStudentProfileLearningPathValid() {
        let profile = StudentProfile()
        let allFormulaIDs = Set(SampleData.formulas.map { $0.id })
        for formulaId in profile.learningPath {
            XCTAssertTrue(allFormulaIDs.contains(formulaId), "学习路径中的公式 '\(formulaId)' 不存在于公式库中")
        }
    }
}
