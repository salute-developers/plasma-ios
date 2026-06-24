import XCTest
@testable import SDDSThemeBuilderCore

final class SddsThemeSourceReaderTests: XCTestCase {
    private var baseDirectory: URL!

    override func setUpWithError() throws {
        try super.setUpWithError()
        baseDirectory = FileManager.default.temporaryDirectory
            .appending(component: "sdds_reader_tests_\(UUID().uuidString)")
        try FileManager.default.createDirectory(at: baseDirectory, withIntermediateDirectories: true)
    }

    override func tearDownWithError() throws {
        try? FileManager.default.removeItem(at: baseDirectory)
        baseDirectory = nil
        try super.tearDownWithError()
    }

    // MARK: - Helpers

    private var configURL: URL {
        baseDirectory.appending(path: ".sdds/config.json")
    }

    private func writeConfig(_ json: String) throws {
        try FileManager.default.createDirectory(at: configURL.deletingLastPathComponent(), withIntermediateDirectories: true)
        try json.data(using: .utf8)!.write(to: configURL)
    }

    /// Создаёт полный набор файлов схемы (`meta.json` + `ios/ios_*.json`) в директории,
    /// заданной относительным путём от базовой директории.
    private func writeSchemeFiles(relativePath: String) throws {
        let directory = baseDirectory.appending(path: relativePath)
        for path in SchemeDirectory.Path.allCases {
            let fileURL = directory.appending(component: path.jsonPath)
            try FileManager.default.createDirectory(at: fileURL.deletingLastPathComponent(), withIntermediateDirectories: true)
            try "{}".data(using: .utf8)!.write(to: fileURL)
        }
    }

    private func writePalette(relativePath: String) throws {
        let fileURL = baseDirectory.appending(path: relativePath)
        try FileManager.default.createDirectory(at: fileURL.deletingLastPathComponent(), withIntermediateDirectories: true)
        try "{}".data(using: .utf8)!.write(to: fileURL)
    }

    private func makeReader() -> SddsThemeSourceReader {
        SddsThemeSourceReader(configURL: configURL, baseDirectory: baseDirectory)
    }

    // MARK: - Tests

    func test_read_usesAliasAndDefaultPaths() throws {
        try writeConfig("""
        { "tenants": [ { "name": "plasma_homeds", "alias": "PlasmaHomeDS" } ] }
        """)
        try writeSchemeFiles(relativePath: ".sdds/plasma_homeds")
        try writePalette(relativePath: ".sdds/tenants/palette.json")

        let source = try XCTUnwrap(makeReader().read())

        XCTAssertEqual(source.baseName, "PlasmaHomeDS")
        XCTAssertEqual(source.tenants.count, 1)
        XCTAssertEqual(source.tenants[0].suffix, "")
        XCTAssertEqual(source.tenants[0].displayName, "PlasmaHomeDS")
        XCTAssertTrue(source.tenants[0].directory.path().hasSuffix(".sdds/plasma_homeds"))
        XCTAssertTrue(source.paletteURL.path().hasSuffix(".sdds/tenants/palette.json"))
    }

    func test_read_fallsBackToNameWhenNoAlias_andMapsTenantSuffixes() throws {
        try writeConfig("""
        {
          "tenants": [
            { "name": "plasma_homeds", "alias": "PlasmaHomeDS" },
            { "name": "partner" }
          ]
        }
        """)
        // Reader validates только базовый tenant.
        try writeSchemeFiles(relativePath: ".sdds/plasma_homeds")
        try writePalette(relativePath: ".sdds/tenants/palette.json")

        let source = try XCTUnwrap(makeReader().read())

        XCTAssertEqual(source.tenants.count, 2)
        XCTAssertEqual(source.tenants[0].suffix, "")           // первый — Default
        XCTAssertEqual(source.tenants[1].suffix, "partner")    // alias ?: name
        XCTAssertEqual(source.tenants[1].displayName, "partner")
        XCTAssertTrue(source.tenants[1].directory.path().hasSuffix(".sdds/partner"))
    }

    func test_read_honorsDirectoryPathAndPalettePath() throws {
        try writeConfig("""
        {
          "palettePath": "custom/palette.json",
          "tenants": [ { "name": "base", "directoryPath": "custom/base" } ]
        }
        """)
        try writeSchemeFiles(relativePath: "custom/base")
        try writePalette(relativePath: "custom/palette.json")

        let source = try XCTUnwrap(makeReader().read())

        XCTAssertEqual(source.baseName, "base")
        XCTAssertTrue(source.tenants[0].directory.path().hasSuffix("custom/base"))
        XCTAssertTrue(source.paletteURL.path().hasSuffix("custom/palette.json"))
    }

    func test_read_returnsNilWhenConfigMissing() {
        XCTAssertNil(makeReader().read())
    }

    func test_read_returnsNilWhenTenantsEmpty() throws {
        try writeConfig(#"{ "tenants": [] }"#)
        XCTAssertNil(makeReader().read())
    }

    func test_read_returnsNilWhenSchemeFilesMissing() throws {
        try writeConfig("""
        { "tenants": [ { "name": "plasma_homeds" } ] }
        """)
        // meta/ios файлы не создаём
        try writePalette(relativePath: ".sdds/tenants/palette.json")
        XCTAssertNil(makeReader().read())
    }

    func test_read_returnsNilWhenPaletteMissing() throws {
        try writeConfig("""
        { "tenants": [ { "name": "plasma_homeds" } ] }
        """)
        try writeSchemeFiles(relativePath: ".sdds/plasma_homeds")
        // палитру не создаём
        XCTAssertNil(makeReader().read())
    }
}
