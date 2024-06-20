import Foundation
import Stencil
import PathKit

private enum Tag: String {
    case ensureValueExists = "ensure_value_exists"
    case ensureAnyValueExists = "ensure_any_value_exists"
    case ensureFloatNonNegative = "ensure_float_non_negative"
    case ensureDoubleInRange = "ensure_double_in_range"
}

private enum Filter: String {
    case ensure = "ensure"
    case ensureFloatNonNegative = "ensure_float_non_negative"
    case ensureDoubleInRange = "ensure_double_in_range"
}

final class TemplateRenderer: Renderable {
    func render(context: [String: Any], template: StencilTemplate, templatesURL: URL) -> CommandResult {
        let ext = Extension()
        registerFilters(ext: ext)
        registerTags(ext: ext)

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
    
    private func registerTags(ext: Extension) {
        ext.registerTag(Tag.ensureValueExists.rawValue) { parser, token in
            let arguments = token.components.dropFirst().map { $0 }
            return EnsureValueExistsNode(arguments: arguments, token: token)
        }
        ext.registerTag(Tag.ensureAnyValueExists.rawValue) { parser, token in
            let arguments = token.components.dropFirst().map { $0 }
            return EnsureAnyValueExistsNode(arguments: arguments, token: token)
        }
        ext.registerTag(Tag.ensureFloatNonNegative.rawValue) { parser, token in
             let arguments = token.components.dropFirst().map { $0 }
             return EnsureFloatNonNegativeNode(arguments: arguments, token: token)
        }
        ext.registerTag(Tag.ensureDoubleInRange.rawValue) { parser, token in
            let arguments = token.components.dropFirst().map { $0 }
            return EnsureDoubleInRangeNode(arguments: arguments, token: token)
        }
    }
    
    private func registerFilters(ext: Extension) {
        ext.registerFilter(Filter.ensure.rawValue) { (value: Any?) in
            guard value != nil else {
                throw TemplateSyntaxError("Value not found in context")
            }
            return value
        }
        ext.registerFilter(Filter.ensureDoubleInRange.rawValue) { (value: Any?, arguments: [Any?]) in
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
        ext.registerFilter(Filter.ensureFloatNonNegative.rawValue) { (value: Any?) in
             guard let floatValue = value as? Float, floatValue >= 0 else {
                 throw TemplateSyntaxError("Value is not a non-negative float")
             }
             return floatValue
        }
    }
}
