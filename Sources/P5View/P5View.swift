// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import WebKit

#if os(iOS)
typealias ViewRepresentable = UIViewRepresentable
#else
typealias ViewRepresentable = NSViewRepresentable
#endif

struct HTMLWebView: ViewRepresentable {

    let html: String      // そのまま渡す場合

    #if os(iOS)
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(html, baseURL: nil)
    }
    #else
    func makeNSView(context: Context) -> WKWebView {
        WKWebView()
    }
    func updateNSView(_ nsView: WKWebView, context: Context) {
        nsView.loadHTMLString(html, baseURL: nil)
    }
    #endif
}

struct LazyView<V: View>: View {
    private let build: () -> V
    init(_ build: @autoclosure @escaping () -> V) {
        self.build = build
    }
    var body: V {
        build()
    }
}

public struct P5View: View {

    let p5Source: String

    public init(p5Source: String) {
        self.p5Source = p5Source
    }

    public var html: some View {
        LazyView(
            HTMLWebView(html: """
            <!DOCTYPE html>
            <html lang="ja">
            <head>
              <meta charset="utf-8" />
              <title>Words Orbit Animation – p5.js</title>
              <script src="https://cdn.jsdelivr.net/npm/p5@1.9.0/lib/p5.min.js"></script>
              <style>
                html,body{margin:0;padding:0;overflow:hidden;background:#000;}
                canvas{display:block;}
              </style>
            </head>
            <body>
            <script>
              \(p5Source)
            </script>
            </body>
            </html>
            """)
        )
    }

    public var body: some View {
        html
    }
}
