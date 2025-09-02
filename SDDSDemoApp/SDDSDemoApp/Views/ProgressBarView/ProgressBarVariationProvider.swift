import Foundation
import SDDSComponents
import SDDSservTheme

final class ProgressBarVariationProvider: VariationProvider {
    typealias Appearance = ProgressBarAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<ProgressBarAppearance>] {
        theme.progressBarVariations
    }
    
    var defaultValue: ProgressBarAppearance {
        ProgressBarAppearance.defaultValue
    }
}
