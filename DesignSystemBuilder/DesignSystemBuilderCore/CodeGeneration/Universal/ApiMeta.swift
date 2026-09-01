import Foundation

struct ApiMetaComponent: Codable {
    let componentName: String
    let qualifiedName: String
    let styleQualifiedName: String
    let sizeQualifiedName: String?
    let components: [String]?
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

struct ApiMetaStateEnum: Codable {
    let qualifiedName: String
    let simpleName: String
    let values: [Value]

    struct Value: Codable {
        let name: String
    }
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

    var isUnmapped: Bool { unmapped == true || methodName.isEmpty }
    var componentState: ComponentState? { state.flatMap(ComponentState.init(rawValue:)) }
    var topGroup: String { group.split(separator: ".").first.map(String.init) ?? group }
    var isRoot: Bool { group == "root" || group.isEmpty }
    var isSize: Bool { topGroup == "size" }
}

final class ApiMetaStore {
    static let shared = ApiMetaStore()

    private(set) var byComponent: [String: ApiMetaComponent] = [:]
    /// Имя компонента → имя записи меты, из которой он генерится (`IconBadgeClear` → `Badge`).
    private var ownerByComponent: [String: String] = [:]
    private(set) var isLoaded = false

    private init() {}

    @discardableResult
    func load(from url: URL) -> Bool {
        guard let data = try? Data(contentsOf: url),
              let components = try? JSONDecoder().decode([ApiMetaComponent].self, from: data) else {
            return false
        }
        byComponent = Dictionary(components.map { ($0.componentName, $0) }, uniquingKeysWith: { first, _ in first })
        ownerByComponent = Dictionary(
            components.flatMap { entry in
                (entry.components ?? []).map { ($0, entry.componentName) }
            },
            uniquingKeysWith: { first, _ in first }
        )
        isLoaded = true
        return true
    }

    func component(_ name: String) -> ApiMetaComponent? {
        byComponent[name]
    }

    /// Запись меты, из которой генерится компонент. Явно заявленная связка
    /// (`@ApiInfo(components:)`) важнее одноимённой записи: компонент `TabBar`
    /// генерится из `TabBarIslandAppearance`, хотя `TabBarAppearance` тоже есть.
    func componentName(for component: String) -> String? {
        ownerByComponent[component] ?? (byComponent[component] != nil ? component : nil)
    }
}
