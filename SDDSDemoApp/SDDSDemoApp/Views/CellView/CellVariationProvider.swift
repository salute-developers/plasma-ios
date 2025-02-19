import Foundation
import SDDSComponents
import SDDSServTheme

final class CellVariationProvider: VariationProvider {
    typealias Appearance = CellAppearance
    
    var contentType: CellContentType
    
    init(contentType: CellContentType) {
        self.contentType = contentType
    }
    
    var variations: [Variation<CellAppearance>] {
        switch contentType {
        case .avatar:
            Cell.all
        case .iconButton:
            Cell.all
        case .switch:
            Cell.all
        case .text:
            Cell.all
        case .none:
            Cell.all
        }
    }
    
    var defaultValue: CellAppearance {
        variations.first?.appearance ?? Cell.m.appearance
    }
}
