import HTMLKit

public struct FormContainer: HTMLComponent {
    
    private let content: HTMLContent
    
    init(@HTMLBuilder builder: () -> HTMLContent) {
        self.content = builder()
    }
    
    public var body: HTMLContent {
        Form {
            content
        }
        .method(.post)
        .class("form")
    }
}

public struct FormHeader: HTMLComponent {
    
    private let content: HTMLContent
    
    public init(@HTMLBuilder builder: () -> HTMLContent) {
        self.content = builder()
    }
    
    public var body: HTMLContent {
        Div {
            content
        }
        .class("form-header")
    }
}

public struct FormBody: HTMLComponent {
    
    private let content: HTMLContent
    
    public init(@HTMLBuilder builder: () -> HTMLContent) {
        self.content = builder()
    }
    
    public var body: HTMLContent {
        Div {
            content
        }
        .class("form-body")
    }
}

public struct FormFooter: HTMLComponent {
    
    private let content: HTMLContent
    
    public init(@HTMLBuilder builder: () -> HTMLContent) {
        self.content = builder()
    }
    
    public var body: HTMLContent {
        Div {
            content
        }
        .class("form-footer")
    }
}

public struct FormRow: HTMLComponent {
    
    private let content: HTMLContent
    
    public init(@HTMLBuilder builder: () -> HTMLContent) {
        self.content = builder()
    }
    
    public var body: HTMLContent {
        Div {
            content
        }
        .class("form-row")
    }
}

public struct FormColumn: HTMLComponent {
    
    private let size: ColumnSize
    private let content: HTMLContent
    
    public init(size: ColumnSize, @HTMLBuilder builder: () -> HTMLContent) {
        self.size = size
        self.content = builder()
    }
    
    public var body: HTMLContent {
        Div {
            content
        }
        .class("form-column size:\(size)")
    }
}

public struct TextareaInput: HTMLComponent {
    
    private let title: TemplateValue<String>
    private let name: TemplateValue<String>
    private var placeholder: TemplateValue<String>?
    private let isRequired: Conditionable
    private let content: HTMLContent
    
    public init(title: TemplateValue<String>, name: TemplateValue<String>, placeholder: TemplateValue<String>? = nil, isRequired: Conditionable = false, @HTMLBuilder builder: () -> HTMLContent) {
        self.title = title
        self.name = name
        self.placeholder = placeholder
        self.isRequired = isRequired
        self.content = builder()
    }
    
    public var body: HTMLContent {
        Div {
            Label { title }
                .class("label")
                .modify(if: isRequired) {
                    $0.class("label required-indicator")
                }
            TextArea { content }
                .id(name)
                .name(name)
                .placeholder(placeholder)
                .class("input type:textarea")
        }
        .class("input-group")
    }
}

public struct TextInput: HTMLComponent {
    
    private let title: TemplateValue<String>
    private let name: TemplateValue<String>
    private var placeholder: TemplateValue<String>?
    private var value: TemplateValue<String>?
    private let isRequired: Conditionable
    
    public init(title: TemplateValue<String>, name: TemplateValue<String>, value: TemplateValue<String>? = nil, placeholder: TemplateValue<String>? = nil, isRequired: Conditionable = false) {
        self.title = title
        self.name = name
        self.value = value
        self.placeholder = placeholder
        self.isRequired = isRequired
    }
    
    public var body: HTMLContent {
        Div {
            Label { title }
                .class("label")
                .modify(if: isRequired) {
                    $0.class("label required-indicator")
                }
            Input()
                .type(.text)
                .id(name)
                .name(name)
                .placeholder(placeholder)
                .class("input type:text")
        }
        .class("input-group")
    }
}

public struct PasswordInput: HTMLComponent {
    
    private let title: TemplateValue<String>
    private let name: TemplateValue<String>
    private var value: TemplateValue<String>?
    private var placeholder: TemplateValue<String>?
    private let isRequired: Conditionable
    
    public init(title: TemplateValue<String>, name: TemplateValue<String>, value: TemplateValue<String>? = nil, placeholder: TemplateValue<String>?, isRequired: Conditionable = false) {
        self.title = title
        self.name = name
        self.value = value
        self.placeholder = placeholder
        self.isRequired = isRequired
    }
    
    public var body: HTMLContent {
        Div {
            Label { title }
                .class("label")
                .modify(if: isRequired) {
                    $0.class("label required-indicator")
                }
            Input()
                .type(.password)
                .id(name)
                .name(name)
                .placeholder(placeholder)
                .class("input type:password")
        }
        .class("input-group")
    }
}

public struct SubmitButton: HTMLComponent {
    
    private let title: TemplateValue<String>
    
    public init(title: TemplateValue<String>) {
        self.title = title
    }
    
    public var body: HTMLContent {
        Button { title }
            .type(.submit)
            .class("button variation:primary")
            .role("button")
    }
}

public struct ResetButton: HTMLComponent {
    
    private let title: TemplateValue<String>
    
    public init(title: TemplateValue<String>) {
        self.title = title
    }
    
    public var body: HTMLContent {
        Button { title }
            .type(.reset)
            .class("button variation:secondary")
            .role("button")
    }
}
