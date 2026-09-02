import XCTest
@testable import DesignSystemBuilderCore

final class UniversalGeneratorParityTests: XCTestCase {

    private let component = CodeGenerationComponent.formItem

    private let configJSON = """
    {
      "disableAlpha": { "type": "dimension", "value": 0.4 },
      "hintIcon": { "type": "icon", "value": "info.circle.outline16" },
      "hintColor": { "type": "color", "default": "text.default.secondary" },
      "titleColor": { "type": "color", "default": "text.default.primary" },
      "titleStyle": { "type": "typography", "value": "body.l.normal" },
      "titlePlacement": { "type": "value", "value": "title-start" },
      "formItemType": { "type": "value", "value": "required" },
      "topTextAlignment": { "type": "value", "value": "edge" },
      "indicatorAlignment": { "type": "value", "value": "top-end" },
      "indicatorAlignmentMode": { "type": "value", "value": "inner" },
      "indicatorStyle": { "type": "component_style", "value": "indicator.m.negative" },
      "titleBlockPadding": { "type": "dimension", "value": 16.0 },
      "hintHeight": { "type": "dimension", "value": 24.0 },
      "indicatorOffsetX": { "type": "dimension", "value": 4.0 },
      "indicatorOffsetY": { "type": "dimension", "value": 6.0 }
    }
    """

    override func setUp() {
        super.setUp()
        UniversalRuntime.currentComponent = component
        if !ApiMetaStore.shared.isLoaded {
            ApiMetaStore.shared.load(from: Self.metaURL)
        }
    }

    private static var metaURL: URL {
        URL(fileURLWithPath: #file)
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .appending(component: ".sdds/ios-api-meta.json")
    }

    private func decode<T: Decodable>(_ type: T.Type) throws -> T {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(T.self, from: Data(configJSON.utf8))
    }

    func testMetaIsLoaded() throws {
        XCTAssertTrue(ApiMetaStore.shared.isLoaded, "ios-api-meta.json must load from \(Self.metaURL.path)")
        XCTAssertNotNil(ApiMetaStore.shared.component(component.metaName))
    }

    func testAppearanceParity() throws {
        let typedProps = try decode(FormItemProps.self)
        let universalProps = try decode(UniversalProps.self)

        let typed = FormItemAppearance(props: typedProps, id: "l", component: component)
        let universal = UniversalAppearance(props: universalProps, id: "l", component: component)

        assertParity(typed: typedMirrorFields(typed), universal: universal.fields, scope: "Appearance")
    }

    func testSizeParity() throws {
        let typedProps = try decode(FormItemProps.self)
        let universalProps = try decode(UniversalProps.self)

        let typed = FormItemSize(props: typedProps, id: "l", nullify: false)
        let universal = UniversalSize(props: universalProps, id: "l", nullify: false)

        assertParity(typed: typedMirrorFields(typed), universal: universal.fields, scope: "Size")
    }


    private func typedMirrorFields(_ value: Any) -> [String: String] {
        var out: [String: String] = [:]
        for child in Mirror(reflecting: value).children {
            guard let label = child.label else { continue }
            if let string = child.value as? String {
                out[label] = string
            } else if let optional = child.value as? String?, let string = optional {
                out[label] = string
            } else if let double = child.value as? Double {
                out[label] = String(double)
            } else if let optional = child.value as? Double?, let double = optional {
                out[label] = String(double)
            }
        }
        return out
    }

    private func isEquivalent(_ typed: String, _ universal: String) -> Bool {
        if typed == universal { return true }
        let unwrapped = universal
            .replacingOccurrences(of: "CGFloat(", with: "")
            .replacingOccurrences(of: ")", with: "")
        return Double(unwrapped) != nil && Double(unwrapped) == Double(typed)
    }

    private func assertParity(typed: [String: String], universal: [String: String], scope: String) {
        XCTAssertFalse(typed.isEmpty, "\(scope): the typed path produced no fields, the test is meaningless")
        XCTAssertFalse(universal.isEmpty, "\(scope): the universal path produced no fields")

        var mismatches: [String] = []
        for (key, typedValue) in typed.sorted(by: { $0.key < $1.key }) {
            guard let universalValue = universal[key] else {
                mismatches.append("\(scope).\(key): missing in universal (typed = \(typedValue))")
                continue
            }
            if !isEquivalent(typedValue, universalValue) {
                mismatches.append("\(scope).\(key): typed = \(typedValue) | universal = \(universalValue)")
            }
        }
        let extra = Set(universal.keys).subtracting(typed.keys).sorted()
        if !extra.isEmpty {
            mismatches.append("\(scope): extra in universal: \(extra.joined(separator: ", "))")
        }
        XCTAssertTrue(mismatches.isEmpty, "Mismatches:\n" + mismatches.joined(separator: "\n"))
    }
}
