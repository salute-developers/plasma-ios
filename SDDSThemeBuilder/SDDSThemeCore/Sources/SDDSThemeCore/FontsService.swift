import Foundation
import CoreGraphics
import CoreText


public final class FontsService {
    public static var shared = FontsService()
    
    /// Инициализации темы, функцию необходимо вызвать внутри приложения в AppDelegate или SceneDelegate
    public func initialize(fontsDirectoryURL: URL) {
        registerFonts(fontsDirectoryURL: fontsDirectoryURL)
    }
}

extension FontsService {
    private func registerFonts(fontsDirectoryURL: URL) {
        let directoryEnumerator = FileManager.default.enumerator(at: fontsDirectoryURL, includingPropertiesForKeys: nil)
        
        while let fileURL = directoryEnumerator?.nextObject() as? URL {
            guard fileURL.pathExtension == "otf" || fileURL.pathExtension == "ttf" else {
                continue
            }
            registerFont(with: fileURL)
        }
    }
    
    private func registerFont(with url: URL) {
        guard let fontDataProvider = CGDataProvider(url: url as CFURL) else {
            fatalError("Could not create font data provider for \(url)")
        }
        
        guard let font = CGFont(fontDataProvider) else {
            fatalError("Could not create font from data provider for \(url)")
        }
        
        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            if let error = error?.takeUnretainedValue() {
                fatalError("Error while registering font \(url): \(error)")
            } else {
                fatalError("Unknown error while registering font \(url)")
            }
        }
    }
}
