import Foundation

final class UnpackThemeCommand: Command {
    let schemeURL: URL
    let outputDirectoryURL: URL
    
    init(schemeURL: URL, outputDirectoryURL: URL) {
        self.schemeURL = schemeURL
        self.outputDirectoryURL = outputDirectoryURL
        
        super.init(name: "Unpack Theme")
    }
    
    @discardableResult override func run() -> CommandResult {
        super.run()
        
        var result = unzip()
        guard let unzippedDirectoryURL = result.asURL else {
            return result
        }
        
        result = removeOtherPlatforms(unzippedDirectoryURL: unzippedDirectoryURL)
        result = buildSchemeDirectory(url: unzippedDirectoryURL)
        return result
    }
    
    private func unzip() -> CommandResult {
        do {
            let schemeURLComponents = schemeURL.lastPathComponent.components(separatedBy: ".")
            let prefix = Array(schemeURLComponents[0..<schemeURLComponents.count - 1])
            let filename = prefix.joined(separator: ".")
            if schemeURLComponents.last == "zip" {
                let url = outputDirectoryURL.appending(path: filename)
                
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: url.path()) {
                    try fileManager.removeItem(atPath: url.path())
                }
                try fileManager.createDirectory(atPath: url.path(), withIntermediateDirectories: false)
                
                let process = Process()
                process.executableURL = URL(fileURLWithPath: "/usr/bin/unzip")
                process.arguments = ["-o", schemeURL.path(), "-d", url.path()]
                
                try process.run()
                process.waitUntilExit()
                
                return .url(url)
            } else {
                return .error(GeneralError.invalidFilename)
            }
        } catch {
            return .error(.nsError(error))
        }
    }
    
    private func removeOtherPlatforms(unzippedDirectoryURL: URL) -> CommandResult {
        do {
            let urls = [
                unzippedDirectoryURL.appending(component: "android"),
                unzippedDirectoryURL.appending(component: "web")
            ]
            
            for url in urls {
                let process = Process()
                process.executableURL = URL(fileURLWithPath: "/bin/rm")
                process.arguments = ["-rf", url.path()]
                
                try process.run()
                process.waitUntilExit()
            }
            
            return .success
        } catch {
            return .error(.nsError(error))
        }
    }
    
    private func buildSchemeDirectory(url: URL) -> CommandResult {
        let fileManager = FileManager.default
        var result = SchemeDirectory()
        for path in SchemeDirectory.Path.allCases {
            let url = url.appending(component: path.jsonPath)
            if fileManager.fileExists(atPath: url.path()) {
                result.urls[path] = url
            } else {
                return .error(GeneralError.invalidSchemeDirectory)
            }
        }
        
        return .schemeDirectory(result)
    }
}
