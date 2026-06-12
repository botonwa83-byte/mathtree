import XCTest

/// 演示 5.1.1(v) 账户删除全流程：登录（手机号注册）→ 更多 → 我的 → 删除账户 → 确认 → 删除成功。
/// 每个关键步骤截屏保存到桌面（模拟器进程可直接写宿主机路径）。
final class DeleteAccountFlowUITests: XCTestCase {

    private let shotDir = "/Users/fengwang/Desktop"

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testDeleteAccountFlow() throws {
        let app = XCUIApplication()
        app.launch()

        // 1. 启动宣传页
        snap("01-启动宣传页")
        let enter = app.buttons["进 入 制 高 点"]
        XCTAssertTrue(enter.waitForExistence(timeout: 10), "未找到进入按钮")
        enter.tap()

        // 2. 登录页，输入手机号注册
        let phoneField = app.textFields["请输入手机号"]
        XCTAssertTrue(phoneField.waitForExistence(timeout: 10), "未找到手机号输入框")
        snap("02-登录页")
        phoneField.tap()
        phoneField.typeText("13800001234")
        snap("03-输入手机号")

        let loginButton = app.buttons["进入学习"]
        XCTAssertTrue(loginButton.waitForExistence(timeout: 5))
        loginButton.tap()

        // 3. 登录成功进入主界面
        let moreTab = app.tabBars.buttons["更多"]
        XCTAssertTrue(moreTab.waitForExistence(timeout: 10), "登录后未进入主界面")
        snap("04-登录成功-主界面")
        moreTab.tap()
        snap("05-更多页-已登录")

        // 4. 进入「我的」（账户行展示昵称"数学学员"）
        let profileRow = app.buttons.containing(
            NSPredicate(format: "label CONTAINS %@", "数学学员")).firstMatch
        let row = profileRow.waitForExistence(timeout: 5) ? profileRow : app.cells.firstMatch
        row.tap()

        // 5. 「我的」页 → 删除账户
        let deleteButton = app.buttons["删除账户"]
        XCTAssertTrue(deleteButton.waitForExistence(timeout: 10), "未找到删除账户按钮")
        if !deleteButton.isHittable { app.swipeUp() }
        snap("06-我的页-删除账户入口")
        deleteButton.tap()

        // 6. 确认弹窗
        let confirmButton = app.buttons["永久删除账户"]
        XCTAssertTrue(confirmButton.waitForExistence(timeout: 5), "未出现删除确认弹窗")
        snap("07-删除确认弹窗")
        confirmButton.tap()

        // 7. 删除成功提示
        let doneAlert = app.alerts["账户已删除"]
        XCTAssertTrue(doneAlert.waitForExistence(timeout: 5), "未出现删除成功提示")
        snap("08-删除成功提示")
        doneAlert.buttons["好"].tap()

        // 8. 回到「我的」，账户行应显示"未登录"
        let loggedOut = app.staticTexts["未登录"]
        XCTAssertTrue(loggedOut.waitForExistence(timeout: 5), "删除后未显示未登录状态")
        snap("09-删除后-未登录状态")
    }

    /// 等动画落定后整屏截图写到桌面。
    private func snap(_ name: String) {
        Thread.sleep(forTimeInterval: 1.2)
        let png = XCUIScreen.main.screenshot().pngRepresentation
        let url = URL(fileURLWithPath: "\(shotDir)/删号流程-\(name).png")
        try? png.write(to: url)
    }
}
