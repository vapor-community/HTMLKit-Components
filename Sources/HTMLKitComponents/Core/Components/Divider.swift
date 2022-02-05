import HTMLKit

public struct Divider: Component {
    
    internal  var classes: [String]
    
    public init() {
        self.classes = ["divider"]
    }
    
    internal init(classes: [String]) {
        self.classes = classes
    }
    
    public var body: AnyContent {
        HorizontalRule()
            .class(classes.joined(separator: " "))
    }
}
