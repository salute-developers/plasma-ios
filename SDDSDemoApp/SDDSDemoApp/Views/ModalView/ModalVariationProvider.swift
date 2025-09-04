import Foundation
import SDDSComponents
import SDDSThemeCore
import SDDSServTheme

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
        Modal.default.appearance
    }
}
