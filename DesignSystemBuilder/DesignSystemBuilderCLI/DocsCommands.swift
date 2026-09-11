import Foundation
import ArgumentParser
import DocsAggregatorCore

/// Абсолютный путь используется как есть, относительный — от корня репозитория.
private func resolve(_ path: String, against root: URL) -> URL {
    path.hasPrefix("/") ? URL(fileURLWithPath: path) : root.appending(path: path)
}

/// Относительный путь резолвится от текущей директории — рабочей директории вызывающего.
private func absoluteURL(_ path: String) -> URL {
    path.hasPrefix("/")
        ? URL(fileURLWithPath: path)
        : URL(fileURLWithPath: FileManager.default.currentDirectoryPath).appending(path: path)
}

private func existingDirectory(_ url: URL) -> URL? {
    FileManager.default.fileExists(atPath: url.path()) ? url : nil
}

/// Корень чекаута plasma-ios: ближайший каталог с `SDDS.xcworkspace` выше переданного.
private func findRepoRoot(above directory: URL) -> URL? {
    var candidate = directory
    while candidate.path() != "/" {
        candidate = candidate.deletingLastPathComponent()
        if FileManager.default.fileExists(atPath: candidate.appending(component: "SDDS.xcworkspace").path()) {
            return candidate
        }
    }
    return nil
}

/// Документационный бандл: скан сэмплов и сборка дерева `.sdds/temp/docs`.
struct Docs: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "docs",
        abstract: "Документационный бандл для dsbuilder docs generate --platform swiftui.",
        subcommands: [Extract.self, Aggregate.self]
    )
}

extension Docs {

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
                throw CleanFailure("запись не удалась: \(error)")
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
                    throw CleanFailure("registry не записан: \(error)")
                }
            }

            if report {
                result.warnings.forEach { FileHandle.standardError.write(Data("warning: \($0)\n".utf8)) }
                if !result.warnings.isEmpty { throw ExitCode(1) }
            }
        }
    }

    /// Сборка дерева бандла из Core-доков, user-слоя и артефактов темы.
    ///
    /// Два режима. `--sdds <dir>` — режим DS Builder: пути выводятся из директории темы, сэмплы
    /// извлекаются здесь же, так эту команду вызывает делегат платформы. `--theme <Name>` —
    /// прежний режим с путями относительно корня репозитория.
    struct Aggregate: ParsableCommand {
        static let configuration = CommandConfiguration(
            commandName: "aggregate",
            abstract: "Собрать дерево .sdds/temp/docs для внешнего dsbuilder."
        )

        @Option(name: .long, help: "Директория `.sdds` темы. Пути и сэмплы выводятся из неё.")
        var sdds: String?

        @Option(name: .long, help: "Имя темы, например PlasmaHomeDS. Не используется вместе с --sdds.")
        var theme: String?

        @Option(name: .long, help: "Корень репозитория (default: текущая директория).")
        var repoRoot: String?

        @Option(name: .long, help: "Каталог .sdds темы (default: Themes/<Name>Theme/.sdds).")
        var themeSdds: String?

        @Option(name: .long, help: "Каталог core-сэмплов.")
        var coreSamples: String = "SDDSComponentsFixtures/Sources/SDDSComponentsFixtures/Samples"

        @Option(name: .long, help: "Имя модуля core-слоя — первый сегмент fqName.")
        var coreModule: String = "SDDSComponentsFixtures"

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

        @Option(name: .long, help: "Выходной каталог дерева. В режиме --sdds по умолчанию <sdds>/temp/docs.")
        var output: String?

        @Flag(name: .long, help: "Печатать предупреждения; ненулевой выход при их наличии.")
        var report: Bool = false

        func validate() throws {
            switch (sdds, theme) {
            case (nil, nil):
                throw ValidationError("Pass --sdds <dir> or --theme <Name>.")
            case (.some, .some):
                throw ValidationError("--sdds and --theme are mutually exclusive: with --sdds the theme comes from the directory.")
            default:
                break
            }

            guard let sdds = sdds else { return }
            let directory = absoluteURL(sdds)
            guard FileManager.default.fileExists(atPath: directory.appending(component: "config.json").path()) else {
                throw ValidationError("config.json not found in \(directory.path()).")
            }
            guard findRepoRoot(above: directory) != nil else {
                throw ValidationError("\(directory.path()) is not inside a plasma-ios checkout: no SDDS.xcworkspace above it.")
            }
        }

        func run() throws {
            if let sdds {
                try runFromSdds(sddsPath: sdds)
            } else {
                try runFromFlags(themeName: theme ?? "")
            }
        }

        /// Режим DS Builder: сэмплы, user-слой и скриншоты берутся рядом с пакетом темы.
        private func runFromSdds(sddsPath: String) throws {
            let sddsURL = absoluteURL(sddsPath)
            let themePackage = sddsURL.deletingLastPathComponent()
            guard let root = findRepoRoot(above: sddsURL) else {
                throw CleanFailure("\(sddsURL.path()) is not inside a plasma-ios checkout.")
            }

            let folder = themePackage.lastPathComponent
            let themeName = folder.hasSuffix("Theme") ? String(folder.dropLast("Theme".count)) : folder
            let samplesURL = sddsURL.appending(path: "temp/documentation")
            let outputURL = output.map(absoluteURL) ?? sddsURL.appending(path: "temp/docs")

            print("🎯 Theme: \(themeName)")
            print("📦 Source: \(sddsURL.path())")
            print("📚 Repo: \(root.path())")
            print("📂 Output: \(outputURL.path())")

            try extractSamples(root: root, themePackage: themePackage, outputURL: samplesURL)
            try aggregate(
                inputs: DocsAggregate.Inputs(
                    coreDocsURL: resolve(coreDocs, against: root),
                    userDocsURL: existingDirectory(themePackage.appending(path: "docs/override-docs")),
                    componentsInfoURL: sddsURL.appending(component: "config-info-ios.json"),
                    themeInfoURL: sddsURL.appending(component: "config-info-tokens-ios.json"),
                    extractedSamplesURL: samplesURL,
                    screenshotsURL: existingDirectory(themePackage.appending(path: "docs/screenshots")),
                    artifactId: artifactId ?? "sdds-\(themeName.lowercased())-swiftui",
                    artifactVersion: artifactVersion
                ),
                outputURL: outputURL
            )
        }

        /// Прежний режим: пути задаются флагами относительно корня репозитория, сэмплы уже извлечены.
        private func runFromFlags(themeName: String) throws {
            let root = URL(fileURLWithPath: repoRoot ?? FileManager.default.currentDirectoryPath)
            let sddsURL = resolve(themeSdds ?? "Themes/\(themeName)Theme/.sdds", against: root)

            try aggregate(
                inputs: DocsAggregate.Inputs(
                    coreDocsURL: resolve(coreDocs, against: root),
                    userDocsURL: userDocs.map { resolve($0, against: root) },
                    componentsInfoURL: sddsURL.appending(component: "config-info-ios.json"),
                    themeInfoURL: sddsURL.appending(component: "config-info-tokens-ios.json"),
                    extractedSamplesURL: resolve(samples, against: root),
                    screenshotsURL: screenshots.map { resolve($0, against: root) },
                    artifactId: artifactId ?? "sdds-\(themeName.lowercased())-swiftui",
                    artifactVersion: artifactVersion
                ),
                outputURL: resolve(output ?? "DesignSystemBuilder/.sdds/temp/docs", against: root)
            )
        }

        /// Извлекает `// @DocSample`-сэмплы core-слоя и слоя темы.
        private func extractSamples(root: URL, themePackage: URL, outputURL: URL) throws {
            var layers = [SampleScanner.Layer(directory: resolve(coreSamples, against: root), module: coreModule)]
            if let themeSamplesURL = existingDirectory(themePackage.appending(path: "docs/Samples")) {
                layers.append(.init(directory: themeSamplesURL, module: themePackage.lastPathComponent))
            }

            let scanner = SampleScanner(repoRoot: root)
            let result = scanner.scan(layers: layers)
            do {
                try scanner.write(result, to: outputURL)
            } catch {
                throw CleanFailure("запись сэмплов не удалась: \(error)")
            }
            print("samples: \(result.records.count) → \(outputURL.path())")

            if report, !result.warnings.isEmpty {
                result.warnings.forEach { FileHandle.standardError.write(Data("warning: \($0)\n".utf8)) }
                throw ExitCode(1)
            }
        }

        private func aggregate(inputs: DocsAggregate.Inputs, outputURL: URL) throws {
            do {
                let result = try DocsAggregate().run(inputs: inputs, outputURL: outputURL)
                print("aggregate: core pages \(result.pagesCore), user pages \(result.pagesUser) → \(outputURL.path)")
                if report {
                    result.warnings.forEach { FileHandle.standardError.write(Data("warning: \($0)\n".utf8)) }
                    if !result.warnings.isEmpty { throw ExitCode(1) }
                }
            } catch let error as ExitCode {
                throw error
            } catch let error as CleanFailure {
                throw error
            } catch {
                throw CleanFailure("aggregate: \(error)")
            }
        }
    }
}
