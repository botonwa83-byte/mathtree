import SwiftUI

// MARK: - iPad / 大屏适配工具

extension View {
    /// 在 iPad/大屏上把内容限制在可读宽度内并水平居中；iPhone 上(宽度本就 < maxWidth)无任何影响。
    /// 用于避免题干、卡片、正文在 iPad 上横跨整屏导致阅读体验差。
    func readableContentWidth(_ maxWidth: CGFloat = 700) -> some View {
        self
            .frame(maxWidth: maxWidth, alignment: .center)
            .frame(maxWidth: .infinity, alignment: .center)
    }
}

/// 统一的设备判断：横向 size class 为 regular 即视为 iPad/大屏。
/// 用法：@Environment(\.horizontalSizeClass) private var hSizeClass
///       private var isIPad: Bool { hSizeClass == .regular }
enum LayoutAdaptation {
    /// iPad 自适应网格的建议最小单元宽度。
    static let gridMinItemWidth: CGFloat = 320
}

// MARK: - 数学符号美化(纯文本字段用，KaTeX/latex 字段不经过此处)

extension String {
    private static let supMap: [Character: Character] = [
        "0":"⁰","1":"¹","2":"²","3":"³","4":"⁴","5":"⁵","6":"⁶","7":"⁷","8":"⁸","9":"⁹",
        "+":"⁺","-":"⁻","=":"⁼","(":"⁽",")":"⁾",
        "a":"ᵃ","b":"ᵇ","c":"ᶜ","d":"ᵈ","e":"ᵉ","f":"ᶠ","g":"ᵍ","h":"ʰ","i":"ⁱ","j":"ʲ",
        "k":"ᵏ","l":"ˡ","m":"ᵐ","n":"ⁿ","o":"ᵒ","p":"ᵖ","r":"ʳ","s":"ˢ","t":"ᵗ","u":"ᵘ",
        "v":"ᵛ","w":"ʷ","x":"ˣ","y":"ʸ","z":"ᶻ"
    ]
    private static let subMap: [Character: Character] = [
        "0":"₀","1":"₁","2":"₂","3":"₃","4":"₄","5":"₅","6":"₆","7":"₇","8":"₈","9":"₉",
        "+":"₊","-":"₋","=":"₌","(":"₍",")":"₎",
        "a":"ₐ","e":"ₑ","h":"ₕ","i":"ᵢ","j":"ⱼ","k":"ₖ","l":"ₗ","m":"ₘ","n":"ₙ","o":"ₒ",
        "p":"ₚ","r":"ᵣ","s":"ₛ","t":"ₜ","u":"ᵤ","v":"ᵥ","x":"ₓ"
    ]

    /// 把纯文本里的 ^2、a_1、>=、+-、√(5) 等"凑写"转成接近数学书的 Unicode 显示。
    var mathPretty: String {
        var s = self
        // 关系/运算符(顺序: 长的先)
        for (k, v) in [("<=>","⇔"),("<->","↔"),("<=","≤"),(">=","≥"),("!=","≠"),
                       ("+-","±"),("-+","∓"),("=>","⇒"),("->","→"),("...","…")] {
            s = s.replacingOccurrences(of: k, with: v)
        }
        // √(单个数/字母) → √x ；多字符保留括号
        s = String.stripSqrtParens(s)
        // 上标 ^ / 下标 _
        s = String.applyScript(s, marker: "^", map: String.supMap)
        s = String.applyScript(s, marker: "_", map: String.subMap)
        return s
    }

    private static func stripSqrtParens(_ input: String) -> String {
        var out = ""
        let a = Array(input)
        var i = 0
        while i < a.count {
            if a[i] == "√", i+1 < a.count, a[i+1] == "(" {
                // 找匹配右括号
                if let close = a[(i+2)...].firstIndex(of: ")") {
                    let inside = String(a[(i+2)..<close])
                    // 单一 token(纯数字或单字母)才去括号
                    if inside.count == 1 || (inside.count <= 3 && inside.allSatisfy { $0.isNumber }) {
                        out += "√" + inside
                        i = close + 1
                        continue
                    }
                }
            }
            out.append(a[i]); i += 1
        }
        return out
    }

    private static func applyScript(_ input: String, marker: Character, map: [Character: Character]) -> String {
        var out = ""
        let a = Array(input)
        var i = 0
        func mapRun(_ chars: [Character]) -> String? {
            var r = ""
            for c in chars { guard let m = map[c] else { return nil }; r.append(m) }
            return r
        }
        while i < a.count {
            if a[i] == marker, i+1 < a.count {
                let nxt = a[i+1]
                // ^(...) 或 ^{...}
                if nxt == "(" || nxt == "{" {
                    let closeCh: Character = nxt == "(" ? ")" : "}"
                    if let rel = a[(i+2)...].firstIndex(of: closeCh) {
                        let inside = Array(a[(i+2)..<rel])
                        if inside.count <= 5, let mapped = mapRun(inside) {
                            out += mapped; i = rel + 1; continue
                        }
                    }
                }
                // ^[+-]?digits
                else if nxt.isNumber || ((nxt == "+" || nxt == "-") && i+2 < a.count && a[i+2].isNumber) {
                    var j = i + 1
                    var run: [Character] = []
                    if a[j] == "+" || a[j] == "-" { run.append(a[j]); j += 1 }
                    while j < a.count, a[j].isNumber { run.append(a[j]); j += 1 }
                    if let mapped = mapRun(run) { out += mapped; i = j; continue }
                }
                // ^单字母
                else if nxt.isLetter, let m = map[Character(nxt.lowercased())] {
                    out.append(m); i += 2; continue
                }
            }
            out.append(a[i]); i += 1
        }
        return out
    }
}
