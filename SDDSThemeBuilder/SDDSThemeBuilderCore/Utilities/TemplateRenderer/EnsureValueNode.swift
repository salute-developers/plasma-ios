import Foundation
import Stencil

class EnsureValueNode: NodeType {
    let arguments: [String]
    var token: Stencil.Token?

    init(arguments: [String], token: Stencil.Token) {
        self.arguments = arguments
        self.token = token
    }

    func render(_ context: Context) throws -> String {
        throw TemplateRendererError("Subclasses need to implement the `render` method.")
    }

    func getValue(forKeyPath keyPath: String, from dictionary: [String: Any]) -> Any? {
        let keys = keyPath.split(separator: ".").map { String($0) }
        var value: Any? = dictionary

        for key in keys {
            if let dict = value as? [String: Any], let nextValue = dict[key] {
                value = nextValue
            } else {
                value = nil
                break
            }
        }
        
        return value
    }
}
