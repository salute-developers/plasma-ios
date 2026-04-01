import SandboxCore
import SwiftUI

enum ChipStory: Story {
    typealias State = ChipUiState
    static let defaultState = ChipUiState()

    static let id = "chip.story"
    static let title = "Chip"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: ChipUiState, theme: Theme) -> some View {
        ChipView(viewModel: ChipViewModel(theme: theme, uiState: state))
    }
}
