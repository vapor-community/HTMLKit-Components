import HTMLKit

public struct FormContainer: Component {
    
    internal var content: [FormElement]
    
    internal var classes: [String]
    
    public init(@ContentBuilder<FormElement> content: () -> [FormElement]) {
        
        self.content = content()
        self.classes = ["form"]
    }
    
    internal init(content: [FormElement], classes: [String]) {
        
        self.content = content
        self.classes = classes
    }
    
    public var body: AnyContent {
        Form {
            content
        }
        .method(.post)
        .class(classes.joined(separator: " "))
    }
}

public struct FieldLabel: Component {
    
    internal var content: [AnyContent]
    
    internal var classes: [String]
    
    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
    
        self.content = content()
        self.classes = ["label"]
    }
    
    internal init(content: [AnyContent], classes: [String]) {
        
        self.content = content
        self.classes = classes
    }
    
    public var body: AnyContent {
        Label {
            content
        }
        .class(classes.joined(separator: " "))
    }
}

public struct TextField: Component {
    
    internal let name: TemplateValue<String>
    
    internal var rows: Int = 1
    
    internal var content: [String]
    
    internal var classes: [String]
    
    public init(name: TemplateValue<String>, @ContentBuilder<String> content: () -> [String]) {
        
        self.name = name
        self.content = content()
        self.classes = ["input", "type:text"]
    }
    
    internal init(name: TemplateValue<String>, rows: Int, content: [String], classes: [String]) {
        
        self.name = name
        self.rows = rows
        self.content = content
        self.classes = classes
    }
    
    public var body: AnyContent {
        TextArea {
            content
        }
        .id(name)
        .name(name)
        .class(classes.joined(separator: " "))
        .rows(rows)
    }
}

extension TextField {
    
    public func lineLimit(_ value: Int) -> TextField {
        
        return TextField(name: self.name, rows: value, content: self.content, classes: self.classes)
    }
}

public struct SelectField: Component {
    
    internal let name: TemplateValue<String>
    
    internal var content: [InputElement]
    
    internal var classes: [String]
    
    public init(name: TemplateValue<String>, content: [InputElement]) {
        
        self.name = name
        self.content = content
        self.classes = ["input", "type:select"]
    }
    
    internal init(name: TemplateValue<String>, content: [InputElement], classes: [String]) {
        
        self.name = name
        self.content = content
        self.classes = classes
    }
    
    public var body: AnyContent {
        Select {
            content
        }
        .id(name)
        .name(name)
        .class(classes.joined(separator: " "))
    }
}

public struct SecureField: Component {
    
    internal let name: TemplateValue<String>
    
    internal let value: TemplateValue<String?>
    
    internal var classes: [String]
    
    public init(name: TemplateValue<String>, value: TemplateValue<String?> = .constant(nil)) {
        
        self.name = name
        self.value = value
        self.classes = ["input", "type:password"]
    }
    
    internal init(name: TemplateValue<String>, value: TemplateValue<String?>, classes: [String]) {
        
        self.name = name
        self.value = value
        self.classes = classes
    }
    
    public var body: AnyContent {
        Input()
            .type(.password)
            .id(name)
            .name(name)
            .class(classes.joined(separator: " "))
            .modify(unwrap: value) {
                $0.value($1)
            }
    }
}

public struct SearchField: Component {
    
    internal let name: TemplateValue<String>
    
    internal let value: TemplateValue<String?>
    
    internal var classes: [String]
    
    public init(name: TemplateValue<String>, value: TemplateValue<String?> = .constant(nil)) {
        
        self.name = name
        self.value = value
        self.classes = ["input", "type:search"]
    }
    
    internal init(name: TemplateValue<String>, value: TemplateValue<String?>, classes: [String]) {
        
        self.name = name
        self.value = value
        self.classes = classes
    }
    
    public var body: AnyContent {
        Input()
            .type(.search)
            .id(name)
            .name(name)
            .class(classes.joined(separator: " "))
            .modify(unwrap: value) {
                $0.value($1)
            }
    }
}

public struct SubmitButton: Component {
    
    internal let label: TemplateValue<String>
    
    internal var classes: [String]
    
    public init(label: TemplateValue<String>) {
        self.label = label
        self.classes = ["button", ButtonStyle.primary.rawValue]
    }
    
    public var body: AnyContent {
        Button {
            label
        }
        .type(.submit)
        .class(classes.joined(separator: " "))
        .role(.button)
    }
}

public struct ResetButton: Component {
    
    internal let label: TemplateValue<String>
    
    internal var classes: [String]
    
    public init(label: TemplateValue<String>) {
        
        self.label = label
        self.classes = ["button", ButtonStyle.secondary.rawValue]
    }
    
    public var body: AnyContent {
        Button {
            label
        }
        .type(.reset)
        .class(classes.joined(separator: " "))
        .role(.button)
    }
}
