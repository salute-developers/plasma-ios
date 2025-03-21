import Foundation
import SDDSComponents
import SDDSServTheme

final class ChipGroupVariationProvider: VariationProvider {
    typealias Appearance = ChipGroupAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<ChipGroupAppearance>] {
        theme.chipGroupVariations
    }
    
    var defaultValue: ChipGroupAppearance {
        ChipGroupAppearance.defaultValue
    }
}
