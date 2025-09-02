import Foundation
import SDDSComponents
import SDDSservTheme

final class CellVariationProvider: VariationProvider {
    typealias Appearance = CellAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<CellAppearance>] {
        theme.cellVariations
    }
    
    var defaultValue: CellAppearance {
        CellAppearance.defaultValue
    }
}
