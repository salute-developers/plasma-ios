import Foundation
import SDDSComponents
import SDDSServTheme

final class SpinnerVariationProvider: VariationProvider {
    typealias Appearance = SpinnerAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<SpinnerAppearance>] {
        theme.spinnerVariations
    }
    
    var defaultValue: SpinnerAppearance {
        SpinnerAppearance.defaultValue
    }
} 
