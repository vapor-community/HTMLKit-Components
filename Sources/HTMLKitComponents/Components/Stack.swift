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

public struct Stack: HTMLComponent {
    
    private let direction: StackDirection
    private let content: HTML
    
    public init(direction: StackDirection, @HTMLBuilder builder: () -> HTML) {
        self.direction = direction
        self.content = builder()
    }
    
    public var body: HTML {
        Div {
            content
        }
        .class("stack direction:\(direction)")
    }
}

public struct StackColumn: HTMLComponent {
    
    private let size: ColumnSize
    private let content: HTML
    
    public init(size: ColumnSize, @HTMLBuilder builder: () -> HTML) {
        self.size = size
        self.content = builder()
    }
    
    public var body: HTML {
        Div {
            content
        }
        .class("stack-column size:\(size)")
    }
}
