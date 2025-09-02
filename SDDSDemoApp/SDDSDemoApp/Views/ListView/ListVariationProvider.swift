import Foundation
import SDDSComponents
import SDDSservTheme

final class ListVariationProvider: VariationProvider {
    typealias Appearance = ListAppearance
    
    var theme: Theme
    var layout: ListItemLayout
    
    init(theme: Theme = .sdddsServTheme, layout: ListItemLayout = .normal) {
        self.theme = theme
        self.layout = layout
    }

    var variations: [Variation<ListAppearance>] {
        switch layout {
        case .normal:
            theme.listNormalVariations
        case .tight:
            theme.listTightVariations
        }
    }
    
    var defaultValue: ListAppearance {
        ListAppearance.defaultValue
    }
} 
