public enum StackDirection: String {
    
    case vertical = "direction:vertical"
    case horizontal = "direction:horizontal"
}

public enum ColumnAlignment: String {
    
    case left = "alignment:left"
    case center = "alignment:center"
    case right = "alignment:right"
}

public enum ColumnSize: String {
    
    case one = "size:1"
    case two = "size:2"
    case three = "size:3"
    case four = "size:4"
    case five = "size:5"
    case six = "size:6"
    case seven = "size:7"
    case eight = "size:8"
    case nine = "size:9"
    case ten = "size:10"
    case eleven = "size:11"
    case twelve = "size:12"
}

public enum ForegroundColor: String {
    
    case silver = "color:silver"
    case darkgrey = "color:darkgrey"
    case grey = "color:grey"
    case red = "color:red"
    case orange = "color:orange"
    case blue = "color:blue"
    case lightblue = "color:lightblue"
    case green = "color:green"
    case yellow = "color:yellow"
    case white = "color:white"
    case black = "color:black"
    case primary = "color:primary"
    case secondary = "color:secondary"
    case tertiary = "color:tertiary"
}

public enum FontSize: String {
    
    case small = "size:small"
    case medium = "size:medium"
    case large = "size:large"
}

public enum TextTransformation: String {
    
    case uppercase = "transformation:uppercase"
    case lowercase = "transformation:lowercase"
    case capitalize = "transformation:capitalize"
}

public enum FontWeight: String {
    
    case regular = "weight:regular"
    case black = "weight:black"
    case heavy = "weight:heavy"
    case bold = "weight:bold"
    case light = "weight:light"
    case medium = "weight:medium"
    case semibold = "weight:semibold"
    case thin = "weight:thin"
    case ultraLight = "weight:ultralight"
}

public enum TextDecoration: String {
    
    case underline = "decoration:underline"
    case overline = "decoration:overline"
    case strikeThrough = "decoration:strikethrough"
    case none = "decoration:none"
}

public enum FontStyle: String {
    
    case italic = "style:italic"
    case oblique = "style:oblique"
}

public enum BackgroundColor: String {
    
    case silver = "background color:silver"
    case grey = "background color:grey"
    case red = "background color:red"
    case orange = "background color:orange"
    case blue = "background color:blue"
    case green = "background color:green"
    case yellow = "background color:yellow"
    case white = "background color:white"
    case primary = "background color:primary"
    case secondary = "background color:secondary"
    case tertiary = "background color:tertiary"
}

public enum ObjectFit: String {
    
    case contain = "fit:contain"
    case cover = "fit:cover"
    case fill = "fit:fill"
    case scaleDown = "fit:scaledown"
    case none = "fit:none"
}

public enum OpacityValue: String {
    
    case intransparent = "opacity:intransparent"
    case transparent = "opacity:transparent"
}
