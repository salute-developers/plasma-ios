import XCTest
@testable import DesignSystemBuilderCore

/// Инварианты `ios-api-meta.json`, которые проверяет импорт в базу дизайн-системы.
///
/// Свойство компонента там уникально по имени и несёт ровно один тип, а состояния
/// заводятся по объявленному набору — состояние, которое есть в конфигурации, но не
/// объявлено, импортировать не из чего. Оба требования до сих пор ловились только
/// глазами на ревью, и оба один раз проехали.
final class ApiMetaInvariantsTests: XCTestCase {

    override func setUp() {
        super.setUp()
        if !ApiMetaStore.shared.isLoaded {
            ApiMetaStore.shared.load(from: Self.metaURL)
        }
    }

    /// Один id внутри компонента — один тип.
    func testParamIdCarriesSingleType() throws {
        var conflicts: [String] = []
        for (component, meta) in ApiMetaStore.shared.byComponent.sorted(by: { $0.key < $1.key }) {
            var typesById: [String: Set<String>] = [:]
            for param in meta.params {
                typesById[param.id, default: []].insert(param.type)
            }
            for (id, types) in typesById where types.count > 1 {
                conflicts.append("\(component).\(id): \(types.sorted().joined(separator: ", "))")
            }
        }
        XCTAssertTrue(conflicts.isEmpty, "One property id must carry one type:\n" + conflicts.joined(separator: "\n"))
    }

    /// Тип соответствует природе значения: коэффициент не бывает размером, счётчик — числом с точкой.
    func testParamTypeMatchesName() throws {
        let expectations: [(suffixes: [String], type: String)] = [
            (["factor", "alpha", "opacity", "ratio"], "float"),
            (["count", "columns"], "integer"),
        ]
        var mismatches: [String] = []
        for (component, meta) in ApiMetaStore.shared.byComponent.sorted(by: { $0.key < $1.key }) {
            for param in meta.params {
                let name = param.id.lowercased()
                for expectation in expectations where expectation.suffixes.contains(where: { name.hasSuffix($0) }) {
                    if param.type != expectation.type {
                        mismatches.append("\(component).\(param.id): \(param.type), expected \(expectation.type)")
                    }
                }
            }
        }
        XCTAssertTrue(mismatches.isEmpty, "Property types do not match their names:\n" + mismatches.joined(separator: "\n"))
    }

    /// Набор состояний полон: всё, что встречается в конфигурациях оформления, объявлено.
    ///
    /// Состояния взаимодействия в наборе не участвуют — их словарь общий для всех компонентов
    /// и заводится не платформой.
    func testDeclaredStatesCoverConfigurations() throws {
        var missing: [String] = []
        for component in CodeGenerationComponent.supportedComponents.sorted(by: { $0.rawValue < $1.rawValue }) {
            let fixture = Self.fixturesURL.appending(component: component.configurationFilename(themeConfig: Self.themeConfig))
            guard let data = try? Data(contentsOf: fixture) else { continue }
            let used = Self.states(in: try JSONSerialization.jsonObject(with: data)).subtracting(Self.interactionStates)
            guard !used.isEmpty else { continue }
            let declared = ApiMetaStore.shared.component(component.metaName)?.stateEnum?.configIds ?? []
            let undeclared = used.subtracting(declared)
            if !undeclared.isEmpty {
                missing.append("\(component.metaName) (\(component.rawValue)): \(undeclared.sorted().joined(separator: ", "))")
            }
        }
        XCTAssertTrue(
            missing.isEmpty,
            "States are present in configurations but not declared with @ApiStates/@ApiStateEnum:\n"
                + missing.joined(separator: "\n")
        )
    }

    /// Состояния взаимодействия: словарь общий для всех компонентов, платформа их не объявляет.
    private static let interactionStates: Set<String> = [
        "pressed", "hovered", "focused", "selected", "activated", "readonly", "disabled",
    ]

    private static func states(in json: Any) -> Set<String> {
        switch json {
        case let dictionary as [String: Any]:
            var result: Set<String> = []
            if let states = dictionary["state"] as? [String] {
                result.formUnion(states)
            }
            for value in dictionary.values {
                result.formUnion(states(in: value))
            }
            return result
        case let array as [Any]:
            return array.reduce(into: Set<String>()) { $0.formUnion(states(in: $1)) }
        default:
            return []
        }
    }

    private static let themeConfig = DesignSystemBuilderConfiguration.ThemeConfiguration(
        name: "SDDSServ",
        url: "\(DesignSystemBuilderConfiguration.Theme.baseURL)/sdds_serv/latest.zip"
    )

    private static var testsURL: URL {
        URL(fileURLWithPath: #file).deletingLastPathComponent()
    }

    private static var fixturesURL: URL {
        testsURL.appending(component: "Fixtures/ComponentConfigs")
    }

    private static var metaURL: URL {
        testsURL
            .deletingLastPathComponent()
            .appending(component: ".sdds/ios-api-meta.json")
    }
}
