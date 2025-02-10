import Foundation

final class ComponentStyleContextBuilder: CodeGenerationContextBuilder {
    let string: String
    
    init(_ string: String) {
        self.string = string
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
        
        return result.joined(separator: comma)
    }
}
