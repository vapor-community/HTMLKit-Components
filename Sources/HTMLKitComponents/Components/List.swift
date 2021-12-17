import HTMLKit

public enum ColumnAlignment: String {
    case left
    case center
    case right
}

public struct ListContainer: Component {
    
    private let content: AnyContent
    
    public init(@ContentBuilder<AnyContent> content: () -> AnyContent) {
        self.content = content()
    }
    
    public var body: AnyContent {
        Division {
            content
        }
        .class("list")
    }
}

public struct ListHeader: Component {
    
    private let content: AnyContent
    
    public init(@ContentBuilder<AnyContent> content: () -> AnyContent) {
        self.content = content()
    }
    
    public var body: AnyContent {
        Division {
            content
        }
        .class("list-header")
    }
}

public struct ListBody: Component {
    
    private let content: [ListElement]
    
    public init(@ContentBuilder<ListElement> content: () -> [ListElement]) {
        self.content = content()
    }
    
    public var body: AnyContent {
        UnorderedList {
            content
        }
        .class("list-body")
    }
}

public struct ListRow: Component {

    private let content: AnyContent
    
    public init(@ContentBuilder<AnyContent> content: () -> AnyContent) {
        self.content = content()
    }
    
    public var body: AnyContent {
        ListItem {
            content
        }
        .class("list-row")
    }
}

public struct ListColumn: Component {
    
    private let size: ColumnSize
    private let alignment: ColumnAlignment
    private let content: AnyContent
    
    public init(size: ColumnSize, alignment: ColumnAlignment = .left, @ContentBuilder<AnyContent> content: () -> AnyContent) {
        self.size = size
        self.alignment = alignment
        self.content = content()
    }
    
    public var body: AnyContent {
        Division {
            content
        }
        .class("list-column size:\(size.rawValue) alignment:\(alignment.rawValue)")
    }
}

public struct ListFooter: Component {
    
    private let content: AnyContent
    
    public init(@ContentBuilder<AnyContent> content: () -> AnyContent) {
        self.content = content()
    }
    
    public var body: AnyContent {
        Division {
            content
        }
        .class("list-footer")
    }
}

