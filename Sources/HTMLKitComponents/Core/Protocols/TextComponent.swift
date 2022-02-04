public protocol TextComponent {
    
    func font(_ style: TextStyle) -> Self
    
    func foregroundColor(_ color: ForegroundColor) -> Self
    
    func fontSize(_ size: FontSize) -> Self
    
    func fontWeight(_ weight: FontWeight) -> Self
    
    func fontTransformation(_ transformation: TextTransformation) -> Self
    
    func fontStyle(_ style: FontStyle) -> Self
    
    func bold() -> Self
    
    func italic() -> Self
    
    func underline() -> Self
}
