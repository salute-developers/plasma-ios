import Foundation

final class InstallFontsCommand: Command {
    private let fontFamiliesContainer: FontFamiliesContainer
    private let fontsURL: URL
    private let copyFontsScriptURL: URL
    private let registerFontsScriptURL: URL
    private let sddsThemeBuilderXcodeProjectURL: URL
    private let themePlistURL: URL
    private let queue = DispatchQueue(label: "com.sdds.DownloadFontsCommand", qos: .userInitiated, attributes: .concurrent)
    
    init(fontFamiliesContainer: FontFamiliesContainer, fontsURL: URL, copyFontsScriptURL: URL, registerFontsScriptURL: URL, sddsThemeBuilderXcodeProjectURL: URL, themePlistURL: URL) {
        self.fontFamiliesContainer = fontFamiliesContainer
        self.fontsURL = fontsURL
        self.copyFontsScriptURL = copyFontsScriptURL
        self.registerFontsScriptURL = registerFontsScriptURL
        self.sddsThemeBuilderXcodeProjectURL = sddsThemeBuilderXcodeProjectURL
        self.themePlistURL = themePlistURL
        
        super.init(name: "Download Fonts")
    }
    
    @discardableResult override func run() -> CommandResult {
        super.run()
        
        let result = download()
        guard !result.isError else {
            return result
        }
        
        return result
    }
    
    // MARK: - Download
    private func download() -> CommandResult {
        let group = DispatchGroup()
        var isFailed = false
        for key in FontFamily.Key.allCases {
            guard let fontFamily = fontFamiliesContainer.items[key] else {
                continue
            }
            
            let fonts = fontFamily.fonts
            for font in fonts {
                group.enter()
                queue.async {
                    let result = DownloadCommand(fileURL: font.link, outputURL: self.outputURL(for: font)).run()
                    if result.isError {
                        Logger.printText("Error occured during downloading of \(font.link)")
                        isFailed = true
                    }
                    group.leave()
                }
            }
        }
        group.wait()
        
        if isFailed {
            return .error(GeneralError.unableToDownloadFonts)
        } else {
            return .success
        }
    }
    
    private func outputURL(for font: Font) -> URL {
        return fontsURL.appending(component: font.link.lastPathComponent)
    }
    
}
