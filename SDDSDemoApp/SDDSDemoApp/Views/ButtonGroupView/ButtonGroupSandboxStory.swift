import SandboxCore
import SwiftUI

enum ButtonGroupStory: Story {
    typealias State = ButtonGroupUiState
    static let defaultState = ButtonGroupUiState()

    static let id = "buttonGroup.story"
    static let title = "ButtonGroup"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: ButtonGroupUiState, theme: Theme) -> some View {
        ButtonGroupView(viewModel: ButtonGroupViewModel(theme: theme, uiState: state))
    }
}
