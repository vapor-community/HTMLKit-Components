import HTMLKit

public enum AvatarSize: String {
    case small
    case regular
    case medium
    case large
}

public enum AvatarStatus: String {
    case available
    case busy
    case unavailable
    case offline
}

public struct Avatar: Component {
    
    private let link: TemplateValue<String>
    private let size: AvatarSize
    private let status: AvatarStatus
    
    public init(uri: TemplateValue<String>, size: AvatarSize = .regular, status: AvatarStatus = .available) {
        self.link = uri
        self.size = size
        self.status = status
    }
    
    public var body: AnyContent {
        Division {
            Division {
                Image()
                    .source(link.rawValue)
                    .class("avatar-image")
            }
            .class("avatar-status status:\(status.rawValue)")
        }
        .class("avatar")
    }
}

public struct AvatarGroup: Component {
    
    private let content: AnyContent
    
    public init(@ContentBuilder<AnyContent> content: () -> AnyContent) {
        self.content = content()
    }
    
    public var body: AnyContent {
        Division {
            content
        }
        .class("avatar-group")
    }
}

