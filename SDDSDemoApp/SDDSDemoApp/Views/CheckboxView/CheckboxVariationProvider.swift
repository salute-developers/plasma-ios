import Foundation
import SDDSComponents
import SDDSservTheme

final class CheckboxVariationProvider: VariationProvider {
    typealias Appearance = CheckboxAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<CheckboxAppearance>] {
        theme.checkboxVariations
    }
    
    var defaultValue: CheckboxAppearance {
        CheckboxAppearance.defaultValue
    }
}
