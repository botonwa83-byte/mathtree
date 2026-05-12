import SwiftUI
import WebKit

struct FormulaView: UIViewRepresentable {
    let latex: String
    let displayMode: Bool
    let fontSize: CGFloat

    init(latex: String, displayMode: Bool = true, fontSize: CGFloat = 24) {
        self.latex = latex
        self.displayMode = displayMode
        self.fontSize = fontSize
    }

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.isOpaque = false
        webView.backgroundColor = .clear
        webView.scrollView.isScrollEnabled = false
        webView.scrollView.bounces = false
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let escapedLatex = escapeForJavaScript(latex)

        let html = """
        <!DOCTYPE html><html>
        <head>
          <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
          <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.16.9/dist/katex.min.css">
          <script src="https://cdn.jsdelivr.net/npm/katex@0.16.9/dist/katex.min.js"></script>
          <style>
            body {
              background: transparent;
              margin: 0;
              padding: 8px;
              display: flex;
              justify-content: center;
              align-items: center;
              min-height: 40px;
              color: #2D3436;
            }
            .katex { font-size: \(fontSize)px; color: #2D3436; }
          </style>
        </head>
        <body>
          <div id="formula"></div>
          <script>
            try {
              katex.render('\(escapedLatex)', document.getElementById('formula'), {
                displayMode: \(displayMode),
                throwOnError: false
              });
            } catch(e) {
              document.getElementById('formula').innerText = '\(escapedLatex)';
            }
          </script>
        </body></html>
        """
        webView.loadHTMLString(html, baseURL: nil)
    }

    private func escapeForJavaScript(_ string: String) -> String {
        return string
            .replacingOccurrences(of: "\\", with: "\\\\")
            .replacingOccurrences(of: "'", with: "\\'")
            .replacingOccurrences(of: "\n", with: "\\n")
            .replacingOccurrences(of: "\r", with: "\\r")
            .replacingOccurrences(of: "\t", with: "\\t")
            .replacingOccurrences(of: "<", with: "\\u003C")
            .replacingOccurrences(of: ">", with: "\\u003E")
    }
}
