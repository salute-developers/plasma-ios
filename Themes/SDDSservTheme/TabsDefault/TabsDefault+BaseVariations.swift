import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct TabsDefault {
    public static var l: GeneralAppearanceVariation<TabsDefault, TabsAppearance, TabsDefaultVariation.L> {
        var appearance = TabsAppearance.base
        appearance.size = TabsDefaultSize.l
        appearance.disclosureTextTypography = TabsDefaultTypography(oneSize: AdaptiveTypographyToken.bodyLBold.typography).asContainer
        appearance.dropdownMenuAppearance = DropdownMenuNormal.l.appearance
        appearance.tabItemAppearance = TabItemDefault.l.appearance

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<TabsDefault, TabsAppearance, TabsDefaultVariation.M> {
        var appearance = TabsAppearance.base
        appearance.size = TabsDefaultSize.m
        appearance.disclosureTextTypography = TabsDefaultTypography(oneSize: AdaptiveTypographyToken.bodyMBold.typography).asContainer
        appearance.dropdownMenuAppearance = DropdownMenuNormal.m.appearance
        appearance.tabItemAppearance = TabItemDefault.m.appearance

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<TabsDefault, TabsAppearance, TabsDefaultVariation.S> {
        var appearance = TabsAppearance.base
        appearance.size = TabsDefaultSize.s
        appearance.disclosureTextTypography = TabsDefaultTypography(oneSize: AdaptiveTypographyToken.bodyMBold.typography).asContainer
        appearance.dropdownMenuAppearance = DropdownMenuNormal.m.appearance
        appearance.tabItemAppearance = TabItemDefault.m.appearance

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: GeneralAppearanceVariation<TabsDefault, TabsAppearance, TabsDefaultVariation.Xs> {
        var appearance = TabsAppearance.base
        appearance.size = TabsDefaultSize.xs
        appearance.disclosureTextTypography = TabsDefaultTypography(oneSize: AdaptiveTypographyToken.bodyXsBold.typography).asContainer
        appearance.dropdownMenuAppearance = DropdownMenuNormal.xs.appearance
        appearance.tabItemAppearance = TabItemDefault.xs.appearance

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<TabsAppearance>] = [
        TabsDefault.l.variation,
        TabsDefault.l.horizontal.variation,
        TabsDefault.l.vertical.variation,
        TabsDefault.m.variation,
        TabsDefault.m.horizontal.variation,
        TabsDefault.m.vertical.variation,
        TabsDefault.s.variation,
        TabsDefault.s.horizontal.variation,
        TabsDefault.s.vertical.variation,
        TabsDefault.xs.variation,
        TabsDefault.xs.horizontal.variation,
        TabsDefault.xs.vertical.variation,
    ]
}

public struct TabsDefaultVariation {
    public struct L {}
    public struct LHorizontal {}
    public struct LVertical {}
    public struct M {}
    public struct MHorizontal {}
    public struct MVertical {}
    public struct S {}
    public struct SHorizontal {}
    public struct SVertical {}
    public struct Xs {}
    public struct XsHorizontal {}
    public struct XsVertical {}
}

private extension TabsAppearance {
    static var base: TabsAppearance {
        var appearance = TabsAppearance()
        appearance.disclosureColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: .clearColor)
        appearance.dividerAppearance = Divider.default.appearance
        appearance.indicatorColor = ColorToken.surfaceDefaultSolidDefault
        appearance.overflowNextIcon = Asset.disclosureRightOutline24.image
        appearance.overflowNextIconColor = ColorToken.textDefaultSecondary
        appearance.overflowPrevIcon = Asset.disclosureLeftOutline24.image
        appearance.overflowPrevIconColor = ColorToken.textDefaultSecondary
        return appearance
    }
}
