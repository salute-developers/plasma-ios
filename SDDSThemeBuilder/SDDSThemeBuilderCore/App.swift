import Foundation
import Stencil

public final class App {
    let config: ThemeBuilderConfiguration
    let sourcePath: String
    let outputPath: String?

    public init(config: ThemeBuilderConfiguration, sourcePath: String, outputPath: String? = nil) {
        self.config = config
        self.sourcePath = sourcePath
        self.outputPath = outputPath
    }
    
    private func executeCommands(config: ThemeBuilderConfiguration, themeConfig: ThemeBuilderConfiguration.ThemeConfiguration) {
        PrepareDirectoriesCommand(
            themeBuilderURL: themeBuilderURL,
            outputDirectoryURL: outputDirectoryURL(config: themeConfig),
            themeURL: themeURL(config: themeConfig)
        ).run()
        DownloadCommand(fileURL: effectiveSchemeURL(themeConfig: themeConfig), outputURL: schemeZipLocalURL(themeConfig: themeConfig)).run()
        DownloadCommand(fileURL: config.paletteURL, outputURL: paletteLocalURL(config: config, themeConfig: themeConfig)).run()
        
        guard let schemeDirectory = UnpackThemeCommand(schemeURL: schemeZipLocalURL(themeConfig: themeConfig), outputDirectoryURL: outputDirectoryURL(config: themeConfig))
            .run()
            .asSchemeDirectory else {
            Logger.terminate("No scheme directory")
            return
        }
        
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
            ),
            GenerateTokensCommand(
                name: "Generate Color Tokens",
                schemeURL: schemeDirectory.url(for: .colors),
                themeURL: themeURL(config: themeConfig),
                templates: [.colorToken, .colors],
                generatedOutputURL: generatedTokensURL(config: themeConfig),
                templateRender: TemplateRenderer(paletteMapper: PaletteMapper(paletteURL: config.paletteURL)),
                contextBuilder: ColorContextBuilder(
                    paletteURL: paletteLocalURL(config: config, themeConfig: themeConfig),
                    metaScheme: metaScheme
                ),
            themeName: themeConfig.name
            ),
            GenerateTokensCommand(
                name: "Generate Shadow Tokens",
                schemeURL: schemeDirectory.url(for: .shadows),
                themeURL: themeURL(config: themeConfig),
                templates: [.shadowToken, .shadows],
                generatedOutputURL: generatedTokensURL(config: themeConfig),
                templateRender: TemplateRenderer(paletteMapper: PaletteMapper(paletteURL: config.paletteURL)),
                contextBuilder: GeneralContextBuilder(
                    kind: .shadow,
                    metaScheme: metaScheme
                ),
            themeName: themeConfig.name
            ),
            GenerateTokensCommand(
                name: "Generate Spacing Tokens",
                schemeURL: schemeDirectory.url(for: .spacing),
                themeURL: themeURL(config: themeConfig),
                templates: [.spacingToken, .spacings],
                generatedOutputURL: generatedTokensURL(config: themeConfig),
                templateRender: TemplateRenderer(paletteMapper: PaletteMapper(paletteURL: config.paletteURL)),
                contextBuilder: GeneralContextBuilder(
                    kind: .spacing,
                    metaScheme: metaScheme
                ),
            themeName: themeConfig.name
            ),
            GenerateTokensCommand(
                name: "Generate Shape Tokens",
                schemeURL: schemeDirectory.url(for: .shapes),
                themeURL: themeURL(config: themeConfig),
                templates: [.shapeToken, .shapes],
                generatedOutputURL: generatedTokensURL(config: themeConfig),
                templateRender: TemplateRenderer(paletteMapper: PaletteMapper(paletteURL: config.paletteURL)),
                contextBuilder: GeneralContextBuilder(
                    kind: .shape,
                    metaScheme: metaScheme
                ),
            themeName: themeConfig.name
            ),
            GenerateTokensCommand(
                name: "Generate Typography Tokens",
                schemeURL: schemeDirectory.url(for: .typography),
                themeURL: themeURL(config: themeConfig),
                templates: [.typographyToken, .typographies],
                generatedOutputURL: generatedTokensURL(config: themeConfig),
                templateRender: TemplateRenderer(paletteMapper: PaletteMapper(paletteURL: config.paletteURL)),
                contextBuilder: TypographyContextBuilder(
                    fontFamiliesContainer: fontFamiliesContainer,
                    metaScheme: metaScheme,
                    fontFamilyOverride: themeConfig.fontFamilyOverride
                ),
            themeName: themeConfig.name
            ),
            GenerateTokensCommand(
                name: "Generate Gradient Tokens",
                schemeURL: schemeDirectory.url(for: .gradients),
                themeURL: themeURL(config: themeConfig),
                templates: [.gradientToken, .gradients],
                generatedOutputURL: generatedTokensURL(config: themeConfig),
                templateRender: TemplateRenderer(paletteMapper: PaletteMapper(paletteURL: config.paletteURL)),
                contextBuilder: GradientContextBuilder(
                    paletteURL: paletteLocalURL(config: config, themeConfig: themeConfig),
                    metaScheme: metaScheme
                ),
            themeName: themeConfig.name
            )
        ]
        commands.append(contentsOf: generateComponentVariations(themeConfig: themeConfig))

        runCommands(commands)

        for tenant in themeConfig.tenants {
            Logger.printText("🎨 Generating tenant \(tenant.name) for \(themeConfig.name)...")
            executeTenantCommands(config: config, themeConfig: themeConfig, tenant: tenant)
        }
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

        guard let tenantMetaScheme = DecodeCommand<Scheme>(url: tenantSchemeDirectory.url(for: .meta))
            .run()
            .asScheme else {
            Logger.terminate("No scheme for tenant \(tenant.name)")
            return
        }

        guard let tenantFontFamiliesContainer = DecodeCommand<FontFamiliesContainer>(url: tenantSchemeDirectory.url(for: .fontFamilies))
            .run()
            .asFontFamiliesContainer else {
            Logger.terminate("No font family container for tenant \(tenant.name)")
            return
        }

        let tenantSuffix = tenant.name

        let commands: [Command] = [
            GenerateTokensCommand(
                name: "Generate Color Tokens (\(tenant.name))",
                schemeURL: tenantSchemeDirectory.url(for: .colors),
                themeURL: themeURL(config: themeConfig),
                templates: [.colorToken, .colors],
                generatedOutputURL: generatedTokensURL(config: themeConfig),
                templateRender: TemplateRenderer(paletteMapper: PaletteMapper(paletteURL: config.paletteURL)),
                contextBuilder: ColorContextBuilder(
                    paletteURL: paletteLocalURL(config: config, themeConfig: themeConfig),
                    metaScheme: tenantMetaScheme
                ),
                themeName: themeConfig.name,
            tenantSuffix: tenantSuffix
            ),
            GenerateTokensCommand(
                name: "Generate Shadow Tokens (\(tenant.name))",
                schemeURL: tenantSchemeDirectory.url(for: .shadows),
                themeURL: themeURL(config: themeConfig),
                templates: [.shadowToken, .shadows],
                generatedOutputURL: generatedTokensURL(config: themeConfig),
                templateRender: TemplateRenderer(paletteMapper: PaletteMapper(paletteURL: config.paletteURL)),
                contextBuilder: GeneralContextBuilder(
                    kind: .shadow,
                    metaScheme: tenantMetaScheme
                ),
                themeName: themeConfig.name,
            tenantSuffix: tenantSuffix
            ),
            GenerateTokensCommand(
                name: "Generate Spacing Tokens (\(tenant.name))",
                schemeURL: tenantSchemeDirectory.url(for: .spacing),
                themeURL: themeURL(config: themeConfig),
                templates: [.spacingToken, .spacings],
                generatedOutputURL: generatedTokensURL(config: themeConfig),
                templateRender: TemplateRenderer(paletteMapper: PaletteMapper(paletteURL: config.paletteURL)),
                contextBuilder: GeneralContextBuilder(
                    kind: .spacing,
                    metaScheme: tenantMetaScheme
                ),
                themeName: themeConfig.name,
            tenantSuffix: tenantSuffix
            ),
            GenerateTokensCommand(
                name: "Generate Shape Tokens (\(tenant.name))",
                schemeURL: tenantSchemeDirectory.url(for: .shapes),
                themeURL: themeURL(config: themeConfig),
                templates: [.shapeToken, .shapes],
                generatedOutputURL: generatedTokensURL(config: themeConfig),
                templateRender: TemplateRenderer(paletteMapper: PaletteMapper(paletteURL: config.paletteURL)),
                contextBuilder: GeneralContextBuilder(
                    kind: .shape,
                    metaScheme: tenantMetaScheme
                ),
                themeName: themeConfig.name,
            tenantSuffix: tenantSuffix
            ),
            GenerateTokensCommand(
                name: "Generate Typography Tokens (\(tenant.name))",
                schemeURL: tenantSchemeDirectory.url(for: .typography),
                themeURL: themeURL(config: themeConfig),
                templates: [.typographyToken, .typographies],
                generatedOutputURL: generatedTokensURL(config: themeConfig),
                templateRender: TemplateRenderer(paletteMapper: PaletteMapper(paletteURL: config.paletteURL)),
                contextBuilder: TypographyContextBuilder(
                    fontFamiliesContainer: tenantFontFamiliesContainer,
                    metaScheme: tenantMetaScheme,
                    fontFamilyOverride: themeConfig.fontFamilyOverride
                ),
                themeName: themeConfig.name,
            tenantSuffix: tenantSuffix
            ),
            GenerateTokensCommand(
                name: "Generate Gradient Tokens (\(tenant.name))",
                schemeURL: tenantSchemeDirectory.url(for: .gradients),
                themeURL: themeURL(config: themeConfig),
                templates: [.gradientToken, .gradients],
                generatedOutputURL: generatedTokensURL(config: themeConfig),
                templateRender: TemplateRenderer(paletteMapper: PaletteMapper(paletteURL: config.paletteURL)),
                contextBuilder: GradientContextBuilder(
                    paletteURL: paletteLocalURL(config: config, themeConfig: themeConfig),
                    metaScheme: tenantMetaScheme
                ),
                themeName: themeConfig.name,
            tenantSuffix: tenantSuffix
            )
        ]

        runCommands(commands)
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
    /// `ThemeConfiguration.localSchemePath`, который хранится как путь
    /// относительно корня репо.
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
        if let outputPath = outputPath, !outputPath.isEmpty {
            return URL(fileURLWithPath: outputPath, isDirectory: true)
                .appending(component: "\(config.name)Theme")
        }
        return themeBuilderURL.appending(component: "../Themes/\(config.name)Theme")
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
