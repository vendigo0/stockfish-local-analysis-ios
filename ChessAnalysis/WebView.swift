import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let resource: String
    let subdirectory: String?

    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences.allowsContentJavaScript = true
        configuration.preferences.javaScriptEnabled = true
        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.backgroundColor = .white
        webView.scrollView.backgroundColor = .white
        webView.isOpaque = false
        webView.scrollView.pinchGestureRecognizer?.isEnabled = false
        webView.scrollView.minimumZoomScale = 1.0
        webView.scrollView.maximumZoomScale = 1.0
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        guard let url = Bundle.main.url(forResource: resource, withExtension: "html", subdirectory: subdirectory) else {
            return
        }
        let base = url.deletingLastPathComponent()
        webView.loadFileURL(url, allowingReadAccessTo: base)
    }
}
