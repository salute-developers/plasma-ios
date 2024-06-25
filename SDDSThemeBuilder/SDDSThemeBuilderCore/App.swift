import Foundation
import Stencil

public final class App {
    let schemeZipURL: URL
    let paletteURL: URL
    let themeBuilderURL: URL
    
    private func executeCommands() {
        PrepareDirectoriesCommand(
            themeBuilderURL: themeBuilderURL,
            outputDirectoryURL: outputDirectoryURL,
            themeURL: themeURL
        )
        DownloadCommand(fileURL: schemeZipURL, outputURL: schemeZipLocalURL).run()
        DownloadCommand(fileURL: paletteURL, outputURL: paletteLocalURL).run()
        
        guard let schemeDirectory = UnpackThemeCommand(schemeURL: schemeZipLocalURL, outputDirectoryURL: outputDirectoryURL)
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
        
        let commands = [
            InstallFontsCommand(
                fontFamiliesContainer: fontFamiliesContainer,
                fontsURL: fontsURL,
                copyFontsScriptURL: copyFontsScriptURL,
                registerFontsScriptURL: registerFontsScriptURL,
                sddsThemeBuilderXcodeProjectURL: xcodeProjectURL,
                themePlistURL: themePlistURL
            ),
            GenerateTokensCommand(
                name: "Generate Color Tokens",
                schemeURL: schemeDirectory.url(for: .colors),
                themeURL: themeURL,
                templates: [.colorToken, .colors],
                generatedOutputURL: generatedTokensURL,
                contextBuilder: ColorContextBuilder(
                    paletteURL: paletteLocalURL,
                    metaScheme: metaScheme
                )
            ),
            GenerateTokensCommand(
                name: "Generate Shadow Tokens",
                schemeURL: schemeDirectory.url(for: .shadows),
                themeURL: themeURL,
                templates: [.shadowToken, .shadows],
                generatedOutputURL: generatedTokensURL,
                contextBuilder: GeneralContextBuilder(
                    kind: .shadow,
                    metaScheme: metaScheme
                )
            ),
            GenerateTokensCommand(
                name: "Generate Shape Tokens",
                schemeURL: schemeDirectory.url(for: .shapes),
                themeURL: themeURL,
                templates: [.shapeToken, .shapes],
                generatedOutputURL: generatedTokensURL,
                contextBuilder: GeneralContextBuilder(
                    kind: .shape,
                    metaScheme: metaScheme
                )
            ),
            GenerateTokensCommand(
                name: "Generate Typography Tokens",
                schemeURL: schemeDirectory.url(for: .typography),
                themeURL: themeURL,
                templates: [.typographyToken, .typographies],
                generatedOutputURL: generatedTokensURL,
                contextBuilder: TypographyContextBuilder(
                    fontFamiliesContainer: fontFamiliesContainer, 
                    metaScheme: metaScheme
                )
            ),
            GenerateTokensCommand(
                name: "Generate Gradient Tokens",
                schemeURL: schemeDirectory.url(for: .gradients),
                themeURL: themeURL,
                templates: [.gradientToken, .gradients],
                generatedOutputURL: generatedTokensURL,
                contextBuilder: GradientContextBuilder(
                    paletteURL: paletteLocalURL,
                    metaScheme: metaScheme
                )
            )
        ]
        
        for command in commands {
            let result = command.run()
            switch result {
            case .error(let error):
                Logger.terminate(with: error)
            default:
                break
            }
        }
    }
        
    public init(schemeZipURL: URL,
                paletteURL: URL,
                themeBuilderURL: URL) {
        self.schemeZipURL = schemeZipURL
        self.paletteURL = paletteURL
        self.themeBuilderURL = themeBuilderURL
    }
}

// MARK: - Directories
extension App {
    private var outputDirectoryURL: URL {
        themeBuilderURL.appending(component: "Output")
    }
    
    private var xcodeProjectURL: URL {
        themeBuilderURL.appending(component: "SDDSThemeBuilder.xcodeproj")
    }
    
    private var themeURL: URL {
        themeBuilderURL.appending(component: "SDDSTheme")
    }
    
    private var templatesURL: URL {
        themeBuilderURL.appending(component: "SDDSThemeBuilderCore/Stencil")
    }
    
    private var schemeZipLocalURL: URL {
        outputDirectoryURL.appending(component: schemeZipURL.lastPathComponent)
    }
    
    private var paletteLocalURL: URL {
        outputDirectoryURL.appending(component: paletteURL.lastPathComponent)
    }
    
    private var generatedTokensURL: URL {
        themeURL.appending(component: "Generated")
    }
    
    private var fontsURL: URL {
        themeURL.appending(component: "Fonts")
    }
    
    private var copyFontsScriptURL: URL {
        themeBuilderURL.appending(component: "SDDSThemeBuilderCore/Fonts/copyFonts.rb")
    }
    
    private var registerFontsScriptURL: URL {
        themeBuilderURL.appending(component: "SDDSThemeBuilderCore/Fonts/registerFonts.rb")
    }
    
    private var themePlistURL: URL {
        themeURL.appending(component: "info.plist")
    }
}

// MARK: - Runnable
extension App: Runnable {
    @discardableResult public func run() -> CommandResult {
        Logger.printLine()
        Logger.printText("Running SDDSThemeBuilder...")
        Logger.printLine()
        
        executeCommands()

        Logger.printLine()
        return .empty
    }
}
