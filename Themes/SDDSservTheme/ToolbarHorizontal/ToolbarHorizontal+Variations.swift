import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<ToolbarHorizontal, ToolbarAppearance, ToolbarHorizontalVariation.L> {
    
    var hasShadow: ComponentAppearanceVariation<ToolbarHorizontal, ToolbarAppearance> {
        var size =  ToolbarHorizontalAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.shadow = ShadowToken.downSoftS
    
        return .init(
            name: "l.hasShadow",
            appearance: appearance
        )
    }
    
    var l: GeneralAppearanceVariation<ToolbarHorizontal, ToolbarAppearance, ToolbarHorizontalVariation.L> {
        var size =  ToolbarHorizontalAnySize(size: appearance.size)
        size.dividerMargin = CGFloat(12.0)
        size.paddingBottom = CGFloat(8.0)
        size.paddingEnd = CGFloat(8.0)
        size.paddingStart = CGFloat(8.0)
        size.paddingTop = CGFloat(8.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXl.cornerRadius) as PathDrawer
        size.slotPadding = CGFloat(12.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l",
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

public extension GeneralAppearanceVariation<ToolbarHorizontal, ToolbarAppearance, ToolbarHorizontalVariation.LHasshadow> {
    
    var hasShadow: ComponentAppearanceVariation<ToolbarHorizontal, ToolbarAppearance> {
        var size =  ToolbarHorizontalAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.shadow = ShadowToken.downSoftS
    
        return .init(
            name: "l.hasShadow",
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

public extension GeneralAppearanceVariation<ToolbarHorizontal, ToolbarAppearance, ToolbarHorizontalVariation.M> {
    
    var hasShadow: ComponentAppearanceVariation<ToolbarHorizontal, ToolbarAppearance> {
        var size =  ToolbarHorizontalAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.shadow = ShadowToken.downSoftS
    
        return .init(
            name: "m.hasShadow",
            appearance: appearance
        )
    }
    
    var m: GeneralAppearanceVariation<ToolbarHorizontal, ToolbarAppearance, ToolbarHorizontalVariation.M> {
        var size =  ToolbarHorizontalAnySize(size: appearance.size)
        size.dividerMargin = CGFloat(10.0)
        size.paddingBottom = CGFloat(6.0)
        size.paddingEnd = CGFloat(6.0)
        size.paddingStart = CGFloat(6.0)
        size.paddingTop = CGFloat(6.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer
        size.slotPadding = CGFloat(10.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m",
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

public extension GeneralAppearanceVariation<ToolbarHorizontal, ToolbarAppearance, ToolbarHorizontalVariation.MHasshadow> {
    
    var hasShadow: ComponentAppearanceVariation<ToolbarHorizontal, ToolbarAppearance> {
        var size =  ToolbarHorizontalAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.shadow = ShadowToken.downSoftS
    
        return .init(
            name: "m.hasShadow",
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

public extension GeneralAppearanceVariation<ToolbarHorizontal, ToolbarAppearance, ToolbarHorizontalVariation.S> {
    
    var hasShadow: ComponentAppearanceVariation<ToolbarHorizontal, ToolbarAppearance> {
        var size =  ToolbarHorizontalAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.shadow = ShadowToken.downSoftS
    
        return .init(
            name: "s.hasShadow",
            appearance: appearance
        )
    }
    
    var s: GeneralAppearanceVariation<ToolbarHorizontal, ToolbarAppearance, ToolbarHorizontalVariation.S> {
        var size =  ToolbarHorizontalAnySize(size: appearance.size)
        size.dividerMargin = CGFloat(8.0)
        size.paddingBottom = CGFloat(4.0)
        size.paddingEnd = CGFloat(4.0)
        size.paddingStart = CGFloat(4.0)
        size.paddingTop = CGFloat(4.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
        size.slotPadding = CGFloat(8.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s",
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

public extension GeneralAppearanceVariation<ToolbarHorizontal, ToolbarAppearance, ToolbarHorizontalVariation.SHasshadow> {
    
    var hasShadow: ComponentAppearanceVariation<ToolbarHorizontal, ToolbarAppearance> {
        var size =  ToolbarHorizontalAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.shadow = ShadowToken.downSoftS
    
        return .init(
            name: "s.hasShadow",
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

public extension GeneralAppearanceVariation<ToolbarHorizontal, ToolbarAppearance, ToolbarHorizontalVariation.Xs> {
    
    var hasShadow: ComponentAppearanceVariation<ToolbarHorizontal, ToolbarAppearance> {
        var size =  ToolbarHorizontalAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.shadow = ShadowToken.downSoftS
    
        return .init(
            name: "xs.hasShadow",
            appearance: appearance
        )
    }
    
    var xs: GeneralAppearanceVariation<ToolbarHorizontal, ToolbarAppearance, ToolbarHorizontalVariation.Xs> {
        var size =  ToolbarHorizontalAnySize(size: appearance.size)
        size.dividerMargin = CGFloat(6.0)
        size.paddingBottom = CGFloat(4.0)
        size.paddingEnd = CGFloat(4.0)
        size.paddingStart = CGFloat(4.0)
        size.paddingTop = CGFloat(4.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
        size.slotPadding = CGFloat(8.0)

        var appearance = appearance
        appearance.size = size
    
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

public extension GeneralAppearanceVariation<ToolbarHorizontal, ToolbarAppearance, ToolbarHorizontalVariation.XsHasshadow> {
    
    var hasShadow: ComponentAppearanceVariation<ToolbarHorizontal, ToolbarAppearance> {
        var size =  ToolbarHorizontalAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.shadow = ShadowToken.downSoftS
    
        return .init(
            name: "xs.hasShadow",
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


public extension ComponentAppearanceVariation<ToolbarHorizontal, ToolbarAppearance> {
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

private extension ToolbarAppearance {
    
}
