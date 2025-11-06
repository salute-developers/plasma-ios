import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<TabsDefault, TabsAppearance, TabsDefaultVariation.L> {
    
    var horizontal: ComponentAppearanceVariation<TabsDefault, TabsAppearance> {
        var size =  TabsDefaultAnySize(size: appearance.size)
        size.minSpacing = CGFloat(28.0)
        size.orientation = TabsOrientation.horizontal

        var appearance = appearance
        appearance.size = size
        appearance.tabItemAppearance = TabItemDefault.l.horizontal.appearance
    
        return .init(
            name: "l.horizontal",
            appearance: appearance
        )
    }
    
    var l: GeneralAppearanceVariation<TabsDefault, TabsAppearance, TabsDefaultVariation.L> {
        var size =  TabsDefaultAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.disclosureTextTypography = TabsDefaultTypography(l: AdaptiveTypographyToken.bodyLBold.typography).asContainer
        appearance.dropdownMenuAppearance = DropdownMenuNormal.l.appearance
        appearance.tabItemAppearance = TabItemDefault.l.appearance
    
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
    var vertical: ComponentAppearanceVariation<TabsDefault, TabsAppearance> {
        var size =  TabsDefaultAnySize(size: appearance.size)
        size.minSpacing = CGFloat(0.0)
        size.orientation = TabsOrientation.vertical
        size.overflowIconSize = CGFloat(24)

        var appearance = appearance
        appearance.size = size
        appearance.overflowNextIcon = Asset.disclosureDownOutline24.image
        appearance.overflowPrevIcon = Asset.disclosureUpOutline24.image
        appearance.tabItemAppearance = TabItemDefault.l.vertical.appearance
    
        return .init(
            name: "l.vertical",
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

public extension GeneralAppearanceVariation<TabsDefault, TabsAppearance, TabsDefaultVariation.LHorizontal> {
    
    var horizontal: ComponentAppearanceVariation<TabsDefault, TabsAppearance> {
        var size =  TabsDefaultAnySize(size: appearance.size)
        size.minSpacing = CGFloat(28.0)
        size.orientation = TabsOrientation.horizontal

        var appearance = appearance
        appearance.size = size
        appearance.tabItemAppearance = TabItemDefault.l.horizontal.appearance
    
        return .init(
            name: "l.horizontal",
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

public extension GeneralAppearanceVariation<TabsDefault, TabsAppearance, TabsDefaultVariation.LVertical> {
    
    var vertical: ComponentAppearanceVariation<TabsDefault, TabsAppearance> {
        var size =  TabsDefaultAnySize(size: appearance.size)
        size.minSpacing = CGFloat(0.0)
        size.orientation = TabsOrientation.vertical
        size.overflowIconSize = CGFloat(24)

        var appearance = appearance
        appearance.size = size
        appearance.overflowNextIcon = Asset.disclosureDownOutline24.image
        appearance.overflowPrevIcon = Asset.disclosureUpOutline24.image
        appearance.tabItemAppearance = TabItemDefault.l.vertical.appearance
    
        return .init(
            name: "l.vertical",
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

public extension GeneralAppearanceVariation<TabsDefault, TabsAppearance, TabsDefaultVariation.M> {
    
    var horizontal: ComponentAppearanceVariation<TabsDefault, TabsAppearance> {
        var size =  TabsDefaultAnySize(size: appearance.size)
        size.minSpacing = CGFloat(28.0)
        size.orientation = TabsOrientation.horizontal

        var appearance = appearance
        appearance.size = size
        appearance.tabItemAppearance = TabItemDefault.m.horizontal.appearance
    
        return .init(
            name: "m.horizontal",
            appearance: appearance
        )
    }
    
    var m: GeneralAppearanceVariation<TabsDefault, TabsAppearance, TabsDefaultVariation.M> {
        var size =  TabsDefaultAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.disclosureTextTypography = TabsDefaultTypography(m: AdaptiveTypographyToken.bodyMBold.typography).asContainer
        appearance.dropdownMenuAppearance = DropdownMenuNormal.m.appearance
        appearance.tabItemAppearance = TabItemDefault.m.appearance
    
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    var vertical: ComponentAppearanceVariation<TabsDefault, TabsAppearance> {
        var size =  TabsDefaultAnySize(size: appearance.size)
        size.minSpacing = CGFloat(0.0)
        size.orientation = TabsOrientation.vertical
        size.overflowIconSize = CGFloat(24)

        var appearance = appearance
        appearance.size = size
        appearance.overflowNextIcon = Asset.disclosureDownOutline24.image
        appearance.overflowPrevIcon = Asset.disclosureUpOutline24.image
        appearance.tabItemAppearance = TabItemDefault.m.vertical.appearance
    
        return .init(
            name: "m.vertical",
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

public extension GeneralAppearanceVariation<TabsDefault, TabsAppearance, TabsDefaultVariation.MHorizontal> {
    
    var horizontal: ComponentAppearanceVariation<TabsDefault, TabsAppearance> {
        var size =  TabsDefaultAnySize(size: appearance.size)
        size.minSpacing = CGFloat(28.0)
        size.orientation = TabsOrientation.horizontal

        var appearance = appearance
        appearance.size = size
        appearance.tabItemAppearance = TabItemDefault.m.horizontal.appearance
    
        return .init(
            name: "m.horizontal",
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

public extension GeneralAppearanceVariation<TabsDefault, TabsAppearance, TabsDefaultVariation.MVertical> {
    
    var vertical: ComponentAppearanceVariation<TabsDefault, TabsAppearance> {
        var size =  TabsDefaultAnySize(size: appearance.size)
        size.minSpacing = CGFloat(0.0)
        size.orientation = TabsOrientation.vertical
        size.overflowIconSize = CGFloat(24)

        var appearance = appearance
        appearance.size = size
        appearance.overflowNextIcon = Asset.disclosureDownOutline24.image
        appearance.overflowPrevIcon = Asset.disclosureUpOutline24.image
        appearance.tabItemAppearance = TabItemDefault.m.vertical.appearance
    
        return .init(
            name: "m.vertical",
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

public extension GeneralAppearanceVariation<TabsDefault, TabsAppearance, TabsDefaultVariation.S> {
    
    var horizontal: ComponentAppearanceVariation<TabsDefault, TabsAppearance> {
        var size =  TabsDefaultAnySize(size: appearance.size)
        size.minSpacing = CGFloat(28.0)
        size.orientation = TabsOrientation.horizontal

        var appearance = appearance
        appearance.size = size
        appearance.tabItemAppearance = TabItemDefault.s.horizontal.appearance
    
        return .init(
            name: "s.horizontal",
            appearance: appearance
        )
    }
    
    var s: GeneralAppearanceVariation<TabsDefault, TabsAppearance, TabsDefaultVariation.S> {
        var size =  TabsDefaultAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.disclosureTextTypography = TabsDefaultTypography(s: AdaptiveTypographyToken.bodyMBold.typography).asContainer
        appearance.dropdownMenuAppearance = DropdownMenuNormal.m.appearance
        appearance.tabItemAppearance = TabItemDefault.m.appearance
    
        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    var vertical: ComponentAppearanceVariation<TabsDefault, TabsAppearance> {
        var size =  TabsDefaultAnySize(size: appearance.size)
        size.minSpacing = CGFloat(0.0)
        size.orientation = TabsOrientation.vertical
        size.overflowIconSize = CGFloat(24)

        var appearance = appearance
        appearance.size = size
        appearance.overflowNextIcon = Asset.disclosureDownOutline24.image
        appearance.overflowPrevIcon = Asset.disclosureUpOutline24.image
        appearance.tabItemAppearance = TabItemDefault.s.vertical.appearance
    
        return .init(
            name: "s.vertical",
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

public extension GeneralAppearanceVariation<TabsDefault, TabsAppearance, TabsDefaultVariation.SHorizontal> {
    
    var horizontal: ComponentAppearanceVariation<TabsDefault, TabsAppearance> {
        var size =  TabsDefaultAnySize(size: appearance.size)
        size.minSpacing = CGFloat(28.0)
        size.orientation = TabsOrientation.horizontal

        var appearance = appearance
        appearance.size = size
        appearance.tabItemAppearance = TabItemDefault.s.horizontal.appearance
    
        return .init(
            name: "s.horizontal",
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

public extension GeneralAppearanceVariation<TabsDefault, TabsAppearance, TabsDefaultVariation.SVertical> {
    
    var vertical: ComponentAppearanceVariation<TabsDefault, TabsAppearance> {
        var size =  TabsDefaultAnySize(size: appearance.size)
        size.minSpacing = CGFloat(0.0)
        size.orientation = TabsOrientation.vertical
        size.overflowIconSize = CGFloat(24)

        var appearance = appearance
        appearance.size = size
        appearance.overflowNextIcon = Asset.disclosureDownOutline24.image
        appearance.overflowPrevIcon = Asset.disclosureUpOutline24.image
        appearance.tabItemAppearance = TabItemDefault.s.vertical.appearance
    
        return .init(
            name: "s.vertical",
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

public extension GeneralAppearanceVariation<TabsDefault, TabsAppearance, TabsDefaultVariation.Xs> {
    
    var horizontal: ComponentAppearanceVariation<TabsDefault, TabsAppearance> {
        var size =  TabsDefaultAnySize(size: appearance.size)
        size.minSpacing = CGFloat(28.0)
        size.orientation = TabsOrientation.horizontal

        var appearance = appearance
        appearance.size = size
        appearance.tabItemAppearance = TabItemDefault.xs.horizontal.appearance
    
        return .init(
            name: "xs.horizontal",
            appearance: appearance
        )
    }
    
    var vertical: ComponentAppearanceVariation<TabsDefault, TabsAppearance> {
        var size =  TabsDefaultAnySize(size: appearance.size)
        size.minSpacing = CGFloat(0.0)
        size.orientation = TabsOrientation.vertical
        size.overflowIconSize = CGFloat(24)

        var appearance = appearance
        appearance.size = size
        appearance.overflowNextIcon = Asset.disclosureDownOutline24.image
        appearance.overflowPrevIcon = Asset.disclosureUpOutline24.image
        appearance.tabItemAppearance = TabItemDefault.xs.vertical.appearance
    
        return .init(
            name: "xs.vertical",
            appearance: appearance
        )
    }
    
    var xs: GeneralAppearanceVariation<TabsDefault, TabsAppearance, TabsDefaultVariation.Xs> {
        var size =  TabsDefaultAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.disclosureTextTypography = TabsDefaultTypography(xs: AdaptiveTypographyToken.bodyXsBold.typography).asContainer
        appearance.dropdownMenuAppearance = DropdownMenuNormal.xs.appearance
        appearance.tabItemAppearance = TabItemDefault.xs.appearance
    
        return .init(
            name: "xs",
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

public extension GeneralAppearanceVariation<TabsDefault, TabsAppearance, TabsDefaultVariation.XsHorizontal> {
    
    var horizontal: ComponentAppearanceVariation<TabsDefault, TabsAppearance> {
        var size =  TabsDefaultAnySize(size: appearance.size)
        size.minSpacing = CGFloat(28.0)
        size.orientation = TabsOrientation.horizontal

        var appearance = appearance
        appearance.size = size
        appearance.tabItemAppearance = TabItemDefault.xs.horizontal.appearance
    
        return .init(
            name: "xs.horizontal",
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

public extension GeneralAppearanceVariation<TabsDefault, TabsAppearance, TabsDefaultVariation.XsVertical> {
    
    var vertical: ComponentAppearanceVariation<TabsDefault, TabsAppearance> {
        var size =  TabsDefaultAnySize(size: appearance.size)
        size.minSpacing = CGFloat(0.0)
        size.orientation = TabsOrientation.vertical
        size.overflowIconSize = CGFloat(24)

        var appearance = appearance
        appearance.size = size
        appearance.overflowNextIcon = Asset.disclosureDownOutline24.image
        appearance.overflowPrevIcon = Asset.disclosureUpOutline24.image
        appearance.tabItemAppearance = TabItemDefault.xs.vertical.appearance
    
        return .init(
            name: "xs.vertical",
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


public extension ComponentAppearanceVariation<TabsDefault, TabsAppearance> {
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
