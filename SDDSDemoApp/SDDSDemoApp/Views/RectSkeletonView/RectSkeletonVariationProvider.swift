import Foundation
import SDDSComponents
import SDDSThemeCore
import SDDSservTheme

final class RectSkeletonVariationProvider: VariationProvider {
    typealias Appearance = SkeletonAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<SkeletonAppearance>] {
        theme.rectSkeletonVariations
    }
    
    var defaultValue: SkeletonAppearance {
        RectSkeleton.default.appearance
    }
} 
