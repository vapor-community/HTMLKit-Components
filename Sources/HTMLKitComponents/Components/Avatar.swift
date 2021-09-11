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

public struct Avatar: HTMLComponent {
    
    private let link: HTML
    private let size: AvatarSize
    private let status: AvatarStatus
    
    public init(uri: TemplateValue<String>, size: AvatarSize = .regular, status: AvatarStatus = .available) {
        self.link = uri
        self.size = size
        self.status = status
    }
    
    public var body: HTML {
        Div {
            Div {
                Img()
                    .source(link)
                    .class("avatar-image")
            }
            .class("avatar-status status:\(status)")
        }
        .class("avatar")
    }
}

public struct AvatarGroup: HTMLComponent {
    
    private let content: HTML
    
    public init(@HTMLBuilder builder: () -> HTML) {
        self.content = builder()
    }
    
    public var body: HTML {
        Div {
            content
        }
        .class("avatar-group")
    }
}

