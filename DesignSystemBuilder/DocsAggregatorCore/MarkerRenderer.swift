import Foundation

/// Лёгкое чтение components-info для рендера `<!-- @style-api -->` — поля,
/// нужные таблице параметров и примеру вызова (полная схема — в theme-builder).
public struct ComponentsInfoLite: Codable {
    public let components: [Component]

    public struct Component: Codable {
        public let key: String
        public let coreName: String
        public let styleName: String
        /// Есть только у компонентов, для которых реально сгенерирован
        /// Swift-тип `<Component>Styles`.
        public let styleApi: StyleApi?
        public let variations: [Variation]
    }
    public struct StyleApi: Codable {
        public let stylesClassName: String
        public let returnTypeName: String
        public let params: [Param]
    }
    public struct Param: Codable {
        public let name: String
        public let type: String
        public let typeName: String
        public let values: [Value]
    }
    public struct Value: Codable {
        public let value: String
        public let codeName: String
    }
    public struct Variation: Codable {
        public let name: String
        public let reference: String
    }

    public static func load(from url: URL) throws -> ComponentsInfoLite {
        try JSONDecoder().decode(ComponentsInfoLite.self, from: Data(contentsOf: url))
    }
}

/// Рендер маркеров в markdown-странице:
/// - `// @sample: <путь>` внутри swift-fence и `<!-- @sample: <путь> -->` —
///   инлайн содержимого сниппета; нерезолв — ошибка;
/// - `<!-- @style-api -->` — таблица параметров стиля + пример вызова;
/// - `<!-- @screenshot: ... -->` — passthrough (не трогаем).
public struct MarkerRenderer {
    /// snippet basename (`<id>.swift`) → текст. Ключ по basename, чтобы маркер
    /// мог ссылаться на сэмпл любым путём; id уникален (дедуп на этапе extract).
    public let snippetsByBasename: [String: String]
    public let componentsInfo: ComponentsInfoLite?

    public init(snippets: [String: String], componentsInfo: ComponentsInfoLite?) {
        var byBasename: [String: String] = [:]
        for (path, text) in snippets {
            byBasename[(path as NSString).lastPathComponent] = text
        }
        self.snippetsByBasename = byBasename
        self.componentsInfo = componentsInfo
    }

    public func render(page: String, markdown: String) throws -> String {
        let lines = markdown.components(separatedBy: "\n")
        var output: [String] = []
        var index = 0
        while index < lines.count {
            let line = lines[index]
            let trimmed = line.trimmingCharacters(in: .whitespaces)

            if let marker = sampleMarker(in: trimmed) {
                guard let snippet = snippetsByBasename[(marker as NSString).lastPathComponent] else {
                    throw AggregationError.unresolvedSample(page: page, marker: marker)
                }
                output.append(contentsOf: snippet.components(separatedBy: "\n"))
                index += 1
                continue
            }

            if trimmed == "<!-- @style-api -->" {
                output.append(contentsOf: styleApiBlock(page: page).components(separatedBy: "\n"))
                index += 1
                continue
            }

            output.append(line)
            index += 1
        }
        return output.joined(separator: "\n")
    }

    // MARK: - @sample

    private func sampleMarker(in trimmedLine: String) -> String? {
        if trimmedLine.hasPrefix("// @sample:") {
            return trimmedLine
                .replacingOccurrences(of: "// @sample:", with: "")
                .trimmingCharacters(in: .whitespaces)
        }
        if trimmedLine.hasPrefix("<!-- @sample:"), trimmedLine.hasSuffix("-->") {
            return trimmedLine
                .replacingOccurrences(of: "<!-- @sample:", with: "")
                .replacingOccurrences(of: "-->", with: "")
                .trimmingCharacters(in: .whitespaces)
        }
        return nil
    }

    // MARK: - @style-api

    /// Имя компонента = имя файла минус `Usage.md`.
    /// Готовые стили описаны только у компонентов, для которых сгенерирован
    /// `<Component>Styles`; для остальных выводим предупреждение вместо примера,
    /// который ссылался бы на несуществующий тип. Отличить «нет стилей» от «нет
    /// в дизайн-системе» по components-info нельзя: туда попадают только
    /// компоненты с `bindings`, поэтому сообщение одно и по существу.
    private func styleApiBlock(page: String) -> String {
        let component = ((page as NSString).lastPathComponent as NSString)
            .deletingPathExtension
            .replacingOccurrences(of: "Usage", with: "")
        let documented = (componentsInfo?.components ?? [])
            .filter { $0.coreName == component && $0.styleApi != nil }

        guard !documented.isEmpty else {
            return """
            :::warning
            У компонента нет готовых стилей темы. Если нужен стиль, обратитесь в поддержку.
            :::
            """
        }
        return documented.map { render(component: $0) }.joined(separator: "\n\n")
    }

    private func render(component: ComponentsInfoLite.Component) -> String {
        guard let styleApi = component.styleApi else { return "" }
        var out = component.styleName == component.coreName
            ? "### Параметры стиля\n\n"
            : "### Параметры стиля `\(component.styleName)`\n\n"

        if !styleApi.params.isEmpty {
            out += "| Параметр | Тип | Возможные значения |\n"
            out += "| --- | --- | --- |\n"
            for param in styleApi.params {
                let values = param.values.isEmpty
                    ? "-"
                    : param.values.map { "`.\($0.codeName.firstLowercased)`" }.joined(separator: ", ")
                out += "| `\(param.name)` | `\(param.typeName)` | \(values) |\n"
            }
            out += "\n"
        }

        out += "Пример выбора готового стиля:\n```swift\n"
        let args = styleApi.params
            .map { "    \($0.name.firstLowercased): .\(($0.values.first?.codeName ?? "").firstLowercased)" }
            .joined(separator: ",\n")
        // Вызов возвращает AppearanceVariation<…>; в коде используют её `.appearance`.
        out += args.isEmpty
            ? "let appearance = \(styleApi.stylesClassName).style().appearance\n"
            : "let appearance = \(styleApi.stylesClassName).style(\n\(args)\n).appearance\n"
        if let variation = component.variations.first {
            out += "\n// или через dot notation\n"
            out += "let appearance = \(variation.reference.lowercasedDotChain).appearance\n"
        }
        out += "```\n"
        return out
    }
}

private extension String {
    var firstLowercased: String {
        guard let first = first else { return self }
        return first.lowercased() + dropFirst()
    }

    /// `Badge.L.Default` → `Badge.l.default` — dot-notation iOS-акцессоров
    /// начинается с типа, дальше camelCase-члены с маленькой буквы.
    var lowercasedDotChain: String {
        let parts = split(separator: ".").map(String.init)
        guard parts.count > 1 else { return self }
        let tail = parts.dropFirst().map { part -> String in
            guard let first = part.first else { return part }
            return first.lowercased() + part.dropFirst()
        }
        return ([parts[0]] + tail).joined(separator: ".")
    }
}
