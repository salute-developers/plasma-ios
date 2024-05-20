import XCTest
@testable import SDDSThemeBuilderCore

class GradientContextBuilderTests: XCTestCase {
    var gradientContextBuilder: GradientContextBuilder!
    var validPaletteURL: URL!
    var invalidPaletteURL: URL!

    override func setUp() {
        super.setUp()

        let bundle = Bundle(for: type(of: self))
        validPaletteURL = bundle.url(forResource: "validPalette", withExtension: "json")!
        invalidPaletteURL = bundle.url(forResource: "invalidPalette", withExtension: "json")!

        gradientContextBuilder = GradientContextBuilder(paletteURL: validPaletteURL)
    }

    func testBuildContext_Success() {
        // given
        let validData = """
        {
            "lightBackgroundColor": [
                {"colors": ["#FFFFFF", "#EEEEEE"], "background": "#DDDDDD"}
            ]
        }
        """.data(using: .utf8)!

        // when
        let result = gradientContextBuilder.buildContext(from: validData)

        // then
        switch result {
        case .dictionary(let context):
            XCTAssertNotNil(context["json"], "The context should contain a 'json' key")
            if let jsonContext = context["json"] as? [String: Any] {
                XCTAssertNotNil(jsonContext["backgroundColor"], "JSON should contain 'backgroundColor'")
            } else {
                XCTFail("JSON should be a dictionary containing gradient data")
            }
        default:
            XCTFail("Expected to build context successfully")
        }
    }

    func testBuildContext_DecodingError() {
        // given
        let invalidData = "Invalid JSON".data(using: .utf8)!

        // when
        let result = gradientContextBuilder.buildContext(from: invalidData)

        // then
        switch result {
        case .error(let error as GeneralError):
            XCTAssertEqual(error, GeneralError.decoding, "Expected a decoding error")
        default:
            XCTFail("Expected a decoding error but got \(result)")
        }
    }

    func testBuildContext_EmptyData() {
        // given
        let emptyData = Data()

        // when
        let result = gradientContextBuilder.buildContext(from: emptyData)

        // then
        switch result {
        case .error(let error as GeneralError):
            XCTAssertEqual(error, GeneralError.decoding, "Expected a decoding error with empty data")
        default:
            XCTFail("Expected a decoding error but got \(result)")
        }
    }
}
