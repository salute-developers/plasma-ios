import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<Overlay, OverlayAppearance, OverlayVariation.Default> {
    
    var `default`: ComponentAppearanceVariation<Overlay, OverlayAppearance> {
        var size =  OverlayAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.backgroundColor = ColorToken.overlayDefaultSoft
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
