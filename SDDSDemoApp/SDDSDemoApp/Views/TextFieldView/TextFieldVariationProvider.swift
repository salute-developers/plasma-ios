import Foundation
import SDDSComponents
import SDDSServTheme

final class TextFieldVariationProvider: VariationProvider {
    typealias Appearance = TextFieldAppearance
    
    var layout: TextFieldLayout
    var theme: Theme
    
    init(layout: TextFieldLayout, theme: Theme = .sdddsServTheme) {
        self.layout = layout
        self.theme = theme
    }
    
    var variations: [Variation<TextFieldAppearance>] {
        switch layout {
        case .clear:
            theme.textFieldClearVariations
        case .default:
            theme.textFieldVariations
        }
    }
    
    var defaultValue: TextFieldAppearance {
        TextFieldAppearance.defaultValue
    }
}
