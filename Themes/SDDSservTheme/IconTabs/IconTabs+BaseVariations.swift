import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct IconTabs {
    public static var l: GeneralAppearanceVariation<IconTabs, TabsAppearance, IconTabsVariation.L> {
        var appearance = TabsAppearance.base
        appearance.size = IconTabsSize.l
        appearance.disclosureTextTypography = IconTabsTypography(oneSize: AdaptiveTypographyToken.bodyLBold.typography).asContainer
        appearance.dropdownMenuAppearance = DropdownMenuNormal.l.appearance
        appearance.tabItemAppearance = IconTabItem.l.appearance

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<IconTabs, TabsAppearance, IconTabsVariation.M> {
        var appearance = TabsAppearance.base
        appearance.size = IconTabsSize.m
        appearance.disclosureTextTypography = IconTabsTypography(oneSize: AdaptiveTypographyToken.bodyMBold.typography).asContainer
        appearance.dropdownMenuAppearance = DropdownMenuNormal.m.appearance
        appearance.tabItemAppearance = IconTabItem.m.appearance

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<IconTabs, TabsAppearance, IconTabsVariation.S> {
        var appearance = TabsAppearance.base
        appearance.size = IconTabsSize.s
        appearance.disclosureTextTypography = IconTabsTypography(oneSize: AdaptiveTypographyToken.bodyMBold.typography).asContainer
        appearance.dropdownMenuAppearance = DropdownMenuNormal.m.appearance
        appearance.tabItemAppearance = IconTabItem.m.appearance

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: GeneralAppearanceVariation<IconTabs, TabsAppearance, IconTabsVariation.Xs> {
        var appearance = TabsAppearance.base
        appearance.size = IconTabsSize.xs
        appearance.disclosureTextTypography = IconTabsTypography(oneSize: AdaptiveTypographyToken.bodyXsBold.typography).asContainer
        appearance.dropdownMenuAppearance = DropdownMenuNormal.xs.appearance
        appearance.tabItemAppearance = IconTabItem.xs.appearance

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<TabsAppearance>] = [
        IconTabs.l.variation,
        IconTabs.l.horizontal.variation,
        IconTabs.l.vertical.variation,
        IconTabs.m.variation,
        IconTabs.m.horizontal.variation,
        IconTabs.m.vertical.variation,
        IconTabs.s.variation,
        IconTabs.s.horizontal.variation,
        IconTabs.s.vertical.variation,
        IconTabs.xs.variation,
        IconTabs.xs.horizontal.variation,
        IconTabs.xs.vertical.variation,
    ]
}

public struct IconTabsVariation {
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
        appearance.disclosureIcon = Asset.dotsHorizontalOutline24.image
        appearance.dividerAppearance = Divider.default.appearance
        appearance.indicatorColor = ColorToken.surfaceDefaultSolidDefault
        appearance.overflowNextIcon = Asset.disclosureRightOutline24.image
        appearance.overflowNextIconColor = ColorToken.textDefaultSecondary
        appearance.overflowPrevIcon = Asset.disclosureLeftOutline24.image
        appearance.overflowPrevIconColor = ColorToken.textDefaultSecondary
        return appearance
    }
}
