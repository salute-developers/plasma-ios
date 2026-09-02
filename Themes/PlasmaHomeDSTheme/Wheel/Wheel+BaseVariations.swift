import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct Wheel {
    public static var h1: GeneralAppearanceVariation<Wheel, WheelAppearance, WheelVariation.H1> {
        var appearance = WheelAppearance.base
        appearance.size = WheelSize.h1
        appearance.descriptionTypography = WheelTypography(oneSize: AdaptiveTypographyToken.bodySBold.typography).asContainer
        appearance.itemTextAfterColor = ColorToken.textDefaultSecondary
        appearance.itemTextAfterTypography = WheelTypography(oneSize: AdaptiveTypographyToken.headerH1Bold.typography).asContainer
        appearance.itemTextTypography = WheelTypography(oneSize: AdaptiveTypographyToken.headerH1Bold.typography).asContainer

        return .init(
            name: "h1",
            appearance: appearance
        )
    }
    public static var h4: GeneralAppearanceVariation<Wheel, WheelAppearance, WheelVariation.H4> {
        var appearance = WheelAppearance.base
        appearance.size = WheelSize.h4
        appearance.descriptionTypography = WheelTypography(oneSize: AdaptiveTypographyToken.bodySBold.typography).asContainer
        appearance.itemTextAfterColor = ColorToken.textDefaultPrimary
        appearance.itemTextAfterTypography = WheelTypography(oneSize: AdaptiveTypographyToken.headerH4Bold.typography).asContainer
        appearance.itemTextTypography = WheelTypography(oneSize: AdaptiveTypographyToken.headerH4Bold.typography).asContainer
        appearance.selectionIndicatorColor = ColorToken.surfaceDefaultTransparentPrimary

        return .init(
            name: "h4",
            appearance: appearance
        )
    }
    
    public static var all: [Variation<WheelAppearance>] {
        [
            Wheel.h1.variation,
            Wheel.h1.centerAlign.variation,
            Wheel.h1.leftAlign.variation,
            Wheel.h1.mixedAlign.variation,
            Wheel.h1.rightAlign.variation,
            Wheel.h4.variation,
            Wheel.h4.centerAlign.variation,
            Wheel.h4.leftAlign.variation,
            Wheel.h4.mixedAlign.variation,
            Wheel.h4.rightAlign.variation,
        ]
    }
}

public struct WheelVariation {
    public struct H1 {}
    public struct H1Centeralign {}
    public struct H1Leftalign {}
    public struct H1Mixedalign {}
    public struct H1Rightalign {}
    public struct H4 {}
    public struct H4Centeralign {}
    public struct H4Leftalign {}
    public struct H4Mixedalign {}
    public struct H4Rightalign {}
}

private extension WheelAppearance {
    static var base: WheelAppearance {
        var appearance = WheelAppearance()
        appearance.controlIconDown = Asset.disclosureDownOutline36.image
        appearance.controlIconDownColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.focused], value: .color(.textDefaultPrimary))
        ])
        appearance.controlIconUp = Asset.disclosureUpOutline36.image
        appearance.controlIconUpColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.focused], value: .color(.textDefaultPrimary))
        ])
        appearance.descriptionColor = ColorToken.textDefaultPrimary
        appearance.dividerAppearance = Divider.default.appearance
        appearance.itemTextColor = ColorToken.textDefaultPrimary
        appearance.separatorColor = ColorToken.textDefaultPrimary
        return appearance
    }
}
