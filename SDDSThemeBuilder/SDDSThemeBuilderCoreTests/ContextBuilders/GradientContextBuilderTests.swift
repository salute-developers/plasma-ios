import XCTest
@testable import SDDSThemeBuilderCore

final class GradientContextBuilderTests: XCTestCase {
    var gradientContextBuilder: GradientContextBuilder!
    var mockPaletteURL: URL!
    var gradientJsonURL: URL!
    var invalidGradinentJsonURL: URL!

    override func setUp() {
        super.setUp()

        mockPaletteURL = GradientContextBuilderTests.fileURL(forResource: "palette", withExtension: "json")
        gradientJsonURL = GradientContextBuilderTests.fileURL(forResource: "ios_gradient", withExtension: "json")
        invalidGradinentJsonURL = GradientContextBuilderTests.fileURL(forResource: "ios_gradient_invalid", withExtension: "json")

        gradientContextBuilder = GradientContextBuilder(paletteURL: mockPaletteURL)
    }

    static func fileURL(forResource resource: String, withExtension ext: String) -> URL {
        let bundle = Bundle(for: GradientContextBuilderTests.self)
        guard let url = bundle.url(forResource: resource, withExtension: ext) else {
            fatalError("File \(resource).\(ext) not found in test bundle")
        }
        return url
    }

    func testBuildContext_ValidAlias_Success() {
        // given
        let jsonData = try! Data(contentsOf: gradientJsonURL)
        
        // when
        let result = gradientContextBuilder.buildContext(from: jsonData)

        // then
        switch result {
        case .dictionary(let context):
            guard let json = context["json"] as? [String: Any] else {
                XCTAssertNotNil(context["json"], "Context should contain 'json' key")
                return
            }
            
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: json)
                let decoder = JSONDecoder()
                let theme = try decoder.decode(PrimaryTheme.self, from: jsonData)
                XCTAssertEqual(theme.textDefaultPrimary.dark.first?.colors.first, "#2E090D")
                XCTAssertEqual(theme.textDefaultPrimary.light.first?.colors.first, "#120809")
            } catch {
                print("Error decoding JSON: \(error)")
            }
        default:
            XCTFail("Expected successful context build")
        }
    }

    func testBuildContext_InvalidAlias_Failure() {
        // given
        let jsonData = try! Data(contentsOf: invalidGradinentJsonURL)
        
        // when
        let result = gradientContextBuilder.buildContext(from: jsonData)

        // then
        switch result {
        case .dictionary(let context):
            guard let json = context["json"] as? [String: Any] else {
                XCTAssertNotNil(context["json"], "Context should contain 'json' key")
                return
            }
            
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: json)
                let decoder = JSONDecoder()
                let theme = try decoder.decode(PrimaryTheme.self, from: jsonData)
                let darkColors = theme.textDefaultPrimary.dark.first?.colors ?? []
                let lightColors = theme.textDefaultPrimary.light.first?.colors ?? []
                XCTAssertTrue(darkColors.count == 1 && darkColors[0] == "#000000")
                XCTAssertTrue(lightColors.count == 1 && lightColors[0] == "#000000")
            } catch {
                print("Error decoding JSON: \(error)")
            }
        default:
            XCTFail("Expected successful context build")
        }
    }
    
    func testBuildContext_PopulateMissingColors() {
        // given
        let jsonData = """
        {
            "light.primary": [
                {
                    "kind": "linear",
                    "angle": 45,
                    "colors": ["#120809", "#2E090D"],
                    "locations": [0.0, 1.0]
                }
            ],
            "dark.secondary": [
                {
                    "kind": "linear",
                    "angle": 45,
                    "colors": ["#0D1F2E", "#091D2E"],
                    "locations": [0.0, 1.0]
                }
            ]
        }
        """.data(using: .utf8)!

        // when
        let result = gradientContextBuilder.buildContext(from: jsonData)

        // then
        switch result {
        case .dictionary(let context):
            guard let json = context["json"] as? [String: Any] else {
                XCTAssertNotNil(context["json"], "Context should contain 'json' key")
                return
            }

            if let primary = json["primary"] as? [String: Any],
               let lightPrimary = primary["light"] as? [[String: Any]],
               let darkPrimary = primary["dark"] as? [[String: Any]] {
                XCTAssertEqual(lightPrimary.first?["colors"] as? [String], ["#120809", "#2E090D"], "Primary light colors should match palette red.1000 and red.950")
                XCTAssertEqual(darkPrimary.first?["colors"] as? [String], ["#120809", "#2E090D"], "Primary dark colors should fallback to light colors")
            } else {
                XCTFail("Primary gradient structure is not as expected")
            }

            if let secondary = json["secondary"] as? [String: Any],
               let lightSecondary = secondary["light"] as? [[String: Any]],
               let darkSecondary = secondary["dark"] as? [[String: Any]] {
                XCTAssertEqual(darkSecondary.first?["colors"] as? [String], ["#0D1F2E", "#091D2E"], "Secondary dark colors should match palette blue.1000 and blue.950")
                XCTAssertEqual(lightSecondary.first?["colors"] as? [String], ["#0D1F2E", "#091D2E"], "Secondary light colors should fallback to dark colors")
            } else {
                XCTFail("Secondary gradient structure is not as expected")
            }
        default:
            XCTFail("Expected successful context build")
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
        let result = gradientContextBuilder.buildContext(from: jsonData)

        // then
        XCTAssertTrue(result.isError, "Should fail due to missing dark and light modes")
    }

}

private struct PrimaryTheme: Codable {
    let textDefaultPrimary: PrimaryGradientTheme
}

private struct PrimaryGradientTheme: Codable {
    let dark: [PrimaryGradient]
    let light: [PrimaryGradient]
}

private struct PrimaryGradient: Codable {
    let kind: String
    let angle: Int?
    let colors: [String]
    let locations: [Double]
}
