import SandboxCore
import SwiftUI

enum TextStory: Story {
    typealias State = TextUiState
    static let defaultState = TextUiState()

    static let id = "text.story"
    static let title = "Text"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }

    @ViewBuilder
    static func content(state: TextUiState, theme: Theme) -> some View {
        TextView(viewModel: TextViewModel(theme: theme, uiState: state))
    }
}
