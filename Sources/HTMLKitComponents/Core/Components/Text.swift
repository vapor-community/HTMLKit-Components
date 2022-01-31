import HTMLKit

public struct Text: Component {

    private let content: AnyContent
    private var classes: [String]
    
    public init(@ContentBuilder<AnyContent> content: () -> AnyContent) {
        self.content = content()
        self.classes = ["text"]
    }
    
    internal init(content: AnyContent, classes: [String]) {
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

extension Text {
    
    public func foregroundColor(_ color: ForegroundColor) -> Text {
        
        var classes = self.classes
        classes.append(color.rawValue)
        
        return Text(content: self.content, classes: classes)
    }
    
    public func fontSize(_ size: FontSize) -> Text {
        
        var classes = self.classes
        classes.append(size.rawValue)
        
        return Text(content: self.content, classes: classes)
    }
    
    public func fontWeight(_ weight: FontWeight) -> Text {
        
        var classes = self.classes
        classes.append(weight.rawValue)
        
        return Text(content: self.content, classes: classes)
    }
    
    public func fontTransformation(_ transformation: TextTransformation) -> Text {
        
        var classes = self.classes
        classes.append(transformation.rawValue)
        
        return Text(content: self.content, classes: classes)
    }
    
    public func bold() -> Text {
        
        var classes = self.classes
        classes.append(FontWeight.bold.rawValue)
        
        return Text(content: self.content, classes: classes)
    }
    
    public func italic() -> Text {
        
        var classes = self.classes
        classes.append(FontStyle.italic.rawValue)
        
        return Text(content: self.content, classes: classes)
    }
    
    public func underline() -> Text {
     
        var classes = self.classes
        classes.append(TextDecoration.underline.rawValue)
        
        return Text(content: self.content, classes: classes)
    }
}
