import HTMLKit
import Foundation

public struct ActionButton: Component {
    
    private let uri: TemplateValue<String>
    private let content: AnyContent
    private var classes: [String]
    
    public init(style: ButtonStyle, uri: TemplateValue<String>, @ContentBuilder<AnyContent> content: () -> AnyContent) {
        
        self.uri = uri
        self.content = content()
        self.classes = ["button", style.rawValue]
    }
    
    internal init(uri: TemplateValue<String>, content: AnyContent, classes: [String]) {
        
        self.uri = uri
        self.content = content
        self.classes = classes
    }
    
    public var body: AnyContent {
        Anchor {
            content
        }
        .reference(uri.rawValue)
        .class(classes.joined(separator: " "))
        .role(.button)
    }
}

public struct ButtonGroup: Component {
        
    private let content: AnyContent
    
    public init(@ContentBuilder<AnyContent> content: () -> AnyContent) {
        self.content = content()
    }
    
    public var body: AnyContent {
        Division {
            content
        }
        .class("button-group")
    }
}
