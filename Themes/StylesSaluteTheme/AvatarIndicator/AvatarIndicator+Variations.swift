import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<AvatarIndicator, IndicatorAppearance, AvatarIndicatorVariation.L> {
    
    var l: ComponentAppearanceVariation<AvatarIndicator, IndicatorAppearance> {
        var size =  AvatarIndicatorAnySize(size: appearance.size)
        size.height = CGFloat(12.0)
        size.width = CGFloat(12.0)

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

public extension GeneralAppearanceVariation<AvatarIndicator, IndicatorAppearance, AvatarIndicatorVariation.M> {
    
    var m: ComponentAppearanceVariation<AvatarIndicator, IndicatorAppearance> {
        var size =  AvatarIndicatorAnySize(size: appearance.size)
        size.height = CGFloat(8.0)
        size.width = CGFloat(8.0)

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

public extension GeneralAppearanceVariation<AvatarIndicator, IndicatorAppearance, AvatarIndicatorVariation.S> {
    
    var s: ComponentAppearanceVariation<AvatarIndicator, IndicatorAppearance> {
        var size =  AvatarIndicatorAnySize(size: appearance.size)
        size.height = CGFloat(6.0)
        size.width = CGFloat(6.0)

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


public extension ComponentAppearanceVariation<AvatarIndicator, IndicatorAppearance> {
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

private extension IndicatorAppearance {
    
}

