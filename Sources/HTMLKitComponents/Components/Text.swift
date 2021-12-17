import HTMLKit

public enum FontSize: String {
    case small
    case regular
    case medium
    case large
}

public enum TextTransformation: String {
    
    case normal
    case uppercase
    case lowercase
}

public enum FontWeight: String {
    
    case light
    case regular
    case medium
    case bold
}

public struct Text: Component {

    private let size: FontSize
    private let weight: FontWeight
    private let transformation: TextTransformation
    private let content: AnyContent
    
    public init(size: FontSize = .regular, weight: FontWeight = .regular, transformation: TextTransformation = .normal, @ContentBuilder<AnyContent> content: () -> AnyContent) {
        self.size = size
        self.weight = weight
        self.transformation = transformation
        self.content = content()
    }
    
    public var body: AnyContent {
        Paragraph {
            content
        }
        .class("text size:\(size.rawValue) weight:\(weight.rawValue) transformation:\(transformation.rawValue)")
    }
}
