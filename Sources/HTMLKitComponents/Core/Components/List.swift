import HTMLKit

public struct List: Component {
    
    private let content: [ListElement]
    private var classes: [String]
    
    public init(direction: FlowDirection, @ContentBuilder<ListElement> content: () -> [ListElement]) {
        
        self.content = content()
        self.classes = ["list", direction.rawValue]
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

public struct ListRow: Component {

    private let content: AnyContent
    private var classes: [String]
    
    public init(@ContentBuilder<AnyContent> content: () -> AnyContent) {
        
        self.content = content()
        self.classes = ["list-row"]
    }
    
    internal init(content: AnyContent, classes: [String]) {
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
