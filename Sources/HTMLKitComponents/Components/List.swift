import HTMLKit

public enum ColumnAlignment: String {
    case left
    case center
    case right
}

public struct ListContainer: HTMLComponent {
    
    private let content: HTMLContent
    
    public init(@HTMLBuilder builder: () -> HTMLContent) {
        self.content = builder()
    }
    
    public var body: HTMLContent {
        Div {
            content
        }
        .class("list")
    }
}

public struct ListHeader: HTMLComponent {
    
    private let content: HTMLContent
    
    public init(@HTMLBuilder builder: () -> HTMLContent) {
        self.content = builder()
    }
    
    public var body: HTMLContent {
        Div {
            content
        }
        .class("list-header")
    }
}

public struct ListBody: HTMLComponent {
    
    private let content: HTMLContent
    
    public init(@HTMLBuilder builder: () -> HTMLContent) {
        self.content = builder()
    }
    
    public var body: HTMLContent {
        UnorderedList {
            content
        }
        .class("list-body")
    }
}

public struct ListRow: HTMLComponent {

    private let content: HTMLContent
    
    public init(@HTMLBuilder builder: () -> HTMLContent) {
        self.content = builder()
    }
    
    public var body: HTMLContent {
        ListItem {
            content
        }
        .class("list-row")
    }
}

public struct ListColumn: HTMLComponent {
    
    private let size: ColumnSize
    private let alignment: ColumnAlignment
    private let content: HTMLContent
    
    public init(size: ColumnSize, alignment: ColumnAlignment = .left, @HTMLBuilder builder: () -> HTMLContent) {
        self.size = size
        self.alignment = alignment
        self.content = builder()
    }
    
    public var body: HTMLContent {
        Div {
            content
        }
        .class("list-column size:\(size) alignment:\(alignment)")
    }
}

public struct ListFooter: HTMLComponent {
    
    private let content: HTMLContent
    
    public init(@HTMLBuilder builder: () -> HTMLContent) {
        self.content = builder()
    }
    
    public var body: HTMLContent {
        Div {
            content
        }
        .class("list-footer")
    }
}

