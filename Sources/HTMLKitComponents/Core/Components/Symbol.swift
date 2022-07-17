/*
 Abstract:
 The file contains everything related to the symbol component.
 */

import HTMLKit
import Foundation

public struct Symbol: Component {
    
    /// The content of the symbol.
    internal let content: [VectorElement]
    
    /// The classes of the symbol.
    internal var classes: [String]
    
    /// Retrieves a symbol.
    public init(name: String) {
        
        let url = URL(fileURLWithPath: "./public/assets/symbols").appendingPathComponent(name).appendingPathExtension("svg")

        do {
            self.content = try Parser.load(contentsOfFile: url)
        } catch {
            self.content = []
        }

        self.classes = ["symbol"]
    }
    
    /// Creates a symbol.
    internal init(content: [VectorElement], classes: [String]) {

        self.content = content
        self.classes = classes
    }
    
    public var body: AnyContent {
        Vector {
            content
        }
        .width(16)
        .height(16)
        .viewBox("0 0 16 16")
        .fill("currentColor")
        .class(classes.joined(separator: " "))
    }
    
    public func fontSize(_ size: Tokens.FontSize) -> Symbol {
        
        var newSelf = self
        newSelf.classes.append(size.rawValue)
        return newSelf
    }
    
    public func foregroundColor(_ color: Tokens.ForegroundColor) -> Symbol {
        
        var newSelf = self
        newSelf.classes.append(color.rawValue)
        
        return newSelf
    }
}
