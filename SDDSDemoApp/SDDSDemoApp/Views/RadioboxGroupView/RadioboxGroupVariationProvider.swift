import Foundation
import SDDSComponents

final class RadioboxGroupVariationProvider: VariationProvider {
    typealias Appearance = RadioboxGroupAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<RadioboxGroupAppearance>] {
        theme.radioboxGroupVariations
    }
    
    var defaultValue: RadioboxGroupAppearance {
        RadioboxGroupAppearance.defaultValue
    }
}
