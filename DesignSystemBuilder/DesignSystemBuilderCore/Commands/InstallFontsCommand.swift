import Foundation

final class InstallFontsCommand: Command, FileWriter {
    private let fontFamiliesContainer: FontFamiliesContainer
    private let fontsURL: URL
    private let sddsDesignSystemBuilderXcodeProjectURL: URL
    private let fontFamilyOverride: DesignSystemBuilderConfiguration.FontFamilyOverride

    init(
        fontFamiliesContainer: FontFamiliesContainer,
        fontsURL: URL,
        sddsDesignSystemBuilderXcodeProjectURL: URL,
        fontFamilyOverride: DesignSystemBuilderConfiguration.FontFamilyOverride = .none
    ) {
        self.fontFamiliesContainer = fontFamiliesContainer
        self.fontsURL = fontsURL
        self.sddsDesignSystemBuilderXcodeProjectURL = sddsDesignSystemBuilderXcodeProjectURL
        self.fontFamilyOverride = fontFamilyOverride

        super.init(name: "Create Fonts Manifest")
    }

    @discardableResult override func run() -> CommandResult {
        super.run()

        // При override темы на системный шрифт ни валидация upstream-URL'ов
        // шрифтов, ни их включение в `FontsManifest` не имеют смысла —
        // приложение не будет ничего скачивать на runtime. Сразу выпускаем
        // пустой manifest.
        if fontFamilyOverride == .systemSFPro {
            return createFontsManifest()
        }

        var result: CommandResult = .empty
        for command in [ {self.validatateFonts()}, {self.createFontsManifest()} ] {
            result = command()
            guard !result.isError else {
                return result
            }
        }

        return result
    }

    // MARK: - Validation
    private func validatateFonts() -> CommandResult {
        for key in FontFamily.Key.allCases {
            guard let fontFamily = fontFamiliesContainer.items[key] else {
                continue
            }
            let fonts = fontFamily.fonts
            for font in fonts {
                let ext = font.link.lastPathComponent.components(separatedBy: ".").last
                guard ext == "otf" || ext == "ttf" else {
                    Logger.printText("Font file should be `otf` or `ttf`")
                    return .error(GeneralError.fontExtensionError)
                }
            }
        }

        return .success
    }

    // MARK: - Скачивание и вшивание

    /// Один шрифт, готовый к вшиванию: полезная нагрузка уже скачана и закодирована.
    struct EmbeddedFontSource {
        let filename: String
        let url: URL
        let base64: String

        /// Имя Swift-константы: `SBSansText-Regular.otf` → `sbSansText_Regular`.
        var constantName: String {
            let base = (filename as NSString).deletingPathExtension
                .replacingOccurrences(of: "-", with: "_")
                .replacingOccurrences(of: ".", with: "_")
                .replacingOccurrences(of: " ", with: "_")
            guard let first = base.first else { return "font" }
            return first.lowercased() + base.dropFirst()
        }

        var payloadFileName: String { "\(constantName).swift" }
    }

    /// Скачивает шрифты темы и кодирует их в base64.
    ///
    /// Дедуплицирует по имени файла: в схеме один и тот же `.otf` встречается несколько раз
    /// (одна пара weight/style описана и в `display`, и в `text`), качать его дважды незачем.
    ///
    /// При недоступном CDN команда падает: молча выпустить тему без шрифтов — значит отдать
    /// потребителю сборку, которая тихо отрисуется системным шрифтом.
    private func downloadFonts() -> Result<[EmbeddedFontSource], GeneralError> {
        guard fontFamilyOverride != .systemSFPro else { return .success([]) }

        var byFilename: [String: URL] = [:]
        var order: [String] = []
        for key in FontFamily.Key.allCases {
            guard let fontFamily = fontFamiliesContainer.items[key] else { continue }
            for font in fontFamily.fonts {
                let filename = font.link.lastPathComponent
                if byFilename[filename] == nil { order.append(filename) }
                byFilename[filename] = font.link
            }
        }

        var result: [EmbeddedFontSource] = []
        for filename in order {
            guard let url = byFilename[filename] else { continue }
            do {
                let data = try Data(contentsOf: url)
                guard !data.isEmpty else {
                    Logger.printText("Font \(filename) downloaded empty from \(url.absoluteString)")
                    return .failure(.unableToDownloadFonts)
                }
                result.append(
                    .init(filename: filename, url: url, base64: data.base64EncodedString(options: [.lineLength76Characters, .endLineWithLineFeed]))
                )
                Logger.printText("Font embedded: \(filename) (\(data.count / 1024) KB)")
            } catch {
                Logger.printText("Failed to download font \(filename) from \(url.absoluteString): \(error)")
                return .failure(.unableToDownloadFonts)
            }
        }
        return .success(result)
    }

    /// Убирает `.swift`-нагрузки шрифтов, которых больше нет в теме, — иначе после смены
    /// семейства в каталоге остались бы висеть константы от прежнего набора.
    private func removeStaleFontPayloads(keeping wanted: Set<String>) throws {
        let fileManager = FileManager.default
        let existing = (try? fileManager.contentsOfDirectory(atPath: fontsURL.path())) ?? []
        for name in existing where name.hasSuffix(".swift") && name != "FontsManifest.swift" && !wanted.contains(name) {
            try fileManager.removeItem(at: fontsURL.appending(component: name))
            Logger.printText("Removed stale font payload: \(name)")
        }
    }

    // MARK: - Create Manifest
    private func createFontsManifest() -> CommandResult {
        var fontEntries: [String] = []

        // Под override на системный шрифт manifest должен быть пустым: ни одна
        // запись об upstream-URL шрифта (включая sberdevices.ru-ссылки) не
        // должна попасть в сгенерированный Swift-файл.
        if fontFamilyOverride != .systemSFPro {
            for key in FontFamily.Key.allCases {
                guard let fontFamily = fontFamiliesContainer.items[key] else {
                    continue
                }

                let fonts = fontFamily.fonts
                for font in fonts {
                    let escapedURL = font.link.absoluteString.replacingOccurrences(of: "\"", with: "\\\"")
                    let entry = """
                        FontInfo(url: "\(escapedURL)", weight: "\(font.weight.rawValue)", style: "\(font.style.rawValue)", filename: "\(font.link.lastPathComponent)")
                    """
                    fontEntries.append(entry)
                }
            }
        }

        let embedded: [EmbeddedFontSource]
        switch downloadFonts() {
        case let .success(fonts):
            embedded = fonts
        case let .failure(error):
            return .error(error)
        }

        let embeddedEntries = embedded.map { font in
            """
                    EmbeddedFont(filename: "\(font.filename)", base64: \(font.constantName))
            """
        }

        let swiftContent = """
import Foundation
import SDDSThemeCore

public struct FontInfo {
    public let url: String
    public let weight: String
    public let style: String
    public let filename: String
}

public struct FontsManifest {
    /// Upstream-ссылки на шрифты. Оставлены для трассировки: в рантайме не используются,
    /// шрифты вшиты в исходники темы (см. `embedded`).
    public static let fonts: [FontInfo] = [
\(fontEntries.map { "        \($0)" }.joined(separator: ",\n"))
    ]

    /// Шрифты, вшитые в тему. Регистрируются синхронно, без сети и без ресурсного бандла.
    public static let embedded: [EmbeddedFont] = [
\(embeddedEntries.joined(separator: ",\n"))
    ]
}

"""

        let fileManager = FileManager.default
        do {
            if !fileManager.fileExists(atPath: fontsURL.path()) {
                try fileManager.createDirectory(at: fontsURL, withIntermediateDirectories: true)
            }

            try removeStaleFontPayloads(keeping: Set(embedded.map(\.payloadFileName)))

            // Каждый шрифт — отдельный файл с одной строковой константой: тайпчекер Swift
            // спокойно ест длинные строковые литералы, но ломается на больших массивах байт.
            for font in embedded {
                let payloadURL = fontsURL.appending(component: font.payloadFileName)
                let payload = """
                // Generated by Design System Builder, do not edit

                let \(font.constantName) = \"\"\"
                \(font.base64)
                \"\"\"

                """
                try payload.write(to: payloadURL, atomically: true, encoding: .utf8)
            }

            let swiftURL = fontsURL.appending(component: "FontsManifest.swift")
            try swiftContent.write(to: swiftURL, atomically: true, encoding: .utf8)

            Logger.printText("Fonts manifest created at: \(swiftURL.path())")
        } catch {
            Logger.printText("Failed to write fonts manifest: \(error)")
            return .error(.nsError(error))
        }

        return .success
    }

}
