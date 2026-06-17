import Foundation
import Stencil

public final class App {
    let config: ThemeBuilderConfiguration
    let sourcePath: String

    public init(config: ThemeBuilderConfiguration, sourcePath: String) {
        self.config = config
        self.sourcePath = sourcePath
    }

    /// Разрешённый источник темы. Зеркалит Android `ThemeSourceResolver`:
    /// явный source имеет приоритет, `.sdds` — fallback для тем, которые его не задают.
    private enum ResolvedSource {
        case explicit
        case sdds(SddsThemeSource)
    }

    private func executeCommands(config: ThemeBuilderConfiguration, themeConfig: ThemeBuilderConfiguration.ThemeConfiguration) {
        PrepareDirectoriesCommand(
            themeBuilderURL: themeBuilderURL,
            outputDirectoryURL: outputDirectoryURL(config: themeConfig),
            themeURL: themeURL(config: themeConfig)
        ).run()

        switch resolveSource(themeConfig: themeConfig) {
        case .sdds(let sddsSource):
            executeSddsCommands(config: config, themeConfig: themeConfig, sddsSource: sddsSource)
        case .explicit:
            executeRemoteCommands(config: config, themeConfig: themeConfig)
        }
    }

    /// Разрешает источник темы по семантике Android #815 (`explicit ?: sdds`):
    /// - тема без `sddsConfigPath` декларирует явный source (`url`/`localSchemePath`) → он побеждает;
    /// - тема с `sddsConfigPath` «не задаёт явный» → используется `.sdds`, а при недоступной/неполной
    ///   `.sdds`-директории происходит safety-fallback на remote/zip.
    private func resolveSource(themeConfig: ThemeBuilderConfiguration.ThemeConfiguration) -> ResolvedSource {
        guard themeConfig.sddsConfigPath != nil else {
            return .explicit
        }
        if let sddsSource = sddsThemeSource(themeConfig: themeConfig) {
            return .sdds(sddsSource)
        }
        Logger.printText("⚠️ .sdds недоступен для \(themeConfig.name) — fallback на remote/zip")
        return .explicit
    }

    // MARK: - Remote/zip flow

    private func executeRemoteCommands(
        config: ThemeBuilderConfiguration,
        themeConfig: ThemeBuilderConfiguration.ThemeConfiguration
    ) {
        DownloadCommand(fileURL: effectiveSchemeURL(themeConfig: themeConfig), outputURL: schemeZipLocalURL(themeConfig: themeConfig)).run()
        DownloadCommand(fileURL: config.paletteURL, outputURL: paletteLocalURL(config: config, themeConfig: themeConfig)).run()

        guard let schemeDirectory = UnpackThemeCommand(schemeURL: schemeZipLocalURL(themeConfig: themeConfig), outputDirectoryURL: outputDirectoryURL(config: themeConfig))
            .run()
            .asSchemeDirectory else {
            Logger.terminate("No scheme directory")
            return
        }

        let paletteURL = paletteLocalURL(config: config, themeConfig: themeConfig)
        generateBaseTheme(themeConfig: themeConfig, schemeDirectory: schemeDirectory, paletteURL: paletteURL)

        for tenant in themeConfig.tenants {
            Logger.printText("🎨 Generating tenant \(tenant.name) for \(themeConfig.name)...")
            executeTenantCommands(config: config, themeConfig: themeConfig, tenant: tenant)
        }
    }

    private func executeTenantCommands(
        config: ThemeBuilderConfiguration,
        themeConfig: ThemeBuilderConfiguration.ThemeConfiguration,
        tenant: ThemeBuilderConfiguration.Tenant
    ) {
        let tenantOutputDirectory = self.tenantOutputDirectoryURL(config: themeConfig, tenant: tenant)
        try? FileManager.default.createDirectory(at: tenantOutputDirectory, withIntermediateDirectories: true)

        let tenantZipURL = tenantOutputDirectory.appending(component: tenant.url.lastPathComponent)
        DownloadCommand(fileURL: tenant.url, outputURL: tenantZipURL).run()

        guard let tenantSchemeDirectory = UnpackThemeCommand(schemeURL: tenantZipURL, outputDirectoryURL: tenantOutputDirectory)
            .run()
            .asSchemeDirectory else {
            Logger.terminate("No scheme directory for tenant \(tenant.name)")
            return
        }

        generateTenantTheme(
            themeConfig: themeConfig,
            schemeDirectory: tenantSchemeDirectory,
            paletteURL: paletteLocalURL(config: config, themeConfig: themeConfig),
            tenantSuffix: tenant.name,
            displayName: tenant.name
        )
    }

    // MARK: - Local `.sdds` flow

    /// Пытается прочитать локальный `.sdds`-источник темы. Возвращает nil, если у
    /// темы не задан `sddsConfigPath` либо `.sdds` отсутствует/неполон.
    private func sddsThemeSource(themeConfig: ThemeBuilderConfiguration.ThemeConfiguration) -> SddsThemeSource? {
        guard let relative = themeConfig.sddsConfigPath, !relative.isEmpty else {
            return nil
        }
        let configURL = repoRootURL.appending(path: relative)
        // Базовая директория — родитель папки `.sdds`; относительно неё
        // резолвятся пути из config.json (`.sdds/<tenant>`, `.sdds/tenants/palette.json`).
        let baseDirectory = configURL.deletingLastPathComponent().deletingLastPathComponent()
        return SddsThemeSourceReader(configURL: configURL, baseDirectory: baseDirectory).read()
    }

    private func executeSddsCommands(
        config: ThemeBuilderConfiguration,
        themeConfig: ThemeBuilderConfiguration.ThemeConfiguration,
        sddsSource: SddsThemeSource
    ) {
        Logger.printText("📦 Using local .sdds source for \(themeConfig.name) (base: \(sddsSource.baseName))")

        guard let baseTenant = sddsSource.tenants.first,
              let schemeDirectory = SchemeDirectory.make(fromUnpackedDirectory: baseTenant.directory) else {
            Logger.terminate("No scheme directory in .sdds for \(themeConfig.name)")
            return
        }

        generateBaseTheme(themeConfig: themeConfig, schemeDirectory: schemeDirectory, paletteURL: sddsSource.paletteURL)

        for tenant in sddsSource.tenants.dropFirst() {
            Logger.printText("🎨 Generating tenant \(tenant.displayName) for \(themeConfig.name)...")
            guard let tenantSchemeDirectory = SchemeDirectory.make(fromUnpackedDirectory: tenant.directory) else {
                Logger.terminate("No scheme directory in .sdds for tenant \(tenant.displayName)")
                return
            }
            generateTenantTheme(
                themeConfig: themeConfig,
                schemeDirectory: tenantSchemeDirectory,
                paletteURL: sddsSource.paletteURL,
                tenantSuffix: tenant.suffix,
                displayName: tenant.displayName
            )
        }
    }

    // MARK: - Shared generation

    private func generateBaseTheme(
        themeConfig: ThemeBuilderConfiguration.ThemeConfiguration,
        schemeDirectory: SchemeDirectory,
        paletteURL: URL
    ) {
        guard let metaScheme = DecodeCommand<Scheme>(url: schemeDirectory.url(for: .meta))
            .run()
            .asScheme else {
            Logger.terminate("No scheme")
            return
        }

        guard let fontFamiliesContainer = DecodeCommand<FontFamiliesContainer>(url: schemeDirectory.url(for: .fontFamilies))
            .run()
            .asFontFamiliesContainer else {
            Logger.terminate("No font family container")
            return
        }

        var commands: [Command] = [
            InstallFontsCommand(
                fontFamiliesContainer: fontFamiliesContainer,
                fontsURL: fontsURL(config: themeConfig),
                copyFontsScriptURL: copyFontsScriptURL,
                registerFontsScriptURL: registerFontsScriptURL,
                sddsThemeBuilderXcodeProjectURL: xcodeProjectURL,
                themePlistURL: themePlistURL(config: themeConfig),
                fontFamilyOverride: themeConfig.fontFamilyOverride
            )
        ]
        commands.append(contentsOf: tokenCommands(
            themeConfig: themeConfig,
            schemeDirectory: schemeDirectory,
            metaScheme: metaScheme,
            fontFamiliesContainer: fontFamiliesContainer,
            paletteURL: paletteURL,
            tenantSuffix: nil
        ))
        commands.append(contentsOf: generateComponentVariations(themeConfig: themeConfig))

        runCommands(commands)
    }

    private func generateTenantTheme(
        themeConfig: ThemeBuilderConfiguration.ThemeConfiguration,
        schemeDirectory: SchemeDirectory,
        paletteURL: URL,
        tenantSuffix: String,
        displayName: String
    ) {
        guard let tenantMetaScheme = DecodeCommand<Scheme>(url: schemeDirectory.url(for: .meta))
            .run()
            .asScheme else {
            Logger.terminate("No scheme for tenant \(displayName)")
            return
        }

        guard let tenantFontFamiliesContainer = DecodeCommand<FontFamiliesContainer>(url: schemeDirectory.url(for: .fontFamilies))
            .run()
            .asFontFamiliesContainer else {
            Logger.terminate("No font family container for tenant \(displayName)")
            return
        }

        let commands = tokenCommands(
            themeConfig: themeConfig,
            schemeDirectory: schemeDirectory,
            metaScheme: tenantMetaScheme,
            fontFamiliesContainer: tenantFontFamiliesContainer,
            paletteURL: paletteURL,
            tenantSuffix: tenantSuffix
        )

        runCommands(commands)
    }

    /// Шесть `GenerateTokensCommand` (color/shadow/spacing/shape/typography/gradient),
    /// общие для базовой темы и tenant'ов, для remote- и `.sdds`-источников.
    /// `paletteURL` используется и палитрой рендерера, и context-builder'ами.
    private func tokenCommands(
        themeConfig: ThemeBuilderConfiguration.ThemeConfiguration,
        schemeDirectory: SchemeDirectory,
        metaScheme: Scheme,
        fontFamiliesContainer: FontFamiliesContainer,
        paletteURL: URL,
        tenantSuffix: String?
    ) -> [Command] {
        let label = tenantSuffix.map { " (\($0))" } ?? ""
        let renderer = { TemplateRenderer(paletteMapper: PaletteMapper(paletteURL: paletteURL)) }

        return [
            GenerateTokensCommand(
                name: "Generate Color Tokens\(label)",
                schemeURL: schemeDirectory.url(for: .colors),
                themeURL: themeURL(config: themeConfig),
                templates: [.colorToken, .colors],
                generatedOutputURL: generatedTokensURL(config: themeConfig),
                templateRender: renderer(),
                contextBuilder: ColorContextBuilder(
                    paletteURL: paletteURL,
                    metaScheme: metaScheme
                ),
                themeName: themeConfig.name,
                tenantSuffix: tenantSuffix
            ),
            GenerateTokensCommand(
                name: "Generate Shadow Tokens\(label)",
                schemeURL: schemeDirectory.url(for: .shadows),
                themeURL: themeURL(config: themeConfig),
                templates: [.shadowToken, .shadows],
                generatedOutputURL: generatedTokensURL(config: themeConfig),
                templateRender: renderer(),
                contextBuilder: GeneralContextBuilder(
                    kind: .shadow,
                    metaScheme: metaScheme
                ),
                themeName: themeConfig.name,
                tenantSuffix: tenantSuffix
            ),
            GenerateTokensCommand(
                name: "Generate Spacing Tokens\(label)",
                schemeURL: schemeDirectory.url(for: .spacing),
                themeURL: themeURL(config: themeConfig),
                templates: [.spacingToken, .spacings],
                generatedOutputURL: generatedTokensURL(config: themeConfig),
                templateRender: renderer(),
                contextBuilder: GeneralContextBuilder(
                    kind: .spacing,
                    metaScheme: metaScheme
                ),
                themeName: themeConfig.name,
                tenantSuffix: tenantSuffix
            ),
            GenerateTokensCommand(
                name: "Generate Shape Tokens\(label)",
                schemeURL: schemeDirectory.url(for: .shapes),
                themeURL: themeURL(config: themeConfig),
                templates: [.shapeToken, .shapes],
                generatedOutputURL: generatedTokensURL(config: themeConfig),
                templateRender: renderer(),
                contextBuilder: GeneralContextBuilder(
                    kind: .shape,
                    metaScheme: metaScheme
                ),
                themeName: themeConfig.name,
                tenantSuffix: tenantSuffix
            ),
            GenerateTokensCommand(
                name: "Generate Typography Tokens\(label)",
                schemeURL: schemeDirectory.url(for: .typography),
                themeURL: themeURL(config: themeConfig),
                templates: [.typographyToken, .typographies],
                generatedOutputURL: generatedTokensURL(config: themeConfig),
                templateRender: renderer(),
                contextBuilder: TypographyContextBuilder(
                    fontFamiliesContainer: fontFamiliesContainer,
                    metaScheme: metaScheme,
                    fontFamilyOverride: themeConfig.fontFamilyOverride
                ),
                themeName: themeConfig.name,
                tenantSuffix: tenantSuffix
            ),
            GenerateTokensCommand(
                name: "Generate Gradient Tokens\(label)",
                schemeURL: schemeDirectory.url(for: .gradients),
                themeURL: themeURL(config: themeConfig),
                templates: [.gradientToken, .gradients],
                generatedOutputURL: generatedTokensURL(config: themeConfig),
                templateRender: renderer(),
                contextBuilder: GradientContextBuilder(
                    paletteURL: paletteURL,
                    metaScheme: metaScheme
                ),
                themeName: themeConfig.name,
                tenantSuffix: tenantSuffix
            )
        ]
    }

    private func runCommands(_ commands: [Command]) {
        for command in commands {
            let result = command.run()
            switch result {
            case .error(let error):
                switch error {
                case .schemeNotFound:
                    Logger.printText(command.name + " skipped because no corresponding scheme found. Skipping... ⏭️⚠️")
                    continue
                default:
                    break
                }
                Logger.terminate(with: error)
            default:
                break
            }
        }
    }
}

// MARK: - Variations
extension App {
    private func generateComponentVariations(themeConfig: ThemeBuilderConfiguration.ThemeConfiguration) -> [Command] {
        CodeGenerationComponent.supportedComponents.map { component in
            return component.command(outputURL: generatedComponentsURL(component: component, config: themeConfig), themeConfig: themeConfig)
        }
    }
}

// MARK: - Directories
extension App {
    private var themeBuilderURL: URL {
        let path = URL(fileURLWithPath: sourcePath)
            .deletingLastPathComponent()
            .deletingLastPathComponent()
        return path
    }

    /// Корень репозитория (`plasma-ios`). Используется для резолва
    /// `ThemeConfiguration.localSchemePath` и `sddsConfigPath`, которые хранятся
    /// как пути относительно корня репо.
    private var repoRootURL: URL {
        themeBuilderURL.deletingLastPathComponent()
    }

    /// URL, который `DownloadCommand` использует для получения схемы темы:
    /// либо `file://`-URL локального snapshot'а (если у темы задан
    /// `localSchemePath`), либо upstream-URL из конфига. Это позволяет
    /// отдельным темам собираться без сетевых обращений к стороннему репо схем.
    private func effectiveSchemeURL(themeConfig: ThemeBuilderConfiguration.ThemeConfiguration) -> URL {
        if let relative = themeConfig.localSchemePath, !relative.isEmpty {
            return repoRootURL.appending(path: relative)
        }
        return themeConfig.url
    }

    private func outputDirectoryURL(config: ThemeBuilderConfiguration.ThemeConfiguration) -> URL {
        themeBuilderURL
            .appending(component: "Output")
            .appending(component: config.name)
    }

    private func tenantOutputDirectoryURL(
        config: ThemeBuilderConfiguration.ThemeConfiguration,
        tenant: ThemeBuilderConfiguration.Tenant
    ) -> URL {
        outputDirectoryURL(config: config)
            .appending(component: "tenants")
            .appending(component: tenant.name)
    }

    private var xcodeProjectURL: URL {
        themeBuilderURL.appending(component: "SDDSThemeBuilder.xcodeproj")
    }

    private var templatesURL: URL {
        themeBuilderURL.appending(component: "SDDSThemeBuilderCore/Stencil")
    }

    private func schemeZipLocalURL(themeConfig: ThemeBuilderConfiguration.ThemeConfiguration) -> URL {
        outputDirectoryURL(config: themeConfig)
            .appending(component: themeConfig.url.lastPathComponent)
    }

    private func paletteLocalURL(config: ThemeBuilderConfiguration, themeConfig: ThemeBuilderConfiguration.ThemeConfiguration) -> URL {
        outputDirectoryURL(config: themeConfig).appending(component: config.paletteURL.lastPathComponent)
    }

    private func generatedTokensURL(config: ThemeBuilderConfiguration.ThemeConfiguration) -> URL {
        themeURL(config: config).appending(component: "Tokens")
    }

    private func generatedComponentsURL(component: CodeGenerationComponent, config: ThemeBuilderConfiguration.ThemeConfiguration) -> URL {
        themeURL(config: config).appending(component: component.rawValue)
    }

    private func fontsURL(config: ThemeBuilderConfiguration.ThemeConfiguration) -> URL {
        themeURL(config: config).appending(component: "Fonts")
    }

    private var copyFontsScriptURL: URL {
        themeBuilderURL.appending(component: "SDDSThemeBuilderCore/Fonts/copyFonts.rb")
    }

    private var registerFontsScriptURL: URL {
        themeBuilderURL.appending(component: "SDDSThemeBuilderCore/Fonts/registerFonts.rb")
    }

    private func themePlistURL(config: ThemeBuilderConfiguration.ThemeConfiguration) -> URL {
        themeURL(config: config).appending(component: "info.plist")
    }

    private func themeURL(config: ThemeBuilderConfiguration.ThemeConfiguration) -> URL {
        themeBuilderURL.appending(component: "../Themes/\(config.name)Theme")
    }
}

// MARK: - Runnable
extension App: Runnable {
    @discardableResult public func run() -> CommandResult {
        Logger.printLine()
        Logger.printText("⏰ Running SDDSThemeBuilder...")
        Logger.printLine()

        for themeConfig in config.themes {
            Logger.printText("🚀 Generating code for theme \(themeConfig.name)...")
            executeCommands(config: config, themeConfig: themeConfig)
        }

        Logger.printLine()
        return .empty
    }
}
