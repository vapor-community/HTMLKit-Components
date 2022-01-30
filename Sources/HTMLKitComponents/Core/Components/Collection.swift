import HTMLKit

public struct CollectionContainer: Component {
    
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

public struct CollectionHeader: Component {
    
    private let content: AnyContent
    
    public init(@ContentBuilder<AnyContent> content: () -> AnyContent) {
        self.content = content()
    }
    
    public var body: AnyContent {
        Division {
            content
        }
        .class("collection-header")
    }
}

public struct CollectionBody: Component {
    
    private let content: [ListElement]
    
    public init(@ContentBuilder<ListElement> content: () -> [ListElement]) {
        self.content = content()
    }
    
    public var body: AnyContent {
        UnorderedList {
            content
        }
        .class("collection-body")
    }
}

public struct CollectionItem: Component {
    
    private let content: AnyContent
    
    public init(@ContentBuilder<AnyContent> content: () -> AnyContent) {
        self.content = content()
    }
    
    public var body: AnyContent {
        ListItem {
            content
        }
        .class("collection-item")
    }
}

public struct CollectionFooter: Component {
    
    private let content: AnyContent
    
    public init(@ContentBuilder<AnyContent> content: () -> AnyContent) {
        self.content = content()
    }
    
    public var body: AnyContent {
        Division {
            content
        }
        .class("collection-footer")
    }
}
