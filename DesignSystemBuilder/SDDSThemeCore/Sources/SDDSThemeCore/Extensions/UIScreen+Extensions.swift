import Foundation
import UIKit

public extension UIScreen {
    static var themeStyle: ThemeStyle {
        let currentTheme = UIScreen.main.traitCollection.userInterfaceStyle
        if currentTheme == .dark {
            return .dark
        } else {
            return .light
        }
    }
}
