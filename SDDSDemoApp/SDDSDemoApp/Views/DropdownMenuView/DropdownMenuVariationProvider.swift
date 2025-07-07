import Foundation
import SDDSComponents
import SDDSServTheme

enum DropDownMenuStyle {
    case normal
    case tight
}

final class DropdownMenuVariationProvider: VariationProvider {
    typealias Appearance = DropdownMenuAppearance
    
    var theme: Theme
    var style: DropDownMenuStyle
    
    init(theme: Theme = .sdddsServTheme, style: DropDownMenuStyle = .normal) {
        self.theme = theme
        self.style = style
    }
    
    var variations: [Variation<DropdownMenuAppearance>] {
        switch style {
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
