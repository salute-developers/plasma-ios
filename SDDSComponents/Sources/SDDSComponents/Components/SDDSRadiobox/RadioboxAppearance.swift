import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public struct RadioboxAppearance: SelectionControlAppearance {
    public let titleTypography: TypographyConfiguration
    public let subtitleTypography: TypographyConfiguration
    public let titleColor: ColorToken
    public let subtitleColor: ColorToken
    public let disabledAlpha: CGFloat
    public let imageTintColor: ColorToken?
    
    public init(titleTypography: TypographyConfiguration, subtitleTypography: TypographyConfiguration, titleColor: ColorToken, subtitleColor: ColorToken, disabledAlpha: CGFloat, imageTintColor: ColorToken?) {
        self.titleTypography = titleTypography
        self.subtitleTypography = subtitleTypography
        self.titleColor = titleColor
        self.subtitleColor = subtitleColor
        self.disabledAlpha = disabledAlpha
        self.imageTintColor = imageTintColor
    }
}
