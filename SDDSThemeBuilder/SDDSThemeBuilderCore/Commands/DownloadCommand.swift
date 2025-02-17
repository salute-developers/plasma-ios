import Foundation

final class DownloadCommand: Command {
    let fileURL: URL
    let outputURL: URL?
    
    private let dispatchQueue = DispatchQueue(label: "ru.sdds.DownloadCommand")
    private let urlSession: URLSession
    private let fileManager: FileManager
    
    init(fileURL: URL,
         outputURL: URL? = nil,
         urlSession: URLSession = URLSession.shared,
         fileManager: FileManager = FileManager.default
    ) {
        
        self.fileURL = fileURL
        self.outputURL = outputURL
        self.urlSession = urlSession
        self.fileManager = fileManager
        
        super.init(name: "Download \(fileURL)")
    }
    
    @discardableResult override func run() -> CommandResult {
        super.run()
        
        if let outputURL = outputURL, fileManager.fileExists(atPath: outputURL.path()) {
            return .success
        }
        
        return download()
    }
    
    private func download() -> CommandResult {
        switch fileURL.scheme {
        case "file":
            downloadFromLocalSource()
        case "http", "https":
            downloadFromRemoteSource()
        default:
            .error(.nsError(URLError(.badURL)))
        }
    }
    
    private func downloadFromLocalSource() -> CommandResult {
        do {
            if let outputURL = outputURL {
                if fileManager.fileExists(atPath: outputURL.path()) {
                    try fileManager.removeItem(at: outputURL)
                }

                try fileManager.copyItem(at: fileURL, to: outputURL)
            }

            guard let data = try? Data(contentsOf: fileURL) else {
                return .error(.nsError(URLError(.badURL)))
            }
            return .data(data)
        } catch {
            return .error(.nsError(error))
        }
    }
    
    private func downloadFromRemoteSource() -> CommandResult {
        let urlRequest = URLRequest(url: fileURL)
        
        var result: Result<CommandResult, Error> = .failure(URLError(.unknown))
        let group = DispatchGroup()
        group.enter()
        let task = urlSession.downloadTask(with: urlRequest) { url, response, error in
            defer {
                group.leave()
            }

            if let error = error {
                result = .failure(error)
                return
            }
            
            guard let url = url, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                result = .failure(URLError(.badServerResponse))
                return
            }
            
            do {
                if let outputURL = self.outputURL {
                    let data = try Data(contentsOf: url)
                    if self.fileManager.fileExists(atPath: outputURL.path()) {
                        try self.fileManager.removeItem(at: outputURL)
                    }
                    self.fileManager.createFile(atPath: outputURL.path(), contents: data)
                }
                result = .success(.success)
            } catch {
                result = .failure(error)
            }
        }
        task.resume()
        group.wait()
        
        switch result {
        case .success(let commandResult):
            return commandResult
        case .failure(let error):
            return .error(.nsError(error))
        }
    }
}
