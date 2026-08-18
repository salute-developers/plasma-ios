import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct Carousel {
    public static var buttonsPlacementInner: ComponentAppearanceVariation<Carousel, CarouselAppearance> {
        var appearance = CarouselAppearance.base
        appearance.size = CarouselSize.buttonsPlacementInner

        return .init(
            name: "buttonsPlacementInner",
            appearance: appearance
        )
    }
    public static var buttonsPlacementOuter: ComponentAppearanceVariation<Carousel, CarouselAppearance> {
        var appearance = CarouselAppearance.base
        appearance.size = CarouselSize.buttonsPlacementOuter

        return .init(
            name: "buttonsPlacementOuter",
            appearance: appearance
        )
    }
    
    public static var all: [Variation<CarouselAppearance>] {
        [
            Carousel.buttonsPlacementInner.variation,
            Carousel.buttonsPlacementOuter.variation,
        ]
    }
}

public struct CarouselVariation {
    public struct Buttonsplacementinner {}
    public struct Buttonsplacementouter {}
}

private extension CarouselAppearance {
    static var base: CarouselAppearance {
        var appearance = CarouselAppearance()
        appearance.nextButtonIcon = Asset.chevronRight24.image
        appearance.prevButtonIcon = Asset.chevronLeft24.image
        return appearance
    }
}
