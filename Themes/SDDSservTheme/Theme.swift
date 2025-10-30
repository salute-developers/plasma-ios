import Foundation
@_exported import SDDSThemeCore

public class Theme {
    static let name = "SDDSServTheme"
    
    public class func initialize(onComplete: @escaping () -> Void = {}) {
        EnvironmentValueProvider.shared.setDefaultValues()
        let fonts = FontsManifest.fonts.map { fontInfo in
            SDDSThemeCore.FontInfo(url: fontInfo.url, weight: fontInfo.weight, style: fontInfo.style, filename: fontInfo.filename)
        }
        FontsService.shared.initialize(fonts: fonts) { _ in
            onComplete()
        }
    }
    
    private static var bundleName: String {
        return "\(name)_\(name)"
    }
}
