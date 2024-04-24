import XCTest
@testable import SDDSThemeBuilderCore

final class GeneralContextBuilderTests: XCTestCase {
    var contextBuilder: GeneralContextBuilder!
    
    override func setUp() {
        super.setUp()
        contextBuilder = GeneralContextBuilder()
    }

    func testBuildContext_Success() {
        // given
        let json = """
        {
            "key": "value"
        }
        """
        guard let data = json.data(using: .utf8) else {
            XCTFail("Cannot create data from json string")
            return
        }

        // when
        let result = contextBuilder.buildContext(from: data)
        
        // then
        switch result {
        case .dictionary(let context):
            XCTAssertNotNil(context["json"], "Context should contain 'json' key")
            if let jsonContext = context["json"] as? [String: Any] {
                XCTAssertEqual(jsonContext["key"] as? String, "value", "JSON should contain key 'key' with value 'value'")
            } else {
                XCTFail("JSON should be a dictionary containing the data")
            }
        default:
            XCTFail("Expected to build context successfully")
        }
    }

    func testBuildContext_Failure_DecodingError() {
        // given
        let invalidJson = "{ invalid json }"
        guard let data = invalidJson.data(using: .utf8) else {
            XCTFail("Cannot create data from invalid json string")
            return
        }

        // when
        let result = contextBuilder.buildContext(from: data)
        
        // then
        switch result {
        case .error(let error as GeneralError):
            XCTAssertEqual(error, GeneralError.decoding, "Expected a decoding error")
        default:
            XCTFail("Expected a decoding error but got \(result)")
        }
    }

    func testBuildContext_Failure_EmptyData() {
        // given
        let data = Data()

        // when
        let result = contextBuilder.buildContext(from: data)
        
        // then
        switch result {
        case .error(let error as GeneralError):
            XCTAssertEqual(error, GeneralError.decoding, "Expected a decoding error with empty data")
        default:
            XCTFail("Expected a decoding error but got \(result)")
        }
    }
}
