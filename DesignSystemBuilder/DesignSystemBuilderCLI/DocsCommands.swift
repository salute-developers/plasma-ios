import Foundation
import ArgumentParser
import DocsAggregatorCore

/// Абсолютный путь используется как есть, относительный — от корня репозитория.
private func resolve(_ path: String, against root: URL) -> URL {
    path.hasPrefix("/") ? URL(fileURLWithPath: path) : root.appending(path: path)
}

private func fail(_ message: String) -> Never {
    FileHandle.standardError.write(Data((message + "\n").utf8))
    Foundation.exit(1)
}

/// Документационный бандл: скан сэмплов и сборка дерева `.sdds/temp/docs`.
struct Docs: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "docs",
        abstract: "Документационный бандл для dsbuilder docs generate --platform swiftui.",
        subcommands: [Extract.self, Aggregate.self, SyncComments.self]
    )
}

extension Docs {

    /// Подстановка сниппетов из фикстур в примеры внутри doc-комментариев исходников.
    struct SyncComments: ParsableCommand {
        static let configuration = CommandConfiguration(
            commandName: "sync-comments",
            abstract: "Обновить примеры в doc-комментариях по маркерам `// @sample:`."
        )

        @Option(name: .long, help: "Корень репозитория (default: текущая директория).")
        var repoRoot: String?

        @Option(name: .long, help: "Каталог core-сэмплов.")
        var coreSamples: String = "SDDSComponentsFixtures/Sources/SDDSComponentsFixtures/Samples"

        @Option(name: .long, help: "Имя модуля core-слоя.")
        var coreModule: String = "SDDSComponentsFixtures"

        @Option(name: .long, help: "Каталог сэмплов темы (перекрывают core по id).")
        var themeSamples: String?

        @Option(name: .long, help: "Имя модуля theme-слоя (default: имя каталога).")
        var themeModule: String?

        @Option(name: .long, help: "Где искать исходники с маркерами.")
        var sources: String = "SDDSComponents/Sources"

        @Flag(name: .long, help: "Ничего не писать; ненулевой выход при расхождении.")
        var check: Bool = false

        func run() throws {
            let root = URL(fileURLWithPath: repoRoot ?? FileManager.default.currentDirectoryPath)

            var layers = [SampleScanner.Layer(directory: resolve(coreSamples, against: root), module: coreModule)]
            if let themeSamples {
                let url = resolve(themeSamples, against: root)
                layers.append(.init(directory: url, module: themeModule ?? url.lastPathComponent))
            }
            let scanned = SampleScanner(repoRoot: root).scan(layers: layers)
            var snippetsByBasename: [String: String] = [:]
            for (path, text) in scanned.snippets {
                snippetsByBasename[(path as NSString).lastPathComponent] = text
            }

            let sourcesURL = resolve(sources, against: root)
            let files = swiftFiles(in: sourcesURL)
            var changed: [DocCommentSyncer.FileChange] = []
            var totalMarkers = 0

            for fileURL in files {
                guard let source = try? String(contentsOf: fileURL, encoding: .utf8),
                      source.contains("// @sample:") else { continue }

                let relative = fileURL.path.replacingOccurrences(of: root.path + "/", with: "")
                let result: (text: String, markers: Int)
                do {
                    result = try DocCommentSyncer.sync(
                        source: source,
                        snippetsByBasename: snippetsByBasename,
                        file: relative
                    )
                } catch {
                    fail("\(error)")
                }

                totalMarkers += result.markers
                guard result.text != source else { continue }
                changed.append(.init(file: relative, markers: result.markers))
                if !check {
                    do {
                        try Data(result.text.utf8).write(to: fileURL)
                    } catch {
                        fail("не записан \(relative): \(error)")
                    }
                }
            }

            if check {
                guard changed.isEmpty else {
                    let list = changed.map { "  \($0.file)" }.joined(separator: "\n")
                    FileHandle.standardError.write(Data("""
                    Примеры в doc-комментариях разошлись с фикстурами:
                    \(list)

                    Запустите `dsbuilder docs sync-comments --repo-root .` и закоммитьте результат.
                    """.utf8))
                    throw ExitCode(1)
                }
                print("sync-comments: примеры актуальны (маркеров: \(totalMarkers))")
                return
            }

            if changed.isEmpty {
                print("sync-comments: изменений нет (маркеров: \(totalMarkers))")
            } else {
                changed.forEach { print("updated: \($0.file) (\($0.markers))") }
                print("sync-comments: обновлено файлов: \(changed.count), маркеров: \(totalMarkers)")
            }
        }

        private func swiftFiles(in directory: URL) -> [URL] {
            guard let enumerator = FileManager.default.enumerator(
                at: directory,
                includingPropertiesForKeys: nil,
                options: [.skipsHiddenFiles]
            ) else { return [] }
            return enumerator.compactMap { $0 as? URL }.filter { $0.pathExtension == "swift" }.sorted { $0.path < $1.path }
        }
    }

    /// Скан `// @DocSample`-сэмплов → `samples.json` + сниппеты (+ Swift-реестр).
    struct Extract: ParsableCommand {
        static let configuration = CommandConfiguration(
            commandName: "extract",
            abstract: "Извлечь `// @DocSample`-сэмплы в samples.json и файлы сниппетов."
        )

        @Option(name: .long, help: "Корень репозитория (default: текущая директория).")
        var repoRoot: String?

        @Option(name: .long, help: "Каталог core-сэмплов.")
        var coreSamples: String = "SDDSComponentsFixtures/Sources/SDDSComponentsFixtures/Samples"

        @Option(name: .long, help: "Имя модуля core-слоя — первый сегмент fqName.")
        var coreModule: String = "SDDSComponentsFixtures"

        @Option(name: .long, help: "Каталог сэмплов темы (перекрывают core по id).")
        var themeSamples: String?

        @Option(name: .long, help: "Имя модуля theme-слоя (default: имя каталога).")
        var themeModule: String?

        @Option(name: .long, help: "Куда писать samples.json и сниппеты.")
        var output: String = "DesignSystemBuilder/.sdds/documentation"

        @Option(name: .long, help: "Путь для генерируемого Swift-реестра сэмплов.")
        var emitRegistry: String?

        @Flag(name: .long, help: "Печатать предупреждения; ненулевой выход при их наличии.")
        var report: Bool = false

        func run() throws {
            let root = URL(fileURLWithPath: repoRoot ?? FileManager.default.currentDirectoryPath)
            var layers = [SampleScanner.Layer(directory: resolve(coreSamples, against: root), module: coreModule)]
            if let themeSamples {
                let url = resolve(themeSamples, against: root)
                layers.append(.init(directory: url, module: themeModule ?? url.lastPathComponent))
            }

            let scanner = SampleScanner(repoRoot: root)
            let result = scanner.scan(layers: layers)
            do {
                try scanner.write(result, to: resolve(output, against: root))
            } catch {
                fail("запись не удалась: \(error)")
            }
            print("samples: \(result.records.count) → \(output)/samples.json")

            if let emitRegistry {
                let url = resolve(emitRegistry, against: root)
                do {
                    try FileManager.default.createDirectory(
                        at: url.deletingLastPathComponent(),
                        withIntermediateDirectories: true
                    )
                    try Data(RegistryGenerator.source(records: result.records).utf8).write(to: url)
                    print("registry → \(emitRegistry)")
                } catch {
                    fail("registry не записан: \(error)")
                }
            }

            if report {
                result.warnings.forEach { FileHandle.standardError.write(Data("warning: \($0)\n".utf8)) }
                if !result.warnings.isEmpty { throw ExitCode(1) }
            }
        }
    }

    /// Сборка дерева бандла из Core-доков, user-слоя и артефактов темы.
    struct Aggregate: ParsableCommand {
        static let configuration = CommandConfiguration(
            commandName: "aggregate",
            abstract: "Собрать дерево .sdds/temp/docs для внешнего dsbuilder."
        )

        @Option(name: .long, help: "Корень репозитория (default: текущая директория).")
        var repoRoot: String?

        @Option(name: .long, help: "Имя темы, например PlasmaHomeDS.")
        var theme: String

        @Option(name: .long, help: "Каталог .sdds темы (default: Themes/<Name>Theme/.sdds).")
        var themeSdds: String?

        @Option(name: .long, help: "Каталог Core-документации.")
        var coreDocs: String = "docs-template/swiftui-template/docs"

        @Option(name: .long, help: "Каталог user-слоя документации темы.")
        var userDocs: String?

        @Option(name: .long, help: "Каталог с выходом `docs extract`.")
        var samples: String = "DesignSystemBuilder/.sdds/documentation"

        @Option(name: .long, help: "Каталог готовых скриншотов.")
        var screenshots: String?

        @Option(name: .long, help: "artifact.id для platform-context (default: sdds-<theme>-swiftui).")
        var artifactId: String?

        @Option(name: .long, help: "artifact.version для platform-context.")
        var artifactVersion: String = "0.0.0"

        @Option(name: .long, help: "Выходной каталог дерева бандла.")
        var output: String = "DesignSystemBuilder/.sdds/temp/docs"

        @Flag(name: .long, help: "Печатать предупреждения; ненулевой выход при их наличии.")
        var report: Bool = false

        func run() throws {
            let root = URL(fileURLWithPath: repoRoot ?? FileManager.default.currentDirectoryPath)
            let sdds = resolve(themeSdds ?? "Themes/\(theme)Theme/.sdds", against: root)
            let inputs = DocsAggregate.Inputs(
                coreDocsURL: resolve(coreDocs, against: root),
                userDocsURL: userDocs.map { resolve($0, against: root) },
                componentsInfoURL: sdds.appending(component: "config-info-ios.json"),
                themeInfoURL: sdds.appending(component: "config-info-tokens-ios.json"),
                extractedSamplesURL: resolve(samples, against: root),
                screenshotsURL: screenshots.map { resolve($0, against: root) },
                artifactId: artifactId ?? "sdds-\(theme.lowercased())-swiftui",
                artifactVersion: artifactVersion
            )
            let outputURL = resolve(output, against: root)

            do {
                let result = try DocsAggregate().run(inputs: inputs, outputURL: outputURL)
                print("aggregate: core pages \(result.pagesCore), user pages \(result.pagesUser) → \(outputURL.path)")
                if report {
                    result.warnings.forEach { FileHandle.standardError.write(Data("warning: \($0)\n".utf8)) }
                    if !result.warnings.isEmpty { throw ExitCode(1) }
                }
            } catch let error as ExitCode {
                throw error
            } catch {
                fail("aggregate: \(error)")
            }
        }
    }
}
