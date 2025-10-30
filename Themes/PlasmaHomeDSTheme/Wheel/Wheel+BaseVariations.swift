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
        appearance.itemTextAfterTypography = WheelTypography(oneSize: AdaptiveTypographyToken.headerH1Bold.typography).asContainer
        appearance.itemTextTypography = WheelTypography(oneSize: AdaptiveTypographyToken.headerH1Bold.typography).asContainer

        return .init(
            name: "h1",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<WheelAppearance>] = [
        Wheel.h1.variation,
        Wheel.h1.centerAlign.variation,
        Wheel.h1.leftAlign.variation,
        Wheel.h1.mixedAlign.variation,
        Wheel.h1.rightAlign.variation,
    ]
}

public struct WheelVariation {
    public struct H1 {}
    public struct H1Centeralign {}
    public struct H1Leftalign {}
    public struct H1Mixedalign {}
    public struct H1Rightalign {}
}

private extension WheelAppearance {
    static var base: WheelAppearance {
        var appearance = WheelAppearance()
        appearance.controlIconDown = Asset.disclosureDownOutline36.image
        appearance.controlIconDownColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: .clearColor, hoveredColor: .clearColor, selectedColor: ColorToken.textDefaultPrimary)
        appearance.controlIconUp = Asset.disclosureUpOutline36.image
        appearance.controlIconUpColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: .clearColor, hoveredColor: .clearColor, selectedColor: ColorToken.textDefaultPrimary)
        appearance.descriptionColor = ColorToken.textDefaultPrimary
        appearance.dividerAppearance = Divider.default.appearance
        appearance.itemTextAfterColor = ColorToken.textDefaultSecondary
        appearance.itemTextColor = ColorToken.textDefaultPrimary
        appearance.separatorColor = ColorToken.textDefaultPrimary
        return appearance
    }
}
