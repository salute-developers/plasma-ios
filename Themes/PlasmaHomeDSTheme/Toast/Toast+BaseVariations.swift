import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct Toast {
    public static var `default`: GeneralAppearanceVariation<Toast, ToastAppearance, ToastVariation.Default> {
        var appearance = ToastAppearance.base
        appearance.size = ToastSize.`default`
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidDefault
        appearance.contentEndColor = ColorToken.textInverseSecondary
        appearance.textColor = ColorToken.textInversePrimary
        appearance.textTypography = ToastTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer

        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<ToastAppearance>] = [
        Toast.default.variation,
    ]
}

public struct ToastVariation {
    public struct Default {}
}

private extension ToastAppearance {
    static var base: ToastAppearance {
        var appearance = ToastAppearance()
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidDefault
        appearance.contentEndColor = ColorToken.textInverseSecondary
        appearance.textColor = ColorToken.textInversePrimary
        appearance.textTypography = ToastTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer
        return appearance
    }
}
