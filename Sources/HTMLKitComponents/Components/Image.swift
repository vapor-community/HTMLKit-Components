import HTMLKit

public struct ImageContainer: Component {
    
    private let link: TemplateValue<String>
    
    public init(uri: TemplateValue<String>) {
        self.link = uri
    }
    
    public var body: AnyContent {
        Division {
            Image()
                .source(link.rawValue)
                .alternate("thumbnail")
        }
        .class("image")
    }
}
