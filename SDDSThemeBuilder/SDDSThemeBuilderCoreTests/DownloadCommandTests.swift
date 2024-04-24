import XCTest
import OHHTTPStubs
@testable import SDDSThemeBuilderCore
import OHHTTPStubsSwift

final class DownloadCommandTests: XCTestCase {
    /// SUT
    var downloadSchemeCommand: DownloadCommand!
    
    // Mocks
    var fileManager: FileManager!

    override func setUp() {
        super.setUp()
        fileManager = FileManager.default
        HTTPStubs.setEnabled(true, for: URLSession.shared.configuration)

        let schemeURL = DownloadCommandTests.schemeURL
        let outputURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("scheme.json")
        
        downloadSchemeCommand = DownloadCommand(fileURL: schemeURL, outputURL: outputURL, fileManager: fileManager)
    }

    func testDownloadCommand_Success_FromRemoteSource() {
        // given
        stub(condition: isHost("example.com")) { _ in
            let stubData = "{\"key\": \"value\"}".data(using: .utf8)!
            return HTTPStubsResponse(data: stubData, statusCode: 200, headers: ["Content-Type": "application/json"])
        }
        
        // when
        let result = downloadSchemeCommand.run()
        
        // then
        switch result {
        case .data(let data):
            XCTAssertNotNil(data, "Data should not be nil")
            XCTAssertTrue(!data.isEmpty, "Data should contain the JSON content")
        default:
            XCTFail("Expected to succeed but got \(result)")
        }
    }

    func testDownloadCommand_Success_FromLocalSource() {
        // given
        let localURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("localScheme.json")
        let testData = "Local test data".data(using: .utf8)!
        try? testData.write(to: localURL)
        downloadSchemeCommand = DownloadCommand(fileURL: localURL, outputURL: nil, fileManager: fileManager)

        // when
        let result = downloadSchemeCommand.run()
        
        // then
        switch result {
        case .data(let data):
            XCTAssertEqual(data, testData, "The data should be equal to the test data.")
        default:
            XCTFail("Expected to succeed but got \(result)")
        }

        // Clean up
        try? fileManager.removeItem(at: localURL)
    }

    func testDownloadCommand_Failure_InvalidURL() {
        // given
        let invalidURL = DownloadCommandTests.testURL
        
        downloadSchemeCommand = DownloadCommand(fileURL: invalidURL, outputURL: nil, fileManager: fileManager)

        let host = NSMutableString(string: invalidURL.absoluteString)
            .replacingOccurrences(of: invalidURL.scheme ?? "", with: "")
            .replacingOccurrences(of: "://", with: "")
        
        stub(condition: isHost(host)) { _ in
            return HTTPStubsResponse(error: URLError(.unsupportedURL))
        }
        
        // when
        let result = downloadSchemeCommand.run()
        
        // then
        switch result {
        case .error(let error as URLError):
            XCTAssertEqual(error.code, .unsupportedURL, "Should match the unsupported URL error.")
        default:
            XCTFail("Expected an error due to invalid URL but got \(result)")
        }
    }
}

extension DownloadCommandTests {
    static var schemeURL: URL {
        URL(string: "https://sdds.com/scheme.json")!
    }
    static var testURL: URL {
        URL(string: "https://sdds.com")!
    }
}
