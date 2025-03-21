import Foundation
import SDDSComponents
import SDDSServTheme

final class CounterVariationProvider: VariationProvider {
    typealias Appearance = CounterAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<CounterAppearance>] {
        theme.counterVariations
    }
    
    var defaultValue: CounterAppearance {
        CounterAppearance.defaultValue
    }
}
