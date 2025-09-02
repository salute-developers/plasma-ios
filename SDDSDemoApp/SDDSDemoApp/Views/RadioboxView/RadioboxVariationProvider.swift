import Foundation
import SDDSComponents
import SDDSservTheme

final class RadioboxVariationProvider: VariationProvider {
    typealias Appearance = RadioboxAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<RadioboxAppearance>] {
        theme.radioboxVariations
    }
    
    var defaultValue: RadioboxAppearance {
        RadioboxAppearance.defaultValue
    }
}
