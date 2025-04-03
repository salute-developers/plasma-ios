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
    @available(*, deprecated, message: "use toggleColor instead")
    var color: ColorToken { get }
    var toggleColor: ColorToken { get }
    var borderColor: ColorToken { get }
    var checkedIcon: PathDrawer? { get }
    var checkedIconColor: ColorToken { get }
    var toggleColorChecked: ColorToken { get }
    var toggleColorIndeterminate: ColorToken { get }
    var toggleIndeterminateIcon: PathDrawer? { get }
    var toggleIndeterminateIconColor: ColorToken { get }
    
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
