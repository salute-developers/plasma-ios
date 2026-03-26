import SandboxCore
import SwiftUI

enum CodeFieldStory: Story {
    typealias State = CodeFieldUiState
    static let defaultState = CodeFieldUiState()

    static let id = "codeField.story"
    static let title = "CodeField"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: CodeFieldUiState, theme: Theme) -> some View {
        CodeFieldView(viewModel: CodeFieldViewModel(theme: theme, uiState: state))
    }
}
