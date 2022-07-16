/*
 Abstract:
 The file contains the modifiers for button components.
 */

public protocol ButtonComponent {
    
    /// Sets the size of the button.
    ///
    /// - Parameters:
    ///    - size:
    ///
    /// - Returns: A component
    func buttonSize(_ size: ButtonSize) -> Self
 
    /// Sets the style of the button.
    ///
    /// - Parameters:
    ///    - style:
    ///
    /// - Returns: A component
    func buttonStyle(_ style: ButtonStyle) -> Self
    
    /// Sets the shape of the button.
    ///
    /// - Parameters:
    ///    - shape:
    ///
    /// - Returns: A component
    func borderShape(_ shape: BorderShape) -> Self
    
    /// Sets the background color.
    ///
    /// - Parameters:
    ///    - color:
    ///
    /// - Returns: A component
    func backgroundColor(_ color: BackgroundColor) -> Self
}

