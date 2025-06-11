import Foundation
import SDDSComponents
import SDDSServTheme

final class ToastVariationProvider: VariationProvider {
    typealias Appearance = ToastAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<ToastAppearance>] {
        theme.toastVariations
    }
    
    var defaultValue: ToastAppearance {
        Toast.pilled.default.appearance
    }
} 
