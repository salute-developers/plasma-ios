import XCTest
@testable import SDDSThemeBuilderCore

final class DecodeSchemeCommandTests: XCTestCase {
    /// SUT
    var decodeSchemeCommand: DecodeSchemeCommand!
    
    func testDecodeSchemeCommand_Success() {
        // given
        decodeSchemeCommand = DecodeSchemeCommand(schemeURL: DecodeSchemeCommandTests.schemeURL)
        
        // when
        let result = decodeSchemeCommand.run()
        
        // then
        switch result {
        case .scheme:
            break
        default:
            XCTFail("Incorrect result")
        }
    }
    
    func testDecodeSchemeCommand_Failure() {
        // given
        decodeSchemeCommand = DecodeSchemeCommand(schemeURL: DecodeSchemeCommandTests.emptyURL)
        
        // when
        let result = decodeSchemeCommand.run()
        
        // then
        switch result {
        case .error:
            break
        default:
            XCTFail("Incorrect result")
        }
    }
}

private extension DecodeSchemeCommandTests {
    static var schemeURL: URL {
        let bundle = Bundle(for: DecodeSchemeCommandTests.self)
        let jsonSchema = bundle.url(forResource: "scheme", withExtension: "json")!
        return jsonSchema
    }
    
    static var emptyURL: URL {
        let bundle = Bundle(for: DecodeSchemeCommandTests.self)
        let jsonSchema = bundle.url(forResource: "empty", withExtension: "json")!
        return jsonSchema
    }
}
