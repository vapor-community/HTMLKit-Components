internal protocol ViewComponent {
    
    var classes: [String] { get set }
}

extension ViewComponent {
    
    public func opacity(_ value: OpacityValue) -> Self {
        
        var newSelf = self
        newSelf.classes.append(value.rawValue)
        return newSelf
    }
}
