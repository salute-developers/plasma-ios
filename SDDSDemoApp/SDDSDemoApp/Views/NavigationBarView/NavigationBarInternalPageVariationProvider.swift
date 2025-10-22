import Foundation
import SDDSComponents

final class NavigationBarInternalPageVariationProvider: VariationProvider {
    typealias Appearance = NavigationBarInternalPageAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<NavigationBarInternalPageAppearance>] {
        theme.navigationBarInternalPageVariations
    }
    
    var defaultValue: NavigationBarInternalPageAppearance {
        NavigationBarInternalPageAppearance()
    }
}

