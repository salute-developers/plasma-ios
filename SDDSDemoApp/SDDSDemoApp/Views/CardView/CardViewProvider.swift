import Foundation
import SDDSComponents
import SDDSServTheme

enum CardType: String, CaseIterable {
    case card = "Card"
    case cardSolid = "Card Solid"
    case cardClear = "Card Clear"
}

final class CardVariationProvider: VariationProvider {
    typealias Appearance = CardAppearance
    
    var theme: Theme
    var cardType: CardType
    
    init(theme: Theme = .sdddsServTheme, cardType: CardType) {
        self.theme = theme
        self.cardType = cardType
    }
    
    var variations: [Variation<CardAppearance>] {
        switch cardType {
        case .card:
            theme.cardVariations
        case .cardSolid:
            theme.cardSolidVariations
        case .cardClear:
            theme.cardClearVariations
        }
    }
    
    var defaultValue: CardAppearance {
        variations.first?.appearance ?? CardSolid.m.appearance
    }
}
