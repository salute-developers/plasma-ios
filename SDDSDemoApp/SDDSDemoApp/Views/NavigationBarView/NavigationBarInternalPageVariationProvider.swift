import Foundation
import SDDSComponents

final class NavigationBarInternalPageVariationProvider: VariationProvider {
    typealias Appearance = NavigationBarAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<NavigationBarAppearance>] {
        theme.navigationBarInternalPageVariations
    }
    
    var defaultValue: NavigationBarAppearance {
        NavigationBarAppearance()
    }
}

