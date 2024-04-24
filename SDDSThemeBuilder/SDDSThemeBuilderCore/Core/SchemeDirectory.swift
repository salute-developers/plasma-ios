import Foundation

public struct SchemeDirectory {
    enum Path: String, CaseIterable {
        case main = "stylesSalute"
        case colors = "ios/ios_color"
        case fontFamilies = "ios/ios_fontFamily"
        case gradients = "ios/ios_gradient"
        case shadows = "ios/ios_shadow"
        case shapes = "ios/ios_shape"
        case typogprahy = "ios/ios_typography"
    }
    
    var urls: [Path: URL] = [:]
}

extension SchemeDirectory {
    func url(for path: Path) -> URL {
        guard let url = urls[path] else {
            fatalError("Missing url")
        }
        return url
    }
}

extension SchemeDirectory.Path {
    var jsonPath: String {
        "\(self.rawValue).json"
    }
}
