import Foundation
import Stencil

class EnsureAnyValueExistsNode: EnsureValueNode {
    override func render(_ context: Context) throws -> String {
        guard arguments.count > 0 else {
            throw TemplateSyntaxError("ensure_any_value_exists tag requires at least one argument")
        }

        let flatContext = context.flatten()
        for argument in arguments {
            if let _ = getValue(forKeyPath: argument, from: flatContext) {
                return ""
            }
        }

        throw TemplateSyntaxError("None of the specified values found in context")
    }
}
