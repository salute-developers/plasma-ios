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
        return lastKey.camelCase
    }
    
    var lastKey: String {
        let components = components(separatedBy: ".")
        return (components.last ?? "")
    }
    
    var variationPathComponents: [String] {
        return components(separatedBy: ".").map { $0.camelCase.capitalized }
    }
    
    var chain: String {
        return components(separatedBy: ".")
            .map({ $0.capitalized })
            .map({ $0.replacingOccurrences(of: "-", with: "") })
            .map { string in
                var string = string
                if string.count <= 1 {
                    return string.lowercased()
                } else {
                    return string.prefix(1).lowercased() + string.dropFirst()
                }
            }.joined(separator: ".")
    }
    
    var joinedVariationPath: String {
        let result = variationPathComponents.joined()
        return result
    }
}
