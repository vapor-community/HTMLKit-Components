import HTMLKit

public struct Snippet: Component {
    
    internal var lines: [AnyContent]
    
    internal var classes: [String]
    
    public init(lines: [String]) {
        
        self.lines = lines.map { line in Code { line } }
        self.classes = ["snippet"]
    }
    
    internal init(lines: [AnyContent], classes: [String]) {
        
        self.lines = lines
        self.classes = classes
    }
    
    public var body: AnyContent {
        PreformattedText {
            lines
        }
        .class(classes.joined(separator: " "))
    }
}
