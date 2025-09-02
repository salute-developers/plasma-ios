import Foundation
import SDDSComponents
import SDDSservTheme

final class CircularProgressBarVariationProvider: VariationProvider {
    typealias Appearance = CircularProgressBarAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<CircularProgressBarAppearance>] {
        theme.circularProgressBarVariations
    }
    
    var defaultValue: CircularProgressBarAppearance {
        CircularProgressBarAppearance.defaultValue
    }
}
