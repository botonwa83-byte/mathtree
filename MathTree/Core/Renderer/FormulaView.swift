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
        
        if #available(iOS 16.4, *) {
            config.defaultWebpagePreferences.allowsContentJavaScript = true
        }
        
        config.mediaTypesRequiringUserActionForPlayback = []
        
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.isOpaque = false
        webView.backgroundColor = .clear
        webView.scrollView.isScrollEnabled = false
        webView.scrollView.bounces = false
        webView.allowsLinkPreview = false
        
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let escapedLatex = escapeForJavaScript(latex)

        let html = """
        <!DOCTYPE html><html>
        <head>
          <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <style>
            :root { --font-size: \(fontSize)px; }
            body {
              background: transparent;
              margin: 0;
              padding: 4px 8px;
              display: flex;
              justify-content: center;
              align-items: center;
              min-height: 32px;
              font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
            }
            .katex { font-size: var(--font-size); }
            .katex * { color: #2D3436 !important; }
          </style>
          <script>
            (function() {
              var katexScript = document.createElement('script');
              katexScript.src = 'https://cdn.jsdelivr.net/npm/katex@0.16.10/dist/katex.min.js';
              katexScript.onload = function() {
                renderFormula();
              };
              katexScript.onerror = function() {
                document.getElementById('formula').textContent = '\(escapedLatex)';
              };
              document.head.appendChild(katexScript);
              
              var katexCss = document.createElement('link');
              katexCss.rel = 'stylesheet';
              katexCss.href = 'https://cdn.jsdelivr.net/npm/katex@0.16.10/dist/katex.min.css';
              document.head.appendChild(katexCss);
            })();
            
            function renderFormula() {
              try {
                katex.render('\(escapedLatex)', document.getElementById('formula'), {
                  displayMode: \(displayMode),
                  throwOnError: false,
                  strict: false
                });
              } catch(e) {
                document.getElementById('formula').textContent = '\(escapedLatex)';
              }
            }
          </script>
        </head>
        <body>
          <span id="formula" style="display: inline-block;"></span>
        </body></html>
        """
        
        webView.loadHTMLString(html, baseURL: URL(string: "https://cdn.jsdelivr.net"))
    }

    private func escapeForJavaScript(_ string: String) -> String {
        return string
            .replacingOccurrences(of: "\\", with: "\\\\")
            .replacingOccurrences(of: "'", with: "\\'")
            .replacingOccurrences(of: "\"", with: "\\\"")
            .replacingOccurrences(of: "\n", with: "\\n")
            .replacingOccurrences(of: "\r", with: "\\r")
            .replacingOccurrences(of: "\t", with: "\\t")
            .replacingOccurrences(of: "<", with: "\\u003C")
            .replacingOccurrences(of: ">", with: "\\u003E")
            .replacingOccurrences(of: "&", with: "\\u0026")
    }
}
