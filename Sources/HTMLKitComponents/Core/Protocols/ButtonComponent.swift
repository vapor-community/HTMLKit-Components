public protocol ButtonComponent {
    
    func buttonSize(_ size: ButtonSize) -> Self
 
    func buttonStyle(_ style: ButtonStyle) -> Self
    
    func borderShape(_ shape: BorderShape) -> Self
    
    func backgroundColor(_ color: BackgroundColor) -> Self
}

