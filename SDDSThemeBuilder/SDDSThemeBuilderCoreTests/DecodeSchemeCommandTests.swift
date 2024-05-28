import XCTest
@testable import SDDSThemeBuilderCore

final class DecodeCommandTests: XCTestCase {
    /// SUT
    var decodeCommand: DecodeCommand<Scheme>!
    
    func testDecodeCommand_Success() {
        // given
        decodeCommand = DecodeCommand(url: DecodeCommandTests.schemeURL)
        
        // when
        let result = decodeCommand.run()
        
        // then
        switch result {
        case .value(let scheme as Scheme):
            XCTAssertEqual(scheme.name, "stylesSalute")
            XCTAssertEqual(scheme.version, "0.1.0")
        default:
            XCTFail("Expected a successful decoding result with a Scheme value")
        }
    }
    
    func testDecodeCommand_Failure() {
        // given
        decodeCommand = DecodeCommand(url: DecodeCommandTests.invalidURL)
        
        // when
        let result = decodeCommand.run()
        
        // then
        switch result {
        case .error:
            break
        default:
            XCTFail("Expected an error result")
        }
    }
}

private extension DecodeCommandTests {
    static var schemeURL: URL {
        let bundle = Bundle(for: DecodeCommandTests.self)
        guard let url = bundle.url(forResource: "scheme", withExtension: "json") else {
            fatalError("scheme.json not found")
        }
        return url
    }
    
    static var invalidURL: URL {
        let bundle = Bundle(for: DecodeCommandTests.self)
        guard let url = bundle.url(forResource: "empty", withExtension: "json") else {
            fatalError("invalid.json not found")
        }
        return url
    }
}
