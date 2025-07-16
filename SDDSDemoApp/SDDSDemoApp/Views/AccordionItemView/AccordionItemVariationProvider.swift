import Foundation
import SDDSComponents
import SDDSServTheme

final class AccordionItemVariationProvider: VariationProvider {
    typealias Appearance = AccordionItemAppearance
    
    var theme: Theme
    var layout: AccordionItemLayout
    
    init(theme: Theme = .sdddsServTheme, layout: AccordionItemLayout = .solidActionEnd) {
        self.theme = theme
        self.layout = layout
    }

    var variations: [Variation<AccordionItemAppearance>] {
        switch layout {
        case .clearActionStart:
            theme.accordionItemClearActionStartVariations
        case .clearActionEnd:
            theme.accordionItemClearActionEndVariations
        case .solidActionStart:
            theme.accordionItemSolidActionStartVariations
        case .solidActionEnd:
            theme.accordionItemSolidActionEndVariations
        }
    }
    
    var defaultValue: AccordionItemAppearance {
        AccordionItemAppearance.defaultValue
    }
} 