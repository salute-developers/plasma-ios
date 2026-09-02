import Foundation

protocol CodeGenerationContextBuilder {
    var context: String? { get }
}

extension CodeGenerationContextBuilder {
    func asProperty(key: String) -> String {
        return "var \(key) = \(context ?? "nil")"
    }
    
    func asFunction(signature: String) -> String {
        return "\(signature) \(context ?? "nil")"
    }
}
