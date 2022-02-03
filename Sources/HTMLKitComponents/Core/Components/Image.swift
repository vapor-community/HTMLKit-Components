import HTMLKit

public struct ImageView: Component {
    
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

extension ImageView: ImageComponent {
    
    public func objectFit(_ fit: ObjectFit) -> ImageView {
        
        var newSelf = self
        newSelf.classes.append(fit.rawValue)
        return newSelf
    }
    
    public func imageScale(_ scale: ImageScale) -> ImageView {
        
        var newSelf = self
        newSelf.classes.append(scale.rawValue)
        return newSelf
    }
    
    public func clipShape(_ shape: ClipShape) -> ImageView {
        
        var newSelf = self
        newSelf.classes.append(shape.rawValue)
        return newSelf
    }
}

extension ImageView: ViewComponent {
    
    public func opacity(_ value: OpacityValue) -> ImageView {
        
        var newSelf = self
        newSelf.classes.append(value.rawValue)
        return newSelf
    }
}
