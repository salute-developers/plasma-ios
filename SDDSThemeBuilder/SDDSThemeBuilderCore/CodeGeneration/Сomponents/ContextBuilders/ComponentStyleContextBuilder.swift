import Foundation

final class ComponentStyleContextBuilder: CodeGenerationContextBuilder {
    let string: String
    let appearance: String?
    let nullify: Bool
    
    init(_ string: String?, appearance: String? = nil, nullify: Bool = false) {
        self.string = string ?? ""
        self.appearance = appearance
        self.nullify = nullify
    }
    
    var context: String? {
        let comma = "."
        let parts = string.components(separatedBy: ".")
        var componentVariation = [String]()
        let _ = parts.filter {
            if $0.contains("-") {
                componentVariation = $0.components(separatedBy: "-")
            }
            return false
        }
        let componentParts = componentVariation
            .filter {
                if $0.contains("solid") && !string.contains("accordion") {
                    return false
                }
                return true
            }
        
        let componentName = componentVariation.isEmpty ? parts.first?.capitalized : componentParts
            .map {
                if !$0.contains("box") {
                    return $0.capitalized
                }
                return $0
            }
            .joined()
        
        guard let component = CodeGenerationComponent(rawValue: componentName ?? "") else {
            return nullify ? "nil" : ""
        }
        let variations = Array(parts[1..<parts.count])
        
        var result = [String]()
        result += [component.rawValue]
        result += variations
        
        if variations.isEmpty {
            result += ["default"]
        }
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
