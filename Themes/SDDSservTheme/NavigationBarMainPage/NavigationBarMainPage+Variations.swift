import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<NavigationBarMainPage, NavigationBarMainPageAppearance, NavigationBarMainPageVariation.Hasbackground> {
    
    var hasBackground: GeneralAppearanceVariation<NavigationBarMainPage, NavigationBarMainPageAppearance, NavigationBarMainPageVariation.Hasbackground> {
        var size =  NavigationBarMainPageAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidCard
    
        return .init(
            name: "hasBackground",
            appearance: appearance
        )
    }
    
    var rounded: ComponentAppearanceVariation<NavigationBarMainPage, NavigationBarMainPageAppearance> {
        var size =  NavigationBarMainPageAnySize(size: appearance.size)
        size.bottomShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "hasBackground.rounded",
            appearance: appearance
        )
    }
    
    var shadow: GeneralAppearanceVariation<NavigationBarMainPage, NavigationBarMainPageAppearance, NavigationBarMainPageVariation.HasbackgroundShadow> {
        var size =  NavigationBarMainPageAnySize(size: appearance.size)

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

public extension GeneralAppearanceVariation<NavigationBarMainPage, NavigationBarMainPageAppearance, NavigationBarMainPageVariation.HasbackgroundRounded> {
    
    var rounded: ComponentAppearanceVariation<NavigationBarMainPage, NavigationBarMainPageAppearance> {
        var size =  NavigationBarMainPageAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<NavigationBarMainPage, NavigationBarMainPageAppearance, NavigationBarMainPageVariation.HasbackgroundShadow> {
    
    var rounded: ComponentAppearanceVariation<NavigationBarMainPage, NavigationBarMainPageAppearance> {
        var size =  NavigationBarMainPageAnySize(size: appearance.size)
        size.bottomShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "hasBackground.shadow.rounded",
            appearance: appearance
        )
    }
    
    var shadow: GeneralAppearanceVariation<NavigationBarMainPage, NavigationBarMainPageAppearance, NavigationBarMainPageVariation.HasbackgroundShadow> {
        var size =  NavigationBarMainPageAnySize(size: appearance.size)

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

public extension GeneralAppearanceVariation<NavigationBarMainPage, NavigationBarMainPageAppearance, NavigationBarMainPageVariation.HasbackgroundShadowRounded> {
    
    var rounded: ComponentAppearanceVariation<NavigationBarMainPage, NavigationBarMainPageAppearance> {
        var size =  NavigationBarMainPageAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<NavigationBarMainPage, NavigationBarMainPageAppearance, NavigationBarMainPageVariation.Nobackground> {
    
    var noBackground: GeneralAppearanceVariation<NavigationBarMainPage, NavigationBarMainPageAppearance, NavigationBarMainPageVariation.Nobackground> {
        var size =  NavigationBarMainPageAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.backgroundColor = ColorToken.surfaceDefaultClear
    
        return .init(
            name: "noBackground",
            appearance: appearance
        )
    }
    
    var rounded: ComponentAppearanceVariation<NavigationBarMainPage, NavigationBarMainPageAppearance> {
        var size =  NavigationBarMainPageAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<NavigationBarMainPage, NavigationBarMainPageAppearance, NavigationBarMainPageVariation.NobackgroundRounded> {
    
    var rounded: ComponentAppearanceVariation<NavigationBarMainPage, NavigationBarMainPageAppearance> {
        var size =  NavigationBarMainPageAnySize(size: appearance.size)
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


public extension ComponentAppearanceVariation<NavigationBarMainPage, NavigationBarMainPageAppearance> {
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

private extension NavigationBarMainPageAppearance {
    
}
