import HTMLKit
import Foundation

public enum NavigationDirection: String {
    
    case vertical
    case horizontal
}

public struct Navigation: HTMLComponent {
    
    private let direction: NavigationDirection
    
    private let content: HTML
    
    public init(direction: NavigationDirection, @HTMLBuilder builder: () -> HTML) {
        self.direction = direction
        self.content = builder()
    }
    
    public var body: HTML {
        UnorderedList {
            content
        }
        .class("navigation direction:\(direction)")
    }
}

public struct NavigationItem: HTMLComponent {
    
    private let isActive: Conditionable
    private let content: HTML
    
    public init(isActive: Conditionable = false, @HTMLBuilder builder: () -> HTML) {
        self.isActive = isActive
        self.content = builder()
    }
    
    public var body: HTML {
        ListItem {
            content
        }
        .class("navigation-item")
        .modify(if: isActive) {
            $0.class("navigation-item active")
        }
    }
}

public struct NavigationLink: HTMLComponent {
    
    private let link: HTML
    private let content: HTML
    
    public init(uri: TemplateValue<String>, id: TemplateValue<UUID>? = nil, @HTMLBuilder builder: () -> HTML) {
        
        if let id = id {
            self.link = uri + "/" + id
        } else {
            self.link = uri
        }
        
        self.content = builder()
    }
    
    public var body: HTML {
        Anchor { content }
            .href(link)
            .class("navigation-link")
            .role("link")
    }
}

