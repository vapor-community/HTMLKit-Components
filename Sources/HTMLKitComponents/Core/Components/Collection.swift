import HTMLKit

public struct Collection: Component {
    
    internal var content: [ListElement]
    
    internal var classes: [String]
    
    internal var events: [String]?
    
    public init(ratio: ItemRatio = .half, @ContentBuilder<ListElement> content: () -> [ListElement]) {
        
        self.content = content()
        self.classes = ["collection", ratio.rawValue]
    }
    
    internal init(content: [ListElement], classes: [String], events: [String]?) {
        
        self.content = content
        self.classes = classes
        self.events = events
    }
    
    public var body: AnyContent {
        UnorderedList {
            content
        }
        .class(classes.joined(separator: " "))
    }
    
    public var scripts: AnyContent {
        
        if let events = self.events {
            return [content.scripts, Script { events }]
        }
        
        return [content.scripts]
    }
}

extension Collection {
    
    public func collectionStyle(_ style: CollectionStyle) -> Collection {
        
        var newSelf = self
        newSelf.classes.append(style.rawValue)
        return newSelf
    }
}

public struct CollectionItem: Component {
    
    internal  var content: [AnyContent]
    
    internal  var classes: [String]
    
    internal var events: [String]?
    
    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        
        self.content = content()
        self.classes = ["collection-item"]
    }
    
    internal init(content: [AnyContent], classes: [String], events: [String]?) {
        
        self.content = content
        self.classes = classes
        self.events = events
    }
    
    public var body: AnyContent {
        ListItem {
            content
        }
        .class(classes.joined(separator: " "))
    }
    
    public var scripts: AnyContent {
        
        if let events = self.events {
            return [content.scripts, Script { events }]
        }
        
        return [content.scripts]
    }
}
