import HTMLKit
import Foundation

public enum NavigationDirection: String {
    
    case vertical
    case horizontal
}

public struct NavigationContainer: Component {
    
    private let direction: NavigationDirection
    
    private let content: [ListElement]
    
    public init(direction: NavigationDirection, @ContentBuilder<ListElement> content: () -> [ListElement]) {
        self.direction = direction
        self.content = content()
    }
    
    public var body: AnyContent {
        UnorderedList {
            content
        }
        .class("navigation direction:\(direction.rawValue)")
    }
}

public struct NavigationItem: Component, ListElement {
    
    private let isActive: Bool
    private let content: AnyContent
    
    public init(isActive: Bool = false, @ContentBuilder<AnyContent> content: () -> AnyContent) {
        self.isActive = isActive
        self.content = content()
    }
    
    public var body: AnyContent {
        ListItem {
            content
        }
        .class("navigation-item")
        .modify(if: isActive) {
            $0.class("navigation-item active")
        }
    }
}

public struct NavigationLink: Component {
    
    private let link: TemplateValue<String>
    private let content: AnyContent
    
    public init(uri: TemplateValue<String>, id: TemplateValue<UUID>? = nil, @ContentBuilder<AnyContent> content: () -> AnyContent) {
        
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
        .class("navigation-link")
        .role("link")
    }
}

