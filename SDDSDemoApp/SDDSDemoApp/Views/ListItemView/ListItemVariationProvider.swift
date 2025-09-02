import Foundation
import SDDSComponents
import SDDSservTheme

public enum ListItemLayout: String, CaseIterable {
    case normal
    case tight
}

final class ListItemVariationProvider: VariationProvider {
    typealias Appearance = ListItemAppearance
    
    var theme: Theme
    var layout: ListItemLayout
    
    init(theme: Theme = .sdddsServTheme, layout: ListItemLayout = .normal) {
        self.theme = theme
        self.layout = layout
    }

    var variations: [Variation<ListItemAppearance>] {
        switch layout {
        case .normal:
            theme.listItemNormalVariations
        case .tight:
            theme.listItemTightVariations
        }
    }
    
    var defaultValue: ListItemAppearance {
        ListItemAppearance.defaultValue
    }
} 
