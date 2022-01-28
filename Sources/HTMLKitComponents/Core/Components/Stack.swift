import HTMLKit

public enum StackDirection: String {
    
    case vertical
    case horizontal
}

public enum ColumnSize: String {
    
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case ten = "10"
    case eleven = "11"
    case twelve = "12"
}

public struct Stack: Component {
    
    private let direction: StackDirection
    private let content: AnyContent
    
    public init(direction: StackDirection, @ContentBuilder<AnyContent> content: () -> AnyContent) {
        self.direction = direction
        self.content = content()
    }
    
    public var body: AnyContent {
        Division {
            content
        }
        .class("stack direction:\(direction.rawValue)")
    }
}

public struct StackColumn: Component {
    
    private let size: ColumnSize
    private let content: AnyContent
    
    public init(size: ColumnSize, @ContentBuilder<AnyContent> content: () -> AnyContent) {
        self.size = size
        self.content = content()
    }
    
    public var body: AnyContent {
        Division {
            content
        }
        .class("stack-column size:\(size.rawValue)")
    }
}