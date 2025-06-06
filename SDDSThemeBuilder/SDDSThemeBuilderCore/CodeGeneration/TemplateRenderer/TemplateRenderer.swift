import Foundation
import Stencil
import PathKit
import SwiftUI

private enum Tag: String {
    case ensureValueExists = "ensure_value_exists"
    case ensureAnyValueExists = "ensure_any_value_exists"
    case ensureDoubleNonNegative = "ensure_double_non_negative"
    case ensureDouble = "ensure_double_exists"
    case ensureDoubleInRange = "ensure_double_in_range"
}

private enum Filter: String {
    case ensure = "ensure"
    case ensureDouble = "ensure_double_exists"
    case ensureDoubleNonNegative = "ensure_double_non_negative"
    case ensureDoubleInRange = "ensure_double_in_range"
    case ensureShapeKindInRange = "ensure_shape_kind_in_range"
    case ensureValidHex = "ensure_valid_hex"
    case findState = "findState"
    case escapeSwiftKeyword = "escapeSwiftKeyword"
    case camelCase = "camelCase"
    case capitalized = "capitalized"
    case adjustedCornerRadius = "adjustedCornerRadius"
    case paletteColor = "palette_color"
    case generateFunction = "generate_function"
    case removeFuncKeyword = "remove_func_keyword"
    case insertArguments = "insert_arguments"
}

private enum SwiftKeyword: String, CaseIterable {
    case `default`, `class`, `struct`, `enum`, `protocol`, `extension`, `func`, `var`, `let`, `import`

    static var allKeywords: Set<String> {
        return Set(SwiftKeyword.allCases.map { $0.rawValue })
    }
}

final class TemplateRenderer: Renderable {
    let paletteMapper: PaletteMapper?
    
    init(paletteMapper: PaletteMapper? = nil) {
        self.paletteMapper = paletteMapper
    }
    
    func render(context: [String: Any], template: StencilTemplate, removeLines: Bool = true) -> CommandResult {
        let ext = Extension()
        registerFilters(ext: ext)
        registerTags(ext: ext)
        
        guard let templatesURL = Bundle(for: TemplateRenderer.self).url(forResource: template.rawValue, withExtension: "stencil")?.deletingLastPathComponent() else {
            return .error(.codeGeneration(.templateLoadingFailed))
        }
        let templatesPath = templatesURL.path()
        let stencilEnvironment = Environment(loader: FileSystemLoader(paths: [Path(templatesPath)]), extensions: [ext])
        
        guard let template = try? stencilEnvironment.loadTemplate(name: template.withStencilExt) else {
            return .error(.codeGeneration(.templateLoadingFailed))
        }
        
        // Swift file generation
        do {
            let rendered = try template.render(context)
            if removeLines {
                return .generated(removeExtraNewlines(from: rendered))
            } else {
                return .generated(rendered)
            }
        } catch {
            print(error)
            return .error(.codeGeneration(.renderingFailed))
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
        ext.registerTag(Tag.ensureDouble.rawValue) { parser, token in
            let arguments = token.components.dropFirst().map { $0 }
            return EnsureFloatExistsNode(arguments: arguments, token: token)
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
        ext.registerFilter(Filter.ensureDouble.rawValue) { (value: Any?) in
            guard let doubleValue = Double.convert(value) else {
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
        ext.registerFilter(Filter.findState.rawValue) { (value: Any?, arguments: [Any?]) in
            guard let states = value as? [[String: Any]],
                  let targetState = arguments.first as? String else {
                throw TemplateSyntaxError("Invalid input for findState filter")
            }

            for state in states {
                if let stateArray = state["state"] as? [String],
                   stateArray.contains(targetState),
                   let value = state["value"] as? String {
                    return value.camelCase
                }
            }

            throw TemplateSyntaxError("State '\(targetState)' not found in states array")
        }
        ext.registerFilter(Filter.escapeSwiftKeyword.rawValue) { (value: Any?) in
            guard let keyword = value as? String else { return value }
            return SwiftKeyword.allKeywords.contains(keyword) ? "`\(keyword)`" : keyword
        }
        ext.registerFilter(Filter.camelCase.rawValue) { (value: Any?) in
            guard let stringValue = value as? String else { return value }
            return stringValue.camelCase
        }
        ext.registerFilter(Filter.capitalized.rawValue) { (value: Any?) in
            guard let stringValue = value as? String else { return value }
            guard !stringValue.contains("`default`") else {
                return stringValue
                    .replacingOccurrences(of: stringValue, with: "default")
                    .capitalized
            }
            return stringValue.capitalized
        }
        ext.registerFilter(Filter.adjustedCornerRadius.rawValue) { (value: Any?, arguments: [Any?]) in
            guard let baseCornerRadiusKey = value as? String else {
                throw TemplateSyntaxError("Invalid value for adjustedCornerRadius filter")
            }
            
            let adjustmentValue = arguments.first.flatMap(Double.convert) ?? 0
            let adjustment = adjustmentValue > 0 ? "+ \(adjustmentValue)" : adjustmentValue < 0 ? "- \(-adjustmentValue)" : ""
            
            return "ShapeToken.\(baseCornerRadiusKey.camelCase).cornerRadius \(adjustment)".trimmingCharacters(in: .whitespaces)
        }
        ext.registerFilter(Filter.paletteColor.rawValue) { [weak self] (value: Any?) in
            guard let paletteMapper = self?.paletteMapper, let value = value as? String else {
                return value
            }
            
            let color = try? self?.paletteMapper?.colorMap(value).hexWithAlpha
            return color
        }
        ext.registerFilter(Filter.generateFunction.rawValue) { (value: Any?) in
            guard let valueString = value as? String else { return false }
            return valueString.hasPrefix("func")
        }
        ext.registerFilter(Filter.removeFuncKeyword.rawValue) { (value: Any?) in
            guard let valueString = value as? String else { return value }
            return valueString.replacingOccurrences(of: "func", with: "")
        }
        ext.registerFilter(Filter.insertArguments.rawValue) { (value: Any?) in
            guard let valueString = value as? String else { return value }
            return valueString.argumentParser(type: ".dense")
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
