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
        let bundle = Bundle.allBundles
        while let fileURL = directoryEnumerator?.nextObject() as? URL {
            guard fileURL.pathExtension == "otf" || fileURL.pathExtension == "ttf" else {
                continue
            }
            registerFont(with: fileURL)
        }
    }
    
    private func registerFont(with url: URL) {
        guard let fontDataProvider = CGDataProvider(url: url as CFURL) else {
            print("Could not create font data provider for \(url)")
            return
        }
        
        guard let font = CGFont(fontDataProvider) else {
            print("Could not create font from data provider for \(url)")
            return
        }
        
        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            if let error = error?.takeUnretainedValue() {
                print("Error while registering font \(url): \(error)")
            } else {
                print("Unknown error while registering font \(url)")
            }
        }
    }
}
