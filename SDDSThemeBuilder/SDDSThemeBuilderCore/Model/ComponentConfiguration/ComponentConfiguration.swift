import Foundation

struct ComponentConfiguration<Props: MergeableConfiguration>: Codable {
    struct View: Codable {
        let props: Props
    }
    
    struct Variation: Codable {
        let id: String
        let parent: String?
        let props: Props
        let view: [String: View]?
        /// Значения binding-свойств для этой вариации (например,
        /// `size=xs, required-placement=start`). Пусто для конфигов без bindings.
        let binding: [VariationBinding]

        init(
            id: String = "default",
            parent: String? = nil,
            props: Props,
            view: [String: View]? = nil,
            binding: [VariationBinding] = []
        ) {
            self.id = id
            self.parent = parent
            self.props = props
            self.view = view
            self.binding = binding
        }

        // Кастомный декодер с fallback для props
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)

            self.id = try container.decode(String.self, forKey: .id)
            self.parent = try container.decodeIfPresent(String.self, forKey: .parent)
            self.view = try container.decodeIfPresent([String: View].self, forKey: .view)
            self.binding = try container.decodeIfPresent([VariationBinding].self, forKey: .binding) ?? []

            // Если props отсутствует, создаем пустой Props
            if container.contains(.props) {
                self.props = try container.decode(Props.self, forKey: .props)
            } else {
                // Создаем пустой Props через декодирование пустого JSON
                let emptyJSON = "{}"
                let emptyData = emptyJSON.data(using: .utf8)!
                self.props = try JSONDecoder().decode(Props.self, from: emptyData)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case id, parent, props, view, binding
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)

            try container.encode(id, forKey: .id)
            try container.encodeIfPresent(parent, forKey: .parent)
            try container.encodeIfPresent(view, forKey: .view)
            if !binding.isEmpty {
                try container.encode(binding, forKey: .binding)
            }

            // Всегда кодируем props, даже если он пустой
            try container.encode(props, forKey: .props)
        }
    }
    
    let view: [String: View]
    let props: Props?
    let variations: [Variation]
    /// Описание binding-свойств компонента (размерности вариаций: size, view, …).
    /// Пусто для legacy-конфигов без bindings — тогда binding API не генерируется.
    let bindings: [Binding]

    init(view: [String: View]? = nil, props: Props? = nil, variations: [Variation], bindings: [Binding] = []) {
        self.view = view ?? [:]
        self.props = props
        self.variations = variations
        self.bindings = bindings
    }

    enum CodingKeys: String, CodingKey {
        case view, props, variations, bindings
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.view = try container.decodeIfPresent([String: View].self, forKey: .view) ?? [:]
        self.props = try container.decodeIfPresent(Props.self, forKey: .props)
        self.variations = try container.decode([Variation].self, forKey: .variations)
        self.bindings = try container.decodeIfPresent([Binding].self, forKey: .bindings) ?? []
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(view, forKey: .view)
        try container.encodeIfPresent(props, forKey: .props)
        try container.encode(variations, forKey: .variations)
        if !bindings.isEmpty {
            try container.encode(bindings, forKey: .bindings)
        }
    }
}

/// Тип binding-свойства компонента: перечисление, булево значение или
/// «вид» (view) — размерность, задаваемая через `view`.
enum BindingType: String, Codable {
    case `enum`
    case boolean
    case view
}

/// Описание одного binding-свойства компонента — размерности вариации.
/// Например, `size` со значениями `[xs, s, m, l]` и дефолтом `xs`.
struct Binding: Codable {
    let name: String
    let type: BindingType
    let values: [String]?
    let defaultValue: String?
}

/// Значение binding-свойства для конкретной вариации (например, `size=xs`).
struct VariationBinding: Codable {
    let name: String
    let value: String
}

// MARK: - Binding API: raw config

/// Props-независимое чтение конфига компонента только для binding-данных
/// (`bindings` + `variations[].binding`). Используется, чтобы разрешить binding
/// без знания конкретного `Props`-типа компонента.
struct RawComponentConfig: Codable {
    struct RawVariation: Codable {
        let id: String
        let parent: String?
        let binding: [VariationBinding]?
    }
    let bindings: [Binding]?
    let variations: [RawVariation]?
}

// MARK: - Binding API: resolved model

/// Разрешённая binding-информация компонента: размерности (enum/view/boolean) и
/// развёрнутый список стилей (лист-вариация × view) с reference и iOS-акцессором.
struct ComponentBindingInfo {
    struct Value {
        let raw: String   // "xs"
        let code: String  // "Xs"
    }
    struct Dimension {
        let name: String         // "size" / "required-placement"
        let paramName: String    // "size" / "requiredPlacement"
        let type: BindingType
        let enumTypeName: String // "FormItemSize"
        let values: [Value]
        let defaultValue: String?
    }
    struct Style {
        let caseName: String     // "FormItemXsStartNoneDefault"
        let reference: String    // "FormItem.Xs.Start.None.Default"
        let accessor: String     // "FormItem.xs.requiredStart.`default`"
        let values: [String: String] // dimName -> raw value
    }
    let component: String        // "FormItem"
    let key: String              // "form-item"
    let appearanceType: String   // "FormItemAppearance"
    let dimensions: [Dimension]
    let styles: [Style]

    var stylesEnumName: String { "\(component)Styles" }
    var returnType: String { "AppearanceVariation<\(appearanceType)>" }
    var isEmpty: Bool { dimensions.isEmpty || styles.isEmpty }
    /// Размерности, попадающие в enum'ы и в сигнатуру `style(...)` (enum + view, без boolean).
    var paramDimensions: [Dimension] { dimensions.filter { $0.type != .boolean } }
}

// MARK: - Binding API: resolver

/// Строит `ComponentBindingInfo` из binding-данных конфига:
/// enum-размерности закодированы в дереве вариаций (dotted `id`), `view`-размерность
/// ортогональна и разворачивается по своим значениям, отсутствующие enum-размерности
/// берут `defaultValue`.
struct ComponentBindingResolver {
    struct Variation {
        let id: String
        let parent: String?
        let binding: [VariationBinding]
    }

    let component: String       // "FormItem"
    let key: String             // "form-item"
    let appearanceType: String  // "FormItemAppearance"
    let bindings: [Binding]
    let variations: [Variation]

    func resolve() -> ComponentBindingInfo? {
        guard !bindings.isEmpty else { return nil }

        let dimensions: [ComponentBindingInfo.Dimension] = bindings.map { binding in
            let values = (binding.values ?? []).map {
                ComponentBindingInfo.Value(raw: $0, code: $0.codeName)
            }
            return .init(
                name: binding.name,
                paramName: binding.name.camelCase,
                type: binding.type,
                enumTypeName: binding.name.codeName,
                values: values,
                defaultValue: binding.defaultValue
            )
        }

        let enumDimensions = dimensions.filter { $0.type == .enum }
        let viewDimension = dimensions.first { $0.type == .view }
        let paramDimensions = dimensions.filter { $0.type != .boolean }

        // Листовые вариации — не являющиеся родителем ни для кого.
        let parents = Set(variations.compactMap { $0.parent })
        let leaves = variations.filter { !parents.contains($0.id) && !$0.binding.isEmpty }

        var styles: [ComponentBindingInfo.Style] = []
        var seen = Set<String>()

        for leaf in leaves {
            let bound = Dictionary(leaf.binding.map { ($0.name, $0.value) }, uniquingKeysWith: { first, _ in first })
            var valueMap: [String: String] = [:]
            for dim in enumDimensions {
                valueMap[dim.name] = bound[dim.name] ?? dim.defaultValue ?? dim.values.first?.raw ?? ""
            }
            let enumAccessorSegments = leaf.id.chain
                .split(separator: ".")
                .map { String($0).memberAccessSafe }

            if let viewDimension = viewDimension {
                for viewValue in viewDimension.values {
                    var full = valueMap
                    full[viewDimension.name] = viewValue.raw
                    let segments = enumAccessorSegments + [viewValue.raw.chain.memberAccessSafe]
                    if let style = makeStyle(paramDimensions: paramDimensions, valueMap: full, accessorSegments: segments),
                       seen.insert(style.caseName).inserted {
                        styles.append(style)
                    }
                }
            } else if let style = makeStyle(paramDimensions: paramDimensions, valueMap: valueMap, accessorSegments: enumAccessorSegments),
                      seen.insert(style.caseName).inserted {
                styles.append(style)
            }
        }

        guard !styles.isEmpty else { return nil }
        return .init(
            component: component,
            key: key,
            appearanceType: appearanceType,
            dimensions: dimensions,
            styles: styles
        )
    }

    private func makeStyle(
        paramDimensions: [ComponentBindingInfo.Dimension],
        valueMap: [String: String],
        accessorSegments: [String]
    ) -> ComponentBindingInfo.Style? {
        let codeNames = paramDimensions.map { valueMap[$0.name]?.codeName ?? "" }
        guard !codeNames.contains(where: { $0.isEmpty }) else { return nil }
        let reference = ([component] + codeNames).joined(separator: ".")
        let caseName = component + codeNames.joined()
        let accessor = ([component] + accessorSegments).joined(separator: ".")
        return .init(caseName: caseName, reference: reference, accessor: accessor, values: valueMap)
    }
}

// MARK: - Binding API: Swift source generation

extension ComponentBindingInfo {
    private func valueCase(_ raw: String) -> String { raw.camelCase.memberAccessSafe }
    private var styleCase: (ComponentBindingInfo.Style) -> String { { $0.caseName.lowerCamelIdentifier } }

    /// Генерирует Swift-исходник `<Component>+StylesCollection.swift`:
    /// enum'ы размерностей, styles-enum, `style` var, `resolve(...)` и `style(...)`.
    func stylesCollectionSource() -> String {
        var out = "// This file is code generated. Do not modify.\n"
        out += "import Foundation\n"
        out += "import SwiftUI\n"
        out += "import SDDSComponents\n"
        out += "import SDDSThemeCore\n\n"

        out += "/// Все стили компонента \(component)\n"
        out += "public enum \(stylesEnumName): String {\n"
        for style in styles {
            out += "    case \(styleCase(style)) = \"\(style.reference)\"\n"
        }
        // Enum'ы размерностей вложены в styles-enum, чтобы не конфликтовать с
        // уже сгенерированными типами компонента (например, `\(component)Size`).
        for dim in paramDimensions {
            out += "\n    /// Возможные значения свойства \(dim.name)\n"
            out += "    public enum \(dim.enumTypeName) {\n"
            for value in dim.values {
                out += "        case \(valueCase(value.raw))\n"
            }
            out += "    }\n"
        }
        out += "}\n\n"

        out += "public extension \(stylesEnumName) {\n"
        out += "    var style: \(returnType) {\n"
        out += "        switch self {\n"
        for style in styles {
            out += "        case .\(styleCase(style)): return \(style.accessor)\n"
        }
        out += "        }\n"
        out += "    }\n\n"

        let params = paramDimensions.map { "\($0.paramName): \($0.enumTypeName)" }.joined(separator: ", ")
        let tuple = paramDimensions.map { $0.paramName }.joined(separator: ", ")
        out += "    static func resolve(\(params)) -> \(stylesEnumName) {\n"
        out += "        switch (\(tuple)) {\n"
        for style in styles {
            let pattern = paramDimensions.map { ".\(valueCase(style.values[$0.name] ?? ""))" }.joined(separator: ", ")
            out += "        case (\(pattern)): return .\(styleCase(style))\n"
        }
        out += "        default: fatalError(\"Unsupported \(key) style combination\")\n"
        out += "        }\n"
        out += "    }\n\n"

        let forward = paramDimensions.map { "\($0.paramName): \($0.paramName)" }.joined(separator: ", ")
        out += "    static func style(\(params)) -> \(returnType) {\n"
        out += "        resolve(\(forward)).style\n"
        out += "    }\n"
        out += "}\n"
        return out
    }
}

// MARK: - Binding API: config-info meta

/// Мета-описание сгенерированных стилей (`.sdds/config-info-ios.json`).
struct ConfigInfo: Codable {
    let name: String
    let packageName: String
    let tokens: [TokenMeta]
    let components: [ComponentMeta]

    struct TokenMeta: Codable {
        let id: String?
        let name: String
        let type: String?
        let tags: [String]?
    }

    struct ComponentMeta: Codable {
        let key: String
        let coreName: String
        let styleName: String
        let props: [Prop]
        let styleApi: StyleApi
        let variations: [Variation]

        struct Prop: Codable {
            let name: String
            let values: [String]
        }
        struct StyleApi: Codable {
            let stylesClassName: String
            let returnTypeName: String
            let params: [Param]
            struct Param: Codable {
                let name: String
                let type: String
                let typeName: String
                let values: [Value]
                struct Value: Codable {
                    let value: String
                    let codeName: String
                }
            }
        }
        struct Variation: Codable {
            let name: String
            let reference: String
            let props: [PropValue]
            struct PropValue: Codable {
                let name: String
                let value: String
            }
        }
    }
}

extension ComponentBindingInfo {
    func componentMeta() -> ConfigInfo.ComponentMeta {
        let props = dimensions.map {
            ConfigInfo.ComponentMeta.Prop(name: $0.name, values: $0.values.map { $0.raw })
        }
        let params = paramDimensions.map { dim in
            ConfigInfo.ComponentMeta.StyleApi.Param(
                name: dim.name,
                type: dim.type.rawValue,
                typeName: "\(stylesEnumName).\(dim.enumTypeName)",
                values: dim.values.map { .init(value: $0.raw, codeName: $0.code) }
            )
        }
        let variations = styles.map { style in
            ConfigInfo.ComponentMeta.Variation(
                name: paramDimensions.map { style.values[$0.name] ?? "" }.joined(separator: "."),
                reference: style.reference,
                props: paramDimensions.map { .init(name: $0.name, value: style.values[$0.name] ?? "") }
            )
        }
        return .init(
            key: key,
            coreName: component,
            styleName: component,
            props: props,
            styleApi: .init(stylesClassName: stylesEnumName, returnTypeName: returnType, params: params),
            variations: variations
        )
    }
}

extension ComponentConfiguration {
    var allProps: [String: ComponentConfiguration.Variation] {
        var result = [String: ComponentConfiguration.Variation]()
        
        if variations.isEmpty, let props = props {
            result["default"] = ComponentConfiguration.Variation(props: props, view: view)
            return result
        }
        for variation in self.variations {
            result[variation.id] = variation
        }
        return result
    }
    
    var allBaseKeys: [String] {
        return allProps.keys.map({ $0 }).filter {
            $0.variationPathComponents.count == 1
        }.sorted()
    }
    
    var allChildKeys: [String] {
        return allProps.keys.map({ $0 }).filter {
            $0.variationPathComponents.count > 1
        }.sorted()
    }
    
    func childKeys(for parentKey: String) -> [String] {
        let variations = self.variations
        return variations.filter({ $0.parent == parentKey }).map { $0.id }
    }
    
    func hasChild(rawKey: String) -> Bool {
        let index = allProps.firstIndex(where: { props in
            return props.value.parent == rawKey
        })
        return index != nil
    }
    
    func allRecursiveChildKey(for parentKey: String) -> [String] {
        var result: [String] = []
        var visited = Set<String>()
        
        func dfs(_ key: String) {
            let directChildren = childKeys(for: key)
            for child in directChildren {
                guard !visited.contains(child) else { continue }
                visited.insert(child)
                result.append(child)
                dfs(child)
            }
        }
        
        dfs(parentKey)
        return result
    }
}
