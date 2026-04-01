import Foundation
import SDDSComponents

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
        variations.first?.appearance ?? ToastAppearance()
    }
} 
