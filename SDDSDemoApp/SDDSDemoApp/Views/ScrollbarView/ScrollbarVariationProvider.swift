import Foundation
import SDDSComponents
import SDDSservTheme

final class ScrollbarVariationProvider: VariationProvider {
    typealias Appearance = ScrollbarAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<ScrollbarAppearance>] {
        theme.scrollbarVariations
    }
    
    var defaultValue: ScrollbarAppearance {
        ScrollbarAppearance.defaultValue
    }
} 
