import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public struct CheckboxAppearance: SelectionControlAppearance {
    public let titleTypography: TypographyToken
    public let subtitleTypography: TypographyToken
    public let enabledTitleColor: ColorToken
    public let enabledSubtitleColor: ColorToken
    public let disabledTitleColor: ColorToken
    public let disabledSubtitleColor: ColorToken
    public var disabledImageAlpha: CGFloat
    public var imageTintColor: ColorToken?
    
    public init(titleTypography: TypographyToken, subtitleTypography: TypographyToken, enabledTitleColor: ColorToken, enabledSubtitleColor: ColorToken, disabledTitleColor: ColorToken, disabledSubtitleColor: ColorToken, disabledImageAlpha: CGFloat, imageTintColor: ColorToken? = nil) {
        self.titleTypography = titleTypography
        self.subtitleTypography = subtitleTypography
        self.enabledTitleColor = enabledTitleColor
        self.enabledSubtitleColor = enabledSubtitleColor
        self.disabledTitleColor = disabledTitleColor
        self.disabledSubtitleColor = disabledSubtitleColor
        self.disabledImageAlpha = disabledImageAlpha
        self.imageTintColor = imageTintColor
    }
}
