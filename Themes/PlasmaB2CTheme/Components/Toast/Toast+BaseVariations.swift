import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct Toast {
    public static var pilled: ComponentAppearanceVariation<Toast, ToastAppearance> {
        var appearance = ToastAppearance.base
        appearance.size = ToastSize.pilled

        return .init(
            name: "pilled",
            appearance: appearance
        )
    }
    public static var rounded: ComponentAppearanceVariation<Toast, ToastAppearance> {
        var appearance = ToastAppearance.base
        appearance.size = ToastSize.rounded

        return .init(
            name: "rounded",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<ToastAppearance>] = [
        Toast.pilled.variation,
        Toast.rounded.variation,
    ]
}

public struct ToastVariation {
    public struct Pilled {}
    public struct Rounded {}
}

private extension ToastAppearance {
    static var base: ToastAppearance {
        var appearance = ToastAppearance()
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidCard
        appearance.contentEndColor = ColorToken.textDefaultSecondary
        appearance.textColor = ColorToken.textDefaultPrimary
        appearance.textTypography = ToastTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        return appearance
    }
}
