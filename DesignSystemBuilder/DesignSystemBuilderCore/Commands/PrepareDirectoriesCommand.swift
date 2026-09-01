import Foundation

final class PrepareDirectoriesCommand: Command {
    let designSystemBuilderURL: URL
    let outputDirectoryURL: URL
    let themeURL: URL
    
    init(designSystemBuilderURL: URL, outputDirectoryURL: URL, themeURL: URL) {
        self.designSystemBuilderURL = designSystemBuilderURL
        self.outputDirectoryURL = outputDirectoryURL
        self.themeURL = themeURL
        
        super.init(name: "Prepare Directories")
    }
    
    override func run() -> CommandResult {
        super.run()
        
        for url in [designSystemBuilderURL, outputDirectoryURL, themeURL] {
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


