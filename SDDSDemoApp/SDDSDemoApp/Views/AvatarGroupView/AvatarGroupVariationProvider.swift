import Foundation
import SDDSComponents
import SDDSservTheme

final class AvatarGroupVariationProvider: VariationProvider {
    typealias Appearance = AvatarGroupAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<AvatarGroupAppearance>] {
        theme.avatarGroupVariations
    }
    
    var defaultValue: AvatarGroupAppearance {
        AvatarGroupAppearance.defaultValue
    }
}
