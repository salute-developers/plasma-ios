import Foundation
import SDDSComponents
import SDDSservTheme

final class BottomSheetVariationProvider: VariationProvider {
    typealias Appearance = BottomSheetAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<BottomSheetAppearance>] {
        theme.bottomSheetVariations
    }
    
    var defaultValue: BottomSheetAppearance {
        BottomSheetAppearance.defaultValue
    }
}
