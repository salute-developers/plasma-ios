import Foundation
import Stencil
import PathKit
import SwiftUI

private enum Tag: String {
    case ensureValueExists = "ensure_value_exists"
    case ensureAnyValueExists = "ensure_any_value_exists"
    case ensureDoubleNonNegative = "ensure_double_non_negative"
    case ensureDoubleInRange = "ensure_double_in_range"
}

private enum Filter: String {
    case ensure = "ensure"
    case ensureDoubleNonNegative = "ensure_double_non_negative"
    case ensureDoubleInRange = "ensure_double_in_range"
    case ensureShapeKindInRange = "ensure_shape_kind_in_range"
    case ensureValidHex = "ensure_valid_hex"
}

final class TemplateRenderer: Renderable {
    func render(context: [String: Any], template: StencilTemplate) -> CommandResult {
        let ext = Extension()
        registerFilters(ext: ext)
        registerTags(ext: ext)
        
        guard let templatesURL = Bundle(for: TemplateRenderer.self).url(forResource: template.rawValue, withExtension: "stencil")?.deletingLastPathComponent() else {
            return .error(CodeGenerationError.templateLoadingFailed)
        }
        let templatesPath = templatesURL.path()
        let stencilEnvironment = Environment(loader: FileSystemLoader(paths: [Path(templatesPath)]), extensions: [ext])
        
        guard let template = try? stencilEnvironment.loadTemplate(name: template.withStencilExt) else {
            return .error(CodeGenerationError.templateLoadingFailed)
        }
        
        // Swift file generation
        do {
            let rendered = try template.render(context)
            let content = removeExtraNewlines(from: rendered)
            return .generated(content)
        } catch {
            print(error)
            return .error(CodeGenerationError.renderingFailed)
        }
    }
    
    func removeExtraNewlines(from content: String) -> String {
        var lines = content.components(separatedBy: .newlines)
        lines = lines.filter { $0 != "    " }
        return lines.joined(separator: "\n")
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
        ext.registerTag(Tag.ensureDoubleNonNegative.rawValue) { parser, token in
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
            guard let doubleValue = value as? Double else {
                return value
            }
            return doubleValue.twoDecimalsFormatted
        }
        ext.registerFilter(Filter.ensureDoubleInRange.rawValue) { (value: Any?, arguments: [Any?]) in
            let range = arguments.compactMap { value in
                return Double.convert(value)
            }
            guard range.count == 2 else {
                throw TemplateSyntaxError("Invalid range for ensure_double_in_range")
            }
            guard let doubleValue = value as? Double, doubleValue >= range[0], doubleValue <= range[1] else {
                throw TemplateSyntaxError("Value is not a double in range [\(range[0]),\(range[1])]")
            }
            return doubleValue
        }
        ext.registerFilter(Filter.ensureDoubleNonNegative.rawValue) { (value: Any?) in
            guard let doubleValue = Double.convert(value), doubleValue >= 0 else {
                throw TemplateSyntaxError("Value \(String(describing: value)) is not a non-negative double")
            }
            return doubleValue
        }
        ext.registerFilter(Filter.ensureShapeKindInRange.rawValue) { (value: Any?) in
            guard let stringValue = value as? String, stringValue == "round" else {
                throw TemplateSyntaxError("Value \(String(describing: value)) can only be equal to `round`")
            }
            return stringValue
        }
        ext.registerFilter(Filter.ensureValidHex.rawValue) { (value: Any?) in
            guard let stringValue = value as? String else {
                throw TemplateSyntaxError("Value \(String(describing: value)) for hex should be string")
            }
            _ = Color(hex: stringValue)
            
            return stringValue
        }
    }
}

fileprivate extension Double {
    static func convert(_ value: Any?) -> Double? {
        if let intValue = value as? Int {
            return Double(intValue)
        } else if let doubleValue = value as? Double {
            return doubleValue
        } else if let stringValue = value as? String {
            return Double(stringValue)
        } else {
            return nil
        }
    }
}
