import HTMLKit

public struct HStack: Component {
    
    internal var content: [AnyContent]
    
    internal var classes: [String]
    
    public init(alignment: VerticalAlignment = .center, @ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        
        self.content = content()
        self.classes = ["hstack", alignment.rawValue]
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
    
    public var scripts: AnyContent {
        return [content.scripts]
    }
    
    public func contentSpace(_ value: ContentSpace) -> HStack {
        
        var newSelf = self
        newSelf.classes.append(value.rawValue)
        return newSelf
    }
    
    
}

extension HStack: ViewComponent {
    
    public func backgroundColor(_ color: BackgroundColor) -> HStack {
        
        var newSelf = self
        newSelf.classes.append(color.rawValue)
        return newSelf
    }

    public func opacity(_ value: OpacityValue) -> HStack {
        
        var newSelf = self
        newSelf.classes.append(value.rawValue)
        return newSelf
    }
    
    public func zIndex(_ index: PositionIndex) -> HStack {
        
        var newSelf = self
        newSelf.classes.append(index.rawValue)
        return newSelf
    }
}

public struct VStack: Component {
    
    internal var content: [AnyContent]
    
    internal var classes: [String]
    
    public init(alignment: HorizontalAlignment = .leading, @ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        
        self.content = content()
        self.classes = ["vstack", alignment.rawValue]
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
    
    public var scripts: AnyContent {
        return [content.scripts]
    }
}

extension VStack: ViewComponent {
    
    public func backgroundColor(_ color: BackgroundColor) -> VStack {
        
        var newSelf = self
        newSelf.classes.append(color.rawValue)
        return newSelf
    }

    public func opacity(_ value: OpacityValue) -> VStack {
        
        var newSelf = self
        newSelf.classes.append(value.rawValue)
        return newSelf
    }
    
    public func zIndex(_ index: PositionIndex) -> VStack {
        
        var newSelf = self
        newSelf.classes.append(index.rawValue)
        return newSelf
    }
}

public struct ZStack: Component {
    
    internal var content: [AnyContent]
    
    internal var classes: [String]
    
    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        
        self.content = content()
        self.classes = ["zstack"]
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
    
    public var scripts: AnyContent {
        return [content.scripts]
    }
}

public struct StackColumn: Component {
    
    internal var content: [AnyContent]
    
    internal var classes: [String]
    
    public init(size: ColumnSize, @ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        
        self.content = content()
        self.classes = ["stack-column", size.rawValue]
    }
    
    public init(size: ColumnSize, alignment: TextAlignment, @ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        
        self.content = content()
        self.classes = ["stack-column", size.rawValue, alignment.rawValue]
    }
    
    public init(size: ColumnSize, offset: ColumnOffset, @ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        
        self.content = content()
        self.classes = ["stack-column", size.rawValue, offset.rawValue]
    }
    
    public init(size: ColumnSize, alignment: TextAlignment, offset: ColumnOffset, @ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        
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
    
    public var scripts: AnyContent {
        return [content.scripts]
    }
}
