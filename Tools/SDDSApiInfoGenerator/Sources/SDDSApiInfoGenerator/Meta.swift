import Foundation

/// Схема `ios-api-meta.json` (массив компонентов):
/// - `qualifiedName`/`styleQualifiedName` — Swift-тип `*Appearance`;
/// - `methodName` — имя stored-property;
/// - `paramName` — имя аргумента memberwise-init (совпадает с property);
/// - `valueQualifiedType` — Swift-тип значения (для группы — тип под-структуры).
struct ComponentApiMeta: Codable {
    let componentName: String
    let qualifiedName: String
    let styleQualifiedName: String
    let sizeQualifiedName: String?
    let resolvedTypes: [String]
    let stateEnum: StateEnum?
    /// Реализации стиля, если компонент описан несколькими `*Appearance` (iOS-специфика:
    /// `tab-bar` дизайн-системы — это `TabBarAppearance` и `TabBarIslandAppearance`).
    /// Для компонента с одной реализацией поле отсутствует.
    let styles: [Style]?
    let params: [Param]

    /// Имя `*Appearance`-типа без суффикса: `SDDSComponents.ButtonAppearance` → `Button`.
    ///
    /// Props-модели и override'ы заведены на тип, а не на компонент: один `ButtonAppearance`
    /// обслуживает BasicButton, IconButton и LinkButton, и `ButtonProps` у них общий.
    var appearanceBaseName: String {
        let simple = qualifiedName.components(separatedBy: ".").last ?? qualifiedName
        let suffix = "Appearance"
        return simple.hasSuffix(suffix) ? String(simple.dropLast(suffix.count)) : simple
    }
}

/// Одна реализация стиля компонента.
struct Style: Codable {
    /// Имя реализации: `TabBar`, `TabBarIsland`.
    let name: String
    let styleQualifiedName: String
    let sizeQualifiedName: String?
}

/// enum кастомных состояний компонента.
struct StateEnum: Codable {
    let qualifiedName: String
    let simpleName: String
    let values: [Value]

    struct Value: Codable {
        let name: String
    }
}

/// Значения enum-свойства: как значение конфига проецируется на case.
struct ValueEnum: Codable {
    let qualifiedName: String
    let simpleName: String
    let values: [Value]
    /// Case, на который проецируется значение, не совпавшее ни с одним `id`.
    let defaultValue: String?

    struct Value: Codable {
        let name: String
        let id: String
    }
}

/// Одно настраиваемое свойство компонента.
struct Param: Codable {
    /// Категория (`color`/`shape`/`typography`/`dimension`/`shadow`/`icon`/
    /// `component_style`/`boolean`/`int`/`float`/`value`) — словарь тот же, что у Android.
    let type: String
    let id: String
    /// Имя stored-property (iOS-аналог `methodName` билдера).
    let methodName: String
    /// Имя аргумента memberwise-init (= property).
    let paramName: String
    /// Полный Swift-тип property.
    let paramQualifiedType: String
    /// Короткое имя типа property.
    let paramSimpleType: String
    /// Тип значения (для группы — тип под-структуры/протокола).
    let valueQualifiedType: String
    /// Dotted-путь группы (`root` для верхнего уровня, иначе `size`, `indicator.colors`, …).
    let group: String
    /// `true`, если у config-id нет пары в iOS `Appearance` (пустой `methodName`):
    /// либо свойства на iOS нет, либо структурный кейс (split → EdgeInsets/CGPoint).
    /// Эмитится только когда `true` (иначе поля нет).
    let unmapped: Bool?
    let state: String?
    let copyOf: String?
    let valueEnum: ValueEnum?
    /// Значение берётся из id вариации, а не из prop'а конфига.
    let fromVariation: Bool?
    /// Значение из разметки: литерал или выражение над ключами конфига.
    let markupValue: String?
    let markupZero: String?
    /// Числовое значение печатается как есть, без обёртки `CGFloat(...)`.
    let rawNumber: Bool?
    /// Свойство эмитится всегда, даже если конфиг не содержит значения для него.
    let alwaysEmit: Bool?
    /// Значение берётся только из состояния `state`, без отката на базовое значение ключа.
    let stateOnly: Bool?
    /// Реализации, в которых есть это свойство. Заполняется только когда у компонента
    /// несколько реализаций и свойство есть не во всех.
    let styles: [String]?
    /// Размер берётся из имени иконки в конфиге (`close.24` → 24), а не из числового значения.
    /// Тип при этом обычный `dimension`: отдельной категории для размера иконки нет — на Android
    /// такого типа тоже нет, размер там несёт сам `ImageSource`.
    let sizeFromIcon: Bool?

    var explicitId: Bool = false

    /// Источник декларации свойства (для вставки маркеров) — НЕ сериализуется в JSON.
    var sourceFile: String? = nil
    var sourceLine: Int? = nil

    private enum CodingKeys: String, CodingKey {
        case type, id, methodName, paramName, paramQualifiedType, paramSimpleType, valueQualifiedType, group, unmapped
        case state, copyOf, valueEnum, fromVariation, markupValue, markupZero, rawNumber, alwaysEmit, stateOnly
        case sizeFromIcon, styles
    }

    init(type: String, id: String, methodName: String, paramName: String,
         paramQualifiedType: String, paramSimpleType: String, valueQualifiedType: String, group: String,
         unmapped: Bool? = nil, state: String? = nil, copyOf: String? = nil, valueEnum: ValueEnum? = nil, fromVariation: Bool? = nil, markupValue: String? = nil, markupZero: String? = nil,
         rawNumber: Bool? = nil, alwaysEmit: Bool? = nil, stateOnly: Bool? = nil, sizeFromIcon: Bool? = nil,
         styles: [String]? = nil,
         explicitId: Bool = false, sourceFile: String? = nil, sourceLine: Int? = nil) {
        self.type = type; self.id = id; self.methodName = methodName; self.paramName = paramName
        self.paramQualifiedType = paramQualifiedType; self.paramSimpleType = paramSimpleType
        self.valueQualifiedType = valueQualifiedType; self.group = group
        self.unmapped = unmapped
        self.state = state; self.copyOf = copyOf; self.valueEnum = valueEnum; self.fromVariation = fromVariation; self.markupValue = markupValue; self.markupZero = markupZero
        self.rawNumber = rawNumber; self.alwaysEmit = alwaysEmit; self.stateOnly = stateOnly
        self.sizeFromIcon = sizeFromIcon; self.styles = styles; self.explicitId = explicitId
        self.sourceFile = sourceFile; self.sourceLine = sourceLine
    }
}

extension Param {
    /// Отмечает, что свойство есть в реализации `style`.
    func adding(style: String, of all: [String]) -> Param {
        var known = styles ?? []
        if !known.contains(style) { known.append(style) }
        return copy(styles: all.filter { known.contains($0) })
    }

    /// Свойство, которое есть во всех реализациях, список не нужен.
    func collapsingStyles(of all: [String]) -> Param {
        (styles?.count ?? 0) == all.count ? copy(styles: nil) : self
    }

    private func copy(styles: [String]?) -> Param {
        var result = Param(
            type: type, id: id, methodName: methodName, paramName: paramName,
            paramQualifiedType: paramQualifiedType, paramSimpleType: paramSimpleType,
            valueQualifiedType: valueQualifiedType, group: group, unmapped: unmapped,
            state: state, copyOf: copyOf, valueEnum: valueEnum, fromVariation: fromVariation,
            markupValue: markupValue, markupZero: markupZero, rawNumber: rawNumber,
            alwaysEmit: alwaysEmit, stateOnly: stateOnly, sizeFromIcon: sizeFromIcon,
            styles: styles, explicitId: explicitId, sourceFile: sourceFile, sourceLine: sourceLine
        )
        result.explicitId = explicitId
        return result
    }
}
