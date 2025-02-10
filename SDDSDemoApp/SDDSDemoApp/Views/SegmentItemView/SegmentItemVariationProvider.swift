import Foundation
import SDDSComponents
import SDDSServTheme

final class SegmentItemVariationProvider: VariationProvider {
    typealias Appearance = SegmentItemAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<SegmentItemAppearance>] {
        theme.segmentItemVariations
    }
    
    var defaultValue: SegmentItemAppearance {
        variations.first?.appearance ?? SegmentItem.l.primary.appearance
    }
}
