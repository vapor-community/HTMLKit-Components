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

public struct Text: HTMLComponent {

    private let size: FontSize
    private let weight: FontWeight
    private let transformation: TextTransformation
    private let content: HTML
    
    public init(size: FontSize = .regular, weight: FontWeight = .regular, transformation: TextTransformation = .normal, @HTMLBuilder builder: () -> HTML) {
        self.size = size
        self.weight = weight
        self.transformation = transformation
        self.content = builder()
    }
    
    public var body: HTML {
        P { content }
            .class("text size:\(size) weight:\(weight) transformation:\(transformation)")
    }
}
