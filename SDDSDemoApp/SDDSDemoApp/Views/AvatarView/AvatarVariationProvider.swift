import Foundation
import SDDSComponents
import SDDSservTheme

final class AvatarVariationProvider: VariationProvider {
    typealias Appearance = AvatarAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<AvatarAppearance>] {
        theme.avatarVariations
    }
    
    var defaultValue: AvatarAppearance {
        AvatarAppearance.defaultValue
    }
}
