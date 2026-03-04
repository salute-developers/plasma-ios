import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<Overlay, OverlayAppearance, OverlayVariation.Default> {
    
    var `default`: ComponentAppearanceVariation<Overlay, OverlayAppearance> {
        var size =  OverlayAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.backgroundColor = .color(.overlayOnDarkSoft)
        appearance.blurRadius = CGFloat(16.0)
    
        return .init(
            name: "default",
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

public extension GeneralAppearanceVariation<Overlay, OverlayAppearance, OverlayVariation.Directionbottom> {
    
    var directionBottom: ComponentAppearanceVariation<Overlay, OverlayAppearance> {
        var size =  OverlayAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.backgroundColor = .gradient(GradientToken.overlayDefaultGradientDown)
    
        return .init(
            name: "directionBottom",
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

public extension GeneralAppearanceVariation<Overlay, OverlayAppearance, OverlayVariation.Directiontop> {
    
    var directionTop: ComponentAppearanceVariation<Overlay, OverlayAppearance> {
        var size =  OverlayAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.backgroundColor = .gradient(GradientToken.overlayDefaultGradientUp)
    
        return .init(
            name: "directionTop",
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


public extension ComponentAppearanceVariation<Overlay, OverlayAppearance> {
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

private extension OverlayAppearance {
    
}
