import SandboxCore
import SwiftUI

enum ButtonStory: Story {
    typealias State = ButtonUiState
    static let defaultState = ButtonUiState()

    static let id = "button.story"
    static let title = "Button"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: ButtonUiState, theme: Theme) -> some View {
        ButtonView(viewModel: ButtonViewModel(theme: theme, uiState: state))
    }
}
