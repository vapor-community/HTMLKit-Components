import HTMLKit

public struct ImageView: Component, ImageComponent, ViewComponent {
    
    internal let source: TemplateValue<String>
    
    internal var classes: [String]
    
    public init(source: TemplateValue<String>) {
        
        self.source = source
        self.classes = ["image"]
    }
    
    internal init(source: TemplateValue<String>, classes: [String]) {
        
        self.source = source
        self.classes = classes
    }
    
    public var body: AnyContent {
        Division {
            Image()
                .source(source.rawValue)
                .role(.img)
        }
        .class(classes.joined(separator: " "))
    }
}
