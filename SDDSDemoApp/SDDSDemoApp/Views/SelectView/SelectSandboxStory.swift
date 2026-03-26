import SandboxCore
import SwiftUI

enum SelectStory: Story {
    typealias State = SelectUiState
    static let defaultState = SelectUiState()

    static let id = "select.story"
    static let title = "Select"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: SelectUiState, theme: Theme) -> some View {
        SelectView(viewModel: SelectViewModel(theme: theme, uiState: state))
    }
}
