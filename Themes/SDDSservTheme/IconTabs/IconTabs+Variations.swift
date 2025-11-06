import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<IconTabs, TabsAppearance, IconTabsVariation.L> {
    
    var horizontal: ComponentAppearanceVariation<IconTabs, TabsAppearance> {
        var size =  IconTabsAnySize(size: appearance.size)
        size.orientation = TabsOrientation.horizontal

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.horizontal",
            appearance: appearance
        )
    }
    
    var l: GeneralAppearanceVariation<IconTabs, TabsAppearance, IconTabsVariation.L> {
        var size =  IconTabsAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.disclosureTextTypography = IconTabsTypography(l: AdaptiveTypographyToken.bodyLBold.typography).asContainer
        appearance.dropdownMenuAppearance = DropdownMenuNormal.l.appearance
        appearance.tabItemAppearance = IconTabItem.l.appearance
    
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
    var vertical: ComponentAppearanceVariation<IconTabs, TabsAppearance> {
        var size =  IconTabsAnySize(size: appearance.size)
        size.orientation = TabsOrientation.vertical
        size.overflowIconSize = CGFloat(24)

        var appearance = appearance
        appearance.size = size
        appearance.overflowNextIcon = Asset.disclosureDownOutline24.image
        appearance.overflowPrevIcon = Asset.disclosureUpOutline24.image
    
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

public extension GeneralAppearanceVariation<IconTabs, TabsAppearance, IconTabsVariation.LHorizontal> {
    
    var horizontal: ComponentAppearanceVariation<IconTabs, TabsAppearance> {
        var size =  IconTabsAnySize(size: appearance.size)
        size.orientation = TabsOrientation.horizontal

        var appearance = appearance
        appearance.size = size
    
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

public extension GeneralAppearanceVariation<IconTabs, TabsAppearance, IconTabsVariation.LVertical> {
    
    var vertical: ComponentAppearanceVariation<IconTabs, TabsAppearance> {
        var size =  IconTabsAnySize(size: appearance.size)
        size.orientation = TabsOrientation.vertical
        size.overflowIconSize = CGFloat(24)

        var appearance = appearance
        appearance.size = size
        appearance.overflowNextIcon = Asset.disclosureDownOutline24.image
        appearance.overflowPrevIcon = Asset.disclosureUpOutline24.image
    
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

public extension GeneralAppearanceVariation<IconTabs, TabsAppearance, IconTabsVariation.M> {
    
    var horizontal: ComponentAppearanceVariation<IconTabs, TabsAppearance> {
        var size =  IconTabsAnySize(size: appearance.size)
        size.orientation = TabsOrientation.horizontal

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.horizontal",
            appearance: appearance
        )
    }
    
    var m: GeneralAppearanceVariation<IconTabs, TabsAppearance, IconTabsVariation.M> {
        var size =  IconTabsAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.disclosureTextTypography = IconTabsTypography(m: AdaptiveTypographyToken.bodyMBold.typography).asContainer
        appearance.dropdownMenuAppearance = DropdownMenuNormal.m.appearance
        appearance.tabItemAppearance = IconTabItem.m.appearance
    
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    var vertical: ComponentAppearanceVariation<IconTabs, TabsAppearance> {
        var size =  IconTabsAnySize(size: appearance.size)
        size.orientation = TabsOrientation.vertical
        size.overflowIconSize = CGFloat(24)

        var appearance = appearance
        appearance.size = size
        appearance.overflowNextIcon = Asset.disclosureDownOutline24.image
        appearance.overflowPrevIcon = Asset.disclosureUpOutline24.image
    
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

public extension GeneralAppearanceVariation<IconTabs, TabsAppearance, IconTabsVariation.MHorizontal> {
    
    var horizontal: ComponentAppearanceVariation<IconTabs, TabsAppearance> {
        var size =  IconTabsAnySize(size: appearance.size)
        size.orientation = TabsOrientation.horizontal

        var appearance = appearance
        appearance.size = size
    
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

public extension GeneralAppearanceVariation<IconTabs, TabsAppearance, IconTabsVariation.MVertical> {
    
    var vertical: ComponentAppearanceVariation<IconTabs, TabsAppearance> {
        var size =  IconTabsAnySize(size: appearance.size)
        size.orientation = TabsOrientation.vertical
        size.overflowIconSize = CGFloat(24)

        var appearance = appearance
        appearance.size = size
        appearance.overflowNextIcon = Asset.disclosureDownOutline24.image
        appearance.overflowPrevIcon = Asset.disclosureUpOutline24.image
    
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

public extension GeneralAppearanceVariation<IconTabs, TabsAppearance, IconTabsVariation.S> {
    
    var horizontal: ComponentAppearanceVariation<IconTabs, TabsAppearance> {
        var size =  IconTabsAnySize(size: appearance.size)
        size.orientation = TabsOrientation.horizontal

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.horizontal",
            appearance: appearance
        )
    }
    
    var s: GeneralAppearanceVariation<IconTabs, TabsAppearance, IconTabsVariation.S> {
        var size =  IconTabsAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.disclosureTextTypography = IconTabsTypography(s: AdaptiveTypographyToken.bodyMBold.typography).asContainer
        appearance.dropdownMenuAppearance = DropdownMenuNormal.m.appearance
        appearance.tabItemAppearance = IconTabItem.m.appearance
    
        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    var vertical: ComponentAppearanceVariation<IconTabs, TabsAppearance> {
        var size =  IconTabsAnySize(size: appearance.size)
        size.orientation = TabsOrientation.vertical
        size.overflowIconSize = CGFloat(24)

        var appearance = appearance
        appearance.size = size
        appearance.overflowNextIcon = Asset.disclosureDownOutline24.image
        appearance.overflowPrevIcon = Asset.disclosureUpOutline24.image
    
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

public extension GeneralAppearanceVariation<IconTabs, TabsAppearance, IconTabsVariation.SHorizontal> {
    
    var horizontal: ComponentAppearanceVariation<IconTabs, TabsAppearance> {
        var size =  IconTabsAnySize(size: appearance.size)
        size.orientation = TabsOrientation.horizontal

        var appearance = appearance
        appearance.size = size
    
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

public extension GeneralAppearanceVariation<IconTabs, TabsAppearance, IconTabsVariation.SVertical> {
    
    var vertical: ComponentAppearanceVariation<IconTabs, TabsAppearance> {
        var size =  IconTabsAnySize(size: appearance.size)
        size.orientation = TabsOrientation.vertical
        size.overflowIconSize = CGFloat(24)

        var appearance = appearance
        appearance.size = size
        appearance.overflowNextIcon = Asset.disclosureDownOutline24.image
        appearance.overflowPrevIcon = Asset.disclosureUpOutline24.image
    
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

public extension GeneralAppearanceVariation<IconTabs, TabsAppearance, IconTabsVariation.Xs> {
    
    var horizontal: ComponentAppearanceVariation<IconTabs, TabsAppearance> {
        var size =  IconTabsAnySize(size: appearance.size)
        size.orientation = TabsOrientation.horizontal

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.horizontal",
            appearance: appearance
        )
    }
    
    var vertical: ComponentAppearanceVariation<IconTabs, TabsAppearance> {
        var size =  IconTabsAnySize(size: appearance.size)
        size.orientation = TabsOrientation.vertical
        size.overflowIconSize = CGFloat(24)

        var appearance = appearance
        appearance.size = size
        appearance.overflowNextIcon = Asset.disclosureDownOutline24.image
        appearance.overflowPrevIcon = Asset.disclosureUpOutline24.image
    
        return .init(
            name: "xs.vertical",
            appearance: appearance
        )
    }
    
    var xs: GeneralAppearanceVariation<IconTabs, TabsAppearance, IconTabsVariation.Xs> {
        var size =  IconTabsAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.disclosureTextTypography = IconTabsTypography(xs: AdaptiveTypographyToken.bodyXsBold.typography).asContainer
        appearance.dropdownMenuAppearance = DropdownMenuNormal.xs.appearance
        appearance.tabItemAppearance = IconTabItem.xs.appearance
    
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

public extension GeneralAppearanceVariation<IconTabs, TabsAppearance, IconTabsVariation.XsHorizontal> {
    
    var horizontal: ComponentAppearanceVariation<IconTabs, TabsAppearance> {
        var size =  IconTabsAnySize(size: appearance.size)
        size.orientation = TabsOrientation.horizontal

        var appearance = appearance
        appearance.size = size
    
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

public extension GeneralAppearanceVariation<IconTabs, TabsAppearance, IconTabsVariation.XsVertical> {
    
    var vertical: ComponentAppearanceVariation<IconTabs, TabsAppearance> {
        var size =  IconTabsAnySize(size: appearance.size)
        size.orientation = TabsOrientation.vertical
        size.overflowIconSize = CGFloat(24)

        var appearance = appearance
        appearance.size = size
        appearance.overflowNextIcon = Asset.disclosureDownOutline24.image
        appearance.overflowPrevIcon = Asset.disclosureUpOutline24.image
    
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


public extension ComponentAppearanceVariation<IconTabs, TabsAppearance> {
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
