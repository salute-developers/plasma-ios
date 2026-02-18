import Foundation
import SDDSComponents

// swiftlint:disable:next type_name
final class CollapsingNavigationBarInternalPageVariationProvider: VariationProvider {
    typealias Appearance = CollapsingNavigationBarAppearance

    var theme: Theme

    init(theme: Theme = .plasmaHomeDSTheme) {
        self.theme = theme
    }

    var variations: [Variation<CollapsingNavigationBarAppearance>] {
        theme.collapsingNavigationBarInternalPageVariations
    }

    var defaultValue: CollapsingNavigationBarAppearance {
        CollapsingNavigationBarAppearance()
    }
}
