import HTMLKit

public struct Image: HTMLComponent {
    
    private let link: HTMLContent
    
    public init(uri: TemplateValue<String>) {
        self.link = uri
    }
    
    public var body: HTMLContent {
        Div {
            Img()
                .source(link)
                .alt("thumbnail")
        }
        .class("image")
    }
}
