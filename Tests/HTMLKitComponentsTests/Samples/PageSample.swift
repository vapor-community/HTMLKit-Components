import HTMLKit
import HTMLKitComponents

public struct SamplePage: Page {
    
    internal var content: [BodyElement]
    
    internal var actions: [String]?
    
    public init(@ContentBuilder<BodyElement> content: () -> [BodyElement]) {
        
        self.content = content()
    }
    
    public var body: AnyContent {
        Document(type: .html5)
        Html {
            Head {
                Title {
                    "SamplePage"
                }
            }
            Body {
                content
                scripts
            }
        }
    }
    
    public var scripts: BodyElement {
        return [content.scripts]
    }
}

public struct SampleView: Page {
    
    public var body: AnyContent {
        SamplePage {
            List(direction: .vertical) {
                ListRow {
                    Text {
                        "Test"
                    }
                    .id("selector")
                    .onHover(perfom: .show("target"))
                }
            }
        }
    }
}

extension Array: AnyElement where Element == AnyContent {}

extension Array: BodyElement where Element == AnyContent {}
