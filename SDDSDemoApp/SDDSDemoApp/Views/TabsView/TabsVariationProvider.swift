import Foundation
import SDDSComponents
import SDDSServTheme

enum SDDSTabsType: String, CaseIterable {
    case tabsDefault = "Tabs Default"
    case tabsHeader = "Tabs Header"
    case iconTabs = "Icon Tabs"
}

final class TabsVariationProvider: VariationProvider {
    typealias Appearance = TabsAppearance
    
    var tabsType: SDDSTabsType
    var theme: Theme
    
    init(tabsType: SDDSTabsType, theme: Theme = .sdddsServTheme) {
        self.tabsType = tabsType
        self.theme = theme
    }
    
    var variations: [Variation<TabsAppearance>] {
        switch tabsType {
        case .tabsDefault:
            TabsDefault.all
        case .tabsHeader:
            TabsHeader.all
        case .iconTabs:
            // TODO: После генерации темы заменить на IconTabs.all
            TabsDefault.all
        }
    }
    
    var defaultValue: TabsAppearance {
        TabsAppearance.defaultValue
    }
}

