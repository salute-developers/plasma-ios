import SandboxCore
import SwiftUI

enum ChipGroupStory: Story {
    typealias State = ChipGroupUiState
    static let defaultState = ChipGroupUiState()

    static let id = "chipGroup.story"
    static let title = "ChipGroup"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: ChipGroupUiState, theme: Theme) -> some View {
        ChipGroupView(viewModel: ChipGroupViewModel(theme: theme, uiState: state))
    }
}
