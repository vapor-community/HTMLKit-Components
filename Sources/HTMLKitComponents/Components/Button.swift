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

public struct ActionButton: Component {
    
    private let variation: ButtonVariation
    private let size: ButtonSize
    private let link: TemplateValue<String>
    private let content: AnyContent
    
    public init(variation: ButtonVariation, size: ButtonSize = .regular, uri: TemplateValue<String>, id: TemplateValue<UUID>? = nil, @ContentBuilder<AnyContent> content: () -> AnyContent) {

        self.variation = variation
        self.size = size
        
        if let id = id {
            self.link = .constant("\(uri)/\(id)")
        } else {
            self.link = uri
        }
        
        self.content = content()
    }
    
    public var body: AnyContent {
        Anchor {
            content
        }
        .reference(link.rawValue)
        .class("button variation:\(variation.rawValue) size:\(size.rawValue)")
        .role("button")
    }
}

public struct DropdownButton: Component {
    
    private let content: AnyContent
    
    public init(@ContentBuilder<AnyContent> content: () -> AnyContent) {
        self.content = content()
    }
    
    public var body: AnyContent {
        Division {
            content
        }
        .class("dropdown")
    }
}

public struct DropdownMenu: Component {
    
    private let content: [ListElement]
    
    public init(@ContentBuilder<ListElement> content: () -> [ListElement]) {
        self.content = content()
    }
    
    public var body: AnyContent {
        UnorderedList {
            content
        }
        .class("dropdown-menu")
    }
}

public struct DropdownItem: Component {
    
    private let content: AnyContent
    
    public init(@ContentBuilder<AnyContent> content: () -> AnyContent) {
        self.content = content()
    }
    
    public var body: AnyContent {
        ListItem {
            content
        }
        .class("dropdown-item")
    }
}

public struct DropdownLink: Component {
    
    private let content: AnyContent
    
    public init(@ContentBuilder<AnyContent> content: () -> AnyContent) {
        self.content = content()
    }
    
    public var body: AnyContent {
        Anchor {
            content
        }
        .class("dropdown-link")
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
