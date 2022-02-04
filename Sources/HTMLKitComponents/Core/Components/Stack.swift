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

extension Stack: ViewComponent {
    
    public func backgroundColor(_ color: BackgroundColor) -> Stack {
        
        var newSelf = self
        newSelf.classes.append(color.rawValue)
        return newSelf
    }

    public func opacity(_ value: OpacityValue) -> Stack {
        
        var newSelf = self
        newSelf.classes.append(value.rawValue)
        return newSelf
    }
    
    public func zIndex(_ index: PositionIndex) -> Stack {
        
        var newSelf = self
        newSelf.classes.append(index.rawValue)
        return newSelf
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
