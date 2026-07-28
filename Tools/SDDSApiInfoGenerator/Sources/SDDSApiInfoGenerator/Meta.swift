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
    let resolvedTypes: [String]
    let stateEnum: StateEnum?
    let params: [Param]
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

/// Одно настраиваемое свойство компонента.
struct Param: Codable {
    /// Категория (`color`/`shape`/`typography`/`dimension`/`shadow`/`icon`/
    /// `component_style`/`boolean`/`int`/`float`/`value`).
    let type: String
    /// Имя свойства в конфиге (`// sdds:apiName=<id>` либо имя property).
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

    /// Источник декларации свойства (для вставки маркеров) — НЕ сериализуется в JSON.
    var sourceFile: String? = nil
    var sourceLine: Int? = nil

    private enum CodingKeys: String, CodingKey {
        case type, id, methodName, paramName, paramQualifiedType, paramSimpleType, valueQualifiedType, group, unmapped
    }

    init(type: String, id: String, methodName: String, paramName: String,
         paramQualifiedType: String, paramSimpleType: String, valueQualifiedType: String, group: String,
         unmapped: Bool? = nil, sourceFile: String? = nil, sourceLine: Int? = nil) {
        self.type = type; self.id = id; self.methodName = methodName; self.paramName = paramName
        self.paramQualifiedType = paramQualifiedType; self.paramSimpleType = paramSimpleType
        self.valueQualifiedType = valueQualifiedType; self.group = group
        self.unmapped = unmapped
        self.sourceFile = sourceFile; self.sourceLine = sourceLine
    }
}
