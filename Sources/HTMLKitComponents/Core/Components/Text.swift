import HTMLKit

public struct Text: Component, TextComponent {

    internal var content: [AnyContent]
    
    internal var classes: [String]
    
    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        
        self.content = content()
        self.classes = ["text"]
    }
    
    internal init(content: [AnyContent], classes: [String]) {
        
        self.content = content
        self.classes = classes
    }
    
    public var body: AnyContent {
        Paragraph {
            content
        }
        .class(classes.joined(separator: " "))
    }
}
