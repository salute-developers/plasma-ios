import Foundation
import SDDSComponents
import SDDSServTheme

enum SDDSTabItemType: String, CaseIterable {
    case tabItemDefault = "Tab Item Default"
    case tabItemHeader = "Tab Item Header"
    case iconTabItem = "Icon Tab Item"
}

final class TabItemVariationProvider: VariationProvider {
    typealias Appearance = TabItemAppearance
    
    var tabItemType: SDDSTabItemType
    var theme: Theme
    
    init(tabItemType: SDDSTabItemType, theme: Theme = .sdddsServTheme) {
        self.tabItemType = tabItemType
        self.theme = theme
    }
    
    var variations: [Variation<TabItemAppearance>] {
        switch tabItemType {
        case .tabItemDefault:
            theme.tabItemDefaultVariations
        case .tabItemHeader:
            theme.tabItemHeaderVariations
        case .iconTabItem:
            theme.iconTabItemVariations
        }
    }
    
    var defaultValue: TabItemAppearance {
        TabItemAppearance.defaultValue
    }
}
