import HTMLKit

public struct Stack: Component {
    
    private let content: AnyContent
    private let classes: [String]
    
    public init(direction: FlowDirection, @ContentBuilder<AnyContent> content: () -> AnyContent) {
        self.content = content()
        self.classes = ["stack", direction.rawValue]
    }
    
    internal init(content: AnyContent, classes: [String]) {
        self.content = content
        self.classes = classes
    }
    
    public var body: AnyContent {
        Division {
            content
        }
        .class(classes.joined(separator: " "))
    }
}

public struct StackColumn: Component {
    
    private let content: AnyContent
    private var classes: [String]
    
    public init(size: ColumnSize, @ContentBuilder<AnyContent> content: () -> AnyContent) {
        
        self.content = content()
        self.classes = ["stack-column", size.rawValue]
    }
    
    public init(size: ColumnSize, alignment: ColumnAlignment, @ContentBuilder<AnyContent> content: () -> AnyContent) {
        
        self.content = content()
        self.classes = ["stack-column", size.rawValue, alignment.rawValue]
    }
    
    internal init(content: AnyContent, classes: [String]) {
        self.content = content
        self.classes = classes
    }
    
    public var body: AnyContent {
        Division {
            content
        }
        .class(classes.joined(separator: " "))
    }
}
