import SandboxCore
import SwiftUI

enum CardStory: Story {
    typealias State = CardUiState
    static let defaultState = CardUiState()

    static let id = "card.story"
    static let title = "Card"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: CardUiState, theme: Theme) -> some View {
        CardView(viewModel: CardViewModel(theme: theme, uiState: state))
    }
}
