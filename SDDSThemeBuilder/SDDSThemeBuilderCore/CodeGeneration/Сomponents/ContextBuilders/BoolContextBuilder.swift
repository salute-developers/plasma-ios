import Foundation

final class BoolContextBuilder: CodeGenerationContextBuilder {
    let value: Bool?
    let nullify: Bool
    
    init(_ value: Bool?, nullify: Bool = false) {
        self.value = value
        self.nullify = nullify
    }
    
    init<T>(_ value: ValueState<T>?, nullify: Bool = false) {
        self.value = value?.value as? Bool
        self.nullify = nullify
    }
    
    var context: String? {
        if let value = value {
            return "Bool(\(value))"
        } else {
            return nullify ? nil : "Bool(0)"
        }
    }
}
