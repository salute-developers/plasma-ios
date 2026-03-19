import Foundation
import SDDSComponents

final class PaginationDotsVariationProvider: VariationProvider {
    typealias Appearance = PaginationDotsAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<PaginationDotsAppearance>] {
        let horizontal = theme.paginationDotsHorizontalVariations.map {
            Variation(
                originalVariation: $0.originalVariation,
                styles: $0.styles,
                name: "horizontal.\($0.name)",
                appearance: $0.appearance
            )
        }
        let vertical = theme.paginationDotsVerticalVariations.map {
            Variation(
                originalVariation: $0.originalVariation,
                styles: $0.styles,
                name: "vertical.\($0.name)",
                appearance: $0.appearance
            )
        }
        return horizontal + vertical
    }
    
    var defaultValue: PaginationDotsAppearance {
        PaginationDotsAppearance.defaultValue
    }
}
