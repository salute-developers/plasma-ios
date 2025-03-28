import Foundation

final class ComponentStyleContextBuilder: CodeGenerationContextBuilder {
    let string: String
    let reflectable: (any Reflectable)?
    
    init(_ string: String, reflectable: (any Reflectable)? = nil) {
        self.string = string
        self.reflectable = reflectable
    }
    
    var context: String? {
        let comma = "."
        let items = string.components(separatedBy: comma)
        guard let component = Component(rawValue: items.first ?? "") else {
            return ""
        }
        let variations = Array(items[1..<items.count])
        
        var result = [String]()
        result += [component.componentName]
        result += variations
        result += ["appearance"]
        
        if let reflectable = reflectable {
            let modifyString = """
            modify { appearance in
                var appearance = appearance
                \(reflectable.context)
                return appearance
            }
            """
            result += [modifyString]
        }
        
        return result.joined(separator: comma)
    }
}
