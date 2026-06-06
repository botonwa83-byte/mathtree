import SwiftUI

// MARK: - 武器库解锁付费墙

struct SKPaywallView: View {
    @ObservedObject private var purchase = PurchaseManager.shared
    @Environment(\.dismiss) private var dismiss

    private var priceLabel: String {
        purchase.product?.displayPrice ?? "¥18"
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // ── 顶部英雄区 ──────────────────────────────────
                heroArea

                // ── 权益列表 ────────────────────────────────────
                VStack(alignment: .leading, spacing: 14) {
                    benefitRow(icon: "bolt.fill",        color: .apexLava,
                               title: "解锁全部 \(SampleData.secondKillCases.map(\.weapon).uniqued().count) 把武器",
                               desc: "降维武器 + 选择题技巧，全部开放")
                    benefitRow(icon: "target",            color: .apexEmerald,
                               title: "\(SampleData.secondKillCases.count) 道压轴战例双解对决",
                               desc: "常规法 vs 秒杀法，省时倍数一眼看穿")
                    benefitRow(icon: "infinity",          color: .apexStarBlue,
                               title: "一次买断，永久使用",
                               desc: "无订阅、无续费，内容持续更新")
                    benefitRow(icon: "shieldcheck",       color: .apexGold,
                               title: "支持恢复购买",
                               desc: "换机后登录 App Store 同一账号即可恢复")
                }
                .padding(.horizontal, 24)
                .padding(.top, 28)
                .padding(.bottom, 20)

                Divider().padding(.horizontal, 24)

                // ── 免费已享受 ──────────────────────────────────
                VStack(spacing: 6) {
                    Text("已免费开放前 \(PurchaseManager.freeWeaponCount) 把武器")
                        .font(.footnote).foregroundColor(.secondary)
                    Text("解锁后立即获得剩余全部内容 →")
                        .font(.footnote).fontWeight(.medium).foregroundColor(.apexLava)
                }
                .padding(.vertical, 16)

                // ── 购买按钮 ─────────────────────────────────────
                purchaseButton
                    .padding(.horizontal, 24)

                // ── 恢复购买 ─────────────────────────────────────
                Button {
                    Task { await purchase.restore() }
                } label: {
                    Text("恢复购买")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .underline()
                }
                .padding(.top, 12)
                .disabled(purchase.isPurchasing)

                // ── 错误提示 ──────────────────────────────────────
                if let err = purchase.errorMessage {
                    Text(err)
                        .font(.caption)
                        .foregroundColor(.apexDanger)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 24)
                        .padding(.top, 8)
                }

                // ── 法律小字 ──────────────────────────────────────
                Text("购买即视为同意《用户协议》。付款通过 Apple 账户完成，换机后可在「恢复购买」找回。")
                    .font(.system(size: 10))
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 28)
                    .padding(.top, 16)
                    .padding(.bottom, 32)
            }
        }
        .background(Color.apexBackground.ignoresSafeArea())
        .onChange(of: purchase.isUnlocked) { unlocked in
            if unlocked { dismiss() }
        }
    }

    // MARK: 子视图

    private var heroArea: some View {
        ZStack {
            LinearGradient(colors: [Color.apexLava, Color.apexMystery],
                           startPoint: .topLeading, endPoint: .bottomTrailing)
            VStack(spacing: 10) {
                Image(systemName: "shippingbox.fill")
                    .font(.system(size: 44))
                    .foregroundColor(.white)
                Text("解锁完整武器库")
                    .font(.system(size: 24, weight: .black, design: .rounded))
                    .foregroundColor(.white)
                Text("一杯奶茶钱，53 把降维武器随便用")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.9))
            }
            .padding(.vertical, 40)
        }
    }

    private var purchaseButton: some View {
        Button {
            Task { await purchase.purchase() }
        } label: {
            HStack(spacing: 10) {
                if purchase.isPurchasing {
                    ProgressView().tint(.white)
                } else {
                    Image(systemName: "lock.open.fill")
                }
                Text(purchase.isPurchasing ? "处理中…" : "立即解锁  \(priceLabel)")
                    .fontWeight(.bold)
            }
            .font(.headline)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(
                LinearGradient(colors: [Color.apexLava, Color.apexMystery],
                               startPoint: .leading, endPoint: .trailing)
            )
            .cornerRadius(16)
            .shadow(color: Color.apexLava.opacity(0.3), radius: 10, y: 4)
        }
        .disabled(purchase.isPurchasing)
    }

    private func benefitRow(icon: String, color: Color, title: String, desc: String) -> some View {
        HStack(alignment: .top, spacing: 14) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(color.opacity(0.15))
                    .frame(width: 38, height: 38)
                Image(systemName: icon)
                    .font(.subheadline)
                    .foregroundColor(color)
            }
            VStack(alignment: .leading, spacing: 2) {
                Text(title).font(.subheadline).fontWeight(.semibold).foregroundColor(.primary)
                Text(desc).font(.caption).foregroundColor(.secondary)
            }
            Spacer()
        }
    }
}

// MARK: - Sequence helper

private extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var seen = Set<Element>()
        return filter { seen.insert($0).inserted }
    }
}

#Preview {
    SKPaywallView()
}
