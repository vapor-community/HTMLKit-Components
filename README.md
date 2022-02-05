# HTMLKit-Components

This package contains common UI-components wich are build with HTMLKit.

### Getting started

#### Installation

Add the packages to your dependecies and targets in your package file.

```swift
/// [Package.swift]

...
dependencies: [
    ...
    ///1. Add the packages
    .package(name: "HTMLKit", url: "https://github.com/vapor-community/HTMLKit.git", from: "2.4.4"),
    .package(name: "HTMLKitComponents", url: "https://github.com/vapor-community/HTMLKit-Components.git", from: "0.1.0")
],
targets: [
    .target( 
    ...
        dependencies: [
            ...
            /// 2. Add the products
            .product(name: "HTMLKit", package: "HTMLKit"),
            .product(name: "HTMLKitComponents", package: "HTMLKitComponents")
        ]
    ),
    ...
```

#### Example

```swift
/// [SimpleView.swift]

HStack(alignment: .top) {
    StackColumn(size: .four, offset: .eight) {
        List(direction: .vertical) {
            ListRow {
                Text {
                    "Languages"
                }
                .fontSize(.small)
            }
            ListRow {
                Link(destination: "#") {
                    "German"
                }
            }
            ListRow {
                Link(destination: "#") {
                    "English"
                }
            }
        }
    }
```
