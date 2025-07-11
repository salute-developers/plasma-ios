import Foundation
import SDDSComponents
import SDDSServTheme

enum DropDownMenuLayout: String, CaseIterable {
    case normal
    case tight
}

final class DropdownMenuVariationProvider: VariationProvider {
    typealias Appearance = DropdownMenuAppearance
    
    var theme: Theme
    var layout: DropDownMenuLayout = .normal
    
    init(theme: Theme = .sdddsServTheme, layout: DropDownMenuLayout = .normal) {
        self.theme = theme
        self.layout = layout
    }
    
    var variations: [Variation<DropdownMenuAppearance>] {
        switch layout {
        case .normal:
            theme.dropdownMenuNormalVariations
        case .tight:
            theme.dropdownMenuTightVariations
        }
    }
    
    var defaultValue: DropdownMenuAppearance {
        variations.first?.appearance ?? DropdownMenuAppearance()
    }
}
