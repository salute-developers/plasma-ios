import Foundation
import SDDSComponents
import SDDSServTheme

final class TextAreaVariationProvider: VariationProvider {
    typealias Appearance = TextAreaAppearance
    
    var layout: TextAreaLayout
    var theme: Theme
    
    init(layout: TextAreaLayout, theme: Theme = .sdddsServTheme) {
        self.layout = layout
        self.theme = theme
    }
    
    var variations: [Variation<TextAreaAppearance>] {
        switch layout {
        case .clear:
            theme.textAreaClearVariations
        case .default:
            theme.textAreaVariations
        }
    }
    
    var defaultValue: TextAreaAppearance {
        TextAreaAppearance.defaultValue
    }
}
