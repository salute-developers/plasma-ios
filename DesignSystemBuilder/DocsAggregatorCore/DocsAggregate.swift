import Foundation

/// Сборка дерева документационного бандла `.sdds/temp/docs/`.
/// Выход потребляет `dsbuilder docs generate --platform swiftui`
/// без модификаций CLI.
public struct DocsAggregate {

    public struct Inputs {
        /// Core-доки: каталог с markdown + `structure.json`.
        public var coreDocsURL: URL
        /// User-слой (опционально): каталог с markdown + `structure.json`.
        public var userDocsURL: URL?
        /// Выход theme-builder: components-info (`config-info-ios.json`).
        public var componentsInfoURL: URL
        /// Выход theme-builder: theme-info (`config-info-tokens-ios.json`).
        public var themeInfoURL: URL
        /// Выход `extract`: каталог с `samples.json` и `swift/**`.
        public var extractedSamplesURL: URL
        /// Каталог готовых скриншотов (опционально — Phase 4).
        public var screenshotsURL: URL?
        /// platform-context: id/version артефакта.
        public var artifactId: String
        public var artifactVersion: String

        public init(
            coreDocsURL: URL,
            userDocsURL: URL? = nil,
            componentsInfoURL: URL,
            themeInfoURL: URL,
            extractedSamplesURL: URL,
            screenshotsURL: URL? = nil,
            artifactId: String,
            artifactVersion: String
        ) {
            self.coreDocsURL = coreDocsURL
            self.userDocsURL = userDocsURL
            self.componentsInfoURL = componentsInfoURL
            self.themeInfoURL = themeInfoURL
            self.extractedSamplesURL = extractedSamplesURL
            self.screenshotsURL = screenshotsURL
            self.artifactId = artifactId
            self.artifactVersion = artifactVersion
        }
    }

    public struct Report {
        public var pagesCore = 0
        public var pagesUser = 0
        /// `@screenshot`-маркеры, оставшиеся в отрендеренном контенте (fqName).
        public var screenshotMarkers: [String] = []
        /// Сколько png реально попало в `assets/screenshots/`.
        public var screenshotFiles = 0
        public var warnings: [String] = []
    }

    private let fileManager = FileManager.default

    public init() {}

    @discardableResult
    public func run(inputs: Inputs, outputURL: URL) throws -> Report {
        var report = Report()

        for required in [inputs.coreDocsURL, inputs.componentsInfoURL, inputs.themeInfoURL, inputs.extractedSamplesURL]
        where !fileManager.fileExists(atPath: required.path) {
            throw AggregationError.missingInput(required.path)
        }

        try? fileManager.removeItem(at: outputURL)
        try fileManager.createDirectory(at: outputURL, withIntermediateDirectories: true)

        // Рендерер маркеров: сниппеты из extract-каталога.
        let snippets = try loadSnippets(from: inputs.extractedSamplesURL)
        let componentsInfo = try ComponentsInfoLite.load(from: inputs.componentsInfoURL)
        let renderer = MarkerRenderer(snippets: snippets, componentsInfo: componentsInfo)

        // Core-слой.
        let coreStructure = try renderLayer(
            docsURL: inputs.coreDocsURL,
            layerName: "core",
            renderer: renderer,
            outputURL: outputURL,
            validateMergeRules: false,
            pages: &report.pagesCore,
            markers: &report.screenshotMarkers,
            warnings: &report.warnings
        )
        try writeJSON(coreStructure, to: outputURL.appending(component: "structure-core.json"))

        // User-слой (опционален).
        if let userDocsURL = inputs.userDocsURL, fileManager.fileExists(atPath: userDocsURL.path) {
            let userStructure = try renderLayer(
                docsURL: userDocsURL,
                layerName: "user",
                renderer: renderer,
                outputURL: outputURL,
                validateMergeRules: true,
                pages: &report.pagesUser,
                markers: &report.screenshotMarkers,
                warnings: &report.warnings
            )
            try writeJSON(userStructure, to: outputURL.appending(component: "structure-user.json"))
        } else {
            try writeJSON(DocsStructure(navigation: []), to: outputURL.appending(component: "structure-user.json"))
        }

        // meta/: артефакты theme-builder + samples + platform-context.
        let metaURL = outputURL.appending(component: "meta")
        try fileManager.createDirectory(at: metaURL, withIntermediateDirectories: true)
        try fileManager.copyItem(
            at: inputs.componentsInfoURL,
            to: metaURL.appending(component: "components-info.json")
        )
        try fileManager.copyItem(
            at: inputs.themeInfoURL,
            to: metaURL.appending(component: "theme-info.json")
        )
        let samplesJSON = inputs.extractedSamplesURL.appending(component: "samples.json")
        if fileManager.fileExists(atPath: samplesJSON.path) {
            try fileManager.copyItem(at: samplesJSON, to: metaURL.appending(component: "samples.json"))
        }
        try writePlatformContext(inputs: inputs, to: metaURL.appending(component: "platform-context.json"))

        // assets/: examples из extract, screenshots (возможно пустые).
        let assetsURL = outputURL.appending(component: "assets")
        let examplesURL = assetsURL.appending(component: "examples")
        try fileManager.createDirectory(at: examplesURL, withIntermediateDirectories: true)
        let extractedSwift = inputs.extractedSamplesURL.appending(component: "swift")
        if fileManager.fileExists(atPath: extractedSwift.path) {
            try fileManager.copyItem(at: extractedSwift, to: examplesURL.appending(component: "swift"))
        }
        let screenshotsOut = assetsURL.appending(component: "screenshots")
        try fileManager.createDirectory(at: screenshotsOut, withIntermediateDirectories: true)
        if let screenshotsURL = inputs.screenshotsURL, fileManager.fileExists(atPath: screenshotsURL.path) {
            for file in try fileManager.contentsOfDirectory(at: screenshotsURL, includingPropertiesForKeys: nil)
            where file.pathExtension == "png" {
                try fileManager.copyItem(at: file, to: screenshotsOut.appending(component: file.lastPathComponent))
                report.screenshotFiles += 1
            }
        }

        // Маркеры без картинок = битые ссылки у потребителя бандла. Молчать нельзя:
        // именно так эта ошибка и жила незамеченной, пока скрипт не передавал каталог.
        let delivered = Set(
            (try? fileManager.contentsOfDirectory(at: screenshotsOut, includingPropertiesForKeys: nil))?
                .filter { $0.pathExtension == "png" }
                .map { $0.deletingPathExtension().lastPathComponent } ?? []
        )
        let missing = report.screenshotMarkers
            .filter { !delivered.contains($0.replacingOccurrences(of: ".", with: "_")) }
            .sorted()
        if !missing.isEmpty {
            let hint = report.screenshotFiles == 0
                ? " — укажите --screenshots <каталог> (по умолчанию Themes/<Тема>Theme/docs/screenshots)"
                : " — для этой темы такие сэмплы не сняты"
            report.warnings.append(
                "маркеров @screenshot без картинки: \(missing.count) из \(report.screenshotMarkers.count)"
                + " (например \(missing.prefix(3).joined(separator: ", ")))" + hint
            )
        }

        return report
    }

    // MARK: - Layer rendering

    private func renderLayer(
        docsURL: URL,
        layerName: String,
        renderer: MarkerRenderer,
        outputURL: URL,
        validateMergeRules: Bool,
        pages: inout Int,
        markers: inout [String],
        warnings: inout [String]
    ) throws -> DocsStructure {
        let structureURL = docsURL.appending(component: "structure.json")
        guard fileManager.fileExists(atPath: structureURL.path) else {
            throw AggregationError.missingInput(structureURL.path)
        }
        let structure = try DocsStructure.load(from: structureURL)
        let contentRoot = outputURL.appending(components: "content", layerName)

        for (page, merge) in structure.pageMerges {
            if validateMergeRules {
                let filename = (page as NSString).lastPathComponent
                switch merge {
                case "prepend":
                    throw AggregationError.userMergePrependRejected(page: page)
                case "replace", nil:
                    break
                default: // append (явный)
                    guard filename.hasPrefix("+") else {
                        throw AggregationError.userAppendRequiresPlusPrefix(page: page)
                    }
                }
            }
            let sourceURL = docsURL.appending(path: page)
            guard let markdown = try? String(contentsOf: sourceURL, encoding: .utf8) else {
                throw AggregationError.structurePageMissing(structure: structureURL.path, page: page)
            }
            let rendered = try renderer.render(page: page, markdown: markdown)
            for piece in rendered.components(separatedBy: "<!-- @screenshot:").dropFirst() {
                let fqName = piece.components(separatedBy: "-->")[0].trimmingCharacters(in: .whitespaces)
                if !fqName.isEmpty { markers.append(fqName) }
            }
            let destination = contentRoot.appending(path: page)
            try fileManager.createDirectory(at: destination.deletingLastPathComponent(), withIntermediateDirectories: true)
            try (rendered.data(using: .utf8) ?? Data()).write(to: destination)
            pages += 1
        }

        // Orphans: md на диске, не упомянутые в структуре — предупреждение.
        // Пути приводим к канонической форме: иначе симлинк в пути каталога
        // (например /var → /private/var) ломает вычисление относительного пути,
        // и страница из структуры ошибочно считается сиротой.
        let listed = Set(structure.pagePaths)
        let root = docsURL.resolvingSymlinksInPath().standardizedFileURL.path
        if let enumerator = fileManager.enumerator(at: docsURL, includingPropertiesForKeys: nil) {
            for case let url as URL in enumerator where url.pathExtension == "md" {
                let path = url.resolvingSymlinksInPath().standardizedFileURL.path
                guard path.hasPrefix(root + "/") else { continue }
                let relative = String(path.dropFirst(root.count + 1))
                if !listed.contains(relative) {
                    warnings.append("\(layerName): orphan-страница вне структуры: \(relative)")
                }
            }
        }
        return structure
    }

    // MARK: - Writers

    private func writeJSON<T: Encodable>(_ value: T, to url: URL) throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys, .withoutEscapingSlashes]
        try encoder.encode(value).write(to: url)
    }

    private struct PlatformContext: Encodable {
        struct Artifact: Encodable {
            let id: String
            let version: String
        }
        let artifact: Artifact
        let platform: String
    }

    private func writePlatformContext(inputs: Inputs, to url: URL) throws {
        let context = PlatformContext(
            artifact: .init(id: inputs.artifactId, version: inputs.artifactVersion),
            platform: "swiftui"
        )
        try writeJSON(context, to: url)
    }

    private func loadSnippets(from extractURL: URL) throws -> [String: String] {
        var snippets: [String: String] = [:]
        let swiftRoot = extractURL.appending(component: "swift")
        guard let enumerator = fileManager.enumerator(at: swiftRoot, includingPropertiesForKeys: nil) else {
            return snippets
        }
        for case let url as URL in enumerator where url.pathExtension == "swift" {
            snippets[url.lastPathComponent] = try String(contentsOf: url, encoding: .utf8)
                .trimmingCharacters(in: .newlines)
        }
        return snippets
    }
}
