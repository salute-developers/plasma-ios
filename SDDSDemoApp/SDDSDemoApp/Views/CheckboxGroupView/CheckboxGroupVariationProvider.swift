import Foundation
import SDDSComponents
import SDDSServTheme

final class CheckboxGroupVariationProvider: VariationProvider {
    typealias Appearance = CheckboxGroupAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<CheckboxGroupAppearance>] {
        theme.checkboxGroupVariations
    }
    
    var defaultValue: CheckboxGroupAppearance {
        CheckboxGroupAppearance.defaultValue
    }
}
