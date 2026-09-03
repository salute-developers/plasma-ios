import XCTest
@testable import DesignSystemBuilderCore

final class TokenMetaResolverTests: XCTestCase {

    private func resolver(
        color: [String: Any] = [:],
        gradient: [String: Any] = [:],
        typography: [String: Any] = [:],
        shadow: [String: Any] = [:],
        shape: [String: Any] = [:],
        spacing: [String: Any] = [:],
        namespace: String = "PlasmaHomeDSTheme"
    ) -> TokenMetaResolver {
        TokenMetaResolver(
            namespace: namespace,
            colorJson: color,
            gradientJson: gradient,
            typographyJson: typography,
            shadowJson: shadow,
            shapeJson: shape,
            spacingJson: spacing
        )
    }

    private func token(
        _ type: TokenKind,
        _ name: String,
        displayName: String = "display",
        description: String = "desc",
        enabled: Bool = true
    ) -> Token {
        Token(type: type, name: name, tags: [], displayName: displayName, description: description, enabled: enabled)
    }

    private func encoded(_ value: JSONValue) throws -> String {
        String(data: try JSONEncoder().encode([value]), encoding: .utf8)!
    }

    func test_argb_from6DigitAddsOpaqueAlpha() {
        XCTAssertEqual(TokenMetaResolver.argb(fromRGBAHex: "#080808"), "0xFF080808")
        XCTAssertEqual(TokenMetaResolver.argb(fromRGBAHex: "#199AF0"), "0xFF199AF0")
    }

    func test_argb_from8DigitMovesAlphaFront() {
        XCTAssertEqual(TokenMetaResolver.argb(fromRGBAHex: "#00000066"), "0x66000000")
        XCTAssertEqual(TokenMetaResolver.argb(fromRGBAHex: "#F5F5F593"), "0x93F5F5F5")
    }

    func test_pascalCase() {
        XCTAssertEqual(TokenMetaResolver.pascalCase("outlineOnDarkInfo"), "OutlineOnDarkInfo")
        XCTAssertEqual(TokenMetaResolver.pascalCase("spacing0x"), "Spacing0x")
    }

    func test_jsonValue_zeroAndOneStayNumbers() throws {
        XCTAssertEqual(try encoded(JSONValue.make(from: 0)), "[0]")
        XCTAssertEqual(try encoded(JSONValue.make(from: 1)), "[1]")
        XCTAssertEqual(try encoded(JSONValue.make(from: true)), "[true]")
        XCTAssertEqual(try encoded(JSONValue.make(from: false)), "[false]")
    }

    func test_jsonValue_integralNumberEncodesWithoutDecimal() throws {
        XCTAssertEqual(try encoded(JSONValue.make(from: 20.0)), "[20]")
    }

    func test_colorEntry() throws {
        let entry = try XCTUnwrap(
            resolver(color: ["outlineOnDarkInfo": ["dark": "#199AF0", "light": "#0E8ADD"]])
                .entry(for: token(.color, "dark.outline.on-dark.info", displayName: "onDarkOutlineInfo"))
        )
        XCTAssertEqual(entry.theme, "dark")
        XCTAssertEqual(entry.type, "color")
        XCTAssertEqual(entry.name, "dark.outline.on-dark.info")
        XCTAssertEqual(entry.reference, "OutlineOnDarkInfo")
        XCTAssertEqual(entry.themeReference, "PlasmaHomeDSTheme.ColorToken.outlineOnDarkInfo")
        XCTAssertEqual(entry.tenant, "")
        guard case .string(let value) = entry.value else { return XCTFail("expected string value") }
        XCTAssertEqual(value, "0xFF199AF0")
    }

    func test_gradientEntry_locationsStayNumbers_colorsToARGB() throws {
        let json: [String: Any] = ["accentGradient": ["dark": [["kind": "linear", "angle": 45, "colors": ["#120809", "#2E090D"], "locations": [0, 1]]]]]
        let entry = try XCTUnwrap(resolver(gradient: json).entry(for: token(.gradient, "dark.accent-gradient")))
        let encodedValue = try encoded(entry.value)
        XCTAssertTrue(encodedValue.contains("\"locations\":[0,1]"), encodedValue)
        XCTAssertFalse(encodedValue.contains("false"), "locations 0/1 must not become bool")
        XCTAssertTrue(encodedValue.contains("0xFF120809"), encodedValue)
    }

    func test_typographyEntry_usesScreenSubValue() throws {
        let json: [String: Any] = ["headerH2Medium": ["large": ["size": 32, "weight": "medium"]]]
        let entry = try XCTUnwrap(resolver(typography: json).entry(for: token(.typography, "screen-l.header.h2.medium")))
        XCTAssertEqual(entry.theme, "")
        XCTAssertEqual(entry.reference, "HeaderH2Medium")
        XCTAssertEqual(entry.themeReference, "PlasmaHomeDSTheme.AdaptiveTypographyToken.headerH2Medium")
        guard case .object(let object) = entry.value, case .number(let size)? = object["size"] else {
            return XCTFail("expected object value with size")
        }
        XCTAssertEqual(size, 32)
    }

    func test_spacingEntry_valueIsNumber() throws {
        let entry = try XCTUnwrap(resolver(spacing: ["spacing0x": ["value": 0]]).entry(for: token(.spacing, "spacing.0x")))
        XCTAssertEqual(entry.themeReference, "PlasmaHomeDSTheme.SpacingToken.spacing0x")
        XCTAssertEqual(try encoded(entry.value), "[0]")
    }

    func test_shapeEntry() throws {
        let entry = try XCTUnwrap(resolver(shape: ["roundL": ["cornerRadius": 16, "kind": "round"]]).entry(for: token(.shape, "round.l")))
        XCTAssertEqual(entry.reference, "RoundL")
        XCTAssertEqual(entry.themeReference, "PlasmaHomeDSTheme.ShapeToken.roundL")
    }

    func test_fontFamilyExcluded() {
        XCTAssertNil(resolver().entry(for: token(.fontFamily, "display")))
    }

    func test_disabledExcluded() {
        XCTAssertNil(resolver(color: ["x": ["dark": "#000000"]]).entry(for: token(.color, "dark.x", enabled: false)))
    }

    func test_missingResolvedValueSkipsEntry() {
        XCTAssertNil(resolver(color: [:]).entry(for: token(.color, "dark.text.primary")))
    }

    func test_entries_filtersAndMaps() {
        let tokens = [
            token(.color, "dark.text.primary"),
            token(.fontFamily, "display"),
            token(.color, "dark.x", enabled: false)
        ]
        let entries = resolver(color: ["textPrimary": ["dark": "#080808"]]).entries(for: tokens)
        XCTAssertEqual(entries.count, 1)
        XCTAssertEqual(entries.first?.reference, "TextPrimary")
    }
}
