import Foundation
@_exported import SDDSThemeCore

public class Theme {    
    public class func initialize() {
        guard let fontsDirectoryURL = Bundle(for: self).resourceURL else {
            fatalError("Fonts directory not found in bundle")
        }
        FontsService.shared.initialize(fontsDirectoryURL: fontsDirectoryURL)
    }
}
