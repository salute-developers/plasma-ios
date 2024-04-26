import Foundation
import Stencil

public final class App {
    let schemeZipURL: URL
    let paletteURL: URL
    let templatesURL: URL
    let outputDirectoryURL: URL
    let generatedOutputURL: URL
    
    private func executeCommands() {
        DownloadCommand(fileURL: schemeZipURL, outputURL: schemeZipLocalURL).run()
        DownloadCommand(fileURL: paletteURL, outputURL: paletteLocalURL).run()
        
        let result = UnpackThemeCommand(schemeURL: schemeZipLocalURL, outputDirectoryURL: outputDirectoryURL).run()
        guard let schemeDirectory = result.asSchemeDirectory else {
            return
        }
        
        DecodeSchemeCommand(schemeURL: schemeDirectory.url(for: .meta)).run()
        GenerateTokensCommand(
            name: "Generate Color Tokens",
            schemeURL: schemeDirectory.url(for: .colors),
            templatesURL: templatesURL,
            template: .color,
            generatedOutputURL: generatedOutputURL,
            contextBuilder: ColorContextBuilder(paletteURL: paletteLocalURL)
        ).run()
        GenerateTokensCommand(
            name: "Generate Shadow Tokens",
            schemeURL: schemeDirectory.url(for: .shadows),
            templatesURL: templatesURL,
            template: .shadow,
            generatedOutputURL: generatedOutputURL
        ).run()
        GenerateTokensCommand(
            name: "Generate Shape Tokens",
            schemeURL: schemeDirectory.url(for: .shapes),
            templatesURL: templatesURL,
            template: .shape,
            generatedOutputURL: generatedOutputURL
        ).run()
        GenerateTokensCommand(
            name: "Generate Typography Tokens",
            schemeURL: schemeDirectory.url(for: .typogprahy),
            templatesURL: templatesURL,
            template: .typography,
            generatedOutputURL: generatedOutputURL,
            contextBuilder: TypographyContextBuilder()
        ).run()
    }
    
    public init(schemeZipURL: URL,
                paletteURL: URL,
                templatesURL: URL,
                outputDirectoryURL: URL,
                generatedOutput: URL) {
        self.schemeZipURL = schemeZipURL
        self.paletteURL = paletteURL
        self.templatesURL = templatesURL
        self.outputDirectoryURL = outputDirectoryURL
        self.generatedOutputURL = generatedOutput
    }
    
    private var schemeZipLocalURL: URL {
        outputDirectoryURL.appending(component: schemeZipURL.lastPathComponent)
    }
    
    private var paletteLocalURL: URL {
        outputDirectoryURL.appending(component: paletteURL.lastPathComponent)
    }
}

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
