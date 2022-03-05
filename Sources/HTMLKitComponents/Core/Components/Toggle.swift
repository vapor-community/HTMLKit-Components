import HTMLKit

public struct Toggle: Component {
    
    internal let name: TemplateValue<String>
    
    internal var classes: [String]
    
    internal var events: [String]?
    
    public init(name: TemplateValue<String>) {
        
        self.name = name
        self.classes = ["toggle"]
    }
    
    internal init(name: TemplateValue<String>, classes: [String], events: [String]?) {
        
        self.name = name
        self.classes = classes
        self.events = events
    }
    
    public var body: AnyContent {
        Label {
            Input()
                .type(.checkbox)
                .id(name)
                .name(name)
            Division {
            }
            .class("toggle-slider")
        }
        .tabIndex("0")
        .class(classes.joined(separator: " "))
    }
    
    public var scripts: AnyContent {
        
        if let events = self.events {
            return [Script { events }]
        }
        
        return []
    }
}
