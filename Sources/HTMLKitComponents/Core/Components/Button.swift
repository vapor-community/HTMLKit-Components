import HTMLKit
import Foundation

public struct ActionButton: Component {
    
    internal let destination: TemplateValue<String>
    
    internal var content: [AnyContent]
    
    internal var classes: [String]
    
    internal var events: [String]?
    
    public init(destination: TemplateValue<String>, @ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        
        self.destination = destination
        self.content = content()
        self.classes = ["button"]
    }
    
    internal init(destination: TemplateValue<String>, content: [AnyContent], classes: [String], events: [String]?) {
        
        self.destination = destination
        self.content = content
        self.classes = classes
        self.events = events
    }
    
    public var body: AnyContent {
        Anchor {
            content
        }
        .reference(destination.rawValue)
        .class(classes.joined(separator: " "))
        .role(.button)
    }
    
    public var scripts: AnyContent {
        
        if let events = self.events {
            return [content.scripts, Script { events }]
        }
        
        return [content.scripts]
    }
}

public struct SubmitButton: Component {
    
    internal let label: TemplateValue<String>
    
    internal var classes: [String]
    
    public init(label: TemplateValue<String>) {
        self.label = label
        self.classes = ["button", ButtonStyle.primary.rawValue]
    }
    
    public var body: AnyContent {
        Button {
            label
        }
        .type(.submit)
        .class(classes.joined(separator: " "))
        .role(.button)
    }
}

public struct ResetButton: Component {
    
    internal let label: TemplateValue<String>
    
    internal var classes: [String]
    
    public init(label: TemplateValue<String>) {
        
        self.label = label
        self.classes = ["button", ButtonStyle.secondary.rawValue]
    }
    
    public var body: AnyContent {
        Button {
            label
        }
        .type(.reset)
        .class(classes.joined(separator: " "))
        .role(.button)
    }
}
