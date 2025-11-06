import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<TabItemHeader, TabItemAppearance, TabItemHeaderVariation.H1> {
    
    var h1: ComponentAppearanceVariation<TabItemHeader, TabItemAppearance> {
        var size =  TabItemHeaderAnySize(size: appearance.size)
        size.actionPadding = CGFloat(16.0)
        size.actionSize = CGFloat(52.0)
        size.paddingEnd = CGFloat(0.0)
        size.paddingStart = CGFloat(0.0)
        size.valuePadding = CGFloat(16.0)

        var appearance = appearance
        appearance.size = size
        appearance.labelTypography = TabItemHeaderTypography(h1: AdaptiveTypographyToken.headerH1Normal.typography).asContainer
        appearance.valueTypography = TabItemHeaderTypography(h1: AdaptiveTypographyToken.headerH1Normal.typography).asContainer
    
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

public extension GeneralAppearanceVariation<TabItemHeader, TabItemAppearance, TabItemHeaderVariation.H2> {
    
    var h2: ComponentAppearanceVariation<TabItemHeader, TabItemAppearance> {
        var size =  TabItemHeaderAnySize(size: appearance.size)
        size.actionPadding = CGFloat(12.0)
        size.paddingEnd = CGFloat(0.0)
        size.paddingStart = CGFloat(0.0)
        size.valuePadding = CGFloat(14.0)

        var appearance = appearance
        appearance.size = size
        appearance.labelTypography = TabItemHeaderTypography(h2: AdaptiveTypographyToken.headerH2Normal.typography).asContainer
        appearance.valueTypography = TabItemHeaderTypography(h2: AdaptiveTypographyToken.headerH2Normal.typography).asContainer
    
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

public extension GeneralAppearanceVariation<TabItemHeader, TabItemAppearance, TabItemHeaderVariation.H3> {
    
    var h3: ComponentAppearanceVariation<TabItemHeader, TabItemAppearance> {
        var size =  TabItemHeaderAnySize(size: appearance.size)
        size.actionPadding = CGFloat(10.0)
        size.actionSize = CGFloat(30.0)
        size.paddingEnd = CGFloat(0.0)
        size.paddingStart = CGFloat(0.0)
        size.valuePadding = CGFloat(12.0)

        var appearance = appearance
        appearance.size = size
        appearance.labelTypography = TabItemHeaderTypography(h3: AdaptiveTypographyToken.headerH3Normal.typography).asContainer
        appearance.valueTypography = TabItemHeaderTypography(h3: AdaptiveTypographyToken.headerH3Normal.typography).asContainer
    
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

public extension GeneralAppearanceVariation<TabItemHeader, TabItemAppearance, TabItemHeaderVariation.H4> {
    
    var h4: ComponentAppearanceVariation<TabItemHeader, TabItemAppearance> {
        var size =  TabItemHeaderAnySize(size: appearance.size)
        size.actionPadding = CGFloat(8.0)
        size.actionSize = CGFloat(26.0)
        size.paddingEnd = CGFloat(0.0)
        size.paddingStart = CGFloat(0.0)
        size.valuePadding = CGFloat(10.0)

        var appearance = appearance
        appearance.size = size
        appearance.labelTypography = TabItemHeaderTypography(h4: AdaptiveTypographyToken.headerH4Normal.typography).asContainer
        appearance.valueTypography = TabItemHeaderTypography(h4: AdaptiveTypographyToken.headerH4Normal.typography).asContainer
    
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

public extension GeneralAppearanceVariation<TabItemHeader, TabItemAppearance, TabItemHeaderVariation.H5> {
    
    var h5: ComponentAppearanceVariation<TabItemHeader, TabItemAppearance> {
        var size =  TabItemHeaderAnySize(size: appearance.size)
        size.actionPadding = CGFloat(8.0)
        size.actionSize = CGFloat(24.0)
        size.paddingEnd = CGFloat(0.0)
        size.paddingStart = CGFloat(0.0)
        size.valuePadding = CGFloat(10.0)

        var appearance = appearance
        appearance.size = size
        appearance.labelTypography = TabItemHeaderTypography(h5: AdaptiveTypographyToken.headerH5Normal.typography).asContainer
        appearance.valueTypography = TabItemHeaderTypography(h5: AdaptiveTypographyToken.headerH5Normal.typography).asContainer
    
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


public extension ComponentAppearanceVariation<TabItemHeader, TabItemAppearance> {
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

private extension TabItemAppearance {
    
}
