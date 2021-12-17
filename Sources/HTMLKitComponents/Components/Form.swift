import HTMLKit

public struct FormContainer: Component {
    
    private let content: [FormElement]
    
    init(@ContentBuilder<FormElement> content: () -> [FormElement]) {
        self.content = content()
    }
    
    public var body: AnyContent {
        Form {
            content
        }
        .method(.post)
        .class("form")
    }
}

public struct FormHeader: Component {
    
    private let content: AnyContent
    
    public init(@ContentBuilder<AnyContent> content: () -> AnyContent) {
        self.content = content()
    }
    
    public var body: AnyContent {
        Division {
            content
        }
        .class("form-header")
    }
}

public struct FormBody: Component {
    
    private let content: AnyContent
    
    public init(@ContentBuilder<AnyContent> content: () -> AnyContent) {
        self.content = content()
    }
    
    public var body: AnyContent {
        Division {
            content
        }
        .class("form-body")
    }
}

public struct FormFooter: Component {
    
    private let content: AnyContent
    
    public init(@ContentBuilder<AnyContent> content: () -> AnyContent) {
        self.content = content()
    }
    
    public var body: AnyContent {
        Division {
            content
        }
        .class("form-footer")
    }
}

public struct FormRow: Component {
    
    private let content: AnyContent
    
    public init(@ContentBuilder<AnyContent> content: () -> AnyContent) {
        self.content = content()
    }
    
    public var body: AnyContent {
        Division {
            content
        }
        .class("form-row")
    }
}

public struct FormColumn: Component {
    
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
        .class("form-column size:\(size.rawValue)")
    }
}

public struct TextareaInput: Component {
    
    private let title: TemplateValue<String>
    private let name: TemplateValue<String>
    private var placeholder: TemplateValue<String?>
    private let isRequired: Bool
    private let content: [String]
    
    public init(title: TemplateValue<String>, name: TemplateValue<String>, placeholder: TemplateValue<String?>, isRequired: Bool = false, @ContentBuilder<String> content: () -> [String]) {
        self.title = title
        self.name = name
        self.placeholder = placeholder
        self.isRequired = isRequired
        self.content = content()
    }
    
    public var body: AnyContent {
        Division {
            Label {
                title
                
            }
            .class("label")
            .modify(if: isRequired) {
                $0.class("label required-indicator")
            }
            TextArea {
                content
            }
            .id(name.rawValue)
            .name(name.rawValue)
            .class("input type:textarea")
            .modify(unwrap: placeholder) {
                $0.placeholder($1)
            }
        }
        .class("input-group")
    }
}

public struct TextInput: Component {
    
    private let title: TemplateValue<String>
    private let name: TemplateValue<String>
    private var placeholder: TemplateValue<String?>
    private var value: TemplateValue<String?>
    private let isRequired: Bool
    
    public init(title: TemplateValue<String>, name: TemplateValue<String>, value: TemplateValue<String?>, placeholder: TemplateValue<String?>, isRequired: Bool = false) {
        self.title = title
        self.name = name
        self.value = value
        self.placeholder = placeholder
        self.isRequired = isRequired
    }
    
    public var body: AnyContent {
        Division {
            Label { title }
                .class("label")
                .modify(if: isRequired) {
                    $0.class("label required-indicator")
                }
            Input()
                .type(.text)
                .id(name)
                .name(name)
                .class("input type:text")
                .modify(unwrap: placeholder) {
                    $0.placeholder($1)
                }
        }
        .class("input-group")
    }
}

public struct PasswordInput: Component {
    
    private let title: TemplateValue<String>
    private let name: TemplateValue<String>
    private var value: TemplateValue<String?>
    private var placeholder: TemplateValue<String?>
    private let isRequired: Bool
    
    public init(title: TemplateValue<String>, name: TemplateValue<String>, value: TemplateValue<String?>, placeholder: TemplateValue<String?>, isRequired: Bool = false) {
        self.title = title
        self.name = name
        self.value = value
        self.placeholder = placeholder
        self.isRequired = isRequired
    }
    
    public var body: AnyContent {
        Division {
            Label { title }
                .class("label")
                .modify(if: isRequired) {
                    $0.class("label required-indicator")
                }
            Input()
                .type(.password)
                .id(name)
                .name(name)
                .class("input type:password")
                .modify(unwrap: placeholder) {
                    $0.placeholder($1)
                }
        }
        .class("input-group")
    }
}

public struct SubmitButton: Component {
    
    private let title: TemplateValue<String>
    
    public init(title: TemplateValue<String>) {
        self.title = title
    }
    
    public var body: AnyContent {
        Button { title }
            .type(.submit)
            .class("button variation:primary")
            .role("button")
    }
}

public struct ResetButton: Component {
    
    private let title: TemplateValue<String>
    
    public init(title: TemplateValue<String>) {
        self.title = title
    }
    
    public var body: AnyContent {
        Button {
            title
        }
        .type(.reset)
        .class("button variation:secondary")
        .role("button")
    }
}
