import Foundation
import SDDSComponents
import SDDSServTheme

final class IndicatorVariationProvider: VariationProvider {
    typealias Appearance = IndicatorAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<IndicatorAppearance>] {
        theme.indicatorVariations
    }
    
    var defaultValue: IndicatorAppearance {
        variations.first?.appearance ?? Indicator.l.default.appearance
    }
}
