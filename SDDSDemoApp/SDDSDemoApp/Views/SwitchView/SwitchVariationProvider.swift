import Foundation
import SDDSComponents
import SDDSServTheme

final class SwitchVariationProvider: VariationProvider {
    typealias Appearance = SwitchAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<SwitchAppearance>] {
        theme.switchVariations
    }
    
    var defaultValue: SwitchAppearance {
        SwitchAppearance.defaultValue
    }
}
