internal protocol ImageComponent {
    
    var classes: [String] { get set }
}

extension ImageComponent {
    
    public func objectFit(_ fit: ObjectFit) -> Self {
        
        var newSelf = self
        newSelf.classes.append(fit.rawValue)
        return newSelf
    }
    
    public func imageScale(_ scale: ImageScale) -> Self {
        
        var newSelf = self
        newSelf.classes.append(scale.rawValue)
        return newSelf
    }
    
    public func clipShape(_ shape: ClipShape) -> Self {
        
        var newSelf = self
        newSelf.classes.append(shape.rawValue)
        return newSelf
    }
}
