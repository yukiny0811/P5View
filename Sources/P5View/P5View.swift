// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct P5View: View {

    let p5Source: String
    let baseURL: URL

    public init(p5Source: String, baseURL: URL) {
        self.p5Source = p5Source
        self.baseURL = baseURL
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
                html,body{margin:0;padding:0;overflow:hidden;background:#00000000;}
                canvas{display:block;}
              </style>
            </head>
            <body>
            <script>
              \(p5Source)
            </script>
            </body>
            </html>
            """, baseURL: baseURL)
        )
    }

    public var body: some View {
        html
    }

    public static func createBase64Image(image: UIImage) -> String? {
        guard let pngData = image.pngData() else {
            return nil
        }
        return "data:image/png;base64," + pngData.base64EncodedString()
    }
}
