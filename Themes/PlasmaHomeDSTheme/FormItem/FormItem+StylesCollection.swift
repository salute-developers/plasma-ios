// This file is code generated. Do not modify.
import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

/// Все стили компонента FormItem
public enum FormItemStyles: String {
    case formItemDefault = "FormItem.Default"
    case formItemPositive = "FormItem.Positive"
    case formItemNegative = "FormItem.Negative"
    case formItemWarning = "FormItem.Warning"

    /// Возможные значения свойства view
    public enum View {
        case `default`
        case positive
        case negative
        case warning

        public init?(raw: String) {
            switch raw {
            case "default": self = .`default`
            case "positive": self = .positive
            case "negative": self = .negative
            case "warning": self = .warning
            default: return nil
            }
        }
    }
}

public extension FormItemStyles {
    var style: AppearanceVariation<FormItemAppearance> {
        switch self {
        case .formItemDefault: return FormItem.`default`.`default`
        case .formItemPositive: return FormItem.`default`.positive
        case .formItemNegative: return FormItem.`default`.negative
        case .formItemWarning: return FormItem.`default`.warning
        }
    }

    static func resolve(view: View) -> FormItemStyles {
        switch (view) {
        case (.`default`): return .formItemDefault
        case (.positive): return .formItemPositive
        case (.negative): return .formItemNegative
        case (.warning): return .formItemWarning
        default: return .formItemDefault
        }
    }

    static func style(view: View) -> AppearanceVariation<FormItemAppearance> {
        resolve(view: view).style
    }

    /// Список настраиваемых «ручек» компонента для binding-конфигуратора.
    static let bindingProperties: [BindingProperty] = [
        BindingProperty(name: "view", kind: .singleChoice(["default", "positive", "negative", "warning"]), defaultValue: "default"),
    ]

    /// Резолвит стиль по значениям binding-«ручек» (raw-строки).
    /// Неизвестные/пустые значения размерности берут дефолт.
    static func resolveStyle(bindings: [String: String]) -> AppearanceVariation<FormItemAppearance> {
        let view = View(raw: bindings["view"] ?? "") ?? .`default`
        return style(view: view)
    }
}
