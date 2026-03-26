import Foundation
import SDDSComponents

struct CardUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var orientation: CardOrientation = .horizontal
    var cardType: CardType = .card
}
