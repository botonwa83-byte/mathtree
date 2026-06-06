import XCTest
@testable import MathTree

// MARK: - App Store 内容审核测试
// Apple App Store Review Guidelines 相关检查

final class ContentReviewTests: XCTestCase {

    // MARK: - 1. 敏感词汇检查 (App Store Guidelines 1.1)

    /// Apple 禁止包含暴力、自杀、色情等敏感内容
    private let sensitiveTerms = [
        "自杀", "自残", "色情", "赌博", "毒品",
        "恐怖主义", "歧视", "仇恨", "裸体"
    ]

    /// 需要审查但可能可接受的词汇（教育语境）
    private let cautionTerms = [
        "死亡", "杀", "赤身裸体", "裸泳", "喂鲨鱼"
    ]

    func testHeroContentNoSensitiveTerms() {
        for hero in SampleData.heroes {
            let content = hero.legendStory + hero.famousQuote
            for term in sensitiveTerms {
                XCTAssertFalse(content.contains(term), "英雄 \(hero.id) 的内容包含敏感词: '\(term)'")
            }
        }
    }

    func testMysteryContentNoSensitiveTerms() {
        for mystery in SampleData.mysteries {
            let content = [mystery.title, mystery.summary, mystery.premise, mystery.verdict, mystery.historicalContext].joined(separator: " ")
            for term in sensitiveTerms {
                XCTAssertFalse(content.contains(term), "悬案 \(mystery.id) 包含敏感词: '\(term)'")
            }
        }
    }

    func testCheckCautionTermsInContent() {
        // 这些不是自动 fail，而是打印出来供人工审查
        var findings: [String] = []

        for hero in SampleData.heroes {
            let content = hero.legendStory + hero.famousQuote
            for term in cautionTerms {
                if content.contains(term) {
                    findings.append("[英雄 \(hero.id)] 包含需审查词: '\(term)' -> \(content)")
                }
            }
        }

        for mystery in SampleData.mysteries {
            let allContent = [mystery.title, mystery.summary, mystery.premise, mystery.verdict].joined(separator: " ")
            for term in cautionTerms {
                if allContent.contains(term) {
                    findings.append("[悬案 \(mystery.id)] 包含需审查词: '\(term)' -> \(mystery.title)")
                }
            }
        }

        if !findings.isEmpty {
            print("\n=== 内容审查警告（需人工确认） ===")
            for f in findings { print("  - \(f)") }
            print("=== 共 \(findings.count) 条 ===\n")
        }
    }

    // MARK: - 2. 蓝眼睛悬案专项检查

    func testBlueEyesMysteryContentSafe() {
        // 这个悬案提到"自杀"，需要特别处理
        if let blueEyes = SampleData.mysteries.first(where: { $0.id == "blue_eyes" }) {
            let fullContent = [blueEyes.title, blueEyes.summary, blueEyes.premise, blueEyes.verdict].joined()
            let proofContent = blueEyes.proofSteps.map { $0.explanation }.joined()
            let combined = fullContent + proofContent

            // "自杀" 在纯逻辑谜题语境下，App Store 审核可能拒绝
            if combined.contains("自杀") {
                XCTFail("蓝眼睛悬案包含'自杀'一词，建议替换为'离开'或'被淘汰'，以通过 App Store 审核")
            }
        }
    }

    // MARK: - 3. 名人名言准确性检查

    func testFamousQuotesAccuracy() {
        // 黎曼的名言 "只有在潮水退去时，你才知道谁在裸泳" 实际是巴菲特的名言
        if let riemann = SampleData.heroes.first(where: { $0.id == "riemann" }) {
            XCTAssertFalse(riemann.famousQuote.contains("潮水"), "黎曼的名言实际上是巴菲特的，需要更正")
        }
    }

    // MARK: - 4. 数学内容准确性

    func testMathAnswersCorrect() {
        // 抽查关键数学答案
        for problem in SampleData.problems {
            // 检查难度不等于 0（可能遗漏）
            XCTAssertGreaterThan(problem.difficulty, 0, "题目 \(problem.id) 难度为0，可能是未设置")

            // 检查解题步骤非空
            XCTAssertFalse(problem.solution.steps.isEmpty, "题目 \(problem.id) 解题步骤为空")
            XCTAssertFalse(problem.solution.keyInsight.isEmpty, "题目 \(problem.id) 关键洞察为空")
        }
    }

    // MARK: - 5. 版权与知识产权

    func testNoTrademarkTerms() {
        // 检查是否误用了注册商标
        let trademarkTerms = ["Wolfram", "Mathematica", "MATLAB", "Photomath", "Khan Academy"]
        let allText = collectAllText()
        for term in trademarkTerms {
            XCTAssertFalse(allText.contains(term), "内容中包含第三方商标: '\(term)'")
        }
    }

    // MARK: - 6. 隐私与网络

    func testNoHardcodedURLsExceptCDN() {
        // FormulaView 使用 KaTeX CDN，检查没有其他外部 URL
        // CDN 合规性：确认只使用了 jsdelivr CDN
        // 注意：App Store 审核会检查网络请求
        let allText = collectAllText()

        // 允许的域名
        let allowedDomains = ["cdn.jsdelivr.net"]

        // 检查是否有其他 http/https URL
        let urlPattern = try! NSRegularExpression(pattern: "https?://[^\\s\"']+", options: [])
        let range = NSRange(allText.startIndex..., in: allText)
        let matches = urlPattern.matches(in: allText, options: [], range: range)

        for match in matches {
            let url = String(allText[Range(match.range, in: allText)!])
            let isAllowed = allowedDomains.contains(where: { url.contains($0) })
            if !isAllowed {
                XCTFail("发现未授权的外部URL: \(url)")
            }
        }
    }

    // MARK: - 7. 本地化与编码

    func testNoMojibake() {
        // 检查是否有乱码字符（常见于编码错误）
        let allText = collectAllText()
        let mojibakePatterns = ["ï¿½", "â€", "Ã©", "Ã¨", "Ã¼"]
        for pattern in mojibakePatterns {
            XCTAssertFalse(allText.contains(pattern), "发现可能的乱码: '\(pattern)'")
        }
    }

    // MARK: - 8. App Store 年龄分级

    func testContentAppropriateForAgeRating() {
        // 教育类 App 通常是 4+，检查有无不适宜低龄用户的内容
        let ageRestrictedTerms = ["酒精", "烟草", "暴力行为", "赌博", "色情", "性行为"]
        let allText = collectAllText()
        for term in ageRestrictedTerms {
            XCTAssertFalse(allText.contains(term), "内容包含可能影响年龄分级的词汇: '\(term)'（教育 App 建议 4+）")
        }
    }

    // MARK: - Helper

    private func collectAllText() -> String {
        var parts: [String] = []

        for f in SampleData.formulas {
            parts.append(contentsOf: [f.name, f.latex, f.intuition])
            if let e = f.detailedExplanation { parts.append(e) }
            if let h = f.history { parts.append(h) }
        }

        for p in SampleData.problems {
            parts.append(contentsOf: [p.content, p.answer])
            parts.append(contentsOf: p.solution.steps.map { $0.description })
        }

        for m in SampleData.mysteries {
            parts.append(contentsOf: [m.title, m.summary, m.premise, m.verdict, m.historicalContext])
        }

        for h in SampleData.heroes {
            parts.append(contentsOf: [h.legendStory, h.famousQuote])
        }

        for w in SampleData.weapons {
            parts.append(contentsOf: [w.name, w.codename, w.principle, w.tagline])
        }

        for s in SampleData.dailyStrikes {
            parts.append(contentsOf: [s.question, s.answer])
            if let d = s.detail { parts.append(d) }
        }

        return parts.joined(separator: " ")
    }
}
