import Foundation
import SDDSComponents

final class ListVariationProvider: VariationProvider {
    typealias Appearance = ListAppearance
    
    var theme: Theme
    var layout: ListItemLayout
    
    init(theme: Theme = .sdddsServTheme, layout: ListItemLayout = .listItemNormal) {
        self.theme = theme
        self.layout = layout
    }

    var variations: [Variation<ListAppearance>] {
        let selected: [Variation<ListAppearance>]
        switch layout {
        case .listItemNormal:
            selected = theme.listNormalVariations
        case .listItemTight:
            selected = theme.listTightVariations
        case .listItem:
            selected = theme.listVariations
        case .listNumbered:
            selected = theme.listNumberedVariations
        case .listNumberedItem:
            selected = theme.listVariations
        }

        if !selected.isEmpty {
            return selected
        }

        // Some DSs (e.g. HomeDS) don't support all list layouts.
        return [
            theme.listVariations,
            theme.listNumberedVariations,
            theme.listNormalVariations,
            theme.listTightVariations,
        ].first(where: { !$0.isEmpty }) ?? []
    }
    
    var defaultValue: ListAppearance {
        ListAppearance.defaultValue
    }
} 
