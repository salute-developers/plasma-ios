import Foundation
import SDDSComponents
import SDDSServTheme

final class ListVariationProvider: VariationProvider {
    typealias Appearance = ListAppearance
    
    var theme: Theme
    var layout: ListItemLayout
    
    init(theme: Theme = .sdddsServTheme, layout: ListItemLayout = .listItemNormal) {
        self.theme = theme
        self.layout = layout
    }

    var variations: [Variation<ListAppearance>] {
        switch layout {
        case .listItemNormal:
            theme.listNormalVariations
        case .listItemTight:
            theme.listTightVariations
        case .listItem:
            theme.listVariations
        }
    }
    
    var defaultValue: ListAppearance {
        ListAppearance.defaultValue
    }
} 
