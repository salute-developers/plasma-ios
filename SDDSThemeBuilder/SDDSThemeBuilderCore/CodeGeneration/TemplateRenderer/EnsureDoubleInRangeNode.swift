import Foundation
import Stencil

class EnsureDoubleInRangeNode: EnsureValueNode {
    override func render(_ context: Context) throws -> String {
        guard arguments.count == 3 else {
            throw TemplateSyntaxError("ensure_double_in_range tag requires exactly three arguments")
        }
        let variableName = arguments[0]
        guard let minValue = Double(arguments[1]), let maxValue = Double(arguments[2]) else {
            throw TemplateSyntaxError("Invalid range for ensure_double_in_range")
        }
        
        let flatContext = context.flatten()
        if let value = getValue(forKeyPath: variableName, from: flatContext), let doubleValue = value as? Double, doubleValue >= minValue, doubleValue <= maxValue {
            return ""
        } else {
            throw TemplateSyntaxError("Value for \(variableName) is not a double in range [\(minValue), \(maxValue)] or not found in context")
        }
    }
}
