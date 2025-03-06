import Foundation
import SDDSComponents
import SDDSServTheme

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
        variations.first?.appearance ?? Cell.m.appearance
    }
}
