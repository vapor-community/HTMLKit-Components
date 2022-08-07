import Foundation
import OrderedCollections
import HTMLKit

#if canImport(FoundationXML)
import FoundationXML
#endif

internal typealias ParseElements = BodyElement & DescriptionElement & FigureElement & FormElement & BasicElement & HeadElement & ListElement & MapElement & MediaElement & ObjectElement & RubyElement & TableElement & HtmlElement & VectorElement

internal struct Parser {
    
    internal static func load(contentsOfFile path: URL) throws -> [ParseElements] {
        
        var elements = [ParseElements]()
        
        let document = try XMLDocument(contentsOf: path, options: .documentIncludeContentTypeDeclaration)
        
        if let root = document.rootElement() {
            
            if let children = root.children {
                
                for child in children {
                    
                    if let element = try parse(node: child) {
                        elements.append(element)
                    }
                }
            }
        }
        
        return elements
    }
    
    private static func parse(node: XMLNode) throws -> ParseElement? {
        
        var tempAttributes = OrderedDictionary<String, Any>()
        var tempContent = [ParseElement]()
        
        guard let element = node as? XMLElement else {
            return nil
        }
        
        guard let localName = element.localName else {
            return nil
        }
        
        if let attributes = element.attributes {
            
            for attribute in attributes {
                
                if let attributeName = attribute.localName {
                    tempAttributes[attributeName] = attribute.stringValue
                }
            }
        }
        
        if let children = element.children {
            
            for child in children {
                
                if let model = try parse(node: child) {
                    tempContent.append(model)
                }
            }
        }
        
        return ParseElement(name: localName, attributes: tempAttributes, content: tempContent)
    }
}

internal struct ParseElement: ParseElements {
    
    var name: String

    var attributes: OrderedDictionary<String, Any>?
    
    var content: [AnyContent]?
    
    internal func build(_ formula: Renderer.Formula) throws {

        formula.add(string: "<\(name)")

        if let attributes = attributes {

            attributes.forEach { attribute in
                formula.add(string: " \(attribute.key)=\"\(attribute.value)\"")
            }
        }

        formula.add(string: ">")

        try content.prerender(formula)

        formula.add(string: "</\(name)>")
    }

    internal func build<T>(with manager: Renderer.ContextManager<T>) throws -> String {

        guard let attributes = attributes else {
            return try "<\(name)>\(content.render(with: manager))</\(name)>"
        }
        
        return try "<\(name)" + attributes.map { attribute in return " \(attribute.key)=\"\(attribute.value)\"" } + ">\(content.render(with: manager))</\(name)>" as! String
    }
    
    internal func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
    
    internal func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
}

