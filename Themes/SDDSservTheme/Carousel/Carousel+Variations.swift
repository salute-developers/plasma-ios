import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<Carousel, CarouselAppearance, CarouselVariation.Buttonsplacementinner> {
    
    var buttonsPlacementInner: ComponentAppearanceVariation<Carousel, CarouselAppearance> {
        var size =  CarouselAnySize(size: appearance.size)
        size.buttonsPlacement = CarouselButtonsPlacement.inner

        var appearance = appearance
        appearance.size = size
        appearance.nextButtonAppearance = IconButton.s.pilled.secondary.appearance
        appearance.prevButtonAppearance = IconButton.s.pilled.secondary.appearance
    
        return .init(
            name: "buttonsPlacementInner",
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

public extension GeneralAppearanceVariation<Carousel, CarouselAppearance, CarouselVariation.Buttonsplacementouter> {
    
    var buttonsPlacementOuter: ComponentAppearanceVariation<Carousel, CarouselAppearance> {
        var size =  CarouselAnySize(size: appearance.size)
        size.buttonsPlacement = CarouselButtonsPlacement.outer

        var appearance = appearance
        appearance.size = size
        appearance.nextButtonAppearance = IconButton.s.pilled.clear.appearance
        appearance.prevButtonAppearance = IconButton.s.pilled.clear.appearance
    
        return .init(
            name: "buttonsPlacementOuter",
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


public extension ComponentAppearanceVariation<Carousel, CarouselAppearance> {
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

private extension CarouselAppearance {
    
}
