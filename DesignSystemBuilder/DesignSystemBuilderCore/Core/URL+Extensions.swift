import Foundation

extension URL {
    var absolutePath: String {
        let scheme = "\(self.scheme ?? "")://"
        return absoluteString.replacingOccurrences(of: scheme, with: "")
    }
}
