import Foundation
import SDDSComponents
import SDDSServTheme

final class TextAreaVariationProvider: VariationProvider {
    typealias Appearance = TextAreaAppearance
    
    var layout: TextAreaLayout
    
    init(layout: TextAreaLayout) {
        self.layout = layout
    }
    
    var variations: [Variation<TextAreaAppearance>] {
        switch layout {
        case .clear:
            TextAreaClear.all
        case .default:
            TextArea.all
        }
    }
    
    var defaultValue: TextAreaAppearance {
        variations.first?.appearance ?? TextArea.l.default.appearance
    }
}
