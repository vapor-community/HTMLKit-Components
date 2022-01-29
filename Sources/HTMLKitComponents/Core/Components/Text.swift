import HTMLKit

public enum FontSize: String {
    
    case small = "size:small"
    case medium = "size:medium"
    case large = "size:large"
}

public enum TextTransformation: String {
    
    case uppercase = "transformation:uppercase"
    case lowercase = "transformation:lowercase"
}

public enum FontWeight: String {
    
    case light = "weight:light"
    case medium = "weight:medium"
    case bold = "weight:bold"
}

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
    
    func foregroundColor(_ color: ForegroundColor) -> Text {
        
        var classes = self.classes
        classes.append(color.rawValue)
        
        return Text(content: self.content, classes: classes)
    }
    
    func fontSize(_ size: FontSize) -> Text {
        
        var classes = self.classes
        classes.append(size.rawValue)
        
        return Text(content: self.content, classes: classes)
    }
    
    func fontWeight(_ weight: FontWeight) -> Text {
        
        var classes = self.classes
        classes.append(weight.rawValue)
        
        return Text(content: self.content, classes: classes)
    }
    
    func fontTransformation(_ transformation: TextTransformation) -> Text {
        
        var classes = self.classes
        classes.append(transformation.rawValue)
        
        return Text(content: self.content, classes: classes)
    }
}
