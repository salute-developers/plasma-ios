import Foundation
import SDDSComponents
import SDDSServTheme

final class ChipVariationProvider: VariationProvider {
    typealias Appearance = ChipAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<ChipAppearance>] {
        theme.chipVariations
    }
    
    var defaultValue: ChipAppearance {
        variations.first?.appearance ?? Chip.m.default.appearance
    }
}
