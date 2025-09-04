import Foundation
import SDDSComponents
import SDDSThemeCore
import SDDSServTheme

final class TextSkeletonVariationProvider: VariationProvider {
    typealias Appearance = SkeletonAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<SkeletonAppearance>] {
        theme.textSkeletonVariations
    }
    
    var defaultValue: SkeletonAppearance {
        TextSkeleton.default.appearance
    }
} 
