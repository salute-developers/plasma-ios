import Foundation
import SDDSComponents
import SDDSServTheme

enum AutocompleteLayout: String, CaseIterable {
    case normal
    case tight
}

final class AutocompleteVariationProvider: VariationProvider {
    typealias Appearance = AutocompleteAppearance
    
    var theme: Theme
    var layout: AutocompleteLayout = .normal
    
    init(theme: Theme = .sdddsServTheme, layout: AutocompleteLayout = .normal) {
        self.theme = theme
        self.layout = layout
    }
    
    var variations: [Variation<AutocompleteAppearance>] {
        switch layout {
        case .normal:
            theme.autocompleteNormalVariations
        case .tight:
            theme.autocompleteTightVariations
        }
    }
    
    var defaultValue: AutocompleteAppearance {
        variations.first?.appearance ?? AutocompleteAppearance()
    }
}

