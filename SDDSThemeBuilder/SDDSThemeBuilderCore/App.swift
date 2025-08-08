import Foundation
import Stencil

public final class App {
    let config: ThemeBuilderConfiguration
    let sourcePath: String
    
    public init(config: ThemeBuilderConfiguration, sourcePath: String) {
        self.config = config
        self.sourcePath = sourcePath
    }
    
    private func executeCommands(config: ThemeBuilderConfiguration, themeConfig: ThemeBuilderConfiguration.ThemeConfiguration) {
        PrepareDirectoriesCommand(
            themeBuilderURL: themeBuilderURL,
            outputDirectoryURL: outputDirectoryURL(config: themeConfig),
            themeURL: themeURL(config: themeConfig)
        ).run()
        DownloadCommand(fileURL: themeConfig.url, outputURL: schemeZipLocalURL(themeConfig: themeConfig)).run()
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
                themePlistURL: themePlistURL(config: themeConfig)
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
                )
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
                )
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
                )
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
                )
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
                    metaScheme: metaScheme
                )
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
                )
            )
        ]
        commands.append(contentsOf: generateComponentVariations(themeConfig: themeConfig))
        
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
    
    private func outputDirectoryURL(config: ThemeBuilderConfiguration.ThemeConfiguration) -> URL {
        themeBuilderURL
            .appending(component: "Output")
            .appending(component: config.name)
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
