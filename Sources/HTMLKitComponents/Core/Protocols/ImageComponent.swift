public protocol ImageComponent {
    
    func objectFit(_ fit: ObjectFit) -> Self
    
    func imageScale(_ scale: ImageScale) -> Self
    
    func clipShape(_ shape: ClipShape) -> Self
}
