import XCTest
@testable import SDDSThemeBuilderCore

final class TypographyContextBuilderTests: XCTestCase {
    var typographyContextBuilder: TypographyContextBuilder!
    var mockFontFamiliesContainer: FontFamiliesContainer!

    override func setUp() {
        super.setUp()
        let boldFontURL = TypographyContextBuilderTests.fontURL(forResource: "SBSansDisplay-Bold", withExtension: "otf")

        let displayFonts = [
            Font(link: boldFontURL, weight: .light, style: .normal)
        ]

        mockFontFamiliesContainer = FontFamiliesContainer(items: [
            .display: FontFamily(name: "SBSansDisplay", fonts: displayFonts)
        ])

        typographyContextBuilder = TypographyContextBuilder(fontFamiliesContainer: mockFontFamiliesContainer)
    }

    static func fontURL(forResource resource: String, withExtension ext: String) -> URL {
        let bundle = Bundle(for: TypographyContextBuilderTests.self)
        guard let url = bundle.url(forResource: resource, withExtension: ext) else {
            fatalError("Font file \(resource).\(ext) not found in test bundle")
        }
        return url
    }

    func testBuildContext_Success() {
        // given
        let jsonData = """
        {
            "screen-s.header.h1.bold": {
                "fontFamilyRef": "font-family.display",
                "weight": "light",
                "style": "normal",
                "size": 28,
                "lineHeight": 34,
                "kerning": 0
            }
        }
        """.data(using: .utf8)!

        // when
        let result = typographyContextBuilder.buildContext(from: jsonData)

        // then
        switch result {
        case .dictionary(let context):
            XCTAssertNotNil(context["json"], "Context should contain 'json' key")
            if let json = context["json"] as? [String: Any],
               let header = json["headerH1Bold"] as? [String: Any],
               let small = header["small"] as? [String: Any] {
                XCTAssertEqual(small["fontName"] as? String, "SBSansDisplay-Bold")
            } else {
                XCTFail("JSON structure is not as expected")
            }
        default:
            XCTFail("Expected successful context build")
        }
    }

    func testBuildContext_InvalidTokenFormat() {
        // given
        let jsonData = """
        {
            "subHeader": {
                "fontFamilyRef": "display",
                "weight": "ultraLight",
                "style": "invalidStyle"
            }
        }
        """.data(using: .utf8)!

        // when
        let result = typographyContextBuilder.buildContext(from: jsonData)

        // then
        switch result {
        case .error(let error as GeneralError):
            XCTAssertEqual(error, GeneralError.invalidTokenFormat, "Expected invalid token format error")
        default:
            XCTFail("Expected failure due to invalid token format")
        }
    }

    func testBuildContext_InvalidScreenSize() {
        // given
        let jsonData = """
        {
            "invalidScreen.header": {
                "fontFamilyRef": "display",
                "weight": "bold",
                "style": "normal"
            }
        }
        """.data(using: .utf8)!

        // when
        let result = typographyContextBuilder.buildContext(from: jsonData)

        // then
        if !result.isError {
            XCTFail("Expected failure due to invalid screen size")
        }
    }
}
