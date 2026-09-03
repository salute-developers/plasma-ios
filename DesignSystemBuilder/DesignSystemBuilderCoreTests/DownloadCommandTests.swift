import XCTest
import OHHTTPStubs
@testable import DesignSystemBuilderCore
import OHHTTPStubsSwift

final class DownloadCommandTests: XCTestCase {
    /// SUT
    var downloadSchemeCommand: DownloadCommand!

    // Mocks
    var fileManager: FileManager!
    private var outputURL: URL!

    override func setUp() {
        super.setUp()
        fileManager = FileManager.default
        HTTPStubs.setEnabled(true, for: URLSession.shared.configuration)

        let schemeURL = DownloadCommandTests.schemeURL
        outputURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("scheme.json")
        try? fileManager.removeItem(at: outputURL)

        downloadSchemeCommand = DownloadCommand(fileURL: schemeURL, outputURL: outputURL, fileManager: fileManager)
    }

    func testDownloadCommand_Success_FromRemoteSource() {
        // given
        stub(condition: isHost("sdds.com")) { _ in
            let stubData = "{\"key\": \"value\"}".data(using: .utf8)!
            return HTTPStubsResponse(data: stubData, statusCode: 200, headers: ["Content-Type": "application/json"])
        }

        // when
        let result = downloadSchemeCommand.run()

        // then
        // Команда с заданным outputURL пишет файл и возвращает .success,
        // содержимое проверяем на диске.
        switch result {
        case .success:
            let written = try? Data(contentsOf: outputURL)
            XCTAssertNotNil(written, "Файл должен быть записан по outputURL")
            XCTAssertFalse(written?.isEmpty ?? true, "Записанный файл не должен быть пустым")
        default:
            XCTFail("Ожидался .success, получено \(result)")
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
        case .error:
            XCTAssertTrue(true)
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
