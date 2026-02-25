import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<List, ListAppearance, ListVariation.S> {
    
    var hasBackground: ComponentAppearanceVariation<List, ListAppearance> {
        var size =  ListAnySize(size: appearance.size)
        size.paddingBottom = CGFloat(8.0)
        size.paddingEnd = CGFloat(16.0)
        size.paddingStart = CGFloat(16.0)
        size.paddingTop = CGFloat(8.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXxl.cornerRadius-4.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPrimary
        appearance.listItemAppearance = ListItem.s.appearance
    
        return .init(
            name: "s.hasBackground",
            appearance: appearance
        )
    }
    
    var noBackground: GeneralAppearanceVariation<List, ListAppearance, ListVariation.SNobackground> {
        var size =  ListAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.noBackground",
            appearance: appearance
        )
    }
    
    var s: GeneralAppearanceVariation<List, ListAppearance, ListVariation.S> {
        var size =  ListAnySize(size: appearance.size)
        size.gap = CGFloat(8.0)

        var appearance = appearance
        appearance.size = size
        appearance.listItemAppearance = ListItem.s.appearance
    
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

public extension GeneralAppearanceVariation<List, ListAppearance, ListVariation.SHasbackground> {
    
    var hasBackground: ComponentAppearanceVariation<List, ListAppearance> {
        var size =  ListAnySize(size: appearance.size)
        size.paddingBottom = CGFloat(8.0)
        size.paddingEnd = CGFloat(16.0)
        size.paddingStart = CGFloat(16.0)
        size.paddingTop = CGFloat(8.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXxl.cornerRadius-4.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPrimary
        appearance.listItemAppearance = ListItem.s.appearance
    
        return .init(
            name: "s.hasBackground",
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

public extension GeneralAppearanceVariation<List, ListAppearance, ListVariation.SNobackground> {
    
    var hasItemBackground: ComponentAppearanceVariation<List, ListAppearance> {
        var size =  ListAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.listItemAppearance = ListItem.s.hasBackground.appearance
    
        return .init(
            name: "s.noBackground.hasItemBackground",
            appearance: appearance
        )
    }
    
    var noBackground: GeneralAppearanceVariation<List, ListAppearance, ListVariation.SNobackground> {
        var size =  ListAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.noBackground",
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

public extension GeneralAppearanceVariation<List, ListAppearance, ListVariation.SNobackgroundHasitembackground> {
    
    var hasItemBackground: ComponentAppearanceVariation<List, ListAppearance> {
        var size =  ListAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.listItemAppearance = ListItem.s.hasBackground.appearance
    
        return .init(
            name: "s.noBackground.hasItemBackground",
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


public extension ComponentAppearanceVariation<List, ListAppearance> {
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

private extension ListAppearance {
    
}
