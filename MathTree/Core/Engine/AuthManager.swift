import Foundation
import Security

// MARK: - Keychain 封装（手机号等本地身份信息存系统钥匙串，不出设备）

enum KeychainStore {
    @discardableResult
    static func set(_ value: String, for key: String) -> Bool {
        let data = Data(value.utf8)
        let base: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]
        SecItemDelete(base as CFDictionary)
        var add = base
        add[kSecValueData as String] = data
        add[kSecAttrAccessible as String] = kSecAttrAccessibleAfterFirstUnlock
        return SecItemAdd(add as CFDictionary, nil) == errSecSuccess
    }

    static func get(_ key: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        var result: AnyObject?
        guard SecItemCopyMatching(query as CFDictionary, &result) == errSecSuccess,
              let data = result as? Data else { return nil }
        return String(data: data, encoding: .utf8)
    }

    static func remove(_ key: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]
        SecItemDelete(query as CFDictionary)
    }
}

// MARK: - 用户（手机号作为本地学习 ID，无短信验证、无服务器）

struct AuthUser: Codable, Equatable {
    var countryCode: String
    var phone: String        // 仅本地号码（不含区号）
    var nickname: String
    var createdAt: String

    /// 脱敏展示：138****1234
    var maskedPhone: String {
        guard phone.count >= 7 else { return "\(countryCode) \(phone)" }
        let head = phone.prefix(3)
        let tail = phone.suffix(4)
        return "\(countryCode) \(head)****\(tail)"
    }
}

// MARK: - 国家/地区区号

struct CountryCode: Identifiable, Equatable {
    let code: String
    let label: String
    let flag: String
    var id: String { code }

    static let all: [CountryCode] = [
        CountryCode(code: "+86", label: "中国大陆", flag: "🇨🇳"),
        CountryCode(code: "+852", label: "中国香港", flag: "🇭🇰"),
        CountryCode(code: "+853", label: "中国澳门", flag: "🇲🇴"),
        CountryCode(code: "+886", label: "中国台湾", flag: "🇹🇼"),
        CountryCode(code: "+1", label: "美国/加拿大", flag: "🇺🇸"),
        CountryCode(code: "+44", label: "英国", flag: "🇬🇧"),
        CountryCode(code: "+81", label: "日本", flag: "🇯🇵"),
        CountryCode(code: "+82", label: "韩国", flag: "🇰🇷"),
        CountryCode(code: "+65", label: "新加坡", flag: "🇸🇬"),
        CountryCode(code: "+60", label: "马来西亚", flag: "🇲🇾")
    ]

    static func isValid(_ phone: String, code: String) -> Bool {
        let rules: [String: String] = [
            "+86": "^1[3-9]\\d{9}$",
            "+1": "^[2-9]\\d{9}$",
            "+44": "^7\\d{9}$",
            "+81": "^\\d{10,11}$",
            "+82": "^1\\d{9,10}$",
            "+852": "^[5-9]\\d{7}$",
            "+853": "^6\\d{7}$",
            "+886": "^9\\d{8}$",
            "+65": "^[89]\\d{7}$",
            "+60": "^1\\d{8,9}$"
        ]
        let pattern = rules[code] ?? "^\\d{6,15}$"
        return phone.range(of: pattern, options: .regularExpression) != nil
    }

    static func maxLength(_ code: String) -> Int {
        ["+86": 11, "+1": 10, "+44": 10, "+81": 11, "+82": 11,
         "+852": 8, "+853": 8, "+886": 9, "+65": 8, "+60": 10][code] ?? 15
    }
}

// MARK: - 认证管理（本地，可跳过）

final class AuthManager: ObservableObject {
    static let shared = AuthManager()

    @Published private(set) var currentUser: AuthUser?
    @Published private(set) var didSkipLogin: Bool

    private let authKey = "mathtree.auth.user"
    private let skipKey = "mathtree.auth.didSkip"

    private init() {
        if let json = KeychainStore.get(authKey),
           let data = json.data(using: .utf8),
           let user = try? JSONDecoder().decode(AuthUser.self, from: data) {
            currentUser = user
        }
        didSkipLogin = UserDefaults.standard.bool(forKey: skipKey)
    }

    var isSignedIn: Bool { currentUser != nil }

    /// 是否已经过了登录门槛（登录过 或 选择了游客）。
    var hasPassedGate: Bool { currentUser != nil || didSkipLogin }

    /// 手机号登录（本地 ID，无短信/服务器）。成功返回 true。
    @discardableResult
    func login(phone: String, countryCode: String) -> Bool {
        guard CountryCode.isValid(phone, code: countryCode) else { return false }
        if let existing = currentUser, existing.phone == phone, existing.countryCode == countryCode {
            didSkipLogin = false
            return true
        }
        let user = AuthUser(
            countryCode: countryCode,
            phone: phone,
            nickname: "数学学员",
            createdAt: ISO8601DateFormatter().string(from: Date())
        )
        persist(user)
        currentUser = user
        didSkipLogin = false
        return true
    }

    /// 游客模式：暂不登录。
    func skip() {
        didSkipLogin = true
        UserDefaults.standard.set(true, forKey: skipKey)
    }

    /// 退出登录（清除本地身份）。
    func logout() {
        KeychainStore.remove(authKey)
        currentUser = nil
    }

    /// 删除账户（App Store 审核指南 5.1.1(v) 要求）。
    /// 账户为纯本地身份，手机号是账户关联的唯一个人数据；
    /// 从钥匙串中移除即为永久删除，不可恢复。
    func deleteAccount() {
        KeychainStore.remove(authKey)
        currentUser = nil
        // 删除后以游客身份留在应用内，不强制回到登录门槛
        didSkipLogin = true
        UserDefaults.standard.set(true, forKey: skipKey)
    }

    private func persist(_ user: AuthUser) {
        if let data = try? JSONEncoder().encode(user),
           let json = String(data: data, encoding: .utf8) {
            KeychainStore.set(json, for: authKey)
        }
    }
}
