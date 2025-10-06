import Foundation
import SDDSComponents
import SDDSServTheme

public enum ListItemLayout: String, CaseIterable {
    case listItemNormal
    case listItemTight
    case listItem
}

final class ListItemVariationProvider: VariationProvider {
    typealias Appearance = ListItemAppearance
    
    var theme: Theme
    var layout: ListItemLayout
    
    init(theme: Theme = .sdddsServTheme, layout: ListItemLayout = .listItemNormal) {
        self.theme = theme
        self.layout = layout
    }

    var variations: [Variation<ListItemAppearance>] {
        switch layout {
        case .listItemNormal:
            theme.listItemNormalVariations
        case .listItemTight:
            theme.listItemTightVariations
        case .listItem:
            theme.listItemVariations
        }
    }
    
    var defaultValue: ListItemAppearance {
        ListItemAppearance.defaultValue
    }
} 
