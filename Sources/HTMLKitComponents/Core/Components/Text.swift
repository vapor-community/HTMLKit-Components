import HTMLKit

public struct Text: Component {

    internal var content: [AnyContent]
    
    internal var classes: [String]
    
    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        
        self.content = content()
        self.classes = ["text"]
    }
    
    internal init(content: [AnyContent], classes: [String]) {
        
        self.content = content
        self.classes = classes
    }
    
    public var body: AnyContent {
        Paragraph {
            content
        }
        .class(classes.joined(separator: " "))
    }
}

extension Text: TextComponent {
    
    public func font(_ style: TextStyle) -> Text {
        
        var newSelf = self
        newSelf.classes.append(style.rawValue)
        return newSelf
    }
    
    public func foregroundColor(_ color: ForegroundColor) -> Text {
        
        var newSelf = self
        newSelf.classes.append(color.rawValue)
        return newSelf
    }
    
    public func fontSize(_ size: FontSize) -> Text {
        
        var newSelf = self
        newSelf.classes.append(size.rawValue)
        return newSelf
    }
    
    public func fontWeight(_ weight: FontWeight) -> Text {
        
        var newSelf = self
        newSelf.classes.append(weight.rawValue)
        return newSelf
    }
    
    public func fontTransformation(_ transformation: TextTransformation) -> Text {
        
        var newSelf = self
        newSelf.classes.append(transformation.rawValue)
        return newSelf
    }
    
    public func fontStyle(_ style: FontStyle) -> Text {
        
        var newSelf = self
        newSelf.classes.append(style.rawValue)
        return newSelf
    }
    
    public func bold() -> Text {
        
        var newSelf = self
        newSelf.classes.append(FontWeight.bold.rawValue)
        return newSelf
    }
    
    public func italic() -> Text {
        
        var newSelf = self
        newSelf.classes.append(FontStyle.italic.rawValue)
        return newSelf
    }
    
    public func underline() -> Text {
        
        var newSelf = self
        newSelf.classes.append(TextDecoration.underline.rawValue)
        return newSelf
    }
}
