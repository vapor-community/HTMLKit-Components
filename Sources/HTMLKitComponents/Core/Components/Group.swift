import HTMLKit


public struct Group: Component {
        
    internal var content: [AnyContent]
    
    internal var classes: [String]
    
    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        
        self.content = content()
        self.classes = ["group"]
    }
    
    internal init(content: [AnyContent], classes: [String]) {
        
        self.content = content
        self.classes = classes
    }
    
    public var body: AnyContent {
        Division {
            content
        }
        .class(classes.joined(separator: " "))
    }
    
    public var scripts: AnyContent {
        return [content.scripts]
    }
}

extension Group: TextComponent {
    
    public func font(_ style: TextStyle) -> Group {
        
        var newSelf = self
        newSelf.classes.append(style.rawValue)
        return newSelf
    }
    
    public func foregroundColor(_ color: ForegroundColor) -> Group {
        
        var newSelf = self
        newSelf.classes.append(color.rawValue)
        return newSelf
    }
    
    public func fontSize(_ size: FontSize) -> Group {
        
        var newSelf = self
        newSelf.classes.append(size.rawValue)
        return newSelf
    }
    
    public func fontWeight(_ weight: FontWeight) -> Group {
        
        var newSelf = self
        newSelf.classes.append(weight.rawValue)
        return newSelf
    }
    
    public func fontTransformation(_ transformation: TextTransformation) -> Group {
        
        var newSelf = self
        newSelf.classes.append(transformation.rawValue)
        return newSelf
    }
    
    public func fontStyle(_ style: FontStyle) -> Group {
        
        var newSelf = self
        newSelf.classes.append(style.rawValue)
        return newSelf
    }
    
    public func bold() -> Group {
        
        var newSelf = self
        newSelf.classes.append(FontWeight.bold.rawValue)
        return newSelf
    }
    
    public func italic() -> Group {
        
        var newSelf = self
        newSelf.classes.append(FontStyle.italic.rawValue)
        return newSelf
    }
    
    public func underline() -> Group {
        
        var newSelf = self
        newSelf.classes.append(TextDecoration.underline.rawValue)
        return newSelf
    }
}
