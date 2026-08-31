import XCTest
@testable import SDDSThemeBuilderCore

/// Проверяет распаковку релизного архива исходников: оба layout'а архива (с верхней
/// папкой-обёрткой и без), переиспользование уже распакованного дерева и очистку
/// промежуточных артефактов. Сеть не используется — архив подсовывается по `file://`.
final class SourcesReleaseFetcherTests: XCTestCase {
    private var workDirectory: URL!
    private let version = "release-01-01-2026"

    override func setUpWithError() throws {
        try super.setUpWithError()
        workDirectory = FileManager.default.temporaryDirectory
            .appending(component: "sources_release_tests_\(UUID().uuidString)")
        try FileManager.default.createDirectory(at: workDirectory, withIntermediateDirectories: true)
    }

    override func tearDownWithError() throws {
        try? FileManager.default.removeItem(at: workDirectory)
        workDirectory = nil
        try super.tearDownWithError()
    }

    // MARK: - Helpers

    private var destinationDirectory: URL {
        workDirectory.appending(component: "generated")
    }

    /// Собирает zip с деревом исходников. `wrapped` — архив несёт верхнюю папку
    /// `SDDSSources-<version>` (так пакует `ditto --keepParent` в релизе).
    private func makeArchive(wrapped: Bool) throws -> URL {
        let fileManager = FileManager.default
        let stage = workDirectory.appending(component: "stage_\(UUID().uuidString)")
        let treeRoot = wrapped
            ? stage.appending(component: SourcesReleaseFetcher.directoryName(version: version))
            : stage

        for relative in ["\(SourcesReleaseFetcher.layoutMarker)/Marker.swift", "Themes/SDDSservTheme/Theme.swift"] {
            let fileURL = treeRoot.appending(path: relative)
            try fileManager.createDirectory(at: fileURL.deletingLastPathComponent(), withIntermediateDirectories: true)
            try Data("// \(relative)".utf8).write(to: fileURL)
        }

        let archiveURL = workDirectory.appending(component: "archive_\(UUID().uuidString).zip")
        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/ditto")
        // Содержимое stage кладём в архив как есть: верхняя папка появляется только
        // тогда, когда мы сами создали её внутри stage.
        process.arguments = ["-c", "-k", "--sequesterRsrc", stage.path(), archiveURL.path()]
        try process.run()
        process.waitUntilExit()
        XCTAssertEqual(process.terminationStatus, 0, "ditto не собрал тестовый архив")

        try fileManager.removeItem(at: stage)
        return archiveURL
    }

    private func fetcher(archiveURL: URL) -> SourcesReleaseFetcher {
        var fetcher = SourcesReleaseFetcher(version: version, destinationDirectory: destinationDirectory)
        fetcher.archiveURL = archiveURL
        return fetcher
    }

    // MARK: - Tests

    func testUnpacksArchiveWithoutWrapperIntoGenerationDirectory() throws {
        let fetcher = self.fetcher(archiveURL: try makeArchive(wrapped: false))

        let root = fetcher.resolve()

        XCTAssertEqual(root, destinationDirectory.appending(component: "SDDSSources-\(version)"))
        XCTAssertTrue(FileManager.default.fileExists(atPath: root.appending(path: SourcesReleaseFetcher.layoutMarker).path()))
        XCTAssertTrue(FileManager.default.fileExists(atPath: root.appending(path: "Themes/SDDSservTheme/Theme.swift").path()))
    }

    /// Архив релиза несёт верхнюю папку — распакованный корень должен быть тем же
    /// самым, иначе `--sources-root` смотрел бы на уровень выше дерева исходников.
    func testUnwrapsArchiveWithTopLevelFolder() throws {
        let fetcher = self.fetcher(archiveURL: try makeArchive(wrapped: true))

        let root = fetcher.resolve()

        XCTAssertTrue(FileManager.default.fileExists(atPath: root.appending(path: SourcesReleaseFetcher.layoutMarker).path()))
        XCTAssertFalse(
            FileManager.default.fileExists(atPath: root.appending(component: "SDDSSources-\(version)").path()),
            "верхняя папка архива не должна оставаться внутри корня исходников"
        )
    }

    /// Ни промежуточной папки распаковки, ни скачанного zip рядом с результатом:
    /// они лежат в той же директории, что и сгенерированные темы.
    func testRemovesArchiveAndStagingAfterUnpack() throws {
        let fetcher = self.fetcher(archiveURL: try makeArchive(wrapped: true))

        _ = fetcher.resolve()

        let leftovers = try FileManager.default.contentsOfDirectory(atPath: destinationDirectory.path())
        XCTAssertEqual(leftovers.sorted(), ["SDDSSources-\(version)"])
    }

    /// Повторный запуск переиспользует уже распакованное дерево: архив к тому моменту
    /// может быть недоступен (у клиента — офлайн), и это не должно ломать генерацию.
    func testReusesAlreadyUnpackedSourcesWhenArchiveIsGone() throws {
        let archiveURL = try makeArchive(wrapped: true)
        let fetcher = self.fetcher(archiveURL: archiveURL)
        let firstRoot = fetcher.resolve()
        try FileManager.default.removeItem(at: archiveURL)

        let secondRoot = fetcher.resolve()

        XCTAssertEqual(secondRoot, firstRoot)
        XCTAssertTrue(FileManager.default.fileExists(atPath: secondRoot.appending(path: SourcesReleaseFetcher.layoutMarker).path()))
    }

    /// По умолчанию версия адресует ассет релиза в GitHub — клиенту достаточно тега.
    func testArchiveURLIsReleaseAssetOfRequestedVersion() {
        let fetcher = SourcesReleaseFetcher(version: version, destinationDirectory: destinationDirectory)

        XCTAssertEqual(
            fetcher.resolvedArchiveURL.absoluteString,
            "https://github.com/salute-developers/plasma-ios/releases/download/\(version)/SDDSSources-\(version).zip"
        )
    }

    func testExplicitRepositoryOverridesReleaseHost() {
        var fetcher = SourcesReleaseFetcher(version: version, destinationDirectory: destinationDirectory)
        fetcher.repository = "acme/fork"

        XCTAssertEqual(
            fetcher.resolvedArchiveURL.absoluteString,
            "https://github.com/acme/fork/releases/download/\(version)/SDDSSources-\(version).zip"
        )
    }
}
