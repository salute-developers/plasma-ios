import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public struct RadioboxAppearance: SelectionControlAppearance {
    public let titleTypography: TypographyToken
    public let subtitleTypography: TypographyToken
    public let enabledTitleColor: ColorToken
    public let enabledSubtitleColor: ColorToken
    public let disabledTitleColor: ColorToken
    public let disabledSubtitleColor: ColorToken
    public var disabledImageAlpha: CGFloat
    public let imageTintColor: ColorToken?
}