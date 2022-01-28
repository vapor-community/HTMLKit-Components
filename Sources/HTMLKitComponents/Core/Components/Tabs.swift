import HTMLKit

public struct TabGroup: Component {
    
    private let content: [ListElement]
    
    public init(@ContentBuilder<ListElement> content: () -> [ListElement]) {
        self.content = content()
    }
    
    public var body: AnyContent {
        UnorderedList {
            content
        }
        .class("tab-group")
    }
}

public struct TabItem: Component {
    
    private let content: AnyContent
    
    public init(@ContentBuilder<AnyContent> content: () -> AnyContent) {
        self.content = content()
    }
    
    public var body: AnyContent {
        ListItem {
            content
        }
        .class("tab-item")
    }
}
