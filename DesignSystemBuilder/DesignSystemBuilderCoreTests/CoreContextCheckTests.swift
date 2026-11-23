import XCTest
@testable import DesignSystemBuilderCore

final class CoreContextCheckTests: XCTestCase {
    private var directory: URL!
    private let meta = Data("[{\"componentName\":\"Button\"}]".utf8)

    override func setUpWithError() throws {
        directory = FileManager.default.temporaryDirectory.appending(component: UUID().uuidString)
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
    }

    override func tearDownWithError() throws {
        try? FileManager.default.removeItem(at: directory)
    }

    func testContextLivesInComponentsPackageNextToConfig() {
        let config = URL(fileURLWithPath: "/repo/Themes/XTheme/.sdds/config.json")

        XCTAssertEqual(
            CoreContextCheck.contextURL(sddsConfigURL: config).path(),
            "/repo/Themes/XTheme/.sdds/components/core-context.json"
        )
    }

    func testSameMetaMatches() throws {
        let url = try context(platform: "ios", sha: CoreContextCheck.sha256Hex(meta))

        XCTAssertEqual(CoreContextCheck.compare(metaData: meta, contextURL: url), .match)
    }

    func testOtherMetaIsMismatchWithVersion() throws {
        let url = try context(platform: "swiftui", sha: String(repeating: "a", count: 64), version: "0.34.0")

        let outcome = CoreContextCheck.compare(metaData: meta, contextURL: url)

        XCTAssertEqual(
            outcome,
            .mismatch(version: "0.34.0", expectedSha256: String(repeating: "a", count: 64), actualSha256: CoreContextCheck.sha256Hex(meta))
        )
        let warning = CoreContextCheck.warning(for: outcome, metaURL: URL(fileURLWithPath: "/bin/ios-api-meta.json"), contextURL: url)
        XCTAssertTrue(warning?.contains("iOS Core 0.34.0") == true, warning ?? "")
    }

    func testShaIsComparedCaseInsensitively() throws {
        let url = try context(platform: "ios", sha: CoreContextCheck.sha256Hex(meta).uppercased())

        XCTAssertEqual(CoreContextCheck.compare(metaData: meta, contextURL: url), .match)
    }

    func testNothingToCheckWithoutFileOtherPlatformOrSha() throws {
        XCTAssertEqual(CoreContextCheck.compare(metaData: meta, contextURL: directory.appending(component: "missing.json")), .notChecked)
        XCTAssertEqual(CoreContextCheck.compare(metaData: meta, contextURL: try context(platform: "compose", sha: "abc")), .notChecked)
        // Технический снимок истории: происхождение Core неизвестно, SHA-256 нет.
        XCTAssertEqual(CoreContextCheck.compare(metaData: meta, contextURL: try context(platform: "ios", sha: nil)), .notChecked)
        XCTAssertNil(CoreContextCheck.warning(for: .match, metaURL: directory, contextURL: directory))
    }

    private func context(platform: String, sha: String?, version: String = "1.0.0") throws -> URL {
        var release: [String: Any] = [
            "releaseId": "r1", "libraryId": "sdds-swiftui", "platform": platform,
            "version": version, "provenance": sha == nil ? "migration-snapshot" : "imported"
        ]
        if let sha { release["metaSha256"] = sha }
        let url = directory.appending(component: "\(UUID().uuidString).json")
        try JSONSerialization.data(withJSONObject: ["coreReleases": [release]]).write(to: url)
        return url
    }
}
