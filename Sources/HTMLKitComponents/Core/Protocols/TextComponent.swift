/*
 Abstract:
 The file contains the modifiers for text components.
 */

public protocol TextComponent {
    
    /// Sets the style of the text.
    ///
    /// - Parameters:
    ///    - style:
    ///
    /// - Returns: A component
    func font(_ style: TextStyle) -> Self
    
    /// Sets the foreground color of the text.
    ///
    /// - Parameters:
    ///    - color:
    ///
    /// - Returns: A component
    func foregroundColor(_ color: ForegroundColor) -> Self
    
    /// Sets the size of the text.
    ///
    /// - Parameters:
    ///    - size:
    ///
    /// - Returns: A component
    func fontSize(_ size: FontSize) -> Self
    
    /// Sets the weight of the text.
    ///
    /// - Parameters:
    ///    - weight:
    ///
    /// - Returns:
    func fontWeight(_ weight: FontWeight) -> Self
    
    /// Sets the transformation for the text.
    ///
    /// - Parameters:
    ///    - transformation:
    ///
    /// - Returns: A component
    func fontTransformation(_ transformation: TextTransformation) -> Self
    
    /// Sets the style of the font.
    ///
    /// - Parameters:
    ///    - style:
    ///
    /// - Returns: A component
    func fontStyle(_ style: FontStyle) -> Self
    
    /// Applies a bold font weight to the text.
    ///
    /// - Returns: A component
    func bold() -> Self
    
    /// Applies italics to the text.
    ///
    /// - Returns: A component
    func italic() -> Self
    
    /// Applies an underline to the text.
    ///
    /// - Returns: A component
    func underline() -> Self
}
