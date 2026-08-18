import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct Switch {
    public static var l: GeneralAppearanceVariation<Switch, SwitchAppearance, SwitchVariation.L> {
        var appearance = SwitchAppearance.base
        appearance.size = SwitchSize.l
        appearance.subtitleTypography = SwitchTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.tintColor = StatefulFillStyle(defaultValue: .color(.clearColor), values: [])
        appearance.titleTypography = SwitchTypography(oneSize: AdaptiveTypographyToken.bodyLNormal.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<Switch, SwitchAppearance, SwitchVariation.M> {
        var appearance = SwitchAppearance.base
        appearance.size = SwitchSize.m
        appearance.subtitleTypography = SwitchTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer
        appearance.tintColor = StatefulFillStyle(defaultValue: .color(.clearColor), values: [])
        appearance.titleTypography = SwitchTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<Switch, SwitchAppearance, SwitchVariation.S> {
        var appearance = SwitchAppearance.base
        appearance.size = SwitchSize.s
        appearance.subtitleTypography = SwitchTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.tintColor = StatefulFillStyle(defaultValue: .color(.clearColor), values: [])
        appearance.titleTypography = SwitchTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static var all: [Variation<SwitchAppearance>] {
        [
            Switch.l.variation,
            Switch.l.toggleS.variation,
            Switch.m.variation,
            Switch.m.toggleS.variation,
            Switch.s.variation,
            Switch.s.toggleS.variation,
        ]
    }
}

public struct SwitchVariation {
    public struct L {}
    public struct LToggles {}
    public struct M {}
    public struct MToggles {}
    public struct S {}
    public struct SToggles {}
}

private extension SwitchAppearance {
    static var base: SwitchAppearance {
        var appearance = SwitchAppearance()
        appearance.disabledAlpha = CGFloat(0.4)
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [])
        appearance.tintColor = StatefulFillStyle(defaultValue: .color(.clearColor), values: [])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [])
        appearance.toggleThumbColor = StatefulFillStyle(defaultValue: .color(.surfaceOnDarkSolidDefault), values: [])
        appearance.toggleTrackBorderColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [])
        appearance.toggleTrackColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultTransparentTertiary), values: [
            .init(states: [InteractiveState.checked], value: .color(.surfaceDefaultAccent))
        ])
        appearance.toggleTrackColorChecked = StatefulFillStyle(defaultValue: .color(.surfaceDefaultTransparentTertiary), values: [
            .init(states: [InteractiveState.checked], value: .color(.surfaceDefaultAccent))
        ])
        return appearance
    }
}
