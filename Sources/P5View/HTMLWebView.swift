//
//  File.swift
//  P5View
//
//  Created by Yuki Kuwashima on 2025/08/03.
//

import SwiftUI
import WebKit

#if os(iOS)
typealias ViewRepresentable = UIViewRepresentable
#else
typealias ViewRepresentable = NSViewRepresentable
#endif

struct HTMLWebView: ViewRepresentable {

    let html: String      // そのまま渡す場合
    let baseURL: URL

    #if os(iOS)
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(html, baseURL: baseURL)
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
