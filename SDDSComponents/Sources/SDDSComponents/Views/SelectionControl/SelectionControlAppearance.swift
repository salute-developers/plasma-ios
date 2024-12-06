import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public protocol SelectionControlAppearance {
    var size: SelectionControlSizeConfiguration { get }
    var titleTypography: TypographyConfiguration { get }
    var subtitleTypography: TypographyConfiguration { get }
    var titleColor: ColorToken { get }
    var subtitleColor: ColorToken { get }
    var disabledAlpha: CGFloat { get }
    var imageTintColor: ColorToken? { get }
    
    func titleColor(for isEnabled: Bool) -> ColorToken
    func subtitleColor(for isEnabled: Bool) -> ColorToken
}

public extension SelectionControlAppearance {
    func titleColor(for isEnabled: Bool) -> ColorToken {
        return isEnabled ? titleColor : titleColor.withOpacity(disabledAlpha)
    }

    func subtitleColor(for isEnabled: Bool) -> ColorToken {
        return isEnabled ? subtitleColor : subtitleColor.withOpacity(disabledAlpha)
    }
}
