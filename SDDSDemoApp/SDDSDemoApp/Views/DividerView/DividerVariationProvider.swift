import Foundation
import SDDSComponents
import SDDSservTheme

final class DividerVariationProvider: VariationProvider {
    typealias Appearance = DividerAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<DividerAppearance>] {
        theme.dividerVariations
    }
    
    var defaultValue: DividerAppearance {
        DividerAppearance.defaultValue
    }
}


