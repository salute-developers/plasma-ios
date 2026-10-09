import Foundation

protocol FileWriter {
    func saveFile(content: String, outputURL: URL, filename: String) -> CommandResult
}

extension FileWriter {
    func saveFile(content: String, outputURL: URL, filename: String) -> CommandResult {
        let fileManager = FileManager.default

        do {
            if !fileManager.fileExists(atPath: outputURL.path()) {
                // С промежуточными: `components generate` может быть первой командой в пустом
                // `--output`, и каталога темы над каталогом компонента ещё не существует.
                try fileManager.createDirectory(at: outputURL, withIntermediateDirectories: true)
            }
            
            var outputURL = outputURL
            outputURL.append(path: filename)
            
            if fileManager.fileExists(atPath: outputURL.path()) {
                try fileManager.removeItem(at: outputURL)
            }
            
            guard let data = content.data(using: .utf8) else {
                return .error(.unableWriteData)
            }
            fileManager.createFile(atPath: outputURL.path(), contents: data)
            return .success
        } catch {
            return .error(.nsError(error))
        }
    }
}
