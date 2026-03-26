import Foundation
import SDDSComponents
import SDDSThemeCore

final class ModalVariationProvider: VariationProvider {
    typealias Appearance = ModalAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<ModalAppearance>] {
        theme.modalVariations
    }
    
    var defaultValue: ModalAppearance {
        variations.first?.appearance ?? ModalAppearance()
    }
}
