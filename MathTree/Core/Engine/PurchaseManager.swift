import StoreKit
import SwiftUI

// MARK: - 完整版解锁 IAP（StoreKit 2 · 一次性买断，非订阅）
//
// 产品 ID：com.mathtree.app.fullunlock
// ASC 展示名：完整版永久解锁　|　定价：¥18（苹果价格档 Tier 2）
//
// ── 这一个内购解锁哪些内容（全 App 仅此一处付费墙 SKPaywallView）──
//
//   ① 秒杀殿堂 · 武器库（SecondKillView）
//      · 免费：按战例出场顺序的前 freeWeaponCount(=10) 把武器及其全部战例
//      · 加锁：第 11 把起的其余武器（约 53/63）及其 KillDuelView 双解对决
//      · 表现：锁卡显示 lock 图标 + "解锁后可查看"，点击 → 付费墙
//        判定见 SecondKillView.isLocked(_:)
//
//   ② 练习 · 困难题（BattlefieldView）
//      · 免费：简单 / 中等难度题（difficulty < 0.7）
//      · 加锁：困难难度（difficulty >= 0.7）的全部题目，以及「困难」筛选 chip
//      · 表现：选「困难」或点开困难题 → 付费墙
//        判定见 BattlefieldView 的 isHardLocked / filter == .hard
//
//   其余内容（公式宇宙、错题本、数学发现、英雄录、每日打卡等）一律免费。
//
// ── 解锁后的行为 ──
//   购买成功置 isUnlocked = true 并写入 UserDefaults 缓存（即时刷新 UI）；
//   每次启动再通过 Transaction.currentEntitlements 重新核验权益
//   （防"清数据 / 改 UserDefaults"绕过破解），并支持 AppStore.sync() 恢复购买。
//
// ⚠️ 改动免费/加锁边界时，需同步更新：本说明、freeWeaponCount、
//    SecondKillView.isLocked、BattlefieldView 的 0.7 难度阈值与 .hard 判定。

final class PurchaseManager: ObservableObject {

    static let shared = PurchaseManager()

    /// App Store Connect 里配置的产品 ID，必须与 ASC 保持一致。
    /// 注：旧 ID com.mathtree.app.arsenal_unlock 已在 ASC 删除、不可复用，换用新 ID。
    let productID = "com.mathtree.app.fullunlock"

    /// 免费开放的武器数量（武器库列表里的前 N 把）。
    static let freeWeaponCount = 10

    @Published private(set) var isUnlocked: Bool = false
    @Published private(set) var product: Product?
    @Published private(set) var isPurchasing: Bool = false
    @Published private(set) var errorMessage: String?

    private let storageKey = "arsenal_unlocked"

    private init() {
        // 先读缓存，让 UI 即时呈现（真正核验在异步任务里做）
        isUnlocked = UserDefaults.standard.bool(forKey: storageKey)
        Task {
            await loadProduct()
            await refreshEntitlements()
        }
    }

    // MARK: - 加载产品信息（含本地化价格）

    @MainActor
    func loadProduct() async {
        do {
            let products = try await Product.products(for: [productID])
            product = products.first
        } catch {
            // 网络不通或沙盒未配置时静默失败，价格栏降级显示"¥18"
        }
    }

    // MARK: - 购买

    @MainActor
    func purchase() async {
        guard let product else {
            errorMessage = "获取产品信息失败，请检查网络后重试"
            return
        }
        isPurchasing = true
        errorMessage = nil
        defer { isPurchasing = false }
        do {
            let result = try await product.purchase()
            switch result {
            case .success(let verification):
                let transaction = try checkVerified(verification)
                await transaction.finish()
                unlock()
            case .userCancelled:
                break
            case .pending:
                errorMessage = "购买待处理（可能需要家长确认），完成后将自动解锁"
            @unknown default:
                break
            }
        } catch {
            errorMessage = "购买失败：\(error.localizedDescription)"
        }
    }

    // MARK: - 恢复购买

    @MainActor
    func restore() async {
        isPurchasing = true
        errorMessage = nil
        defer { isPurchasing = false }
        do {
            try await AppStore.sync()
            await refreshEntitlements()
            if !isUnlocked {
                errorMessage = "未找到购买记录"
            }
        } catch {
            errorMessage = "恢复失败：\(error.localizedDescription)"
        }
    }

    // MARK: - 核验当前权益（启动 & 恢复时调用）

    func refreshEntitlements() async {
        for await result in Transaction.currentEntitlements {
            if case .verified(let tx) = result,
               tx.productID == productID,
               tx.revocationDate == nil {
                await MainActor.run { unlock() }
                return
            }
        }
    }

    // MARK: - 本地解锁

    @MainActor
    private func unlock() {
        isUnlocked = true
        UserDefaults.standard.set(true, forKey: storageKey)
    }

    // MARK: - 验证收据

    private func checkVerified<T>(_ result: VerificationResult<T>) throws -> T {
        switch result {
        case .unverified(_, let error):
            throw error
        case .verified(let value):
            return value
        }
    }
}
