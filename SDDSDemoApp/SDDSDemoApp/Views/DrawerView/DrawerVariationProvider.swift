import Foundation
import SDDSComponents
import SDDSServTheme

enum DrawerVariationType: String, CaseIterable {
    case inner
    case none
    case outer
}

final class DrawerVariationProvider: VariationProvider {
    typealias Appearance = DrawerAppearance
    
    var theme: Theme
    var variationType: DrawerVariationType
    
    init(theme: Theme = .sdddsServTheme, variationType: DrawerVariationType = .inner) {
        self.theme = theme
        self.variationType = variationType
    }
    
    var variations: [Variation<DrawerAppearance>] {
        switch variationType {
        case .inner:
            return theme.drawerCloseInnerVariations
        case .none:
            return theme.drawerCloseNoneVariations
        case .outer:
            return theme.drawerCloseOuterVariations
        }
    }
    
    var defaultValue: DrawerAppearance {
        variations.first?.appearance ?? DrawerAppearance()
    }
}
