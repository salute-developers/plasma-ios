import Foundation
import SDDSComponents

final class ImageVariationProvider: VariationProvider {
    typealias Appearance = ImageAppearance

    var theme: Theme

    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }

    var variations: [Variation<ImageAppearance>] {
        theme.imageVariations
    }

    var defaultValue: ImageAppearance {
        ImageAppearance.defaultValue
    }
}
