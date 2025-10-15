import Foundation

final class CGFloatContextBuilder: CodeGenerationContextBuilder {
    let value: Double?
    let nullify: Bool
    
    init(_ value: Double?, nullify: Bool = false) {
        self.value = value
        self.nullify = nullify
    }
    
    init(_ value: String?, nullify: Bool = false) {
        self.value = Double(value ?? "0")
        self.nullify = nullify
    }
    
    init<T>(_ value: ValueState<T>?, nullify: Bool = false) {
        self.value = value?.value as? Double
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
