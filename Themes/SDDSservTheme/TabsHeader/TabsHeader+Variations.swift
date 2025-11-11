import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<TabsHeader, TabsAppearance, TabsHeaderVariation.H1> {
    
    var h1: ComponentAppearanceVariation<TabsHeader, TabsAppearance> {
        var size =  TabsHeaderAnySize(size: appearance.size)
        size.minSpacing = CGFloat(56.0)

        var appearance = appearance
        appearance.size = size
        appearance.disclosureTextTypography = TabsHeaderTypography(h1: AdaptiveTypographyToken.headerH1Bold.typography).asContainer
        appearance.dropdownMenuAppearance = DropdownMenuNormal.l.appearance
        appearance.tabItemAppearance = TabItemHeader.h1.appearance
    
        return .init(
            name: "h1",
            appearance: appearance
        )
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TabsHeader, TabsAppearance, TabsHeaderVariation.H2> {
    
    var h2: ComponentAppearanceVariation<TabsHeader, TabsAppearance> {
        var size =  TabsHeaderAnySize(size: appearance.size)
        size.minSpacing = CGFloat(40.0)

        var appearance = appearance
        appearance.size = size
        appearance.disclosureTextTypography = TabsHeaderTypography(h2: AdaptiveTypographyToken.headerH2Bold.typography).asContainer
        appearance.dropdownMenuAppearance = DropdownMenuNormal.m.appearance
        appearance.tabItemAppearance = TabItemHeader.h2.appearance
    
        return .init(
            name: "h2",
            appearance: appearance
        )
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TabsHeader, TabsAppearance, TabsHeaderVariation.H3> {
    
    var h3: ComponentAppearanceVariation<TabsHeader, TabsAppearance> {
        var size =  TabsHeaderAnySize(size: appearance.size)
        size.minSpacing = CGFloat(36.0)

        var appearance = appearance
        appearance.size = size
        appearance.disclosureTextTypography = TabsHeaderTypography(h3: AdaptiveTypographyToken.headerH3Bold.typography).asContainer
        appearance.dropdownMenuAppearance = DropdownMenuNormal.s.appearance
        appearance.tabItemAppearance = TabItemHeader.h3.appearance
    
        return .init(
            name: "h3",
            appearance: appearance
        )
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TabsHeader, TabsAppearance, TabsHeaderVariation.H4> {
    
    var h4: ComponentAppearanceVariation<TabsHeader, TabsAppearance> {
        var size =  TabsHeaderAnySize(size: appearance.size)
        size.minSpacing = CGFloat(32.0)

        var appearance = appearance
        appearance.size = size
        appearance.disclosureTextTypography = TabsHeaderTypography(h4: AdaptiveTypographyToken.headerH4Bold.typography).asContainer
        appearance.dropdownMenuAppearance = DropdownMenuNormal.xs.appearance
        appearance.tabItemAppearance = TabItemHeader.h4.appearance
    
        return .init(
            name: "h4",
            appearance: appearance
        )
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<TabsHeader, TabsAppearance, TabsHeaderVariation.H5> {
    
    var h5: ComponentAppearanceVariation<TabsHeader, TabsAppearance> {
        var size =  TabsHeaderAnySize(size: appearance.size)
        size.minSpacing = CGFloat(28.0)

        var appearance = appearance
        appearance.size = size
        appearance.disclosureTextTypography = TabsHeaderTypography(h5: AdaptiveTypographyToken.headerH5Bold.typography).asContainer
        appearance.dropdownMenuAppearance = DropdownMenuNormal.xs.appearance
        appearance.tabItemAppearance = TabItemHeader.h5.appearance
    
        return .init(
            name: "h5",
            appearance: appearance
        )
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
    
}


public extension ComponentAppearanceVariation<TabsHeader, TabsAppearance> {
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension TabsAppearance {
    
}
