import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct Radiobox {
    public static var m: ComponentAppearanceVariation<Radiobox, RadioboxAppearance> {
        var appearance = RadioboxAppearance.base
        appearance.size = RadioboxSize.m
        appearance.subtitleTypography = RadioboxTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer
        appearance.titleTypography = RadioboxTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<Radiobox, RadioboxAppearance> {
        var appearance = RadioboxAppearance.base
        appearance.size = RadioboxSize.s
        appearance.subtitleTypography = RadioboxTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.titleTypography = RadioboxTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<RadioboxAppearance>] = [
        Radiobox.m.variation,
        Radiobox.s.variation,
    ]
}

public struct RadioboxVariation {
    public struct M {}
    public struct S {}
}

private extension RadioboxAppearance {
    static var base: RadioboxAppearance {
        var appearance = RadioboxAppearance()
        appearance.borderColor = ColorToken.textDefaultSecondary
        appearance.checkedIconColor = ColorToken.textOnDarkPrimary
        appearance.disabledAlpha = CGFloat(0.4)
        appearance.subtitleColor = ColorToken.textDefaultSecondary
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.toggleColor = ColorToken.surfaceDefaultAccentMain
        appearance.toggleColorChecked = ColorToken.textOnDarkPrimary
        return appearance
    }
}
