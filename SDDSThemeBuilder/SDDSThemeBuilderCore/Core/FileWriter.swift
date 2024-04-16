import Foundation

protocol FileWriter {
    func saveFile(content: String, outputURL: URL, filename: String) -> CommandResult
}

extension FileWriter {
    func saveFile(content: String, outputURL: URL, filename: String) -> CommandResult {
        let fileManager = FileManager.default
        
        var outputURL = outputURL
        outputURL.append(path: filename)

        do {
            if fileManager.fileExists(atPath: outputURL.path()) {
                try fileManager.removeItem(at: outputURL)
            }
            guard let data = content.data(using: .utf8) else {
                return .error(FileWriterError.invalidData)
            }
            fileManager.createFile(atPath: outputURL.path(), contents: data)
            return .success
        } catch {
            return .error(FileWriterError.fileManager(error))
        }
    }
}

enum FileWriterError: Error {
    case invalidData
    case fileManager(Error)
}
