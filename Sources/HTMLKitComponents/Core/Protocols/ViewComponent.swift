public protocol ViewComponent {

    func opacity(_ value: OpacityValue) -> Self
    
    func zIndex(_ index: PositionIndex) -> Self
    
    func backgroundColor(_ color: BackgroundColor) -> Self
}
