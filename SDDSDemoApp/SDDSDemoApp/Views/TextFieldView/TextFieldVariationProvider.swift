import Foundation
import SDDSComponents
import SDDSServTheme

final class TextFieldVariationProvider: VariationProvider {
    typealias Appearance = TextFieldAppearance
    
    var layout: TextFieldLayout
    
    init(layout: TextFieldLayout) {
        self.layout = layout
    }
    
    var variations: [Variation<TextFieldAppearance>] {
        switch layout {
        case .clear:
            TextFieldClear.all
        case .default:
            TextField.all
        }
    }
    
    var defaultValue: TextFieldAppearance {
        variations.first?.appearance ?? TextField.l.default.appearance
    }
}
