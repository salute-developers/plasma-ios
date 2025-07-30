import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct Radiobox {
    public static var l: ComponentAppearanceVariation<Radiobox, RadioboxAppearance> {
        var appearance = RadioboxAppearance.base
        appearance.size = RadioboxSize.l
        appearance.subtitleTypography = RadioboxTypography(oneSize: Typographies.bodyMNormal.typography).asContainer
        appearance.titleTypography = RadioboxTypography(oneSize: Typographies.bodyLNormal.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<Radiobox, RadioboxAppearance> {
        var appearance = RadioboxAppearance.base
        appearance.size = RadioboxSize.m
        appearance.subtitleTypography = RadioboxTypography(oneSize: Typographies.bodySNormal.typography).asContainer
        appearance.titleTypography = RadioboxTypography(oneSize: Typographies.bodyMNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<Radiobox, RadioboxAppearance> {
        var appearance = RadioboxAppearance.base
        appearance.size = RadioboxSize.s
        appearance.subtitleTypography = RadioboxTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.titleTypography = RadioboxTypography(oneSize: Typographies.bodySNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<RadioboxAppearance>] = [
        Radiobox.l.variation,
        Radiobox.m.variation,
        Radiobox.s.variation,
    ]
}

public struct RadioboxVariation {
    public struct L {}
    public struct M {}
    public struct S {}
}

private extension RadioboxAppearance {
    static var base: RadioboxAppearance {
        var appearance = RadioboxAppearance()
        appearance.borderColor = ColorToken.outlineDefaultTransparentTertiary
        appearance.checkedIconColor = ColorToken.surfaceOnDarkSolidDefault
        appearance.disabledAlpha = CGFloat(0.4)
        appearance.subtitleColor = ColorToken.textDefaultSecondary
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.toggleColor = ColorToken.surfaceDefaultAccent
        appearance.toggleColorChecked = ColorToken.surfaceOnDarkSolidDefault
        return appearance
    }
}
