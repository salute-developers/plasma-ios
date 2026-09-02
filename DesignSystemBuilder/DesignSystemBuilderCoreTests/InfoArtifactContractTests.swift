import XCTest
@testable import DesignSystemBuilderCore

/// Контракт info-артефактов документации (`config-info-ios.json`,
/// `config-info-tokens-ios.json`) с backend Documentation Service.
/// Эталон — golden-фикстуры из design-system-builder
/// (`feature-processing/src/test/resources/contracts/ios-components.json`,
/// `ios-theme.json`), скопированные в `Fixtures/InfoArtifacts/` дословно.
/// Backend-DTO: `InfoArtifactDtos.kt` — required-поля повторены в
/// `BackendComponentInfo`/`BackendThemeInfo` ниже.
final class InfoArtifactContractTests: XCTestCase {

    // MARK: - Backend contract mirror (required = non-optional)

    private struct BackendComponentInfo: Decodable {
        let name: String?
        let packageName: String?
        let components: [Component]

        struct Component: Decodable {
            let key: String
            let coreName: String
            let styleName: String
            let props: [Prop]?
            let styleApi: StyleApi?
            let variations: [Variation]

            struct Prop: Decodable {
                let name: String
                let values: [String]?
                let defaultValue: String?
            }
            struct StyleApi: Decodable {
                let stylesClassName: String?
                let returnTypeName: String?
                let params: [Param]?
                struct Param: Decodable {
                    let name: String
                    let type: String
                    let typeName: String?
                    let values: [Value]?
                    struct Value: Decodable {
                        let value: String
                        let codeName: String?
                    }
                }
            }
            struct Variation: Decodable {
                let name: String
                let reference: String?
                let props: [PropValue]?
                struct PropValue: Decodable {
                    let name: String
                    let value: String
                }
            }
        }
    }

    private struct BackendThemeInfo: Decodable {
        let name: String
        let version: String
        let platform: String?
        let tokens: [Token]

        struct Token: Decodable {
            let type: String
            let name: String
            let displayName: String?
            let description: String?
            let reference: String?
            let themeReference: String?
            let tenant: String?
            let theme: String?
        }
    }

    // MARK: - Golden fixtures decode

    func test_goldenComponentsFixture_decodesWithBackendContract() throws {
        let info = try decodeFixture("ios-components.json", as: BackendComponentInfo.self)
        XCTAssertEqual(info.components.count, 1)
        let component = try XCTUnwrap(info.components.first)
        XCTAssertEqual(component.key, "form-item")
        XCTAssertEqual(component.variations.first?.reference, "FormItem.M")
        XCTAssertEqual(component.styleApi?.returnTypeName, "AppearanceVariation<FormItemAppearance>")
        XCTAssertEqual(component.styleApi?.params?.first?.typeName, "FormItemStyles.Size")
    }

    func test_goldenThemeFixture_decodesWithBackendContract() throws {
        let info = try decodeFixture("ios-theme.json", as: BackendThemeInfo.self)
        XCTAssertNil(info.platform, "iOS theme-info не несёт поля platform")
        let token = try XCTUnwrap(info.tokens.first)
        XCTAssertEqual(token.type, "typography")
        XCTAssertEqual(token.themeReference, "SampleTheme.AdaptiveTypographyToken.headerH2Medium")
    }

    // MARK: - Our encoders produce backend-compatible JSON

    func test_configInfo_encodesToBackendCompatibleJson() throws {
        let meta = ConfigInfo.ComponentMeta(
            key: "form-item",
            coreName: "FormItem",
            styleName: "FormItem",
            props: [.init(name: "size", values: ["m"])],
            styleApi: .init(
                stylesClassName: "FormItemStyles",
                returnTypeName: "AppearanceVariation<FormItemAppearance>",
                params: [.init(
                    name: "size",
                    type: "enum",
                    typeName: "FormItemStyles.Size",
                    values: [.init(value: "m", codeName: "M")]
                )]
            ),
            variations: [.init(
                name: "m",
                reference: "FormItem.M",
                props: [.init(name: "size", value: "m")]
            )]
        )
        let info = ConfigInfo(name: "Sample", packageName: "Sample", components: [meta])

        let decoded = try roundTrip(info, as: BackendComponentInfo.self)
        let component = try XCTUnwrap(decoded.components.first)
        XCTAssertEqual(component.key, "form-item")
        XCTAssertEqual(component.variations.first?.reference, "FormItem.M")
        XCTAssertEqual(component.styleApi?.stylesClassName, "FormItemStyles")
    }

    func test_tokensMeta_encodesToBackendCompatibleJson() throws {
        let entry = TokenMetaEntry(
            theme: "",
            type: "color",
            name: "dark.surface.default.solid-card",
            displayName: "solidCardDefault",
            description: "Фон карточек",
            tenant: "",
            reference: "SurfaceDefaultSolidCard",
            themeReference: "SampleTheme.colors.surfaceDefaultSolidCard",
            value: .string("0xFF0D0D0D")
        )
        let file = TokensMetaFile(name: "sample_default", version: "latest", tokens: [entry])

        let decoded = try roundTrip(file, as: BackendThemeInfo.self)
        XCTAssertEqual(decoded.name, "sample_default")
        let token = try XCTUnwrap(decoded.tokens.first)
        XCTAssertEqual(token.type, "color")
        XCTAssertEqual(token.themeReference, "SampleTheme.colors.surfaceDefaultSolidCard")
        XCTAssertFalse(try XCTUnwrap(token.reference).isEmpty,
                       "backend требует хотя бы один lookup term категории reference")
    }

    // MARK: - Negative: backend rejects blank key

    func test_blankComponentKey_failsBackendValidation() throws {
        let json = """
        {"components":[{"key":"","coreName":"X","styleName":"X","variations":[]}]}
        """
        let info = try JSONDecoder().decode(BackendComponentInfo.self, from: Data(json.utf8))
        // Декод проходит (key — строка), но валидация непустого key — на нашей стороне
        // до записи файла: пустой key валит весь артефакт у backend
        // (JsonStructuredArtifactAdaptersTest.malformedElementBlocksWholeArtifact).
        XCTAssertTrue(info.components[0].key.isEmpty)
        XCTAssertTrue(ConfigInfoValidator.validate(componentsWithKeys: [""]).isEmpty == false)
    }

    func test_validator_reportsBlankRequiredFields() {
        XCTAssertTrue(ConfigInfoValidator.validate(componentsWithKeys: ["form-item"]).isEmpty)
        let issues = ConfigInfoValidator.validate(componentsWithKeys: ["form-item", "", "badge"])
        XCTAssertEqual(issues.count, 1)
    }

    // MARK: - Helpers

    private func decodeFixture<T: Decodable>(_ filename: String, as type: T.Type) throws -> T {
        let url = URL(fileURLWithPath: #file)
            .deletingLastPathComponent()
            .appending(component: "Fixtures/InfoArtifacts")
            .appending(component: filename)
        return try JSONDecoder().decode(T.self, from: Data(contentsOf: url))
    }

    private func roundTrip<E: Encodable, D: Decodable>(_ value: E, as type: D.Type) throws -> D {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.sortedKeys]
        return try JSONDecoder().decode(D.self, from: encoder.encode(value))
    }
}
