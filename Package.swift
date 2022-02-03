// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "HTMLKitComponents",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "HTMLKitComponents",
            targets: ["HTMLKitComponents"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor-community/HTMLKit", .branch("main")),
    ],
    targets: [
        .target(
            name: "HTMLKitComponents",
            dependencies: [
                .product(name: "HTMLKit", package: "HTMLKit"),
            ]),
        .testTarget(
            name: "HTMLKitComponentsTests",
            dependencies: ["HTMLKitComponents"]),
    ]
)
