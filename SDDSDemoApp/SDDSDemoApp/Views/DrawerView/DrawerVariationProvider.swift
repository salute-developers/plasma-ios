import Foundation
import SDDSComponents
import SDDSServTheme

final class DrawerVariationProvider: VariationProvider {
    typealias Appearance = DrawerAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<DrawerAppearance>] {
        theme.drawerCloseInnerVariations + theme.drawerCloseNoneVariations + theme.drawerCloseOuterVariations
    }
    
    var defaultValue: DrawerAppearance {
        variations.first?.appearance ?? DrawerAppearance()
    }
}
