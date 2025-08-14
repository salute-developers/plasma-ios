import Foundation
import SDDSComponents
import SDDSServTheme

final class LoaderVariationProvider: VariationProvider {
    typealias Appearance = LoaderAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<LoaderAppearance>] {
        theme.loaderVariations
    }
    
    var defaultValue: LoaderAppearance {
        LoaderAppearance.defaultValue
    }
}
