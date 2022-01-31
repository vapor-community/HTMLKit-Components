import HTMLKit

public struct ImageView: Component {
    
    private let link: TemplateValue<String>
    private let classes: [String]
    
    public init(uri: TemplateValue<String>) {
        self.link = uri
        self.classes = ["image"]
    }
    
    internal init(uri: TemplateValue<String>, classes: [String]) {
        self.link = uri
        self.classes = classes
    }
    
    public var body: AnyContent {
        Division {
            Image()
                .source(link.rawValue)
                .role(.img)
        }
        .class(classes.joined(separator: " "))
    }
}

extension ImageView {
    
    public func objectFit(_ fit: ObjectFit) -> ImageView {
        
        var classes = self.classes
        classes.append(fit.rawValue)
        
        return ImageView(uri: self.link, classes: classes)
    }
    
    public func opacity(_ value: OpacityValue) -> ImageView {
        
        var classes = self.classes
        classes.append(value.rawValue)
        
        return ImageView(uri: self.link, classes: classes)
    }
}
