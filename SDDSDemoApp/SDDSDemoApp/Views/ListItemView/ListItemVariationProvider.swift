import Foundation
import SDDSComponents
import SDDSServTheme

public enum ListItemLayout: String, CaseIterable {
    case listItemNormal
    case listItemTight
    case listItem
    case listNumbered
    case listNumberedItem
    
    static var listLayouts: [ListItemLayout] {
        [.listItemNormal, .listItemTight, .listItem, .listNumbered]
    }
    
    static var itemLayouts: [ListItemLayout] {
        [.listItemNormal, .listItemTight, .listItem, .listNumberedItem]
    }
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
        case .listNumbered:
            theme.listItemVariations
        case .listNumberedItem:
            theme.listNumberedItemVariations
        }
    }
    
    var defaultValue: ListItemAppearance {
        ListItemAppearance.defaultValue
    }
} 
