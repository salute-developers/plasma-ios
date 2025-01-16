import Foundation

extension String {
    var withoutSwiftKeyWords: String {
        switch self {
        case "default":
            return "`\(self)`"
        default:
            return self
        }
    }
    
    var codeGenString: String {
        self.withoutSwiftKeyWords
    }
    
    var baseKey: String {
        let components = components(separatedBy: ".")
        return (components.first ?? "")
    }
    
    var lastVariation: String {
        let components = components(separatedBy: ".")
        return (components.last ?? "").camelCase
    }
    
    var variationPathComponents: [String] {
        return components(separatedBy: ".").map { $0.camelCase.capitalized }
    }
    
    var joinedVariationPath: String {
        let result = variationPathComponents.joined()
        return result
    }
}
