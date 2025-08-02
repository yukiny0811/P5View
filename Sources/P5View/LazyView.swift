//
//  File.swift
//  P5View
//
//  Created by Yuki Kuwashima on 2025/08/03.
//

import SwiftUI

struct LazyView<V: View>: View {
    private let build: () -> V
    init(_ build: @autoclosure @escaping () -> V) {
        self.build = build
    }
    var body: V {
        build()
    }
}
