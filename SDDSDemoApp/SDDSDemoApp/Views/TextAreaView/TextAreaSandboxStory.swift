import SandboxCore
import SwiftUI

enum TextAreaStory: Story {
    typealias State = TextAreaUiState
    static let defaultState = TextAreaUiState()

    static let id = "textArea.story"
    static let title = "TextArea"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: TextAreaUiState, theme: Theme) -> some View {
        TextAreaView(viewModel: TextAreaViewModel(theme: theme, uiState: state))
    }
}
