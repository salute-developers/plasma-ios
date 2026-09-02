import Foundation

public struct SchemeDirectory {
    enum Path: String, CaseIterable {
        case meta = "meta"
        case colors = "ios/ios_color"
        case fontFamilies = "ios/ios_fontFamily"
        case gradients = "ios/ios_gradient"
        case shadows = "ios/ios_shadow"
        case shapes = "ios/ios_shape"
        case typography = "ios/ios_typography"
        case spacing = "ios/ios_spacing"
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

    /// Собирает `SchemeDirectory` из уже распакованной директории схемы:
    /// резолвит `meta.json` и файлы `ios/ios_*.json`. Возвращает `nil`, если
    /// какой-либо обязательный файл отсутствует. Используется как unzip-flow'ом
    /// (`UnpackThemeCommand`), так и локальным `.sdds`-источником.
    static func make(fromUnpackedDirectory directory: URL) -> SchemeDirectory? {
        let fileManager = FileManager.default
        var result = SchemeDirectory()
        for path in Path.allCases {
            let url = directory.appending(component: path.jsonPath)
            guard fileManager.fileExists(atPath: url.path()) else {
                return nil
            }
            result.urls[path] = url
        }
        return result
    }
}

extension SchemeDirectory.Path {
    var jsonPath: String {
        "\(self.rawValue).json"
    }
}
