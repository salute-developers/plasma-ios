import XCTest
@testable import SDDSThemeBuilderCore

final class ColorContextBuilderTests: XCTestCase {
    var colorContextBuilder: ColorContextBuilder!
    var mockPaletteURL: URL!

    override func setUp() {
        super.setUp()

        mockPaletteURL = GradientContextBuilderTests.fileURL(forResource: "palette", withExtension: "json")
        colorContextBuilder = ColorContextBuilder(paletteURL: mockPaletteURL)
    }
    
    static func fileURL(forResource resource: String, withExtension ext: String) -> URL {
        let bundle = Bundle(for: TypographyContextBuilderTests.self)
        guard let url = bundle.url(forResource: resource, withExtension: ext) else {
            fatalError("File \(resource).\(ext) not found in test bundle")
        }
        return url
    }

    func testBuildContext_ValidAlias_Success() {
        // given
        let jsonData = """
        {
            "light.primary": "[palette.red.1000]",
            "dark.primary": "[palette.red.950]"
        }
        """.data(using: .utf8)!

        // when
        let result = colorContextBuilder.buildContext(from: jsonData)

        // then
        switch result {
        case .dictionary(let context):
            XCTAssertNotNil(context["json"], "Context should contain 'json' key")
            if let json = context["json"] as? [String: Any],
               let primary = json["primary"] as? [String: Any],
               let lightPrimary = primary["light"] as? String,
               let darkPrimary = primary["dark"] as? String {
                XCTAssertEqual(lightPrimary, "#120809", "Should match the hex color for red.1000")
                XCTAssertEqual(darkPrimary, "#2E090D", "Should match the hex color for red.950")
            } else {
                XCTFail("JSON structure is not as expected")
            }
        default:
            XCTFail("Expected successful context build")
        }
    }
    
    func testBuildContext_ValidAliasWithAlpha_Success() {
        // given
        let jsonData = """
        {
            "light.primary": "[palette.red.1000][0.5]",
            "dark.primary": "[palette.red.950][0.4]"
        }
        """.data(using: .utf8)!

        // when
        let result = colorContextBuilder.buildContext(from: jsonData)

        // then
        switch result {
        case .dictionary(let context):
            XCTAssertNotNil(context["json"], "Context should contain 'json' key")
            if let json = context["json"] as? [String: Any],
               let primary = json["primary"] as? [String: Any],
               let lightPrimary = primary["light"] as? String,
               let darkPrimary = primary["dark"] as? String {
                XCTAssertEqual(lightPrimary, "#1108097F", "Should match the hex color for red.1000")
                XCTAssertEqual(darkPrimary, "#2D090C66", "Should match the hex color for red.950")
            } else {
                XCTFail("JSON structure is not as expected")
            }
        default:
            XCTFail("Expected successful context build")
        }
    }

    func testBuildContext_InvalidAlias_Failure() {
        // given
        let jsonData = """
        {
            "light.primary": "[palette.red.999]",
            "dark.primary": "[palette.red.950]"
        }
        """.data(using: .utf8)!

        // when
        let result = colorContextBuilder.buildContext(from: jsonData)

        // then
        XCTAssertTrue(result.isError, "Should fail due to an invalid color alias")
    }
    
    func testBuildContext_InvalidAliasFormat_Failure() {
        // given
        let jsonData = """
        {
            "light.primary": "[palette.red.999][]",
            "dark.primary": "[palette.red.950]"
        }
        """.data(using: .utf8)!

        // when
        let result = colorContextBuilder.buildContext(from: jsonData)

        // then
        XCTAssertTrue(result.isError, "Should fail due to an invalid color alias")
    }

    func testBuildContext_MissingPaletteData() {
        // given
        let missingPaletteURL = FileManager.default.temporaryDirectory.appendingPathComponent("missing_palette.json")
        colorContextBuilder = ColorContextBuilder(paletteURL: missingPaletteURL)
        let jsonData = """
        {
            "light.primary": "[palette.red.1000]",
            "dark.primary": "[palette.red.950]"
        }
        """.data(using: .utf8)!

        // when
        let result = colorContextBuilder.buildContext(from: jsonData)

        // then
        XCTAssertTrue(result.isError, "Should fail due to missing palette data")
    }
    
    func testPopulateMissingColors() {
        // given
        var colors: [String: Any] = [
            "primary": [
                "light": "#FFFFFF"
            ],
            "secondary": [
                "dark": "#000000"
            ],
            "tertiary": [
                "light": "#CCCCCC",
                "dark": "#333333"
            ]
        ]
        
        // when
        colorContextBuilder.populateMissingColors(&colors)
        
        // then
        if let primary = colors["primary"] as? [String: Any] {
            XCTAssertEqual(primary["light"] as? String, "#FFFFFF", "Primary light color should be #FFFFFF")
            XCTAssertEqual(primary["dark"] as? String, "#FFFFFF", "Primary dark color should fallback to #FFFFFF")
        } else {
            XCTFail("Primary color dictionary is missing")
        }
        
        if let secondary = colors["secondary"] as? [String: Any] {
            XCTAssertEqual(secondary["dark"] as? String, "#000000", "Secondary dark color should be #000000")
            XCTAssertEqual(secondary["light"] as? String, "#000000", "Secondary light color should fallback to #000000")
        } else {
            XCTFail("Secondary color dictionary is missing")
        }
        
        if let tertiary = colors["tertiary"] as? [String: Any] {
            XCTAssertEqual(tertiary["light"] as? String, "#CCCCCC", "Tertiary light color should be #CCCCCC")
            XCTAssertEqual(tertiary["dark"] as? String, "#333333", "Tertiary dark color should be #333333")
        } else {
            XCTFail("Tertiary color dictionary is missing")
        }
    }

    func testBuildContext_NoDarkOrLight() {
        // given
        let jsonData = """
        {
            "primary": {
                "someMode": "#FFFFFF"
            }
        }
        """.data(using: .utf8)!

        // when
        let result = colorContextBuilder.buildContext(from: jsonData)

        // then
        XCTAssertTrue(result.isError, "Should fail due to missing dark and light modes")
    }
}
