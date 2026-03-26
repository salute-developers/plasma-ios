import Foundation
import SDDSComponents

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
