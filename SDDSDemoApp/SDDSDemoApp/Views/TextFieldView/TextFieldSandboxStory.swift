import SandboxCore
import SwiftUI

enum TextFieldStory: Story {
    typealias State = TextFieldUiState
    static let defaultState = TextFieldUiState()

    static let id = "textField.story"
    static let title = "TextField"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: TextFieldUiState, theme: Theme) -> some View {
        TextFieldView(viewModel: TextFieldViewModel(theme: theme, uiState: state))
    }
}
