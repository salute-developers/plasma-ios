import Foundation
import SDDSComponents

final class TooltipVariationProvider: VariationProvider {
    typealias Appearance = TooltipAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<TooltipAppearance>] {
        theme.tooltipVariations
    }
    
    var defaultValue: TooltipAppearance {
        variations.first?.appearance ?? TooltipAppearance()
    }
} 