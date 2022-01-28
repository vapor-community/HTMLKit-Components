import HTMLKit

public struct Collection: Component {
    
    private let content: AnyContent
    
    public init(@ContentBuilder<AnyContent> content: () -> AnyContent) {
        self.content = content()
    }
    
    public var body: AnyContent {
        Division {
            content
        }
        .class("collection")
    }
}

public struct CollectionItem: Component {
    
    private let content: AnyContent
    
    public init(@ContentBuilder<AnyContent> content: () -> AnyContent) {
        self.content = content()
    }
    
    public var body: AnyContent {
        Division {
            content
        }
        .class("collection-item")
    }
}
