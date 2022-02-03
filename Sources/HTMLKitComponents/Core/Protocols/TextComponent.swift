internal protocol TextComponent {
    
    var classes: [String] { get set }
}

extension TextComponent {
    
    public func foregroundColor(_ color: ForegroundColor) -> Self {
        
        var newSelf = self
        newSelf.classes.append(color.rawValue)
        return newSelf
    }
    
    public func fontSize(_ size: FontSize) -> Self {
        
        var newSelf = self
        newSelf.classes.append(size.rawValue)
        return newSelf
    }
    
    public func fontWeight(_ weight: FontWeight) -> Self {
        
        var newSelf = self
        newSelf.classes.append(weight.rawValue)
        return newSelf
    }
    
    public func fontTransformation(_ transformation: TextTransformation) -> Self {
        
        var newSelf = self
        newSelf.classes.append(transformation.rawValue)
        return newSelf
    }
    
    public func bold() -> Self {
        
        var newSelf = self
        newSelf.classes.append(FontWeight.bold.rawValue)
        return newSelf
    }
    
    public func italic() -> Self {
        
        var newSelf = self
        newSelf.classes.append(FontStyle.italic.rawValue)
        return newSelf
    }
    
    public func underline() -> Self {
     
        var newSelf = self
        newSelf.classes.append(TextDecoration.underline.rawValue)
        return newSelf
    }
}
