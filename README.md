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
    .package(url: "https://github.com/vapor-community/HTMLKit-Components.git", from: "0.1.0")
],
targets: [
    .target( 
    ...
        dependencies: [
            ...
            /// 2. Add the products
            .product(name: "HTMLKitComponents", package: "HTMLKit-Components")
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
