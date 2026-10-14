import Foundation
import SDDSComponents

final class NavigationBarMainPageVariationProvider: VariationProvider {
    typealias Appearance = NavigationBarAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<NavigationBarAppearance>] {
        theme.navigationBarMainPageVariations
    }
    
    var defaultValue: NavigationBarAppearance {
        NavigationBarAppearance()
    }
}

