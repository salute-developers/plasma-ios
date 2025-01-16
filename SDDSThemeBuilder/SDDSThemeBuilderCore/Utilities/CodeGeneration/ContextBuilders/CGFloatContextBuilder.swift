import Foundation

final class CGFloatContextBuilder: CodeGenerationContextBuilder {
    let value: Double?
    let nullify: Bool
    
    init(_ value: Double?, nullify: Bool = false) {
        self.value = value
        self.nullify = nullify
    }
    
    var context: String? {
        if let value = value {
            return "CGFloat(\(value))"
        } else {
            return nullify ? nil : "CGFloat(0)"
        }
    }
}
