import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<Popover, PopoverAppearance, PopoverVariation.M> {
    
    var m: ComponentAppearanceVariation<Popover, PopoverAppearance> {
        var size =  PopoverAnySize(size: appearance.size)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer
        size.tailPadding = CGFloat(20.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<PopoverAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<PopoverAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Popover, PopoverAppearance, PopoverVariation.S> {
    
    var s: ComponentAppearanceVariation<Popover, PopoverAppearance> {
        var size =  PopoverAnySize(size: appearance.size)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
        size.tailPadding = CGFloat(16.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<PopoverAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<PopoverAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}


public extension ComponentAppearanceVariation<Popover, PopoverAppearance> {
    var `default`: AppearanceVariation<PopoverAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<PopoverAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension PopoverAppearance {
    
    var `default`: PopoverAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidCard
        return appearance
    }
    
    var accent: PopoverAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultAccentMain
        return appearance
    }
    
}
