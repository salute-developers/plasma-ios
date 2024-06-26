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
        do {
            let fontFiles = try FileManager.default.contentsOfDirectory(atPath: fontsDirectoryURL.path)
            
            for fontFile in fontFiles {
                guard fontFile.fileExtension == .otf || fontFile.fileExtension == .ttf else {
                    continue
                }
                let fontURL = fontsDirectoryURL.appendingPathComponent(fontFile)
                registerFont(with: fontURL)
            }
        } catch {
            fatalError("Error while loading font files: \(error)")
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
