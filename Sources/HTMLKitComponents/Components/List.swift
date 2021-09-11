import HTMLKit

public enum ColumnAlignment: String {
    case left
    case center
    case right
}

public struct ListContainer: HTMLComponent {
    
    private let content: HTML
    
    public init(@HTMLBuilder builder: () -> HTML) {
        self.content = builder()
    }
    
    public var body: HTML {
        Div {
            content
        }
        .class("list")
    }
}

public struct ListHeader: HTMLComponent {
    
    private let content: HTML
    
    public init(@HTMLBuilder builder: () -> HTML) {
        self.content = builder()
    }
    
    public var body: HTML {
        Div {
            content
        }
        .class("list-header")
    }
}

public struct ListBody: HTMLComponent {
    
    private let content: HTML
    
    public init(@HTMLBuilder builder: () -> HTML) {
        self.content = builder()
    }
    
    public var body: HTML {
        UnorderedList {
            content
        }
        .class("list-body")
    }
}

public struct ListRow: HTMLComponent {

    private let content: HTML
    
    public init(@HTMLBuilder builder: () -> HTML) {
        self.content = builder()
    }
    
    public var body: HTML {
        ListItem {
            content
        }
        .class("list-row")
    }
}

public struct ListColumn: HTMLComponent {
    
    private let size: ColumnSize
    private let alignment: ColumnAlignment
    private let content: HTML
    
    public init(size: ColumnSize, alignment: ColumnAlignment = .left, @HTMLBuilder builder: () -> HTML) {
        self.size = size
        self.alignment = alignment
        self.content = builder()
    }
    
    public var body: HTML {
        Div {
            content
        }
        .class("list-column size:\(size) alignment:\(alignment)")
    }
}

public struct ListFooter: HTMLComponent {
    
    private let content: HTML
    
    public init(@HTMLBuilder builder: () -> HTML) {
        self.content = builder()
    }
    
    public var body: HTML {
        Div {
            content
        }
        .class("list-footer")
    }
}

