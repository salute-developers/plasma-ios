import Foundation
import SDDSComponents
import SDDSServTheme

final class AccordionVariationProvider: VariationProvider {
    typealias Appearance = AccordionAppearance
    
    var theme: Theme
    var layout: AccordionLayout
    
    init(theme: Theme = .sdddsServTheme, layout: AccordionLayout = .solidActionEnd) {
        self.theme = theme
        self.layout = layout
    }

    var variations: [Variation<AccordionAppearance>] {
        switch layout {
        case .clearActionStart:
            return theme.accordionClearActionStartVariations
        case .clearActionEnd:
            return theme.accordionClearActionEndVariations
        case .solidActionStart:
            return theme.accordionSolidActionStartVariations
        case .solidActionEnd:
            return theme.accordionSolidActionEndVariations
        }
    }
    
    var defaultValue: AccordionAppearance {
        AccordionAppearance.defaultValue
    }
} 
