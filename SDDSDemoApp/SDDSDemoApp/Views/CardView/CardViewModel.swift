import Foundation
import Combine
import SwiftUI
import SDDSComponents
import SDDSThemeCore

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
    
    init(theme: Theme = .sdddsServTheme, uiState: CardUiState = .init()) {
        super.init(variationProvider: CardVariationProvider(theme: theme, cardType: uiState.cardType), theme: theme)
        apply(uiState: uiState)
    }

    private func apply(uiState: CardUiState) {
        orientation = uiState.orientation
        cardType = uiState.cardType
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
}
