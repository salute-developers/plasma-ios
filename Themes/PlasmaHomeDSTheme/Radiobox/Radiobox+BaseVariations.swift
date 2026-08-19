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
        appearance.borderColor = StatefulFillStyle(defaultValue: .color(.outlineDefaultTransparentTertiary), values: [
            .init(states: [InteractiveState.focused], value: .color(.outlineDefaultAccent)),
            .init(states: [InteractiveState.focused, InteractiveState.checked], value: .color(.outlineDefaultAccent)),
            .init(states: [InteractiveState.checked], value: .color(.outlineDefaultClear))
        ])
        appearance.checkedIconColor = StatefulFillStyle(defaultValue: .color(.surfaceOnDarkSolidDefault), values: [])
        appearance.disabledAlpha = CGFloat(0.4)
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [])
        appearance.toggleColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.checked], value: .color(.surfaceDefaultAccent))
        ])
        appearance.toggleColorChecked = StatefulFillStyle(defaultValue: .color(.surfaceOnDarkSolidDefault), values: [])
        return appearance
    }
}
