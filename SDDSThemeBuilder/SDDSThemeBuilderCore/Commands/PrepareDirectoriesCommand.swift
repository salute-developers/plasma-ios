import Foundation

final class PrepareDirectoriesCommand: Command {
    let themeBuilderURL: URL
    let outputDirectoryURL: URL
    let themeURL: URL
    
    init(themeBuilderURL: URL, outputDirectoryURL: URL, themeURL: URL) {
        self.themeBuilderURL = themeBuilderURL
        self.outputDirectoryURL = outputDirectoryURL
        self.themeURL = themeURL
        
        super.init(name: "Prepare Directories")
    }
    
    override func run() -> CommandResult {
        super.run()
        
        for url in [themeBuilderURL, outputDirectoryURL, themeURL] {
            prepareDirectory(url: url)
        }
        return .success
    }
    
    private func prepareDirectory(url: URL) {
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: url.path()) {
            try? fileManager.createDirectory(at: url, withIntermediateDirectories: false)
        }
    }
}


