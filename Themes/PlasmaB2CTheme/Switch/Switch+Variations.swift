import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<Switch, SwitchAppearance, SwitchVariation.L> {
    
    var l: GeneralAppearanceVariation<Switch, SwitchAppearance, SwitchVariation.L> {
        var size =  SwitchAnySize(size: appearance.size)
        size.descriptionPadding = CGFloat(4.0)
        size.textPadding = CGFloat(12.0)
        size.toggleThumbHeight = CGFloat(24.0)
        size.toggleThumbWidth = CGFloat(24.0)
        size.toggleTrackHeight = CGFloat(28.0)
        size.toggleTrackWidth = CGFloat(44.0)
        size.verticalGap = CGFloat(0)
        size.width = CGFloat?(0)

        var appearance = appearance
        appearance.size = size
        appearance.subtitleTypography = SwitchTypography(l: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.tintColor = .clearColor
        appearance.titleTypography = SwitchTypography(l: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
    
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<Switch, SwitchAppearance, SwitchVariation.M> {
    
    var m: GeneralAppearanceVariation<Switch, SwitchAppearance, SwitchVariation.M> {
        var size =  SwitchAnySize(size: appearance.size)
        size.descriptionPadding = CGFloat(4.0)
        size.textPadding = CGFloat(12.0)
        size.toggleThumbHeight = CGFloat(24.0)
        size.toggleThumbWidth = CGFloat(24.0)
        size.toggleTrackHeight = CGFloat(28.0)
        size.toggleTrackWidth = CGFloat(44.0)
        size.verticalGap = CGFloat(0)
        size.width = CGFloat?(0)

        var appearance = appearance
        appearance.size = size
        appearance.subtitleTypography = SwitchTypography(m: AdaptiveTypographyToken.bodySNormal.typography).asContainer
        appearance.tintColor = .clearColor
        appearance.titleTypography = SwitchTypography(m: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
    
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<Switch, SwitchAppearance, SwitchVariation.S> {
    
    var s: GeneralAppearanceVariation<Switch, SwitchAppearance, SwitchVariation.S> {
        var size =  SwitchAnySize(size: appearance.size)
        size.descriptionPadding = CGFloat(4.0)
        size.textPadding = CGFloat(12.0)
        size.toggleThumbHeight = CGFloat(24.0)
        size.toggleThumbWidth = CGFloat(24.0)
        size.toggleTrackHeight = CGFloat(28.0)
        size.toggleTrackWidth = CGFloat(44.0)
        size.verticalGap = CGFloat(0)
        size.width = CGFloat?(0)

        var appearance = appearance
        appearance.size = size
        appearance.subtitleTypography = SwitchTypography(s: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.tintColor = .clearColor
        appearance.titleTypography = SwitchTypography(s: AdaptiveTypographyToken.bodySNormal.typography).asContainer
    
        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
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
