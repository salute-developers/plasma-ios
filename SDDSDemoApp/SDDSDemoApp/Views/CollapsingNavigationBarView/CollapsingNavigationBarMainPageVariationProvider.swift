import Foundation
import SDDSComponents

final class CollapsingNavigationBarMainPageVariationProvider: VariationProvider {
    typealias Appearance = CollapsingNavigationBarAppearance

    var theme: Theme

    init(theme: Theme = .plasmaHomeDSTheme) {
        self.theme = theme
    }

    var variations: [Variation<CollapsingNavigationBarAppearance>] {
        theme.collapsingNavigationBarMainPageVariations
    }

    var defaultValue: CollapsingNavigationBarAppearance {
        CollapsingNavigationBarAppearance()
    }
}
