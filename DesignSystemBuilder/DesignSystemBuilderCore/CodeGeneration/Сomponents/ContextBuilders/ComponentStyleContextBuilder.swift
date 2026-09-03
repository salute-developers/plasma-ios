import Foundation

final class ComponentStyleContextBuilder: CodeGenerationContextBuilder {
    let string: String
    let appearance: String?
    let nullify: Bool

    init(_ string: String?, appearance: String? = nil, nullify: Bool = false) {
        self.string = string ?? ""
        self.appearance = appearance
        self.nullify = nullify
    }

    var context: String? {
        let comma = "."
        let parts = string.components(separatedBy: ".")
        let componentVariation = parts.first(where: { $0.contains("-") })?.components(separatedBy: "-") ?? []

        // Имя компонента собирается из первого сегмента: `tab-bar-item-solid` → `TabBarItemSolid`.
        // Часть имён в конфигах несёт вид как суффикс (`badge-solid` — это `Badge`),
        // поэтому если полное имя не компонент, пробуем без `solid`.
        func name(_ words: [String]) -> String {
            words.map { $0.contains("box") ? $0 : $0.capitalized }.joined()
        }
        let candidates = componentVariation.isEmpty
            ? [parts.first?.capitalized ?? ""]
            : [name(componentVariation), name(componentVariation.filter { $0 != "solid" })]

        guard let component = candidates.lazy.compactMap({ CodeGenerationComponent(rawValue: $0) }).first else {
            return nullify ? "nil" : ""
        }
        // Сегмент вариации в конфиге может быть через дефис (`has-background`),
        // в сгенерированном коде это свойство — `hasBackground`.
        let variations = parts[1..<parts.count].map { $0.contains("-") ? $0.camelCase : $0 }
        // Конфиг темы может ссылаться на стиль, которого в ЭТОЙ теме нет
        // (у компонента нет такой вариации либо компонента нет вовсе).
        // Такую ссылку не эмитим — код с ней не компилируется.
        guard ComponentStyleCatalog.contains(component: component, path: variations) else {
            ComponentStyleCatalog.reportSkipped(style: string)
            return nullify ? "nil" : ""
        }

        var result = [String]()
        result += [component.rawValue]
        result += variations

        if variations.isEmpty {
            result += ["default"]
        }
        result += ["appearance"]

        if let appearance = appearance {
            let modifyString = """
            modify(\(appearance))
            """
            result += [modifyString]
        }

        return result.joined(separator: comma)
    }
}
