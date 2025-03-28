import Foundation

final class ComponentStyleContextBuilder: CodeGenerationContextBuilder {
    let string: String
    let appearance: String?
    
    init(_ string: String, appearance: String? = nil) {
        self.string = string
        self.appearance = appearance
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
        
        if let appearance = appearance {
            let modifyString = """
            modify(\(appearance))
            """
            result += [modifyString]
        }
        
        return result.joined(separator: comma)
    }
}
