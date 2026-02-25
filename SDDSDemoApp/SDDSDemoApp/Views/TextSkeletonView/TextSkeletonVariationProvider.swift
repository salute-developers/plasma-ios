import Foundation
import SDDSComponents
import SDDSThemeCore
import SDDSServTheme

final class TextSkeletonVariationProvider: VariationProvider {
    typealias Appearance = SkeletonAppearance
    
    var theme: Theme
    var kind: TextSkeletonKind
    
    init(theme: Theme = .sdddsServTheme, kind: TextSkeletonKind = .default) {
        self.theme = theme
        self.kind = kind
    }
    
    var variations: [Variation<SkeletonAppearance>] {
        switch kind {
        case .default:
            theme.textSkeletonVariations
        case .body:
            theme.textSkeletonBodyVariations
        case .display:
            theme.textSkeletonDisplayVariations
        case .header:
            theme.textSkeletonHeaderVariations
        case .text:
            theme.textSkeletonTextVariations
        }
    }
    
    var defaultValue: SkeletonAppearance {
        TextSkeleton.default.appearance
    }
} 
