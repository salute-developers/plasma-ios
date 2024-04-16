import Foundation
import Stencil

public final class App {
    let schemeURL: URL
    let colorsSchemeURL: URL
    let templatesURL: URL
    let localSchemeURL: URL
    let generatedOutputURL: URL
    
    lazy var commands: [Runnable] = {
        [
            DownloadSchemeCommand(schemeURL: schemeURL, outputURL: localSchemeURL),
            DecodeSchemeCommand(schemeURL: localSchemeURL),
            GenerateColorTokensCommand(
                templatesURL: templatesURL,
                generatedOutputURL: generatedOutputURL,
                downloadSchemeCommand: DownloadSchemeCommand(schemeURL: colorsSchemeURL),
                templateRender: TemplateRenderer()
            )
        ]
    }()
    
    public init(schemeURL: URL,
         colorsSchemeURL: URL,
         templatesURL: URL,
         localSchemeURL: URL,
         generatedOutput: URL) {
        self.schemeURL = schemeURL
        self.colorsSchemeURL = colorsSchemeURL
        self.templatesURL = templatesURL
        self.localSchemeURL = localSchemeURL
        self.generatedOutputURL = generatedOutput
    }
}

extension App: Runnable {
    @discardableResult public func run() -> CommandResult {
        Logger.printLine()
        Logger.printText("Running SDDSThemeBuilder...")
        Logger.printLine()
        
        commands.forEach { $0.run() }

        Logger.printLine()
        return .empty
    }
}
