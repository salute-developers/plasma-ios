import Foundation

/// Обходит каталоги сэмплов, извлекает `@DocSample`-сэмплы и строит реестр:
/// core-слой + theme-слой, дедуп по `id` — theme (local) побеждает.
public struct SampleScanner {

    public struct Layer {
        /// Каталог с сэмплами (обходится рекурсивно по `*.swift`).
        public let directory: URL
        /// Имя модуля — первый сегмент `fqName`.
        public let module: String

        public init(directory: URL, module: String) {
            self.directory = directory
            self.module = module
        }
    }

    public struct Result {
        public var records: [SampleRecord] = []
        public var snippets: [String: String] = [:]  // snippetPath -> text
        public var warnings: [String] = []
    }

    public let repoRoot: URL

    public init(repoRoot: URL) {
        self.repoRoot = repoRoot
    }

    /// Сканирует слои по порядку; более поздний слой (theme) переопределяет
    /// более ранний (core) по `id`.
    public func scan(layers: [Layer]) -> Result {
        var result = Result()
        var byId: [String: (record: SampleRecord, snippet: String)] = [:]
        var order: [String] = []

        for layer in layers {
            for fileURL in swiftFiles(in: layer.directory) {
                guard let source = try? String(contentsOf: fileURL, encoding: .utf8) else {
                    result.warnings.append("не читается: \(fileURL.path)")
                    continue
                }
                let extracted = SampleExtractor.extract(source: source)
                if extracted.isEmpty, source.contains("@DocSample") {
                    result.warnings.append(
                        "маркер @DocSample без извлекаемого сэмпла: \(relativePath(fileURL))"
                    )
                }
                for sample in extracted {
                    let subpath = fileURL.deletingLastPathComponent().path
                        .replacingOccurrences(of: layer.directory.path, with: "")
                        .trimmingCharacters(in: CharacterSet(charactersIn: "/"))
                    let fqSegments = ([layer.module] + subpath.split(separator: "/").map(String.init) + [sample.name])
                    let fqName = fqSegments.joined(separator: ".")
                    let snippetPath = "swift/" + fqSegments.dropLast().joined(separator: "/") + "/\(sample.id).swift"
                    let record = SampleRecord(
                        id: sample.id,
                        kind: sample.kind,
                        fqName: fqName,
                        file: relativePath(fileURL),
                        snippetPath: snippetPath,
                        snippetStartOffset: sample.startOffset,
                        snippetEndOffset: sample.endOffset,
                        needScreenshot: sample.marker.needScreenshot
                    )
                    if byId[sample.id] == nil { order.append(sample.id) }
                    byId[sample.id] = (record, sample.snippet)
                }
            }
        }

        for id in order {
            guard let entry = byId[id] else { continue }
            result.records.append(entry.record)
            result.snippets[entry.record.snippetPath] = entry.snippet
        }
        return result
    }

    /// Пишет `samples.json` и файлы сниппетов в выходной каталог.
    public func write(_ result: Result, to outputURL: URL) throws {
        let fileManager = FileManager.default
        try fileManager.createDirectory(at: outputURL, withIntermediateDirectories: true)

        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys, .withoutEscapingSlashes]
        let data = try encoder.encode(result.records)
        try data.write(to: outputURL.appending(component: "samples.json"))

        for (path, text) in result.snippets {
            let url = outputURL.appending(path: path)
            try fileManager.createDirectory(at: url.deletingLastPathComponent(), withIntermediateDirectories: true)
            try (text + "\n").data(using: .utf8)?.write(to: url)
        }
    }

    // MARK: - Helpers

    private func swiftFiles(in directory: URL) -> [URL] {
        guard let enumerator = FileManager.default.enumerator(
            at: directory,
            includingPropertiesForKeys: nil
        ) else { return [] }
        return enumerator
            .compactMap { $0 as? URL }
            .filter { $0.pathExtension == "swift" }
            .sorted { $0.path < $1.path }
    }

    private func relativePath(_ url: URL) -> String {
        url.path.replacingOccurrences(of: repoRoot.path + "/", with: "")
    }
}
