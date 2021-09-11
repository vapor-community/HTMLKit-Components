import HTMLKit
import Foundation

public enum ButtonVariation: String {
    case primary
    case secondary
    case outline
    case ghost
}

public enum ButtonSize: String {
    case regular
    case large
}

public struct ActionButton: HTMLComponent {
    
    private let variation: ButtonVariation
    private let size: ButtonSize
    private let link: HTML
    private let content: HTML
    
    public init(variation: ButtonVariation, size: ButtonSize = .regular, uri: TemplateValue<String>, id: TemplateValue<UUID>? = nil, @HTMLBuilder builder: () -> HTML) {

        self.variation = variation
        self.size = size
        
        if let id = id {
            self.link = uri + "/" + id
        } else {
            self.link = uri
        }
        
        self.content = builder()
    }
    
    public var body: HTML {
        Anchor {
            content
        }
        .href(link)
        .class("button variation:\(variation) size:\(size)")
        .role("button")
    }
}

public struct DropdownButton: HTMLComponent {
    
    private let content: HTML
    
    public init(@HTMLBuilder builder: () -> HTML) {
        
        self.content = builder()
    }
    
    public var body: HTML {
        Div {
            content
        }
        .class("button")
    }
}

public struct ButtonGroup: HTMLComponent {
        
    private let content: HTML
    
    public init(@HTMLBuilder builder: () -> HTML) {
        
        self.content = builder()
    }
    
    public var body: HTML {
        Div {
            content
        }
        .class("button-group")
    }
}
