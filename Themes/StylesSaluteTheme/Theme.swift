import Foundation
@_exported import SDDSThemeCore

public class Theme {
    static let name = "StylesSaluteTheme"
    
    public class func initialize() {
        guard let themeBundleURL = Bundle.main.url(forResource: "\(bundleName)", withExtension: "bundle"),
              let themeBundle = Bundle(url: themeBundleURL) else {
            fatalError("\(bundleName).bundle not found")
        }
        
        guard let fontsDirectoryURL = themeBundle.resourceURL else {
            fatalError("Fonts directory not found in bundle")
        }
        
        FontsService.shared.initialize(fontsDirectoryURL: themeBundleURL)
        EnvironmentValueProvider.shared.initialize()
    }
    
    private static var bundleName: String {
        return "\(name)_\(name)"
    }
}
