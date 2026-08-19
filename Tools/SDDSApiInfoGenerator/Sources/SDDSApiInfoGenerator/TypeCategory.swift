import Foundation

/// Классификатор Swift-типа property в категорию `Param.type`.
///
/// Логика: сначала явные «терминальные» токен-типы (по точному короткому имени),
/// затем эвристики по ключевым словам, затем скаляры. Всё, что не терминально и
/// известно как struct/protocol в дереве исходников, будет рекурсивно раскрыто
/// как группа (решение принимает `Scanner`, не классификатор).
enum TypeCategory {
    /// Терминальные типы, которые никогда не рекурсим (даже будучи struct'ами).
    /// Ключ — короткое имя типа, значение — категория.
    static let terminalExact: [String: String] = [
        "StatefulColor": "color",
        "StatefulFillStyle": "color",
        "ButtonColor": "color",
        "Color": "color",
        "FillStyle": "color",
        "InteractiveColor": "color",
        "TypographyConfiguration": "typography",
        "TextStyle": "typography",
        "ShapeToken": "shape",
        "ShadowToken": "shadow",
        "Image": "icon"
    ]

    /// Скаляры и геометрия.
    static let scalarExact: [String: String] = [
        "CGFloat": "dimension",
        "Double": "dimension",
        "CGSize": "dimension",
        "CGPoint": "dimension",
        "CGRect": "dimension",
        "EdgeInsets": "dimension",
        "Angle": "dimension",
        "Float": "float",
        "Bool": "boolean",
        "Int": "int",
        "String": "value",
        "TextAlignment": "value",
        "Alignment": "value",
        "HorizontalAlignment": "value",
        "VerticalAlignment": "value"
    ]

    /// Эвристики по вхождению подстроки в короткое имя типа (по убыванию приоритета).
    private static let keywordRules: [(needle: String, category: String)] = [
        ("Typography", "typography"),
        ("Shadow", "shadow"),
        ("Shape", "shape"),
        ("Brush", "color"),
        ("Color", "color"),
        ("FillStyle", "color"),
        ("Gradient", "color"),
        ("Icon", "icon"),
        ("Image", "icon")
    ]

    /// Возвращает категорию для «листа», либо `nil`, если тип стоит попробовать
    /// раскрыть рекурсивно (композит).
    static func terminalCategory(simpleType: String) -> String? {
        if let exact = terminalExact[simpleType] { return exact }
        if let scalar = scalarExact[simpleType] { return scalar }
        if simpleType.hasSuffix("SizeConfiguration") { return nil }
        for rule in keywordRules where simpleType.contains(rule.needle) {
            return rule.category
        }
        return nil
    }

    /// Дефолтная категория для нераскрытого/внешнего типа: композит-стиль, если имя
    /// похоже на style-тип, иначе — сырое `value`.
    static func fallback(simpleType: String) -> String {
        let compositeSuffixes = ["Appearance", "Style", "Configuration", "Props"]
        if compositeSuffixes.contains(where: { simpleType.hasSuffix($0) }) {
            return "component_style"
        }
        return "value"
    }
}
