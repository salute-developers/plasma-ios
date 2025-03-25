import Foundation
import Combine
import SwiftUI
import SDDSComponents

enum CardOrientation: String, CaseIterable {
    case horizontal = "Horizontal"
    case vertical = "Vertical"
}

final class CardViewModel: ComponentViewModel<CardVariationProvider> {
    @Published var orientation: CardOrientation = .horizontal
    @Published var cardType: CardType = .card {
        didSet {
            self.variationProvider.cardType = cardType
            self.selectVariation(variations.first)
        }
    }
    
    init() {
        super.init(variationProvider: CardVariationProvider(cardType: .card))
    }
}
