import HTMLKit

public struct Collection: Component {
    
    internal var content: [ListElement]
    
    internal var classes: [String]
    
    public init(@ContentBuilder<ListElement> content: () -> [ListElement]) {
        
        self.content = content()
        self.classes = ["collection"]
    }
    
    internal init(content: [ListElement], classes: [String]) {
        
        self.content = content
        self.classes = classes
    }
    
    public var body: AnyContent {
        UnorderedList {
            content
        }
        .class(classes.joined(separator: " "))
    }
}

public struct CollectionItem: Component {
    
    internal  var content: [AnyContent]
    
    internal  var classes: [String]
    
    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        
        self.content = content()
        self.classes = ["collection-item"]
    }
    
    internal init(content: [AnyContent], classes: [String]) {
        
        self.content = content
        self.classes = classes
    }
    
    public var body: AnyContent {
        ListItem {
            content
        }
        .class(classes.joined(separator: " "))
    }
}
