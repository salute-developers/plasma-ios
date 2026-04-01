import Foundation
import SDDSComponents
#if canImport(PlasmaHomeDSTheme)
import PlasmaHomeDSTheme
#endif

final class WheelVariationProvider: VariationProvider {
    typealias Appearance = WheelAppearance
    
    var theme: Theme
    
    init(theme: Theme = .plasmaHomeDSTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<WheelAppearance>] {
        theme.wheelVariations
    }
    
    var defaultValue: WheelAppearance {
        WheelAppearance.defaultValue
    }
}

