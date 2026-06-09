import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct Radiobox {
    public static var l: ComponentAppearanceVariation<Radiobox, RadioboxAppearance> {
        var appearance = RadioboxAppearance.base
        appearance.size = RadioboxSize.l
        appearance.subtitleTypography = RadioboxTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.titleTypography = RadioboxTypography(oneSize: AdaptiveTypographyToken.bodyLNormal.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
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
    
    public static var all: [Variation<RadioboxAppearance>] {
        [
            Radiobox.l.variation,
            Radiobox.m.variation,
            Radiobox.s.variation,
        ]
    }
}

public struct RadioboxVariation {
    public struct L {}
    public struct M {}
    public struct S {}
}

private extension RadioboxAppearance {
    static var base: RadioboxAppearance {
        var appearance = RadioboxAppearance()
        appearance.borderColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.outlineDefaultTransparentTertiary), values: [])
        appearance.checkedIconColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.surfaceOnDarkSolidDefault), values: [])
        appearance.disabledAlpha = CGFloat(0.4)
        appearance.subtitleColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textDefaultSecondary), values: [])
        appearance.titleColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.textDefaultPrimary), values: [])
        appearance.toggleColor = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.surfaceDefaultAccent), values: [])
        appearance.toggleColorChecked = StatefulValue<SDDSComponents.FillStyle>(defaultValue: .color(ColorToken.surfaceOnDarkSolidDefault), values: [])
        return appearance
    }
}
