import Foundation
import Stencil

class EnsureValueExistsNode: EnsureValueNode {
    override func render(_ context: Context) throws -> String {
        guard arguments.count == 1 else {
            throw TemplateSyntaxError("ensure_value_exists tag requires exactly one argument")
        }
        let variableName = arguments[0]
        
        let flatContext = context.flatten()
        if let value = getValue(forKeyPath: variableName, from: flatContext) {
            print("Value for \(variableName) found: \(value)")
        } else {
            print("Value for \(variableName) not found in context \(flatContext)")
            throw TemplateSyntaxError("Value for \(variableName) not found in context")
        }
        return ""
    }
}
