import HTMLKit

public struct Stack: Component {
    
    internal var content: [AnyContent]
    
    internal var classes: [String]
    
    public init(direction: FlowDirection, @ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        
        self.content = content()
        self.classes = ["stack", direction.rawValue]
    }
    
    internal init(content: [AnyContent], classes: [String]) {
        
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
    
    internal var content: [AnyContent]
    
    internal var classes: [String]
    
    public init(size: ColumnSize, @ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        
        self.content = content()
        self.classes = ["stack-column", size.rawValue]
    }
    
    public init(size: ColumnSize, alignment: ColumnAlignment, @ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        
        self.content = content()
        self.classes = ["stack-column", size.rawValue, alignment.rawValue]
    }
    
    public init(size: ColumnSize, offset: ColumnOffset, @ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        
        self.content = content()
        self.classes = ["stack-column", size.rawValue, offset.rawValue]
    }
    
    public init(size: ColumnSize, alignment: ColumnAlignment, offset: ColumnOffset, @ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        
        self.content = content()
        self.classes = ["stack-column", size.rawValue, alignment.rawValue, offset.rawValue]
    }
    
    internal init(content: [AnyContent], classes: [String]) {
        
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
