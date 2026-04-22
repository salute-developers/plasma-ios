import Foundation
import SDDSComponents

final class CarouselVariationProvider: VariationProvider {
    typealias Appearance = CarouselAppearance

    var theme: Theme

    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }

    var variations: [Variation<CarouselAppearance>] {
        theme.carouselVariations
    }

    var defaultValue: CarouselAppearance {
        CarouselAppearance.defaultValue
    }
}
