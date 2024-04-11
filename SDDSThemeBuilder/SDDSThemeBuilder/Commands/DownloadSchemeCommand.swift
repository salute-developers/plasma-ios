import Foundation

final class DownloadSchemeCommand: Command {
    let schemeURL: URL
    let outputURL: URL
    private let dispatchQueue = DispatchQueue(label: "ru.sdds.downloadSchemeCommand")
    
    init(schemeURL: URL,
         outputURL: URL) {
        
        self.schemeURL = schemeURL
        self.outputURL = outputURL
        
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
        case "http":
            downloadFromRemoteSource()
        default:
            .error(URLError(.badURL))
        }
    }
    
    private func downloadFromLocalSource() -> CommandResult {
        let fileManager = FileManager.default

        do {
            if fileManager.fileExists(atPath: outputURL.path()) {
                try fileManager.removeItem(at: outputURL)
            }
            try fileManager.copyItem(at: schemeURL, to: outputURL)
        } catch {
            return .error(error)
        }
        
        return .success
    }
    
    private func downloadFromRemoteSource() -> CommandResult {
        let urlRequest = URLRequest(url: schemeURL)
        
        var result: Result<(), Error> = .failure(URLError(.unknown))
        let group = DispatchGroup()
        group.enter()
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            defer {
                group.leave()
            }
            if let error = error {
                result = .failure(error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                result = .failure(URLError(.badServerResponse))
                return
            }
            
            do {
                try data?.write(to: self.outputURL)
                result = .success(())
            } catch {
                result = .failure(error)
            }
            
        }
        group.wait()
        
        switch result {
        case .success:
            return .success
        case .failure(let error):
            return .error(error)
        }
    }
}
