import Foundation

/// Одно свойство конфига (поле `<Component>Props`) — это `id`, который видит
/// универсальный генератор в JSON-конфиге.
struct PropsField {
    let id: String
    /// Категория, выведенная из типа поля (`ColorKeyValue`→color, `KeyValue<Double>`→dimension, …).
    let category: String
    /// Вложенный Props-тип для `ComponentStyleKeyValue<X>` / `KeyValue<XProps>`.
    let nestedProps: String?
}

/// Каталог config-id по компонентам, собранный из неизменённых `*Props`-структур
/// (`SDDSThemeBuilderCore/Model/Props`). Это авторитетный словарь свойств конфига —
/// тул сопоставляет его с Appearance, ничего не переименовывая в исходниках.
final class PropsCatalog {
    /// norm(componentName) → поля.
    private(set) var byComponent: [String: [PropsField]] = [:]

    init(table: SymbolTable) {
        for (name, decl) in table.types where decl.kind == .structOrClass && name.hasSuffix("Props") {
            let component = String(name.dropLast("Props".count))
            let fields = decl.properties.map { property in
                PropsField(
                    id: property.name,
                    category: Self.category(simpleType: property.simpleType, generic: property.genericArgument),
                    nestedProps: (property.genericArgument?.hasSuffix("Props") ?? false) ? property.genericArgument : nil
                )
            }
            if !fields.isEmpty {
                byComponent[Self.norm(component)] = fields
            }
        }
    }

    func fields(forComponent componentName: String) -> [PropsField]? {
        let key = Self.norm(componentName)
        if let exact = byComponent[key] { return exact }
        let candidates = byComponent.keys.filter { $0.hasPrefix(key) }
        guard candidates.count == 1, let only = candidates.first else { return nil }
        return byComponent[only]
    }

    static func norm(_ s: String) -> String {
        s.lowercased().filter { $0.isLetter || $0.isNumber }
    }

    /// Категория config-свойства по типу поля Props.
    private static func category(simpleType: String, generic: String?) -> String {
        switch simpleType {
        case "ColorKeyValue": return "color"
        case "ShapeKeyValue": return "shape"
        case "ShadowKeyValue": return "shadow"
        case "ComponentStyleKeyValue": return "component_style"
        case "KeyValue":
            switch generic {
            case "Double", "CGFloat": return "dimension"
            case "Bool": return "boolean"
            case .some(let g) where g.hasSuffix("Props"): return "component_style"
            default: return "value" // String: типографика/enum — уточняется по матчу с Appearance
            }
        default:
            return generic?.hasSuffix("Props") == true ? "component_style" : "value"
        }
    }
}
