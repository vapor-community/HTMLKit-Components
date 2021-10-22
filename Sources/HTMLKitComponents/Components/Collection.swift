import HTMLKit

public struct Collection: HTMLComponent {
    
    private let content: HTMLContent
    
    public init(@HTMLBuilder builder: () -> HTMLContent) {
        self.content = builder()
    }
    
    public var body: HTMLContent {
        content
    }
}

public struct CollectionItem: HTMLComponent {
    
    private let content: HTMLContent
    
    public init(@HTMLBuilder builder: () -> HTMLContent) {
        self.content = builder()
    }
    
    public var body: HTMLContent {
        content
    }
}
