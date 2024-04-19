import Foundation

final class DownloadSchemeCommand: Command {
    let schemeURL: URL
    let outputURL: URL?
    
    private let dispatchQueue = DispatchQueue(label: "ru.sdds.downloadSchemeCommand")
    private let urlSession: URLSession
    private let fileManager: FileManager
    
    init(schemeURL: URL,
         outputURL: URL? = nil,
         urlSession: URLSession = URLSession.shared,
         fileManager: FileManager = FileManager.default
    ) {
        
        self.schemeURL = schemeURL
        self.outputURL = outputURL
        self.urlSession = urlSession
        self.fileManager = fileManager
        
        super.init(name: "Download JSON Scheme")
    }
    
    override func run() -> CommandResult {
        super.run()
        
        return download()
    }
    
    private func download() -> CommandResult {
        switch schemeURL.scheme {
        case "file":
            downloadFromLocalSource()
        case "http", "https":
            downloadFromRemoteSource()
        default:
            .error(URLError(.badURL))
        }
    }
    
    private func downloadFromLocalSource() -> CommandResult {
        do {
            if let outputURL = outputURL {
                if fileManager.fileExists(atPath: outputURL.path()) {
                    try fileManager.removeItem(at: outputURL)
                }

                try fileManager.copyItem(at: schemeURL, to: outputURL)
            }

            guard let data = try? Data(contentsOf: schemeURL) else {
                return .error(URLError(.badURL))
            }
            return .data(data)
        } catch {
            return .error(error)
        }
    }
    
    private func downloadFromRemoteSource() -> CommandResult {
        let urlRequest = URLRequest(url: schemeURL)
        
        var result: Result<CommandResult, Error> = .failure(URLError(.unknown))
        let group = DispatchGroup()
        group.enter()
        urlSession.dataTask(with: urlRequest) { data, response, error in
            defer {
                group.leave()
            }

            if let error = error {
                result = .failure(error)
                return
            }
            
            guard let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                result = .failure(URLError(.badServerResponse))
                return
            }
            
            do {
                if let outputURL = self.outputURL {
                    try data.write(to: outputURL)
                }
                result = .success(.data(data))
            } catch {
                result = .failure(error)
            }
            
        }
        group.wait()
        
        switch result {
        case .success(let commandResult):
            return commandResult
        case .failure(let error):
            return .error(error)
        }
    }
}
