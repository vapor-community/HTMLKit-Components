import HTMLKit
import Foundation

public struct Link: Component {
    
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
        .class("link")
    }
}
