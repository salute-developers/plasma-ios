import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<List, ListAppearance, ListVariation.M> {
    
    var hasBackground: ComponentAppearanceVariation<List, ListAppearance> {
        var size =  ListAnySize(size: appearance.size)
        size.paddingBottom = CGFloat(8.0)
        size.paddingEnd = CGFloat(16.0)
        size.paddingStart = CGFloat(16.0)
        size.paddingTop = CGFloat(8.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXl.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultTransparentPrimary), values: [])
        appearance.listItemAppearance = ListItem.m.appearance
    
        return .init(
            name: "m.hasBackground",
            appearance: appearance
        )
    }
    
    var m: GeneralAppearanceVariation<List, ListAppearance, ListVariation.M> {
        var size =  ListAnySize(size: appearance.size)
        size.gap = CGFloat(8.0)

        var appearance = appearance
        appearance.size = size
        appearance.listItemAppearance = ListItem.m.appearance
    
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    var noBackground: GeneralAppearanceVariation<List, ListAppearance, ListVariation.MNobackground> {
        var size =  ListAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.noBackground",
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

public extension GeneralAppearanceVariation<List, ListAppearance, ListVariation.MHasbackground> {
    
    var hasBackground: ComponentAppearanceVariation<List, ListAppearance> {
        var size =  ListAnySize(size: appearance.size)
        size.paddingBottom = CGFloat(8.0)
        size.paddingEnd = CGFloat(16.0)
        size.paddingStart = CGFloat(16.0)
        size.paddingTop = CGFloat(8.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXl.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultTransparentPrimary), values: [])
        appearance.listItemAppearance = ListItem.m.appearance
    
        return .init(
            name: "m.hasBackground",
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

public extension GeneralAppearanceVariation<List, ListAppearance, ListVariation.MNobackground> {
    
    var hasItemBackground: ComponentAppearanceVariation<List, ListAppearance> {
        var size =  ListAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.listItemAppearance = ListItem.m.hasBackground.appearance
    
        return .init(
            name: "m.noBackground.hasItemBackground",
            appearance: appearance
        )
    }
    
    var noBackground: GeneralAppearanceVariation<List, ListAppearance, ListVariation.MNobackground> {
        var size =  ListAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.noBackground",
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

public extension GeneralAppearanceVariation<List, ListAppearance, ListVariation.MNobackgroundHasitembackground> {
    
    var hasItemBackground: ComponentAppearanceVariation<List, ListAppearance> {
        var size =  ListAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.listItemAppearance = ListItem.m.hasBackground.appearance
    
        return .init(
            name: "m.noBackground.hasItemBackground",
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

public extension GeneralAppearanceVariation<List, ListAppearance, ListVariation.S> {
    
    var hasBackground: ComponentAppearanceVariation<List, ListAppearance> {
        var size =  ListAnySize(size: appearance.size)
        size.paddingBottom = CGFloat(8.0)
        size.paddingEnd = CGFloat(16.0)
        size.paddingStart = CGFloat(16.0)
        size.paddingTop = CGFloat(8.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXl.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultTransparentPrimary), values: [])
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
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXl.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultTransparentPrimary), values: [])
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

