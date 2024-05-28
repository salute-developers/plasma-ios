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
                XCTAssertTrue(theme.textDefaultPrimary.dark.first?.colors.first?.isEmpty ?? false)
                XCTAssertTrue(theme.textDefaultPrimary.light.first?.colors.first?.isEmpty ?? false)
            } catch {
                print("Error decoding JSON: \(error)")
            }
        default:
            XCTFail("Expected successful context build")
        }
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
