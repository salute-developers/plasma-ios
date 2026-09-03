import XCTest
@testable import DesignSystemBuilderCore

final class UniversalGeneratorFileParityTests: XCTestCase {

    private let themeConfig = DesignSystemBuilderConfiguration.ThemeConfiguration(
        name: "SDDSServ",
        url: "\(DesignSystemBuilderConfiguration.Theme.baseURL)/sdds_serv/latest.zip"
    )

    override func setUp() {
        super.setUp()
        if !ApiMetaStore.shared.isLoaded {
            ApiMetaStore.shared.load(from: Self.metaURL)
        }
        ComponentConfigSource.localDirectory = Self.fixturesURL
    }

    override func tearDown() {
        ComponentConfigSource.localDirectory = nil
        UniversalRuntime.currentComponent = nil
        super.tearDown()
    }

    func testMetaAndFixturesAreAvailable() throws {
        XCTAssertTrue(ApiMetaStore.shared.isLoaded, "ios-api-meta.json must load from \(Self.metaURL.path)")
        let fixtures = try FileManager.default.contentsOfDirectory(at: Self.fixturesURL, includingPropertiesForKeys: nil)
        XCTAssertGreaterThan(fixtures.count, 100, "no config fixtures found in \(Self.fixturesURL.path)")
    }

    func testEveryComponentResolvesInMeta() throws {
        var unresolved: [String] = []
        for component in CodeGenerationComponent.supportedComponents {
            guard let meta = ApiMetaStore.shared.component(component.metaName) else {
                unresolved.append("\(component.rawValue) → \(component.metaName) (no meta entry)")
                continue
            }
            if meta.sizeQualifiedName == nil {
                unresolved.append("\(component.rawValue) → \(component.metaName) (no size property)")
            }
        }
        XCTAssertTrue(unresolved.isEmpty, "Components missing from ios-api-meta.json:\n" + unresolved.joined(separator: "\n"))
    }

    func testAllComponentsGenerateIdenticalFiles() throws {
        var checked: [String] = []
        var skipped: [String] = []
        var failures: [String] = []

        for component in CodeGenerationComponent.supportedComponents.sorted(by: { $0.rawValue < $1.rawValue }) {
            guard component.usesUniversalGenerator else {
                skipped.append("\(component.rawValue) (on the typed path)")
                continue
            }
            guard !Self.staleTypedReference.contains(component) else {
                skipped.append("\(component.rawValue) (typed model is stale)")
                continue
            }
            let fixture = component.configurationFilename(themeConfig: themeConfig)
            guard FileManager.default.fileExists(atPath: Self.fixturesURL.appending(component: fixture).path()) else {
                skipped.append("\(component.rawValue) (no fixture \(fixture))")
                continue
            }

            let typed = generate { component.typedCommand(outputURL: $0, themeConfig: themeConfig) }
            let universal = generate { component.universalCommand(outputURL: $0, themeConfig: themeConfig) }

            if let failure = compare(typed: typed, universal: universal, component: component) {
                failures.append(failure)
            } else {
                checked.append(component.rawValue)
            }
        }

        XCTAssertEqual(Set(skipped), Self.expectedSkips, "the set of skipped components changed")

        XCTAssertEqual(checked.count + failures.count,
                       CodeGenerationComponent.supportedComponents.count - Self.expectedSkips.count,
                       "some components never reached the comparison")

        XCTAssertTrue(failures.isEmpty, "Generators diverge:\n\n" + failures.joined(separator: "\n\n"))
    }

    private static let staleTypedReference: Set<CodeGenerationComponent> = [
        .collapsingNavigationBarInternalPage,
        .collapsingNavigationBarMainPage
    ]

    private static let expectedSkips: Set<String> = [
        "CollapsingNavigationBarInternalPage (typed model is stale)",
        "CollapsingNavigationBarMainPage (typed model is stale)"
    ]

    private func compare(typed: GenerationResult, universal: GenerationResult, component: CodeGenerationComponent) -> String? {
        switch (typed, universal) {
        case let (.failed(typedError), .failed(universalError)):
            print("\(component.rawValue): both generators failed (typed: \(typedError), universal: \(universalError))")
            return nil
        case let (.failed(error), .generated):
            return "\(component.rawValue): the typed generator failed (\(error)), the universal one succeeded"
        case let (.generated, .failed(error)):
            return "\(component.rawValue): the universal generator failed (\(error)), the typed one succeeded"
        case let (.generated(typedFiles), .generated(universalFiles)):
            if typedFiles.isEmpty {
                return "\(component.rawValue): the typed generator produced no files"
            }
            if Set(typedFiles.keys) != Set(universalFiles.keys) {
                return "\(component.rawValue): file sets differ — typed: \(typedFiles.keys.sorted()), universal: \(universalFiles.keys.sorted())"
            }
            var mismatches: [String] = []
            for (filename, typedSource) in typedFiles.sorted(by: { $0.key < $1.key }) {
                let universalSource = universalFiles[filename] ?? ""
                let typedNormalized = KnownTypedDefects.normalize(typedSource).text
                let universalNormalized = KnownTypedDefects.normalize(universalSource).text
                guard typedNormalized != universalNormalized else { continue }
                mismatches.append("  \(filename):\n" + diff(typedNormalized, universalNormalized))
            }
            return mismatches.isEmpty ? nil : "\(component.rawValue):\n" + mismatches.joined(separator: "\n")
        }
    }

    private func diff(_ lhs: String, _ rhs: String, limit: Int = 6) -> String {
        let left = lhs.components(separatedBy: .newlines)
        let right = rhs.components(separatedBy: .newlines)
        var lines: [String] = []
        for index in 0..<max(left.count, right.count) {
            let leftLine = index < left.count ? left[index] : "<no line>"
            let rightLine = index < right.count ? right[index] : "<no line>"
            guard leftLine != rightLine else { continue }
            lines.append("    \(index + 1): typed     | \(leftLine)")
            lines.append("    \(index + 1): universal | \(rightLine)")
            if lines.count >= limit * 2 {
                lines.append("    …")
                break
            }
        }
        return lines.joined(separator: "\n")
    }

    private enum GenerationResult {
        case generated([String: String])
        case failed(String)
    }

    private func generate(command make: (URL) -> Command) -> GenerationResult {
        let outputURL = FileManager.default.temporaryDirectory
            .appending(component: "parity-\(UUID().uuidString)")
        defer { try? FileManager.default.removeItem(at: outputURL) }

        let result = make(outputURL).run()
        guard result == .success else {
            return .failed("\(result)")
        }
        do {
            var files: [String: String] = [:]
            for url in try FileManager.default.contentsOfDirectory(at: outputURL, includingPropertiesForKeys: nil)
            where url.pathExtension == "swift" {
                files[url.lastPathComponent] = try String(contentsOf: url, encoding: .utf8)
            }
            return .generated(files)
        } catch {
            return .failed("\(error)")
        }
    }

    private static var testsURL: URL {
        URL(fileURLWithPath: #file).deletingLastPathComponent()
    }

    private static var fixturesURL: URL {
        testsURL.appending(component: "Fixtures/ComponentConfigs")
    }

    private static var metaURL: URL {
        testsURL
            .deletingLastPathComponent()
            .appending(component: ".sdds/ios-api-meta.json")
    }
}

enum KnownTypedDefects {

    private static let doublePathDrawerCast = " as PathDrawer as PathDrawer"

    private static let emptyAssignmentSuffix = " = "

    private static let transparentDefaults = [
        "= StatefulFillStyle(defaultValue: .color(.clearColor), values: [])",
        "= .color(.clearColor)",
        "= .clearColor",
        "= DefaultPathDrawer() as PathDrawer",
        "= FormTitlePlacement.none",
        "= WheelItemAlignment.start",
        // Значение есть в конфиге (`labelPlacement: none`), но типизированный путь берёт
        // его из id вариации и поэтому теряет. Универсальный читает конфиг.
        "= TextFieldLabelPlacement.none",
        "= TextAreaLabelPlacement.none"
    ]

    /// Типизированный путь пишет case без имени типа (`.multiple`), универсальный —
    /// полностью (`SelectItemType.multiple`). Значение одно и то же.
    private static let shorthandEnum = (typed: "appearance.itemType = .",
                                        actual: "appearance.itemType = SelectItemType.")

    private static let misnamedProperty = (typed: "appearance.toggleIndeterminateColor",
                                           actual: "appearance.toggleIndeterminateIconColor")

    static func normalize(_ source: String) -> (text: String, defects: [String]) {
        var defects: [String] = []

        var lines: [String] = []
        for line in source.components(separatedBy: .newlines) {
            if line.hasSuffix(emptyAssignmentSuffix) {
                defects.append("empty assignment")
                continue
            }
            if Self.transparentDefaults.contains(where: { line.hasSuffix($0) }) {
                defects.append("transparent default")
                continue
            }
            if line.contains(shorthandEnum.typed) {
                defects.append("shorthand enum")
                lines.append(line.replacingOccurrences(of: shorthandEnum.typed, with: shorthandEnum.actual))
                continue
            }
            if line.contains(misnamedProperty.typed) {
                defects.append("misnamed property")
                lines.append(line.replacingOccurrences(of: misnamedProperty.typed, with: misnamedProperty.actual))
                continue
            }
            guard line.contains(doublePathDrawerCast) else {
                lines.append(line)
                continue
            }
            defects.append("double PathDrawer cast")
            lines.append(line.replacingOccurrences(of: doublePathDrawerCast, with: " as PathDrawer"))
        }
        return (lines.joined(separator: "\n"), defects)
    }
}
