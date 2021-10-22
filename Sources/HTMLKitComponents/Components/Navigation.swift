import HTMLKit
import Foundation

public enum NavigationDirection: String {
    
    case vertical
    case horizontal
}

public struct Navigation: HTMLComponent {
    
    private let direction: NavigationDirection
    
    private let content: HTMLContent
    
    public init(direction: NavigationDirection, @HTMLBuilder builder: () -> HTMLContent) {
        self.direction = direction
        self.content = builder()
    }
    
    public var body: HTMLContent {
        UnorderedList {
            content
        }
        .class("navigation direction:\(direction)")
    }
}

public struct NavigationItem: HTMLComponent {
    
    private let isActive: Conditionable
    private let content: HTMLContent
    
    public init(isActive: Conditionable = false, @HTMLBuilder builder: () -> HTMLContent) {
        self.isActive = isActive
        self.content = builder()
    }
    
    public var body: HTMLContent {
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
    
    private let link: HTMLContent
    private let content: HTMLContent
    
    public init(uri: TemplateValue<String>, id: TemplateValue<UUID>? = nil, @HTMLBuilder builder: () -> HTMLContent) {
        
        if let id = id {
            self.link = uri + "/" + id
        } else {
            self.link = uri
        }
        
        self.content = builder()
    }
    
    public var body: HTMLContent {
        Anchor { content }
            .reference(link)
            .class("navigation-link")
            .role("link")
    }
}

