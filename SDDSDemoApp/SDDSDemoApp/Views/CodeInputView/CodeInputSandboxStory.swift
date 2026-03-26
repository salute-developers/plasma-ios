import SandboxCore
import SwiftUI

enum CodeInputStory: Story {
    typealias State = CodeInputUiState
    static let defaultState = CodeInputUiState()

    static let id = "codeInput.story"
    static let title = "CodeInput"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: CodeInputUiState, theme: Theme) -> some View {
        CodeInputView(viewModel: CodeInputViewModel(theme: theme, uiState: state))
    }
}
