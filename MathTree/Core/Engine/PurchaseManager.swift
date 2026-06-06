import StoreKit
import SwiftUI

// MARK: - 武器库解锁 IAP（StoreKit 2 · 一次性买断）
//
// 产品 ID：com.mathtree.app.arsenal_unlock
// 定价在 App Store Connect 配置：¥18（对应苹果价格档 Price Tier 2）。
// 前 10 把武器免费，购买后全解锁；本地用 UserDefaults 缓存，
// 启动时通过 Transaction.currentEntitlements 重新核验（防清数据破解）。

final class PurchaseManager: ObservableObject {

    static let shared = PurchaseManager()

    /// App Store Connect 里配置的产品 ID，必须与 ASC 保持一致。
    let productID = "com.mathtree.app.arsenal_unlock"

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
