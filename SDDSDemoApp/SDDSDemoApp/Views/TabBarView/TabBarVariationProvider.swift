import Foundation
import SDDSComponents
import SDDSServTheme

enum TabBarType: String, CaseIterable {
    case solid = "TabBar Solid"
    case clear = "TabBar Clear"
    case hasLabelClear = "TabBar Has Label Clear"
    case hasLabelSolid = "TabBar Has Label Solid"
}

final class TabBarVariationProvider: VariationProvider {
    typealias Appearance = TabBarAppearance
    
    var theme: Theme
    var tabBarType: TabBarType
    
    init(theme: Theme = .sdddsServTheme, tabBarType: TabBarType) {
        self.theme = theme
        self.tabBarType = tabBarType
    }
    
    var variations: [Variation<TabBarAppearance>] {
        switch tabBarType {
        case .solid:
            theme.tabBarSolidVariations
        case .clear:
            theme.tabBarClearVariations
        case .hasLabelClear:
            theme.tabBarHasLabelClearVariations
        case .hasLabelSolid:
            theme.tabBarHasLabelSolidVariations
        }
    }
    
    var defaultValue: TabBarAppearance {
        TabBarAppearance.defaultValue
    }
}
