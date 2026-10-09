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

/// Собственные состояния компонента: те, что встречаются в его конфигурациях оформления
/// и не входят в общий словарь состояний взаимодействия.
///
/// `qualifiedName`/`simpleName` заполняются, только когда состояния описаны Swift-типом
/// (`@ApiStateEnum`); при разметке через `@ApiStates` типа нет, есть сам набор.
struct StateEnum: Codable {
    let qualifiedName: String?
    let simpleName: String?
    let values: [Value]

    struct Value: Codable {
        let name: String
        /// Имя в форме конфигурации оформления (`text-inlined`), если оно отличается от `name`.
        let configName: String?

        init(name: String, configName: String? = nil) {
            self.name = name
            self.configName = configName
        }
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
    /// Id свойства конфига, из имени иконки которого берётся размер (`close.24` → 24).
    /// Тип при этом обычный `dimension`: отдельной категории для размера иконки нет — на Android
    /// такого типа тоже нет, размер там несёт сам `ImageSource`.
    ///
    /// Собственный `id` у такого свойства свой (`closeIconSize`), а не как у иконки: в базе
    /// свойство компонента уникально по имени и несёт ровно один тип, а иконка уже заняла
    /// `closeIcon` с типом `icon`.
    let sizeFromIconId: String?

    var explicitId: Bool = false

    /// Источник декларации свойства (для вставки маркеров) — НЕ сериализуется в JSON.
    var sourceFile: String? = nil
    var sourceLine: Int? = nil

    private enum CodingKeys: String, CodingKey {
        case type, id, methodName, paramName, paramQualifiedType, paramSimpleType, valueQualifiedType, group, unmapped
        case state, copyOf, valueEnum, fromVariation, markupValue, markupZero, rawNumber, alwaysEmit, stateOnly
        case sizeFromIconId
    }

    init(type: String, id: String, methodName: String, paramName: String,
         paramQualifiedType: String, paramSimpleType: String, valueQualifiedType: String, group: String,
         unmapped: Bool? = nil, state: String? = nil, copyOf: String? = nil, valueEnum: ValueEnum? = nil, fromVariation: Bool? = nil, markupValue: String? = nil, markupZero: String? = nil,
         rawNumber: Bool? = nil, alwaysEmit: Bool? = nil, stateOnly: Bool? = nil, sizeFromIconId: String? = nil,
         explicitId: Bool = false, sourceFile: String? = nil, sourceLine: Int? = nil) {
        self.type = type; self.id = id; self.methodName = methodName; self.paramName = paramName
        self.paramQualifiedType = paramQualifiedType; self.paramSimpleType = paramSimpleType
        self.valueQualifiedType = valueQualifiedType; self.group = group
        self.unmapped = unmapped
        self.state = state; self.copyOf = copyOf; self.valueEnum = valueEnum; self.fromVariation = fromVariation; self.markupValue = markupValue; self.markupZero = markupZero
        self.rawNumber = rawNumber; self.alwaysEmit = alwaysEmit; self.stateOnly = stateOnly
        self.sizeFromIconId = sizeFromIconId; self.explicitId = explicitId
        self.sourceFile = sourceFile; self.sourceLine = sourceLine
    }
}
