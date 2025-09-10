import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<Card, CardAppearance, CardVariation.Default> {
    
    var `default`: ComponentAppearanceVariation<Card, CardAppearance> {
        var size =  CardAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
    
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


public extension ComponentAppearanceVariation<Card, CardAppearance> {
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

private extension CardAppearance {
    
}
