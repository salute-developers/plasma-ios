import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<TabItemDefault, TabItemAppearance, TabItemDefaultVariation.L> {
    
    var horizontal: ComponentAppearanceVariation<TabItemDefault, TabItemAppearance> {
        var size =  TabItemDefaultAnySize(size: appearance.size)
        size.paddingEnd = CGFloat(0.0)
        size.paddingStart = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.horizontal",
            appearance: appearance
        )
    }
    
    var l: GeneralAppearanceVariation<TabItemDefault, TabItemAppearance, TabItemDefaultVariation.L> {
        var size =  TabItemDefaultAnySize(size: appearance.size)
        size.actionIconSize = CGFloat(24)
        size.actionPadding = CGFloat(10.0)
        size.counterPadding = CGFloat(8.0)
        size.endContentSize = CGFloat(24.0)
        size.minHeight = CGFloat(56.0)
        size.startContentPadding = CGFloat(8.0)
        size.startContentSize = CGFloat(24.0)
        size.valuePadding = CGFloat(8.0)

        var appearance = appearance
        appearance.size = size
        appearance.actionIcon = Asset.close24.image
        appearance.counterAppearance = Counter.s.accent.appearance
        appearance.labelTypography = TabItemDefaultTypography(l: AdaptiveTypographyToken.bodyLBold.typography).asContainer
        appearance.valueTypography = TabItemDefaultTypography(l: AdaptiveTypographyToken.bodyLBold.typography).asContainer
    
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
    var vertical: ComponentAppearanceVariation<TabItemDefault, TabItemAppearance> {
        var size =  TabItemDefaultAnySize(size: appearance.size)
        size.paddingEnd = CGFloat(14.0)
        size.paddingStart = CGFloat(22.0)

        var appearance = appearance
        appearance.size = size
    
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

public extension GeneralAppearanceVariation<TabItemDefault, TabItemAppearance, TabItemDefaultVariation.LHorizontal> {
    
    var horizontal: ComponentAppearanceVariation<TabItemDefault, TabItemAppearance> {
        var size =  TabItemDefaultAnySize(size: appearance.size)
        size.paddingEnd = CGFloat(0.0)
        size.paddingStart = CGFloat(0.0)

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

public extension GeneralAppearanceVariation<TabItemDefault, TabItemAppearance, TabItemDefaultVariation.LVertical> {
    
    var vertical: ComponentAppearanceVariation<TabItemDefault, TabItemAppearance> {
        var size =  TabItemDefaultAnySize(size: appearance.size)
        size.paddingEnd = CGFloat(14.0)
        size.paddingStart = CGFloat(22.0)

        var appearance = appearance
        appearance.size = size
    
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

public extension GeneralAppearanceVariation<TabItemDefault, TabItemAppearance, TabItemDefaultVariation.M> {
    
    var horizontal: ComponentAppearanceVariation<TabItemDefault, TabItemAppearance> {
        var size =  TabItemDefaultAnySize(size: appearance.size)
        size.paddingEnd = CGFloat(0.0)
        size.paddingStart = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.horizontal",
            appearance: appearance
        )
    }
    
    var m: GeneralAppearanceVariation<TabItemDefault, TabItemAppearance, TabItemDefaultVariation.M> {
        var size =  TabItemDefaultAnySize(size: appearance.size)
        size.actionIconSize = CGFloat(24)
        size.actionPadding = CGFloat(8.0)
        size.counterPadding = CGFloat(6.0)
        size.endContentSize = CGFloat(24.0)
        size.iconPadding = CGFloat(6.0)
        size.minHeight = CGFloat(48.0)
        size.startContentSize = CGFloat(24.0)
        size.valuePadding = CGFloat(6.0)

        var appearance = appearance
        appearance.size = size
        appearance.actionIcon = Asset.close24.image
        appearance.counterAppearance = Counter.xs.accent.appearance
        appearance.labelTypography = TabItemDefaultTypography(m: AdaptiveTypographyToken.bodyMBold.typography).asContainer
        appearance.valueTypography = TabItemDefaultTypography(m: AdaptiveTypographyToken.bodyMBold.typography).asContainer
    
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    var vertical: ComponentAppearanceVariation<TabItemDefault, TabItemAppearance> {
        var size =  TabItemDefaultAnySize(size: appearance.size)
        size.paddingEnd = CGFloat(12.0)
        size.paddingStart = CGFloat(18.0)

        var appearance = appearance
        appearance.size = size
    
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

public extension GeneralAppearanceVariation<TabItemDefault, TabItemAppearance, TabItemDefaultVariation.MHorizontal> {
    
    var horizontal: ComponentAppearanceVariation<TabItemDefault, TabItemAppearance> {
        var size =  TabItemDefaultAnySize(size: appearance.size)
        size.paddingEnd = CGFloat(0.0)
        size.paddingStart = CGFloat(0.0)

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

public extension GeneralAppearanceVariation<TabItemDefault, TabItemAppearance, TabItemDefaultVariation.MVertical> {
    
    var vertical: ComponentAppearanceVariation<TabItemDefault, TabItemAppearance> {
        var size =  TabItemDefaultAnySize(size: appearance.size)
        size.paddingEnd = CGFloat(12.0)
        size.paddingStart = CGFloat(18.0)

        var appearance = appearance
        appearance.size = size
    
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

public extension GeneralAppearanceVariation<TabItemDefault, TabItemAppearance, TabItemDefaultVariation.S> {
    
    var horizontal: ComponentAppearanceVariation<TabItemDefault, TabItemAppearance> {
        var size =  TabItemDefaultAnySize(size: appearance.size)
        size.paddingEnd = CGFloat(0.0)
        size.paddingStart = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.horizontal",
            appearance: appearance
        )
    }
    
    var s: GeneralAppearanceVariation<TabItemDefault, TabItemAppearance, TabItemDefaultVariation.S> {
        var size =  TabItemDefaultAnySize(size: appearance.size)
        size.actionIconSize = CGFloat(24)
        size.actionPadding = CGFloat(6.0)
        size.counterPadding = CGFloat(4.0)
        size.endContentSize = CGFloat(24.0)
        size.iconPadding = CGFloat(4.0)
        size.minHeight = CGFloat(40.0)
        size.startContentSize = CGFloat(24.0)
        size.valuePadding = CGFloat(4.0)

        var appearance = appearance
        appearance.size = size
        appearance.actionIcon = Asset.close24.image
        appearance.counterAppearance = Counter.xs.accent.appearance
        appearance.labelTypography = TabItemDefaultTypography(s: AdaptiveTypographyToken.bodySBold.typography).asContainer
        appearance.valueTypography = TabItemDefaultTypography(s: AdaptiveTypographyToken.bodySBold.typography).asContainer
    
        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    var vertical: ComponentAppearanceVariation<TabItemDefault, TabItemAppearance> {
        var size =  TabItemDefaultAnySize(size: appearance.size)
        size.paddingEnd = CGFloat(8.0)
        size.paddingStart = CGFloat(14.0)

        var appearance = appearance
        appearance.size = size
    
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

public extension GeneralAppearanceVariation<TabItemDefault, TabItemAppearance, TabItemDefaultVariation.SHorizontal> {
    
    var horizontal: ComponentAppearanceVariation<TabItemDefault, TabItemAppearance> {
        var size =  TabItemDefaultAnySize(size: appearance.size)
        size.paddingEnd = CGFloat(0.0)
        size.paddingStart = CGFloat(0.0)

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

public extension GeneralAppearanceVariation<TabItemDefault, TabItemAppearance, TabItemDefaultVariation.SVertical> {
    
    var vertical: ComponentAppearanceVariation<TabItemDefault, TabItemAppearance> {
        var size =  TabItemDefaultAnySize(size: appearance.size)
        size.paddingEnd = CGFloat(8.0)
        size.paddingStart = CGFloat(14.0)

        var appearance = appearance
        appearance.size = size
    
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

public extension GeneralAppearanceVariation<TabItemDefault, TabItemAppearance, TabItemDefaultVariation.Xs> {
    
    var horizontal: ComponentAppearanceVariation<TabItemDefault, TabItemAppearance> {
        var size =  TabItemDefaultAnySize(size: appearance.size)
        size.paddingEnd = CGFloat(0.0)
        size.paddingStart = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.horizontal",
            appearance: appearance
        )
    }
    
    var vertical: ComponentAppearanceVariation<TabItemDefault, TabItemAppearance> {
        var size =  TabItemDefaultAnySize(size: appearance.size)
        size.paddingEnd = CGFloat(6.0)
        size.paddingStart = CGFloat(10.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.vertical",
            appearance: appearance
        )
    }
    
    var xs: GeneralAppearanceVariation<TabItemDefault, TabItemAppearance, TabItemDefaultVariation.Xs> {
        var size =  TabItemDefaultAnySize(size: appearance.size)
        size.actionIconSize = CGFloat(16)
        size.actionPadding = CGFloat(4.0)
        size.counterPadding = CGFloat(4.0)
        size.endContentSize = CGFloat(16.0)
        size.iconPadding = CGFloat(4.0)
        size.minHeight = CGFloat(32.0)
        size.startContentSize = CGFloat(16.0)
        size.valuePadding = CGFloat(4.0)

        var appearance = appearance
        appearance.size = size
        appearance.actionIcon = Asset.close16.image
        appearance.counterAppearance = Counter.xxs.accent.appearance
        appearance.labelTypography = TabItemDefaultTypography(xs: AdaptiveTypographyToken.bodyXsBold.typography).asContainer
        appearance.valueTypography = TabItemDefaultTypography(xs: AdaptiveTypographyToken.bodyXsBold.typography).asContainer
    
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

public extension GeneralAppearanceVariation<TabItemDefault, TabItemAppearance, TabItemDefaultVariation.XsHorizontal> {
    
    var horizontal: ComponentAppearanceVariation<TabItemDefault, TabItemAppearance> {
        var size =  TabItemDefaultAnySize(size: appearance.size)
        size.paddingEnd = CGFloat(0.0)
        size.paddingStart = CGFloat(0.0)

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

public extension GeneralAppearanceVariation<TabItemDefault, TabItemAppearance, TabItemDefaultVariation.XsVertical> {
    
    var vertical: ComponentAppearanceVariation<TabItemDefault, TabItemAppearance> {
        var size =  TabItemDefaultAnySize(size: appearance.size)
        size.paddingEnd = CGFloat(6.0)
        size.paddingStart = CGFloat(10.0)

        var appearance = appearance
        appearance.size = size
    
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


public extension ComponentAppearanceVariation<TabItemDefault, TabItemAppearance> {
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
