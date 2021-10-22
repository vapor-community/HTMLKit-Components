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
    private let link: HTMLContent
    private let content: HTMLContent
    
    public init(variation: ButtonVariation, size: ButtonSize = .regular, uri: TemplateValue<String>, id: TemplateValue<UUID>? = nil, @HTMLBuilder builder: () -> HTMLContent) {

        self.variation = variation
        self.size = size
        
        if let id = id {
            self.link = uri + "/" + id
        } else {
            self.link = uri
        }
        
        self.content = builder()
    }
    
    public var body: HTMLContent {
        Anchor {
            content
        }
        .reference(link)
        .class("button variation:\(variation) size:\(size)")
        .role("button")
    }
}

public struct DropdownButton: HTMLComponent {
    
    private let content: HTMLContent
    
    public init(@HTMLBuilder builder: () -> HTMLContent) {
        
        self.content = builder()
    }
    
    public var body: HTMLContent {
        Div {
            content
        }
        .class("button")
    }
}

public struct ButtonGroup: HTMLComponent {
        
    private let content: HTMLContent
    
    public init(@HTMLBuilder builder: () -> HTMLContent) {
        
        self.content = builder()
    }
    
    public var body: HTMLContent {
        Div {
            content
        }
        .class("button-group")
    }
}
