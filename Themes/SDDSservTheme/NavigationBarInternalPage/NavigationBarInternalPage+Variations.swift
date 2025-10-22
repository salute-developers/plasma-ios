import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<NavigationBarInternalPage, NavigationBarInternalPageAppearance, NavigationBarInternalPageVariation.Hasbackground> {
    
    var hasBackground: GeneralAppearanceVariation<NavigationBarInternalPage, NavigationBarInternalPageAppearance, NavigationBarInternalPageVariation.Hasbackground> {
        var size =  NavigationBarInternalPageAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidCard
    
        return .init(
            name: "hasBackground",
            appearance: appearance
        )
    }
    
    var rounded: ComponentAppearanceVariation<NavigationBarInternalPage, NavigationBarInternalPageAppearance> {
        var size =  NavigationBarInternalPageAnySize(size: appearance.size)
        size.bottomShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "hasBackground.rounded",
            appearance: appearance
        )
    }
    
    var shadow: GeneralAppearanceVariation<NavigationBarInternalPage, NavigationBarInternalPageAppearance, NavigationBarInternalPageVariation.HasbackgroundShadow> {
        var size =  NavigationBarInternalPageAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.shadow = ShadowToken.downSoftM
    
        return .init(
            name: "hasBackground.shadow",
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

public extension GeneralAppearanceVariation<NavigationBarInternalPage, NavigationBarInternalPageAppearance, NavigationBarInternalPageVariation.HasbackgroundRounded> {
    
    var rounded: ComponentAppearanceVariation<NavigationBarInternalPage, NavigationBarInternalPageAppearance> {
        var size =  NavigationBarInternalPageAnySize(size: appearance.size)
        size.bottomShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "hasBackground.rounded",
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

public extension GeneralAppearanceVariation<NavigationBarInternalPage, NavigationBarInternalPageAppearance, NavigationBarInternalPageVariation.HasbackgroundShadow> {
    
    var rounded: ComponentAppearanceVariation<NavigationBarInternalPage, NavigationBarInternalPageAppearance> {
        var size =  NavigationBarInternalPageAnySize(size: appearance.size)
        size.bottomShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "hasBackground.shadow.rounded",
            appearance: appearance
        )
    }
    
    var shadow: GeneralAppearanceVariation<NavigationBarInternalPage, NavigationBarInternalPageAppearance, NavigationBarInternalPageVariation.HasbackgroundShadow> {
        var size =  NavigationBarInternalPageAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.shadow = ShadowToken.downSoftM
    
        return .init(
            name: "hasBackground.shadow",
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

public extension GeneralAppearanceVariation<NavigationBarInternalPage, NavigationBarInternalPageAppearance, NavigationBarInternalPageVariation.HasbackgroundShadowRounded> {
    
    var rounded: ComponentAppearanceVariation<NavigationBarInternalPage, NavigationBarInternalPageAppearance> {
        var size =  NavigationBarInternalPageAnySize(size: appearance.size)
        size.bottomShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "hasBackground.shadow.rounded",
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

public extension GeneralAppearanceVariation<NavigationBarInternalPage, NavigationBarInternalPageAppearance, NavigationBarInternalPageVariation.Nobackground> {
    
    var noBackground: GeneralAppearanceVariation<NavigationBarInternalPage, NavigationBarInternalPageAppearance, NavigationBarInternalPageVariation.Nobackground> {
        var size =  NavigationBarInternalPageAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.backgroundColor = ColorToken.surfaceDefaultClear
    
        return .init(
            name: "noBackground",
            appearance: appearance
        )
    }
    
    var rounded: ComponentAppearanceVariation<NavigationBarInternalPage, NavigationBarInternalPageAppearance> {
        var size =  NavigationBarInternalPageAnySize(size: appearance.size)
        size.bottomShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "noBackground.rounded",
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

public extension GeneralAppearanceVariation<NavigationBarInternalPage, NavigationBarInternalPageAppearance, NavigationBarInternalPageVariation.NobackgroundRounded> {
    
    var rounded: ComponentAppearanceVariation<NavigationBarInternalPage, NavigationBarInternalPageAppearance> {
        var size =  NavigationBarInternalPageAnySize(size: appearance.size)
        size.bottomShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "noBackground.rounded",
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


public extension ComponentAppearanceVariation<NavigationBarInternalPage, NavigationBarInternalPageAppearance> {
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

private extension NavigationBarInternalPageAppearance {
    
}
