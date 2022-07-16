/*
 Abstract:
 The file contains the modifiers for input components.
 */

public protocol InputComponent {
    
    /// Sets the border shape of the input.
    ///
    /// - Parameters:
    ///    - shape:
    ///
    /// - Returns: A component
    func borderShape(_ shape: BorderShape) -> Self
    
    /// Sets the background color of the input.
    ///
    /// - Parameters:
    ///    - color:
    ///
    /// - Returns: A component
    func backgroundColor(_ color: BackgroundColor) -> Self
}
