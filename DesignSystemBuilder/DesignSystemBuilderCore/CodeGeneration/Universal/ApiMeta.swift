import Foundation

struct ApiMetaComponent: Codable {
    let componentName: String
    let qualifiedName: String
    let styleQualifiedName: String
    let sizeQualifiedName: String?
    let resolvedTypes: [String]
    let stateEnum: ApiMetaStateEnum?
    let params: [ApiMetaParam]

    var appearanceType: String { Self.simpleName(qualifiedName) }
    var sizeType: String? { sizeQualifiedName.map(Self.simpleName) }

    private static func simpleName(_ qualified: String) -> String {
        qualified.components(separatedBy: ".").last ?? qualified
    }
}

struct ApiMetaValueEnum: Codable {
    let qualifiedName: String
    let simpleName: String
    let values: [Value]
    let defaultValue: String?

    struct Value: Codable {
        let name: String
        let id: String
    }

    /// Case, на который проецируется значение конфига. Разделители и регистр не
    /// значимы (`top-end` → `topEnd`), поэтому маркер нужен только там, где значение
    /// отличается по существу (`inside` → `inner`).
    func context(for value: String?) -> String? {
        if let value {
            let needle = Self.normalize(value)
            if let match = values.first(where: { Self.normalize($0.id) == needle }) {
                return "\(simpleName).\(match.name)"
            }
        }
        return defaultValue.map { "\(simpleName).\($0)" }
    }

    private static func normalize(_ value: String) -> String {
        value.lowercased().filter { $0.isLetter || $0.isNumber }
    }
}

/// Собственные состояния компонента. Swift-типа у набора может не быть — тогда
/// `qualifiedName`/`simpleName` пусты, а состояния перечислены разметкой.
struct ApiMetaStateEnum: Codable {
    let qualifiedName: String?
    let simpleName: String?
    let values: [Value]

    struct Value: Codable {
        let name: String
        let configName: String?

        /// Имя в той форме, в какой состояние встречается в конфигурации оформления.
        var configId: String { configName ?? name }
    }

    var configIds: Set<String> { Set(values.map { $0.configId }) }
}

struct ApiMetaParam: Codable {
    let type: String
    let id: String
    let methodName: String
    let paramName: String
    let paramQualifiedType: String
    let paramSimpleType: String
    let valueQualifiedType: String
    let group: String
    let unmapped: Bool?
    let state: String?
    let copyOf: String?
    let valueEnum: ApiMetaValueEnum?
    let fromVariation: Bool?
    let markupValue: String?
    let markupZero: String?
    let rawNumber: Bool?
    let alwaysEmit: Bool?
    let stateOnly: Bool?
    /// Id свойства конфига, из имени иконки которого берётся размер (`close.24` → 24).
    /// Собственный `id` у такого свойства свой: ключ конфига уже занят самой иконкой.
    let sizeFromIconId: String?

    /// Свойство — размер иконки: тип обычный `dimension`, но значение лежит в имени иконки.
    var isIconSize: Bool { sizeFromIconId != nil }

    /// Ключ, под которым значение свойства лежит в конфигурации оформления.
    var configId: String { sizeFromIconId ?? id }

    var isUnmapped: Bool { unmapped == true || methodName.isEmpty }
    var componentState: ComponentState? { state.flatMap(ComponentState.init(rawValue:)) }
    var topGroup: String { group.split(separator: ".").first.map(String.init) ?? group }
    var isRoot: Bool { group == "root" || group.isEmpty }
    var isSize: Bool { topGroup == "size" }
}

final class ApiMetaStore {
    static let shared = ApiMetaStore()

    private(set) var byComponent: [String: ApiMetaComponent] = [:]
    private(set) var isLoaded = false

    private init() {}

    @discardableResult
    func load(from url: URL) -> Bool {
        guard let data = try? Data(contentsOf: url),
              let components = try? JSONDecoder().decode([ApiMetaComponent].self, from: data) else {
            return false
        }
        byComponent = Dictionary(components.map { ($0.componentName, $0) }, uniquingKeysWith: { first, _ in first })
        isLoaded = true
        return true
    }

    func component(_ name: String) -> ApiMetaComponent? {
        byComponent[name]
    }

}
