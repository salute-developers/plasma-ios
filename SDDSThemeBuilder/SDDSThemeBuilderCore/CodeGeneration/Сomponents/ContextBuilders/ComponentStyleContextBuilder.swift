import Foundation

final class ComponentStyleContextBuilder: CodeGenerationContextBuilder {
    let string: String
    
    init(_ string: String) {
        self.string = string
    }
    
    var context: String? {
        var parts = string.components(separatedBy: ".")
        var componentType = [String]()
        let _ = parts.filter {
            if $0.contains("-") {
                componentType = $0.components(separatedBy: "-")
                parts.removeFirst()
            }
            return false
        }
        let componentName = componentType.filter {
            if $0.contains("solid") {
                return false
            }
            return true
        }
        let items = componentType.isEmpty ? parts : componentName + parts
        guard let component = CodeGenerationComponent(rawValue: items.first?.capitalized ?? "") else {
            return ""
        }
        let variations = Array(items[1..<items.count])
        
        var result = [String]()
        result += [component.rawValue]
        result += variations
        result += ["appearance"]
        
        return result.joined(separator: ".")
    }
}
