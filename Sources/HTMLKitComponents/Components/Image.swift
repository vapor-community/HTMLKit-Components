import HTMLKit

public struct Image: HTMLComponent {
    
    private let link: TemplateValue<String>
    
    public init(uri: TemplateValue<String>) {
        self.link = uri
    }
    
    public var body: HTML {
        Div {
            Img(source: link)
                .alt("thumbnail")
        }
        .class("image")
    }
}
