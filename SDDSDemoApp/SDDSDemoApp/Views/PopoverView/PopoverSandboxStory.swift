import SandboxCore
import SwiftUI

enum PopoverStory: Story {
    typealias State = PopoverUiState
    static let defaultState = PopoverUiState()

    static let id = "popover.story"
    static let title = "Popover"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: PopoverUiState, theme: Theme) -> some View {
        PopoverView(
            viewModel: PopoverViewModel(theme: theme, uiState: state)
        )
    }
}
