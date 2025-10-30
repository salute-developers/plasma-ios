import Foundation

final class InstallFontsCommand: Command, FileWriter {
    private let fontFamiliesContainer: FontFamiliesContainer
    private let fontsURL: URL
    private let copyFontsScriptURL: URL
    private let registerFontsScriptURL: URL
    private let sddsThemeBuilderXcodeProjectURL: URL
    private let themePlistURL: URL
    
    init(fontFamiliesContainer: FontFamiliesContainer, fontsURL: URL, copyFontsScriptURL: URL, registerFontsScriptURL: URL, sddsThemeBuilderXcodeProjectURL: URL, themePlistURL: URL) {
        self.fontFamiliesContainer = fontFamiliesContainer
        self.fontsURL = fontsURL
        self.copyFontsScriptURL = copyFontsScriptURL
        self.registerFontsScriptURL = registerFontsScriptURL
        self.sddsThemeBuilderXcodeProjectURL = sddsThemeBuilderXcodeProjectURL
        self.themePlistURL = themePlistURL
        
        super.init(name: "Create Fonts Manifest")
    }
    
    @discardableResult override func run() -> CommandResult {
        super.run()
        
        var result: CommandResult = .empty
        for command in [ {self.validatateFonts()}, {self.createFontsManifest()} ] {
            result = command()
            guard !result.isError else {
                return result
            }
        }

        return result
    }
    
    // MARK: - Validation
    private func validatateFonts() -> CommandResult {
        for key in FontFamily.Key.allCases {
            guard let fontFamily = fontFamiliesContainer.items[key] else {
                continue
            }
            let fonts = fontFamily.fonts
            for font in fonts {
                let ext = font.link.lastPathComponent.components(separatedBy: ".").last
                guard ext == "otf" || ext == "ttf" else {
                    Logger.printText("Font file should be `otf` or `ttf`")
                    return .error(GeneralError.fontExtensionError)
                }
            }
        }
        
        return .success
    }
    
    // MARK: - Create Manifest
    private func createFontsManifest() -> CommandResult {
        var fontEntries: [String] = []
        
        for key in FontFamily.Key.allCases {
            guard let fontFamily = fontFamiliesContainer.items[key] else {
                continue
            }
            
            let fonts = fontFamily.fonts
            for font in fonts {
                let escapedURL = font.link.absoluteString.replacingOccurrences(of: "\"", with: "\\\"")
                let entry = """
                    FontInfo(url: "\(escapedURL)", weight: "\(font.weight.rawValue)", style: "\(font.style.rawValue)", filename: "\(font.link.lastPathComponent)")
                """
                fontEntries.append(entry)
            }
        }
        
        let swiftContent = """
import Foundation

public struct FontInfo {
    public let url: String
    public let weight: String
    public let style: String
    public let filename: String
}

public struct FontsManifest {
    public static let fonts: [FontInfo] = [
\(fontEntries.map { "        \($0)" }.joined(separator: ",\n"))
    ]
}

"""
        
        let fileManager = FileManager.default
        do {
            if !fileManager.fileExists(atPath: fontsURL.path()) {
                try fileManager.createDirectory(at: fontsURL, withIntermediateDirectories: true)
            }
            
            let swiftURL = fontsURL.appending(component: "FontsManifest.swift")
            try swiftContent.write(to: swiftURL, atomically: true, encoding: .utf8)
            
            Logger.printText("Fonts manifest created at: \(swiftURL.path())")
        } catch {
            Logger.printText("Failed to write fonts manifest: \(error)")
            return .error(.nsError(error))
        }
        
        return .success
    }
    
}
