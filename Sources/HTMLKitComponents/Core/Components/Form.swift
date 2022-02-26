import HTMLKit

public struct FormContainer: Component {
    
    internal var content: [FormElement]
    
    internal var classes: [String]
    
    internal var events: [String]?
    
    public init(@ContentBuilder<FormElement> content: () -> [FormElement]) {
        
        self.content = content()
        self.classes = ["form"]
    }
    
    internal init(content: [FormElement], classes: [String], events: [String]?) {
        
        self.content = content
        self.classes = classes
        self.events = events
    }
    
    public var body: AnyContent {
        Form {
            content
        }
        .method(.post)
        .class(classes.joined(separator: " "))
    }
    
    public var scripts: AnyContent {
        
        if let events = self.events {
            return [content.scripts, Script { events }]
        }
        
        return [content.scripts]
    }
}

public struct FieldLabel: Component {
    
    internal let id: TemplateValue<String>
    
    internal var content: [AnyContent]
    
    internal var classes: [String]
    
    internal var events: [String]?
    
    public init(for id: TemplateValue<String>, @ContentBuilder<AnyContent> content: () -> [AnyContent]) {
    
        self.id = id
        self.content = content()
        self.classes = ["label"]
    }
    
    internal init(for id: TemplateValue<String>, content: [AnyContent], classes: [String], events: [String]?) {
        
        self.id = id
        self.content = content
        self.classes = classes
        self.events = events
    }
    
    public var body: AnyContent {
        Label {
            content
        }
        .for(id.rawValue)
        .class(classes.joined(separator: " "))
    }
}

public struct TextField: Component {
    
    internal let name: TemplateValue<String>
    
    internal var rows: Int = 1
    
    internal var content: [String]
    
    internal var classes: [String]
    
    internal var events: [String]?
    
    public init(name: TemplateValue<String>, @ContentBuilder<String> content: () -> [String]) {
        
        self.name = name
        self.content = content()
        self.classes = ["input", "type:textfield", "resize:false"]
    }
    
    internal init(name: TemplateValue<String>, rows: Int, content: [String], classes: [String], events: [String]?) {
        
        self.name = name
        self.rows = rows
        self.content = content
        self.classes = classes
        self.events = events
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
    
    public var scripts: AnyContent {
        
        if let events = self.events {
            return [content.scripts, Script { events }]
        }
        
        return [content.scripts]
    }
}

extension TextField {
    
    public func lineLimit(_ value: Int) -> TextField {
        
        return TextField(name: self.name, rows: value, content: self.content, classes: self.classes, events: self.events)
    }
}

public struct CheckField: Component {
    
    internal let name: TemplateValue<String>
    
    internal let value: TemplateValue<String>
    
    internal var classes: [String]
    
    internal var events: [String]?
    
    public init(name: TemplateValue<String>, value: TemplateValue<String>) {
        
        self.name = name
        self.value = value
        self.classes = ["input", "type:checkfield"]
    }
    
    internal init(name: TemplateValue<String>, value: TemplateValue<String>, classes: [String], events: [String]?) {
        
        self.name = name
        self.value = value
        self.classes = classes
        self.events = events
    }
    
    public var body: AnyContent {
        Input()
            .type(.checkbox)
            .id(name)
            .name(name)
            .value(value)
            .class(classes.joined(separator: " "))
    }
    
    public var scripts: AnyContent {
        
        if let events = self.events {
            return [Script { events }]
        }
        
        return []
    }
}

public struct RadioSelect: Component {
    
    internal let name: TemplateValue<String>
    
    internal let value: TemplateValue<String>
    
    internal var classes: [String]
    
    internal var events: [String]?
    
    public init(name: TemplateValue<String>, value: TemplateValue<String>) {
        
        self.name = name
        self.value = value
        self.classes = ["input", "type:radioselect"]
    }
    
    internal init(name: TemplateValue<String>, value: TemplateValue<String>, classes: [String], events: [String]?) {
        
        self.name = name
        self.value = value
        self.classes = classes
        self.events = events
    }
    
    public var body: AnyContent {
        Input()
            .type(.radio)
            .id(name)
            .name(name)
            .value(value)
            .class(classes.joined(separator: " "))
    }
    
    public var scripts: AnyContent {
        
        if let events = self.events {
            return [Script { events }]
        }
        
        return []
    }
}

public struct SelectField: Component {
    
    internal let name: TemplateValue<String>
    
    internal var content: [InputElement]
    
    internal var classes: [String]
    
    internal var events: [String]?
    
    public init(name: TemplateValue<String>, content: [InputElement]) {
        
        self.name = name
        self.content = content
        self.classes = ["input", "type:selectfield"]
    }
    
    internal init(name: TemplateValue<String>, content: [InputElement], classes: [String], events: [String]?) {
        
        self.name = name
        self.content = content
        self.classes = classes
        self.events = events
    }
    
    public var body: AnyContent {
        Select {
            content
        }
        .id(name)
        .name(name)
        .class(classes.joined(separator: " "))
    }
    
    public var scripts: AnyContent {
        
        if let events = self.events {
            return [content.scripts, Script { events }]
        }
        
        return [content.scripts]
    }
}

public struct SecureField: Component {
    
    internal let name: TemplateValue<String>
    
    internal let value: TemplateValue<String?>
    
    internal var classes: [String]
    
    internal var events: [String]?
    
    public init(name: TemplateValue<String>, value: TemplateValue<String?> = .constant(nil)) {
        
        self.name = name
        self.value = value
        self.classes = ["input", "type:securefield"]
    }
    
    internal init(name: TemplateValue<String>, value: TemplateValue<String?>, classes: [String], events: [String]?) {
        
        self.name = name
        self.value = value
        self.classes = classes
        self.events = events
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
    
    public var scripts: AnyContent {
        
        if let events = self.events {
            return [Script { events }]
        }
        
        return []
    }
}

public struct RangeSlider: Component {
    
    internal let name: TemplateValue<String>
    
    internal var classes: [String]
    
    internal var events: [String]?
    
    public init(name: TemplateValue<String>) {
        
        self.name = name
        self.classes = ["input", "type:rangeslider"]
    }
    
    internal init(name: TemplateValue<String>, classes: [String], events: [String]?) {
        
        self.name = name
        self.classes = classes
        self.events = events
    }
    
    public var body: AnyContent {
        Input()
            .type(.range)
            .id(name)
            .name(name)
            .class(classes.joined(separator: " "))
    }
    
    public var scripts: AnyContent {
        
        if let events = self.events {
            return [Script { events }]
        }
        
        return []
    }
}

public struct SearchField: Component {
    
    internal let name: TemplateValue<String>
    
    internal let value: TemplateValue<String?>
    
    internal var classes: [String]
    
    internal var events: [String]?
    
    public init(name: TemplateValue<String>, value: TemplateValue<String?> = .constant(nil)) {
        
        self.name = name
        self.value = value
        self.classes = ["input", "type:searchfield"]
    }
    
    internal init(name: TemplateValue<String>, value: TemplateValue<String?>, classes: [String], events: [String]?) {
        
        self.name = name
        self.value = value
        self.classes = classes
        self.events = events
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
    
    public var scripts: AnyContent {
        
        if let events = self.events {
            return [Script { events }]
        }
        
        return []
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
