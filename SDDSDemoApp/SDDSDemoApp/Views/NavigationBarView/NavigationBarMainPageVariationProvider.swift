import Foundation
import SDDSComponents

final class NavigationBarMainPageVariationProvider: VariationProvider {
    typealias Appearance = NavigationBarMainPageAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<NavigationBarMainPageAppearance>] {
        theme.navigationBarMainPageVariations
    }
    
    var defaultValue: NavigationBarMainPageAppearance {
        NavigationBarMainPageAppearance()
    }
}

