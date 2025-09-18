import Foundation
import SDDSComponents
import SDDSServTheme

enum TabBarIslandType: String, CaseIterable {
    case tabbar = "TabBar"
    case solid = "TabBar Island Solid"
    case clear = "TabBar Island Clear"
    case hasLabelClear = "TabBar Island Has Label Clear"
    case hasLabelSolid = "TabBar Island Has Label Solid"
}

final class TabBarIslandVariationProvider: VariationProvider {
    typealias Appearance = TabBarIslandAppearance
    
    var theme: Theme
    var tabBarIslandType: TabBarIslandType
    
    init(theme: Theme = .sdddsServTheme, tabBarIslandType: TabBarIslandType) {
        self.theme = theme
        self.tabBarIslandType = tabBarIslandType
    }
    
    var variations: [Variation<TabBarIslandAppearance>] {
        switch tabBarIslandType {
        case .tabbar:
            theme.tabBarVariations
        case .solid:
            theme.tabBarIslandSolidVariations
        case .clear:
            theme.tabBarIslandClearVariations
        case .hasLabelClear:
            theme.tabBarIslandHasLabelClearVariations
        case .hasLabelSolid:
            theme.tabBarIslandHasLabelSolidVariations
        }
    }
    
    var defaultValue: TabBarIslandAppearance {
        TabBarIslandAppearance.defaultValue
    }
}
