import Foundation
import SDDSComponents
import SDDSservTheme

final class PopoverVariationProvider: VariationProvider {
    typealias Appearance = PopoverAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<PopoverAppearance>] {
        theme.popoverVariations
    }
    
    var defaultValue: PopoverAppearance {
        variations.first?.appearance ?? PopoverAppearance()
    }
} 
