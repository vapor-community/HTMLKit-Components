import HTMLKit
import Foundation

public struct Symbol: Component {
    
    internal let content: [VectorElement]
    
    internal var classes: [String]
    
    public init?(named name: String) {
        
        let url = URL(fileURLWithPath: "./public/css/symbols").appendingPathComponent(name).appendingPathExtension("svg")
        
        if !FileManager.default.fileExists(atPath: url.path) {
            return nil
        }

        do {
            self.content = try Parser.load(contentsOfFile: url)
        } catch {
            return nil
        }

        self.classes = ["symbol"]
    }
    
    internal init(content: [VectorElement], classes: [String]) {

        self.content = content
        self.classes = classes
    }
    
    public var body: AnyContent {
        Vector {
            content
        }
        .class(classes.joined(separator: " "))
    }
}

extension Symbol {
    
    public func fontSize(_ size: FontSize) -> Symbol {
        
        var newSelf = self
        newSelf.classes.append(size.rawValue)
        return newSelf
    }
    
    public func foregroundColor(_ color: ForegroundColor) -> Symbol {
        
        var newSelf = self
        newSelf.classes.append(color.rawValue)
        return newSelf
    }
}
