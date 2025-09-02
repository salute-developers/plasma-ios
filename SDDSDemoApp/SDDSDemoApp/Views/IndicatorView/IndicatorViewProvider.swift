import Foundation
import SDDSComponents
import SDDSservTheme

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
        IndicatorAppearance.defaultValue
    }
}
