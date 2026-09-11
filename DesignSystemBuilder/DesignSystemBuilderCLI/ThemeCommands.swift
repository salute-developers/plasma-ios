import Foundation
import ArgumentParser
import DesignSystemBuilderCore

/// Генерация темы из локальной `.sdds`, наполненной DS Builder CLI.
///
/// В отличие от `themes`, которому нужен JSON-конфиг со списком тем, здесь тема одна и
/// описана самой `.sdds`. Так эту команду вызывает `dsbuilder theme generate` из
/// salute-developers/design-system-builder: он передаёт только пути и не знает про Swift.
struct Theme: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "theme",
        abstract: "Генерация кода темы из локальной `.sdds`.",
        subcommands: [Generate.self]
    )
}

extension Theme {

    /// Подмена семейства шрифтов темы на этапе генерации.
    enum FontFamilyOption: String, ExpressibleByArgument, CaseIterable {
        /// Шрифт берётся из схемы как есть.
        case none
        /// Шрифты заменяются на системный SF Pro — для тем, которым нельзя тянуть проприетарный шрифт.
        case systemSFPro = "system-sf-pro"

        var value: DesignSystemBuilderConfiguration.FontFamilyOverride {
            switch self {
            case .none: return .none
            case .systemSFPro: return .systemSFPro
            }
        }
    }

    struct Generate: ParsableCommand {
        static let configuration = CommandConfiguration(
            commandName: "generate",
            abstract: "Сгенерировать пакет темы из `.sdds`, наполненной `dsbuilder theme fetch`."
        )

        @Option(name: .long, help: "Директория `.sdds` темы — та, где лежит config.json.")
        var sdds: String

        @Option(name: [.customShort("o"), .long],
                help: "Куда положить пакет <Name>Theme. По умолчанию — рядом с директорией, содержащей `.sdds`.")
        var output: String?

        @Option(name: .long,
                help: "Имя темы. По умолчанию — имя папки рядом с `.sdds` без суффикса Theme.")
        var name: String?

        @Option(name: .long,
                help: """
                Имя схемы theme-converter, откуда берутся конфиги компонентов. По умолчанию выводится \
                из имени базового тенанта `.sdds` отбрасыванием суффикса `_default`.
                """)
        var scheme: String?

        @Option(name: .long, help: "Подмена семейства шрифтов: none | system-sf-pro.")
        var fontFamilyOverride: FontFamilyOption = .none

        /// Ошибки аргументов отдают код 2 — их видно до того, как что-то сгенерировано.
        func validate() throws {
            let directory = Self.absoluteURL(sdds)
            var isDirectory: ObjCBool = false
            guard FileManager.default.fileExists(atPath: directory.path(), isDirectory: &isDirectory),
                  isDirectory.boolValue else {
                throw ValidationError("Directory not found: \(directory.path())")
            }
            guard FileManager.default.fileExists(atPath: Self.configURL(sddsDirectory: directory).path()) else {
                throw ValidationError("config.json not found in \(directory.path()). Run `dsbuilder init` there first.")
            }
        }

        func run() throws {
            let sddsDirectory = Self.absoluteURL(sdds)
            let configURL = Self.configURL(sddsDirectory: sddsDirectory)

            guard SddsThemeSourceProbe.isReadable(configURL: configURL) else {
                // Токены выгружает `dsbuilder theme fetch`; без них генерировать нечего, и
                // молча откатываться на zip-схему в этом режиме нельзя — источник задан явно.
                throw CleanFailure(
                    "\(sddsDirectory.path()) has no usable theme source. Run `dsbuilder theme fetch` there first."
                )
            }

            let themeName = try resolvedThemeName(sddsDirectory: sddsDirectory)
            let outputURL = output.map(Self.absoluteURL) ?? sddsDirectory.deletingLastPathComponent().deletingLastPathComponent()
            let schemeName = scheme ?? Self.derivedSchemeName(configURL: configURL) ?? themeName.lowercased()

            print("🎯 Theme: \(themeName)")
            print("📦 Source: \(sddsDirectory.path())")
            print("🧩 Component configs: \(schemeName)")
            print("📂 Output: \(outputURL.path())")

            var config = DesignSystemBuilderConfiguration()
            config.themes = [
                DesignSystemBuilderConfiguration.ThemeConfiguration(
                    name: themeName,
                    url: "\(DesignSystemBuilderConfiguration.Theme.baseURL)/\(schemeName)/latest.zip",
                    fontFamilyOverride: fontFamilyOverride.value,
                    sddsConfigPath: configURL.path()
                )
            ]

            App(config: config, sourcePath: #file, outputPath: outputURL.path()).run()
        }

        /// Имя темы: явное, иначе из имени папки рядом с `.sdds` (`PlasmaHomeDSTheme` → `PlasmaHomeDS`).
        private func resolvedThemeName(sddsDirectory: URL) throws -> String {
            if let name = name, !name.isEmpty {
                return name
            }
            let folder = sddsDirectory.deletingLastPathComponent().lastPathComponent
            let derived = folder.hasSuffix("Theme") ? String(folder.dropLast("Theme".count)) : folder
            guard !derived.isEmpty else {
                throw ValidationError("Cannot derive theme name from \(sddsDirectory.path()); pass --name.")
            }
            return derived
        }

        /// Схема theme-converter из имени базового тенанта: `plasma_homeds_default` → `plasma_homeds`.
        private static func derivedSchemeName(configURL: URL) -> String? {
            guard let baseTenant = SddsThemeSourceProbe.baseTenantName(configURL: configURL) else {
                return nil
            }
            let suffix = "_default"
            return baseTenant.hasSuffix(suffix) ? String(baseTenant.dropLast(suffix.count)) : baseTenant
        }

        private static func configURL(sddsDirectory: URL) -> URL {
            sddsDirectory.appending(component: "config.json")
        }

        /// Относительные пути резолвятся от текущей директории — она же рабочая директория вызывающего.
        private static func absoluteURL(_ path: String) -> URL {
            path.hasPrefix("/")
                ? URL(fileURLWithPath: path)
                : URL(fileURLWithPath: FileManager.default.currentDirectoryPath).appending(path: path)
        }
    }
}

/// Ошибка выполнения: печатается как сообщение и даёт код возврата 1, без трейса.
struct CleanFailure: Error, CustomStringConvertible {
    let description: String

    init(_ description: String) {
        self.description = description
    }
}
