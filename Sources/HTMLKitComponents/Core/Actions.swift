public enum ViewAction {
    
    case show(_ target: String)
    case dismiss(_ target: String)
    
    public var script: String {
        
        switch self {
        case .show(let target):
            return show(target)
        case .dismiss(let target):
            return dismiss(target)
        }
    }
    
    private func show(_ target: String) -> String {
        return "$('#\(target)').show();"
    }
    
    private func dismiss(_ target: String) -> String {
        return "$('#\(target)').hide();"
    }
}
