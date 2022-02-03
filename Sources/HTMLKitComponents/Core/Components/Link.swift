import HTMLKit
import Foundation

public struct Link: Component {

    internal let destination: TemplateValue<String>
    
    internal var content: [AnyContent]
    
    internal var classes: [String]
    
    public init(destination: TemplateValue<String>, @ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        
        self.destination = destination
        self.content = content()
        self.classes = ["link"]
    }
    
    internal init(destination: TemplateValue<String>, content: [AnyContent], classes: [String]) {
        
        self.destination = destination
        self.content = content
        self.classes = classes
    }
    
    public var body: AnyContent {
        Anchor {
            content
        }
        .reference(destination.rawValue)
        .class(classes.joined(separator: " "))
    }
}

extension Link: TextComponent {
    
    public func foregroundColor(_ color: ForegroundColor) -> Link {
        
        var newSelf = self
        newSelf.classes.append(color.rawValue)
        return newSelf
    }
    
    public func fontSize(_ size: FontSize) -> Link {
        
        var newSelf = self
        newSelf.classes.append(size.rawValue)
        return newSelf
    }
    
    public func fontWeight(_ weight: FontWeight) -> Link {
        
        var newSelf = self
        newSelf.classes.append(weight.rawValue)
        return newSelf
    }
    
    public func fontTransformation(_ transformation: TextTransformation) -> Link {
        
        var newSelf = self
        newSelf.classes.append(transformation.rawValue)
        return newSelf
    }
    
    public func bold() -> Link {
        
        var newSelf = self
        newSelf.classes.append(FontWeight.bold.rawValue)
        return newSelf
    }
    
    public func italic() -> Link {
        
        var newSelf = self
        newSelf.classes.append(FontStyle.italic.rawValue)
        return newSelf
    }
    
    public func underline() -> Link {
        
        var newSelf = self
        newSelf.classes.append(TextDecoration.underline.rawValue)
        return newSelf
    }
}
