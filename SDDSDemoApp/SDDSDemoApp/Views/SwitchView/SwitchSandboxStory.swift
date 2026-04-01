import SandboxCore
import SwiftUI

enum SwitchStory: Story {
    typealias State = SwitchUiState
    static let defaultState = SwitchUiState()

    static let id = "switch.story"
    static let title = "Switch"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: SwitchUiState, theme: Theme) -> some View {
        SwitchView(viewModel: SwitchViewModel(theme: theme, uiState: state))
    }
}
