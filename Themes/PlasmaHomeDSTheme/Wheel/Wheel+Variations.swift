import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<Wheel, WheelAppearance, WheelVariation.H1> {
    
    var centerAlign: ComponentAppearanceVariation<Wheel, WheelAppearance> {
        var size =  WheelAnySize(size: appearance.size)
        size.itemAlignment = WheelItemAlignment.center

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "h1.centerAlign",
            appearance: appearance
        )
    }
    
    var h1: GeneralAppearanceVariation<Wheel, WheelAppearance, WheelVariation.H1> {
        var size =  WheelAnySize(size: appearance.size)
        size.descriptionPadding = CGFloat(8.0)
        size.itemAlignment = WheelItemAlignment.start
        size.itemMinSpacing = CGFloat(20.0)
        size.itemTextAfterPadding = CGFloat(2.0)
        size.separatorSpacing = CGFloat(40.0)

        var appearance = appearance
        appearance.size = size
        appearance.descriptionTypography = WheelTypography(h1: AdaptiveTypographyToken.bodySBold.typography).asContainer
        appearance.itemTextAfterTypography = WheelTypography(h1: AdaptiveTypographyToken.headerH1Bold.typography).asContainer
        appearance.itemTextTypography = WheelTypography(h1: AdaptiveTypographyToken.headerH1Bold.typography).asContainer
    
        return .init(
            name: "h1",
            appearance: appearance
        )
    }
    
    var leftAlign: ComponentAppearanceVariation<Wheel, WheelAppearance> {
        var size =  WheelAnySize(size: appearance.size)
        size.itemAlignment = WheelItemAlignment.start

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "h1.leftAlign",
            appearance: appearance
        )
    }
    
    var mixedAlign: ComponentAppearanceVariation<Wheel, WheelAppearance> {
        var size =  WheelAnySize(size: appearance.size)
        size.itemAlignment = WheelItemAlignment.mixed

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "h1.mixedAlign",
            appearance: appearance
        )
    }
    
    var rightAlign: ComponentAppearanceVariation<Wheel, WheelAppearance> {
        var size =  WheelAnySize(size: appearance.size)
        size.itemAlignment = WheelItemAlignment.end

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "h1.rightAlign",
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

public extension GeneralAppearanceVariation<Wheel, WheelAppearance, WheelVariation.H1Centeralign> {
    
    var centerAlign: ComponentAppearanceVariation<Wheel, WheelAppearance> {
        var size =  WheelAnySize(size: appearance.size)
        size.itemAlignment = WheelItemAlignment.center

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "h1.centerAlign",
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

public extension GeneralAppearanceVariation<Wheel, WheelAppearance, WheelVariation.H1Leftalign> {
    
    var leftAlign: ComponentAppearanceVariation<Wheel, WheelAppearance> {
        var size =  WheelAnySize(size: appearance.size)
        size.itemAlignment = WheelItemAlignment.start

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "h1.leftAlign",
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

public extension GeneralAppearanceVariation<Wheel, WheelAppearance, WheelVariation.H1Mixedalign> {
    
    var mixedAlign: ComponentAppearanceVariation<Wheel, WheelAppearance> {
        var size =  WheelAnySize(size: appearance.size)
        size.itemAlignment = WheelItemAlignment.mixed

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "h1.mixedAlign",
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

public extension GeneralAppearanceVariation<Wheel, WheelAppearance, WheelVariation.H1Rightalign> {
    
    var rightAlign: ComponentAppearanceVariation<Wheel, WheelAppearance> {
        var size =  WheelAnySize(size: appearance.size)
        size.itemAlignment = WheelItemAlignment.end

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "h1.rightAlign",
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


public extension ComponentAppearanceVariation<Wheel, WheelAppearance> {
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

private extension WheelAppearance {
    
}
