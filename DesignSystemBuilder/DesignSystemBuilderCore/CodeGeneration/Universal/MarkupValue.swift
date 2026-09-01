import Foundation
import SwiftUI

/// Значение свойства, заданное разметкой, а не конфигом. Либо литерал
/// (`CGFloat(0)`, `BottomSheetSizeDefault()`), либо выражение над ключами конфига
/// (`point(x, y)`, `size(w, h)`, `insets(top, leading, bottom, trailing)`,
/// `alpha(key)`), где `0` на месте ключа означает нулевую координату.
enum MarkupValue {

    static func value(expression: String, props: UniversalProps?, nullify: Bool) -> String? {
        guard let call = parse(expression) else { return expression }
        func number(_ key: String) -> Double? {
            if key == "_" { return nil }
            if key == "0" { return 0 }
            return props?[key]?.decoded(KeyValue<Double>.self)?.value
        }
        switch call.name {
        case "point":
            return SizeContextBuilder(x: number(call.args[0]), y: number(call.args[1]),
                                      style: .point, nullify: nullify).context
        case "size":
            return SizeContextBuilder(x: number(call.args[0]), y: number(call.args[1]),
                                      style: .size, nullify: nullify).context
        case "insets", "insetsOrZero":
            let zeroFill = call.name == "insetsOrZero"
            func edge(_ key: String) -> Double? { zeroFill ? (number(key) ?? 0) : number(key) }
            return EdgeInsetsContextBuilder(top: edge(call.args[0]), leading: edge(call.args[1]),
                                            bottom: edge(call.args[2]), trailing: edge(call.args[3]),
                                            nullify: nullify).context
        case "alpha":
            let alpha = props?[call.args[0]]?.decoded(ColorKeyValue.self)?.alpha
            return CGFloatContextBuilder(alpha, nullify: true).context
        default:
            return expression
        }
    }

    /// Значение для нулевой структуры размеров.
    static func zeroValue(param: ApiMetaParam) -> String? {
        if let zero = param.markupZero { return zero }
        guard let expression = param.markupValue else { return nil }
        guard let call = parse(expression) else { return expression }
        switch call.name {
        case "point": return CGPoint.defaultContext
        case "size": return CGSize.defaultContext
        case "insets", "insetsOrZero": return EdgeInsets.defaultContext
        case "alpha": return CGFloat.defaultContext
        default: return expression
        }
    }

    private static func parse(_ expression: String) -> (name: String, args: [String])? {
        guard let open = expression.firstIndex(of: "("), expression.hasSuffix(")") else { return nil }
        let name = String(expression[expression.startIndex..<open])
        guard ["point", "size", "insets", "insetsOrZero", "alpha"].contains(name) else { return nil }
        let inner = expression[expression.index(after: open)..<expression.index(before: expression.endIndex)]
        let args = inner.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
        return (name, args)
    }
}
