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

extension ActionButton: ButtonComponent {
    
    public func buttonSize(_ size: ButtonSize) -> ActionButton {
        
        var newSelf = self
        newSelf.classes.append(size.rawValue)
        return newSelf
    }
    
    public func borderShape(_ shape: BorderShape) -> ActionButton {
        
        var newSelf = self
        newSelf.classes.append(shape.rawValue)
        return newSelf
    }
    
    public func buttonStyle(_ style: ButtonStyle) -> ActionButton {
        
        var newSelf = self
        newSelf.classes.append(style.rawValue)
        return newSelf
    }
    
    public func backgroundColor(_ color: BackgroundColor) -> ActionButton {
        
        var newSelf = self
        newSelf.classes.append(color.rawValue)
        return newSelf
    }
}

public struct SubmitButton: Component {
    
    internal var content: [AnyContent]
    
    internal var classes: [String]
    
    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        
        self.content = content()
        self.classes = ["button"]
    }
    
    public var body: AnyContent {
        Button {
            content
        }
        .type(.submit)
        .class(classes.joined(separator: " "))
    }
}

extension SubmitButton: ButtonComponent {
    
    public func buttonSize(_ size: ButtonSize) -> SubmitButton {
        
        var newSelf = self
        newSelf.classes.append(size.rawValue)
        return newSelf
    }
    
    public func borderShape(_ shape: BorderShape) -> SubmitButton {
        
        var newSelf = self
        newSelf.classes.append(shape.rawValue)
        return newSelf
    }
    
    public func buttonStyle(_ style: ButtonStyle) -> SubmitButton {
        
        var newSelf = self
        newSelf.classes.append(style.rawValue)
        return newSelf
    }
    
    public func backgroundColor(_ color: BackgroundColor) -> SubmitButton {
        
        var newSelf = self
        newSelf.classes.append(color.rawValue)
        return newSelf
    }
}

public struct ResetButton: Component {
    
    internal var content: [AnyContent]
    
    internal var classes: [String]
    
    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        
        self.content = content()
        self.classes = ["button"]
    }
    
    public var body: AnyContent {
        Button {
            content
        }
        .type(.reset)
        .class(classes.joined(separator: " "))
    }
}

extension ResetButton: ButtonComponent {
    
    public func buttonSize(_ size: ButtonSize) -> ResetButton {
        
        var newSelf = self
        newSelf.classes.append(size.rawValue)
        return newSelf
    }
    
    public func borderShape(_ shape: BorderShape) -> ResetButton {
        
        var newSelf = self
        newSelf.classes.append(shape.rawValue)
        return newSelf
    }
    
    public func buttonStyle(_ style: ButtonStyle) -> ResetButton {
        
        var newSelf = self
        newSelf.classes.append(style.rawValue)
        return newSelf
    }
    
    public func backgroundColor(_ color: BackgroundColor) -> ResetButton {
        
        var newSelf = self
        newSelf.classes.append(color.rawValue)
        return newSelf
    }
}
