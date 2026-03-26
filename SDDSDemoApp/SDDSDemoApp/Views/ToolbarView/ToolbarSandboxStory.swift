import SandboxCore
import SwiftUI

enum ToolbarStory: Story {
    typealias State = ToolbarUiState
    static let defaultState = ToolbarUiState()

    static let id = "toolbar.story"
    static let title = "Toolbar"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: ToolbarUiState, theme: Theme) -> some View {
        ToolbarView(viewModel: ToolbarViewModel(theme: theme, uiState: state))
    }
}
