import HTMLKit

public struct Collection: HTMLComponent {
    
    private let content: HTML
    
    public init(@HTMLBuilder builder: () -> HTML) {
        self.content = builder()
    }
    
    public var body: HTML {
        content
    }
}

public struct CollectionItem: HTMLComponent {
    
    private let content: HTML
    
    public init(@HTMLBuilder builder: () -> HTML) {
        self.content = builder()
    }
    
    public var body: HTML {
        content
    }
}
