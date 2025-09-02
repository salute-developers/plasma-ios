import Foundation
import SDDSComponents
import SDDSservTheme

final class SegmentVariationProvider: VariationProvider {
    typealias Appearance = SegmentAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<SegmentAppearance>] {
        theme.segmentVariations
    }
    
    var defaultValue: SegmentAppearance {
        SegmentAppearance.defaultValue
    }
}
