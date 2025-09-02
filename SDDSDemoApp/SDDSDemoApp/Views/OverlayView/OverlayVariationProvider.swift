import Foundation
import SDDSComponents
import SDDSservTheme

final class OverlayVariationProvider: VariationProvider {
    typealias Appearance = OverlayAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }

    var variations: [Variation<OverlayAppearance>] {
        theme.overlayVariations
    }
    
    var defaultValue: OverlayAppearance {
        OverlayAppearance.defaultValue
    }
}
