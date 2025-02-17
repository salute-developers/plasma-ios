import Foundation
import SDDSComponents
import SDDSServTheme

final class CellVariationProvider: VariationProvider {
    typealias Appearance = CellAppearance
    
    init() {}
    
    var variations: [Variation<CellAppearance>] {
        Cell.all
    }
    
    var defaultValue: CellAppearance {
        variations.first?.appearance ?? Cell.l.appearance
    }
}
