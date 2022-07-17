// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "HTMLKitComponents",
    platforms: [
       .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "HTMLKitComponents",
            targets: ["HTMLKitComponents"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor-community/HTMLKit", from: "2.5.0")
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
