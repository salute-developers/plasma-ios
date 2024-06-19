import Foundation
import Stencil
import PathKit

class EnsureValueExistsNode: NodeType {
    let arguments: [String]
    var token: Stencil.Token?

    init(arguments: [String], token: Stencil.Token) {
        self.arguments = arguments
        self.token = token
    }

    func render(_ context: Context) throws -> String {
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

    private func getValue(forKeyPath keyPath: String, from dictionary: [String: Any]) -> Any? {
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

class EnsureAnyValueExistsNode: NodeType {
    let arguments: [String]
    var token: Stencil.Token?

    init(arguments: [String], token: Stencil.Token) {
        self.arguments = arguments
        self.token = token
    }

    func render(_ context: Context) throws -> String {
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

    private func getValue(forKeyPath keyPath: String, from dictionary: [String: Any]) -> Any? {
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

class EnsureFloatNonNegativeNode: NodeType {
    let arguments: [String]
    var token: Stencil.Token?

    init(arguments: [String], token: Stencil.Token) {
        self.arguments = arguments
        self.token = token
    }

    func render(_ context: Context) throws -> String {
        guard arguments.count == 1 else {
            throw TemplateSyntaxError("ensure_float_non_negative tag requires exactly one argument")
        }
        let variableName = arguments[0]
        
        let flatContext = context.flatten()
        if let value = getValue(forKeyPath: variableName, from: flatContext), let floatValue = value as? Float, floatValue >= 0 {
            return ""
        } else {
            throw TemplateSyntaxError("Value for \(variableName) is not a non-negative float or not found in context")
        }
    }

    private func getValue(forKeyPath keyPath: String, from dictionary: [String: Any]) -> Any? {
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

class EnsureDoubleInRangeNode: NodeType {
    let arguments: [String]
    var token: Stencil.Token?

    init(arguments: [String], token: Stencil.Token) {
        self.arguments = arguments
        self.token = token
    }

    func render(_ context: Context) throws -> String {
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

    private func getValue(forKeyPath keyPath: String, from dictionary: [String: Any]) -> Any? {
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

final class TemplateRenderer: Renderable {
    func render(context: [String: Any], template: StencilTemplate, templatesURL: URL) -> CommandResult {
        let ext = Extension()
        
        ext.registerFilter("ensure") { (value: Any?) in
            guard value != nil else {
                throw TemplateSyntaxError("Value not found in context")
            }
            return value
        }
        ext.registerFilter("ensure_double_in_range") { (value: Any?, arguments: [Any?]) in
            let range = arguments.compactMap { value in
                if let intValue = value as? Int {
                    return Double(intValue)
                } else if let doubleValue = value as? Double {
                    return doubleValue
                } else {
                    return nil
                }
            }
            guard range.count == 2 else {
                throw TemplateSyntaxError("Invalid range for ensure_double_in_range")
            }
            guard let doubleValue = value as? Double, doubleValue >= range[0], doubleValue <= range[1] else {
                throw TemplateSyntaxError("Value is not a double in range [\(range[0]),\(range[1])]")
            }
            return doubleValue
        }
        ext.registerFilter("ensure_float_non_negative") { (value: Any?) in
             guard let floatValue = value as? Float, floatValue >= 0 else {
                 throw TemplateSyntaxError("Value is not a non-negative float")
             }
             return floatValue
        }
        ext.registerTag("ensure_value_exists") { parser, token in
            let arguments = token.components.dropFirst().map { $0 }
            return EnsureValueExistsNode(arguments: arguments, token: token)
        }
        ext.registerTag("ensure_any_value_exists") { parser, token in
            let arguments = token.components.dropFirst().map { $0 }
            return EnsureAnyValueExistsNode(arguments: arguments, token: token)
        }
        ext.registerTag("ensure_float_non_negative") { parser, token in
             let arguments = token.components.dropFirst().map { $0 }
             return EnsureFloatNonNegativeNode(arguments: arguments, token: token)
        }
        ext.registerTag("ensure_double_in_range") { parser, token in
            let arguments = token.components.dropFirst().map { $0 }
            return EnsureDoubleInRangeNode(arguments: arguments, token: token)
        }

        let templatesPath = templatesURL.absolutePath
        let stencilEnvironment = Environment(loader: FileSystemLoader(paths: [Path(templatesPath)]), extensions: [ext])
        
        guard let template = try? stencilEnvironment.loadTemplate(name: template.withStencilExt) else {
            return .error(CodeGenerationError.templateLoadingFailed)
        }
        
        // Генерация Swift файла
        do {
            let rendered = try template.render(context)
            return .generated(rendered)
        } catch {
            print(error)
            return .error(CodeGenerationError.renderingFailed)
        }
    }
}
