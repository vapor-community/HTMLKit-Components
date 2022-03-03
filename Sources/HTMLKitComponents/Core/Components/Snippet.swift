import HTMLKit

public struct Snippet: Component {
    
    internal var content: [AnyContent]
    
    internal var classes: [String]
    
    public init(highlight: SyntaxHighlight, content: () -> String) {
        
        self.content = content()
            .replacingOccurrences(of: "<", with: "&lt;")
            .replacingOccurrences(of: ">", with: "&gt;")
            .components(separatedBy: "\n")
            .map { line in
                
                return Paragraph { line }
            }
        
        self.classes = ["snippet", highlight.rawValue]
    }
    
    internal init(content: [AnyContent], classes: [String]) {
        
        self.content = content
        self.classes = classes
    }
    
    public var body: AnyContent {
        PreformattedText {
            content
        }
        .class(classes.joined(separator: " "))
    }
}
