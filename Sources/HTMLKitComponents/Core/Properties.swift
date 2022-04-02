import HTMLKit

public enum FlowDirection: String {
    
    case vertical = "direction:vertical"
    case horizontal = "direction:horizontal"
}

public enum TextAlignment: String {
    
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
    
    case black = "color:black"
    case white = "color:white"
    case blue = "color:blue"
    case brown = "color:brown"
    case cyan = "color:cyan"
    case green = "color:green"
    case indigo = "color:indigo"
    case mint = "color:mint"
    case pink = "color:pink"
    case purple = "color:purple"
    case red = "color:red"
    case teal = "color:teal"
    case orange = "color:orange"
    case yellow = "color:yellow"
    case gray = "color:gray"
    case silver = "color:silver"
    case highlight = "color:highlight"
    case primary = "color:primary"
    case secondary = "color:secondary"
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
    
    case black = "background:black"
    case white = "background:white"
    case blue = "background:blue"
    case brown = "background:brown"
    case cyan = "background:cyan"
    case green = "background:green"
    case indigo = "background:indigo"
    case mint = "background:mint"
    case pink = "background:pink"
    case purple = "background:purple"
    case red = "background:red"
    case teal = "background:teal"
    case orange = "background:orange"
    case yellow = "background:yellow"
    case gray = "background:gray"
    case silver = "background:silver"
    case highlight = "background:highlight"
    case primary = "background:primary"
    case secondary = "background:secondary"
    case transparent = "background:transparent"
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

public enum ColumnOffset: String {
    
    case one = "offset:1"
    case two = "offset:2"
    case three = "offset:3"
    case four = "offset:4"
    case five = "offset:5"
    case six = "offset:6"
    case seven = "offset:7"
    case eight = "offset:8"
    case nine = "offset:9"
    case ten = "offset:10"
    case eleven = "offset:11"
}

public enum ImageScale: String {
    
    case small = "scale:small"
    case medium = "scale:medium"
    case large = "scale:large"
}

public enum ClipShape: String {
    
    case smallrounded = "shape:smallrounded"
    case largerounded = "shape:largerounded"
    case circle = "shape:circle"
}

public enum PositionIndex: String {
    
    case one = "zindex:1"
    case two = "zindex:2"
    case three = "zindex:3"
    case four = "zindex:4"
    case five = "zindex:5"
}

public enum TextStyle: String {
    
    case title = "style:title"
    case headline = "style:headline"
    case subheadline = "style:subheadline"
    case body = "style:body"
    case callout = "style:callout"
    case caption = "style:caption"
    case footnote = "style:footnote"
    case code = "style:code"
}

public enum VerticalAlignment: String {
    
    case top = "alignment:top"
    case center = "alignment:center"
    case bottom = "alignment:bottom"
    case baseline = "alignment:baseline"
}

public enum HorizontalAlignment: String {
    
    case leading = "alignment:leading"
    case center = "alignment:center"
    case trailing = "alignment:trailing"
}

public enum ContentSpace: String {
    
    case around = "space:around"
    case between = "space:between"
    case evenly = "space:evenly"
}

public enum SyntaxHighlight: String {
    
    case plaintext = "hightlight:plaintext"
    case html = "hightlight:html"
    case css = "hightlight:css"
    case javascript = "hightlight:javascript"
}

public enum ButtonStyle: String {
    
    case primary = "style:primary"
    case secondary = "style:secondary"
    case outline = "style:outline"
}

public enum BorderShape: String {
    
    case smallrounded = "shape:smallrounded"
    case largerounded = "shape:largerounded"
    case fullrounded = "shape:fullrounded"
    case circle = "shape:cirlce"
}

public enum ButtonSize: String {
    
    case full = "size:full"
    case large = "size:large"
    case medium = "size:medium"
    case small = "size:small"
}

public enum ItemRatio: String {
    
    case quarter = "ratio:25"
    case third = "ratio:33"
    case half = "ratio:50"
}

public enum CollectionStyle: String {
    
    case grid = "style:grid"
    case carousel = "style:carousel"
}

public enum ListStyle: String {

    case grouped = "style:grouped"
    case accordion = "style:accordion"
    case tab = "style:tab"
}
