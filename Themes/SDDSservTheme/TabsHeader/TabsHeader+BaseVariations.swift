import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct TabsHeader {
    public static var h1: ComponentAppearanceVariation<TabsHeader, TabsAppearance> {
        var appearance = TabsAppearance.base
        appearance.size = TabsHeaderSize.h1
        appearance.disclosureTextTypography = TabsHeaderTypography(oneSize: AdaptiveTypographyToken.headerH1Bold.typography).asContainer
        appearance.dropdownMenuAppearance = DropdownMenuNormal.l.appearance
        appearance.tabItemAppearance = TabItemHeader.h1.appearance

        return .init(
            name: "h1",
            appearance: appearance
        )
    }
    public static var h2: ComponentAppearanceVariation<TabsHeader, TabsAppearance> {
        var appearance = TabsAppearance.base
        appearance.size = TabsHeaderSize.h2
        appearance.disclosureTextTypography = TabsHeaderTypography(oneSize: AdaptiveTypographyToken.headerH2Bold.typography).asContainer
        appearance.dropdownMenuAppearance = DropdownMenuNormal.m.appearance
        appearance.tabItemAppearance = TabItemHeader.h2.appearance

        return .init(
            name: "h2",
            appearance: appearance
        )
    }
    public static var h3: ComponentAppearanceVariation<TabsHeader, TabsAppearance> {
        var appearance = TabsAppearance.base
        appearance.size = TabsHeaderSize.h3
        appearance.disclosureTextTypography = TabsHeaderTypography(oneSize: AdaptiveTypographyToken.headerH3Bold.typography).asContainer
        appearance.dropdownMenuAppearance = DropdownMenuNormal.s.appearance
        appearance.tabItemAppearance = TabItemHeader.h3.appearance

        return .init(
            name: "h3",
            appearance: appearance
        )
    }
    public static var h4: ComponentAppearanceVariation<TabsHeader, TabsAppearance> {
        var appearance = TabsAppearance.base
        appearance.size = TabsHeaderSize.h4
        appearance.disclosureTextTypography = TabsHeaderTypography(oneSize: AdaptiveTypographyToken.headerH4Bold.typography).asContainer
        appearance.dropdownMenuAppearance = DropdownMenuNormal.xs.appearance
        appearance.tabItemAppearance = TabItemHeader.h4.appearance

        return .init(
            name: "h4",
            appearance: appearance
        )
    }
    public static var h5: ComponentAppearanceVariation<TabsHeader, TabsAppearance> {
        var appearance = TabsAppearance.base
        appearance.size = TabsHeaderSize.h5
        appearance.disclosureTextTypography = TabsHeaderTypography(oneSize: AdaptiveTypographyToken.headerH5Bold.typography).asContainer
        appearance.dropdownMenuAppearance = DropdownMenuNormal.xs.appearance
        appearance.tabItemAppearance = TabItemHeader.h5.appearance

        return .init(
            name: "h5",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<TabsAppearance>] = [
        TabsHeader.h1.variation,
        TabsHeader.h2.variation,
        TabsHeader.h3.variation,
        TabsHeader.h4.variation,
        TabsHeader.h5.variation,
    ]
}

public struct TabsHeaderVariation {
    public struct H1 {}
    public struct H2 {}
    public struct H3 {}
    public struct H4 {}
    public struct H5 {}
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
