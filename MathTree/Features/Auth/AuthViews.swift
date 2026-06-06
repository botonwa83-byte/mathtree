import SwiftUI

// MARK: - 登录页（手机号本地 ID，可跳过）

struct LoginView: View {
    /// 非 nil 时表示以 sheet 方式从"我的"进入（纯登录意图，隐藏"暂不登录"）。
    var onDone: (() -> Void)? = nil

    @ObservedObject private var auth = AuthManager.shared
    @State private var phone = ""
    @State private var country = CountryCode.all[0]
    @State private var showCountryPicker = false
    @State private var legal: LegalKind?
    @State private var showError = false

    private var maxLen: Int { CountryCode.maxLength(country.code) }
    private var valid: Bool { CountryCode.isValid(phone, code: country.code) }

    var body: some View {
        ScrollView {
            VStack(spacing: Spacing.xl) {
                logo
                formCard
                if onDone == nil { skipButton }
                agreement
            }
            .padding(.horizontal, Spacing.xl)
            .padding(.top, 60)
            .padding(.bottom, 40)
            .readableContentWidth(480)
        }
        .background(Color.apexBackground)
        .sheet(isPresented: $showCountryPicker) { countryPicker }
        .sheet(item: $legal) { LegalView(kind: $0) }
        .alert("提示", isPresented: $showError) {
            Button("好", role: .cancel) {}
        } message: {
            Text("请输入正确的手机号")
        }
    }

    private var logo: some View {
        VStack(spacing: Spacing.md) {
            ZStack {
                Circle()
                    .fill(LinearGradient(colors: [.apexLava, .apexMystery],
                                         startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 84, height: 84)
                Image(systemName: "bolt.fill")
                    .font(.system(size: 38, weight: .bold))
                    .foregroundColor(.white)
            }
            Text("数学制高点")
                .font(.system(size: 26, weight: .black, design: .rounded))
                .foregroundColor(.primary)
            Text("降维秒杀 · 俯瞰高考压轴")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding(.bottom, Spacing.sm)
    }

    private var formCard: some View {
        VStack(alignment: .leading, spacing: Spacing.lg) {
            VStack(alignment: .leading, spacing: 2) {
                Text("开始学习").font(.headline)
                Text("输入手机号作为你的学习 ID").font(.caption).foregroundColor(.secondary)
            }

            HStack(spacing: 0) {
                Button { showCountryPicker = true } label: {
                    HStack(spacing: 4) {
                        Text(country.flag)
                        Text(country.code).font(.subheadline).foregroundColor(.primary)
                        Image(systemName: "chevron.down").font(.caption2).foregroundColor(.secondary)
                    }
                    .padding(.horizontal, Spacing.md)
                }
                Rectangle().fill(Color.gray.opacity(0.25)).frame(width: 1, height: 24)
                TextField("请输入手机号", text: $phone)
                    .keyboardType(.numberPad)
                    .font(.subheadline)
                    .padding(.horizontal, Spacing.md)
                    .onChange(of: phone) { newValue in
                        let digits = newValue.filter(\.isNumber)
                        phone = String(digits.prefix(maxLen))
                    }
                if !phone.isEmpty {
                    Button { phone = "" } label: {
                        Image(systemName: "xmark.circle.fill").foregroundColor(.secondary)
                    }
                    .padding(.trailing, Spacing.md)
                }
            }
            .frame(height: 50)
            .background(Color.apexBackground)
            .overlay(RoundedRectangle(cornerRadius: Radius.inner)
                .stroke(valid ? Color.apexLava.opacity(0.5) : Color.gray.opacity(0.2), lineWidth: 1))
            .cornerRadius(Radius.inner)

            Button {
                if auth.login(phone: phone, countryCode: country.code) {
                    onDone?()
                } else {
                    showError = true
                }
            } label: {
                Text("进入学习")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(valid ? Color.apexLava : Color.gray.opacity(0.4))
                    .cornerRadius(Radius.inner)
            }
            .disabled(!valid)
        }
        .cardSurface()
    }

    private var skipButton: some View {
        Button { auth.skip() } label: {
            Text("暂不登录，先逛逛")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }

    private var agreement: some View {
        VStack(spacing: 4) {
            Text("手机号仅存储在本地设备（系统钥匙串），用于标识学习进度")
                .font(.caption2)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            HStack(spacing: 2) {
                Text("登录即代表同意").font(.caption2).foregroundColor(.secondary)
                Button("《用户协议》") { legal = .terms }
                    .font(.caption2).foregroundColor(.apexLava)
                Text("和").font(.caption2).foregroundColor(.secondary)
                Button("《隐私政策》") { legal = .privacy }
                    .font(.caption2).foregroundColor(.apexLava)
            }
        }
    }

    private var countryPicker: some View {
        NavigationStack {
            List(CountryCode.all) { c in
                Button {
                    country = c
                    phone = ""
                    showCountryPicker = false
                } label: {
                    HStack(spacing: Spacing.md) {
                        Text(c.flag)
                        Text(c.label).foregroundColor(.primary)
                        Spacer()
                        Text(c.code).foregroundColor(.secondary)
                        if c == country {
                            Image(systemName: "checkmark").foregroundColor(.apexLava)
                        }
                    }
                }
            }
            .navigationTitle("选择国家/地区")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - 隐私政策 / 用户协议

enum LegalKind: Identifiable {
    case privacy, terms
    var id: Int { self == .privacy ? 0 : 1 }
    var title: String { self == .privacy ? "隐私政策" : "用户协议" }
}

struct LegalView: View {
    let kind: LegalKind
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: Spacing.lg) {
                    Text("更新日期：2026 年 6 月")
                        .font(.caption).foregroundColor(.secondary)
                    ForEach(sections, id: \.0) { title, body in
                        VStack(alignment: .leading, spacing: 6) {
                            Text(title).font(.headline)
                            Text(body).font(.subheadline).foregroundColor(.secondary).lineSpacing(4)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(Spacing.xl)
                .readableContentWidth(600)
            }
            .background(Color.apexBackground)
            .navigationTitle(kind.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("关闭") { dismiss() }
                }
            }
        }
    }

    private var sections: [(String, String)] {
        kind == .privacy ? Self.privacy : Self.terms
    }

    static let privacy: [(String, String)] = [
        ("一、我们收集的信息", "数学制高点（以下简称“本应用”）仅收集您主动输入的手机号码，用于在本地标识您的学习进度。我们不会将您的手机号上传到任何服务器。游客模式下不收集任何个人信息。"),
        ("二、信息存储", "您的手机号保存在系统钥匙串（Keychain），学习进度、错题、复习计划等数据保存在应用本地沙盒内，均仅存储于您的设备本地，不会通过网络传输或存储到云端。卸载应用后，所有本地数据将被清除。"),
        ("三、信息共享", "本应用不会与任何第三方共享您的个人信息。我们不使用任何第三方分析、广告或追踪服务。"),
        ("四、数据安全", "我们采用设备本地存储的方式保护您的数据安全。由于数据不离开您的设备，因此不存在网络传输中的安全风险。"),
        ("五、您的权利", "您可以随时在“我的”页面退出登录或重置学习进度，以清除本地存储的个人数据。"),
        ("六、政策更新", "本隐私政策可能会不时更新。更新后的政策将在应用内公布，建议您定期查阅。")
    ]

    static let terms: [(String, String)] = [
        ("一、服务说明", "数学制高点是一款高考数学学习工具，通过“降维秒杀”等方法帮助用户高效攻克高考数学题型。本应用提供的所有学习内容、解题方法与“秒杀”技巧仅供学习参考；部分超纲方法（如洛必达法则、泰勒展开、对数平均不等式等）在高考解答题中可能不被认可，请以最新考试大纲与阅卷要求为准。"),
        ("二、用户行为", "用户应合法使用本应用，不得利用本应用从事任何违法活动。用户对其输入的个人信息（如手机号）的真实性负责。"),
        ("三、知识产权", "本应用的所有内容（包括但不限于文字、题目、图标、界面设计、程序代码）的知识产权归开发者所有。题型源自历年高考高频题型，部分为改编。未经授权，不得复制、修改或分发。"),
        ("四、免责声明", "本应用按“原样”提供，不对学习效果或考试成绩做出任何保证。因使用本应用所产生的任何直接或间接损失，开发者不承担责任。"),
        ("五、协议修改", "开发者保留随时修改本协议的权利。修改后的协议将在应用内公布，继续使用本应用即表示您同意修改后的协议。")
    ]
}

// MARK: - 我的（个人中心：登录状态 + 法律文档 + 退出）

struct ProfileView: View {
    @ObservedObject private var auth = AuthManager.shared
    @ObservedObject private var appearance = AppearanceManager.shared
    @State private var showLogin = false
    @State private var legal: LegalKind?
    @State private var showLogoutConfirm = false

    var body: some View {
        List {
            Section {
                if let u = auth.currentUser {
                    HStack(spacing: Spacing.md) {
                        ZStack {
                            Circle().fill(Color.apexLava.opacity(0.15)).frame(width: 48, height: 48)
                            Image(systemName: "person.fill").foregroundColor(.apexLava)
                        }
                        VStack(alignment: .leading, spacing: 2) {
                            Text(u.nickname).font(.headline)
                            Text(u.maskedPhone).font(.caption).foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 4)
                } else {
                    Button { showLogin = true } label: {
                        HStack(spacing: Spacing.md) {
                            ZStack {
                                Circle().fill(Color.gray.opacity(0.15)).frame(width: 48, height: 48)
                                Image(systemName: "person").foregroundColor(.secondary)
                            }
                            VStack(alignment: .leading, spacing: 2) {
                                Text("未登录").font(.headline).foregroundColor(.primary)
                                Text("登录后用手机号标识学习进度").font(.caption).foregroundColor(.secondary)
                            }
                            Spacer()
                            Image(systemName: "chevron.right").font(.caption).foregroundColor(.secondary)
                        }
                    }
                }
            }

            Section {
                Picker(selection: $appearance.preference) {
                    ForEach(AppearancePreference.allCases) { pref in
                        Text(pref.label).tag(pref)
                    }
                } label: {
                    Label("深色模式", systemImage: "moon.circle.fill").foregroundColor(.primary)
                }
                .pickerStyle(.segmented)
            } header: {
                Text("外观")
            } footer: {
                Text("「跟随系统」会随 iOS 设置里的深色/浅色自动切换；也可在此手动锁定。")
            }

            Section("法律条款") {
                Button { legal = .privacy } label: {
                    Label("隐私政策", systemImage: "hand.raised.fill").foregroundColor(.primary)
                }
                Button { legal = .terms } label: {
                    Label("用户协议", systemImage: "doc.text.fill").foregroundColor(.primary)
                }
            }

            if auth.isSignedIn {
                Section {
                    Button(role: .destructive) { showLogoutConfirm = true } label: {
                        Text("退出登录").frame(maxWidth: .infinity)
                    }
                }
            }
        }
        .navigationTitle("我的")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showLogin) { LoginView(onDone: { showLogin = false }) }
        .sheet(item: $legal) { LegalView(kind: $0) }
        .confirmationDialog("确定退出登录？", isPresented: $showLogoutConfirm, titleVisibility: .visible) {
            Button("退出登录", role: .destructive) { auth.logout() }
            Button("取消", role: .cancel) {}
        } message: {
            Text("退出后将清除本地保存的手机号；学习进度仍保留在本机。")
        }
    }
}
