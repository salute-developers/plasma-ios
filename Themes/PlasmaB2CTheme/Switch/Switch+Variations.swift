import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<Switch, SwitchAppearance, SwitchVariation.L> {
    
    var toggleS: ComponentAppearanceVariation<Switch, SwitchAppearance> {
        var size =  SwitchAnySize(size: appearance.size)
        size.toggleThumbHeight = CGFloat(16.0)
        size.toggleThumbWidth = CGFloat(16.0)
        size.toggleTrackHeight = CGFloat(20.0)
        size.toggleTrackWidth = CGFloat(32.0)
        size.verticalGap = CGFloat(0)
        size.width = CGFloat?(0)

        var appearance = appearance
        appearance.size = size
        appearance.tintColor = .clearColor
    
        return .init(
            name: "l.toggleS",
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

public extension GeneralAppearanceVariation<Switch, SwitchAppearance, SwitchVariation.LToggles> {
    
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

public extension GeneralAppearanceVariation<Switch, SwitchAppearance, SwitchVariation.M> {
    
    var toggleS: ComponentAppearanceVariation<Switch, SwitchAppearance> {
        var size =  SwitchAnySize(size: appearance.size)
        size.toggleThumbHeight = CGFloat(16.0)
        size.toggleThumbWidth = CGFloat(16.0)
        size.toggleTrackHeight = CGFloat(20.0)
        size.toggleTrackWidth = CGFloat(32.0)
        size.verticalGap = CGFloat(0)
        size.width = CGFloat?(0)

        var appearance = appearance
        appearance.size = size
        appearance.tintColor = .clearColor
    
        return .init(
            name: "m.toggleS",
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

public extension GeneralAppearanceVariation<Switch, SwitchAppearance, SwitchVariation.MToggles> {
    
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

public extension GeneralAppearanceVariation<Switch, SwitchAppearance, SwitchVariation.S> {
    
    var toggleS: ComponentAppearanceVariation<Switch, SwitchAppearance> {
        var size =  SwitchAnySize(size: appearance.size)
        size.toggleThumbHeight = CGFloat(16.0)
        size.toggleThumbWidth = CGFloat(16.0)
        size.toggleTrackHeight = CGFloat(20.0)
        size.toggleTrackWidth = CGFloat(32.0)
        size.verticalGap = CGFloat(0)
        size.width = CGFloat?(0)

        var appearance = appearance
        appearance.size = size
        appearance.tintColor = .clearColor
    
        return .init(
            name: "s.toggleS",
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

public extension GeneralAppearanceVariation<Switch, SwitchAppearance, SwitchVariation.SToggles> {
    
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


public extension ComponentAppearanceVariation<Switch, SwitchAppearance> {
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

private extension SwitchAppearance {
    
}
