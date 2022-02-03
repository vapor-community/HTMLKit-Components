public protocol TextComponent {
    
    func foregroundColor(_ color: ForegroundColor) -> Self
    
    func fontSize(_ size: FontSize) -> Self
    
    func fontWeight(_ weight: FontWeight) -> Self
    
    func fontTransformation(_ transformation: TextTransformation) -> Self
    
    func bold() -> Self
    
    func italic() -> Self
    
    func underline() -> Self
}
