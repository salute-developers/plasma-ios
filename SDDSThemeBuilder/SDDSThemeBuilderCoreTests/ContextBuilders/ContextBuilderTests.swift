import XCTest
@testable import SDDSThemeBuilderCore

class ContextBuilderTests: XCTestCase {
    var contextBuilder: ContextBuilderMock!

    override func setUp() {
        super.setUp()
        contextBuilder = ContextBuilderMock()
    }

    func testBuildContext_UsingMock() {
        // given
        let expectedDictionary = ["key": "value"]
        contextBuilder.stubbedResult = .dictionary(expectedDictionary)

        // when
        let jsonData = "{\"key\": \"value\"}".data(using: .utf8)!
        let result = contextBuilder.buildContext(from: jsonData)

        // then
        switch result {
        case .dictionary(let context):
            XCTAssertEqual(context as? [String: String], expectedDictionary, "The context should match the stubbed result")
        default:
            XCTFail("Expected dictionary result from stubbed context builder")
        }
    }

    func testBuildContext_UsingMockWithError() {
        // given
        contextBuilder.stubbedResult = .error(GeneralError.decoding)

        // when
        let jsonData = "Invalid JSON".data(using: .utf8)!
        let result = contextBuilder.buildContext(from: jsonData)

        // then
        if case .error(let error) = result {
            switch error {
            case .schemeNotFound:
                XCTAssertTrue(true)
            default:
                XCTFail("Expected error result from stubbed context builder")
            }
            
        } else {
            XCTFail("Expected error result from stubbed context builder")
        }
    }

    func testBuildContext_UsingMockWithEmptyResult() {
        // given
        contextBuilder.stubbedResult = .empty

        // when
        let jsonData = "{\"key\": \"value\"}".data(using: .utf8)!
        let result = contextBuilder.buildContext(from: jsonData)

        // then
        if case .empty = result {
            XCTAssertTrue(true, "Expected empty result from stubbed context builder")
        } else {
            XCTFail("Expected empty result from stubbed context builder")
        }
    }
}
