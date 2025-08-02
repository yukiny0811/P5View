// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "P5View",
    platforms: [
        .iOS(.v18),
        .macOS(.v15),
    ],
    products: [
        .library(
            name: "P5View",
            targets: ["P5View"]
        ),
    ],
    targets: [
        .target(
            name: "P5View",
            dependencies: []
        ),
    ]
)
