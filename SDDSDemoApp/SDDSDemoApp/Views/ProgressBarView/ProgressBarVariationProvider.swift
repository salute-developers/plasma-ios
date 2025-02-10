import Foundation
import SDDSComponents
import SDDSServTheme

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
        variations.first?.appearance ?? ProgressBar.default.appearance
    }
}
