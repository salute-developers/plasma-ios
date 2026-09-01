import Foundation
import Stencil

class EnsureFloatNonNegativeNode: EnsureValueNode {
    override func render(_ context: Context) throws -> String {
        guard arguments.count == 1 else {
            throw TemplateSyntaxError("ensure_double_non_negative tag requires exactly one argument")
        }
        let variableName = arguments[0]
        
        let flatContext = context.flatten()
        if let value = getValue(forKeyPath: variableName, from: flatContext), let floatValue = value as? Float, floatValue >= 0 {
            return ""
        } else {
            throw TemplateSyntaxError("Value for \(variableName) is not a non-negative float or not found in context")
        }
    }
}

class EnsureFloatExistsNode: EnsureValueNode {
    override func render(_ context: Context) throws -> String {
        guard arguments.count == 1 else {
            throw TemplateSyntaxError("ensure_double_non_negative tag requires exactly one argument")
        }
        let variableName = arguments[0]
        
        let flatContext = context.flatten()
        if let value = getValue(forKeyPath: variableName, from: flatContext), let floatValue = value as? Float {
            return ""
        } else {
            throw TemplateSyntaxError("Value for \(variableName) is not a non-negative float or not found in context")
        }
    }
}
