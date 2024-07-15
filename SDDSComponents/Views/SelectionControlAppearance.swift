import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public protocol SelectionControlAppearance {
    var titleTypography: TypographyToken { get }
    var subtitleTypography: TypographyToken { get }
    var enabledTitleColor: ColorToken { get }
    var enabledSubtitleColor: ColorToken { get }
    var disabledTitleColor: ColorToken { get }
    var disabledSubtitleColor: ColorToken { get }
    var disabledImageAlpha: CGFloat { get }
    var imageTintColor: ColorToken? { get }
    
    func titleColor(for isEnabled: Bool) -> ColorToken
    func subtitleColor(for isEnabled: Bool) -> ColorToken
}

public extension SelectionControlAppearance {
    func titleColor(for isEnabled: Bool) -> ColorToken {
        return isEnabled ? enabledTitleColor : disabledTitleColor
    }

    func subtitleColor(for isEnabled: Bool) -> ColorToken {
        return isEnabled ? enabledSubtitleColor : disabledSubtitleColor
    }
}
