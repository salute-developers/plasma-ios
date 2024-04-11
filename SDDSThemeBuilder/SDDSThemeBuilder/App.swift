import Foundation

final class App {
    let schemeURL: URL
    let localSchemeURL: URL
    
    lazy var commands: [Runnable] = {
        [
            DownloadSchemeCommand(schemeURL: schemeURL, outputURL: localSchemeURL),
            DecodeSchemeCommand(schemeURL: localSchemeURL),
            ProcessParametersCommand(),
            PrepareCodeGenSchemeCommand(),
            GenerateTokensCommand(),
            BuildFrameworkCommand()
        ]
    }()
    
    init(schemeURL: URL, localSchemeURL: URL) {
        self.schemeURL = schemeURL
        self.localSchemeURL = localSchemeURL
    }
}

extension App: Runnable {
    @discardableResult func run() -> CommandResult {
        Logger.printLine()
        Logger.printText("Running SDDSThemeBuilder...")
        Logger.printLine()
        
        commands.forEach { $0.run() }

        Logger.printLine()
        return .empty
    }
}
