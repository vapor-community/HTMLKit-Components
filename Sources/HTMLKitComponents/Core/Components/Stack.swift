/*
 Abstract:
 The file contains everything related to stack components.
 */

import HTMLKit

public struct HStack: Component {
    
    /// The content of the stack.
    internal var content: [AnyContent]
    
    /// The classes of the stack.
    internal var classes: [String]
    
    /// Creates a horizontal stack.
    public init(alignment: VerticalAlignment = .center, @ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        
        self.content = content()
        self.classes = ["hstack", alignment.rawValue]
    }
    
    /// Creates a horizontal stack.
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
    
    /// The behaviour of the stack.
    public var scripts: AnyContent {
        return [content.scripts]
    }
    
    /// Sets the space of the content.
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
    
    /// The content of the stack.
    internal var content: [AnyContent]
    
    /// The classes of the stack.
    internal var classes: [String]
    
    /// Creates a vertical stack.
    public init(alignment: HorizontalAlignment = .leading, @ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        
        self.content = content()
        self.classes = ["vstack", alignment.rawValue]
    }
    
    /// Creates a vertical stack.
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
    
    /// The behaviour of the stack.
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
    
    /// The content of the stack.
    internal var content: [AnyContent]
    
    /// The classes of the stack.
    internal var classes: [String]
    
    /// Creates a stack.
    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        
        self.content = content()
        self.classes = ["zstack"]
    }
    
    /// Creates a stack.
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
    
    /// The behaviour of the stack.
    public var scripts: AnyContent {
        return [content.scripts]
    }
}

public struct StackColumn: Component {
    
    /// The content of the column.
    internal var content: [AnyContent]
    
    /// The content of the column.
    internal var classes: [String]
    
    /// Creates a stack column.
    public init(size: ColumnSize, @ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        
        self.content = content()
        self.classes = ["stack-column", size.rawValue]
    }
    
    /// Creates a stack column.
    public init(size: ColumnSize, alignment: TextAlignment, @ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        
        self.content = content()
        self.classes = ["stack-column", size.rawValue, alignment.rawValue]
    }
    
    /// Creates a stack column.
    public init(size: ColumnSize, offset: ColumnOffset, @ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        
        self.content = content()
        self.classes = ["stack-column", size.rawValue, offset.rawValue]
    }
    
    /// Creates a stack column.
    public init(size: ColumnSize, alignment: TextAlignment, offset: ColumnOffset, @ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        
        self.content = content()
        self.classes = ["stack-column", size.rawValue, alignment.rawValue, offset.rawValue]
    }
    
    /// Creates a stack column.
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
    
    /// The behaviour of the column.
    public var scripts: AnyContent {
        return [content.scripts]
    }
}
