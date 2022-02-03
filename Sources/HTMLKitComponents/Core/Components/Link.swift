import HTMLKit
import Foundation

public struct Link: Component, TextComponent {

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
