import SandboxCore
import SwiftUI

enum RadioboxGroupStory: Story {
    typealias State = RadioboxGroupUiState
    static let defaultState = RadioboxGroupUiState()

    static let id = "radioboxGroup.story"
    static let title = "RadioboxGroup"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: RadioboxGroupUiState, theme: Theme) -> some View {
        RadioboxGroupView(viewModel: RadioboxGroupViewModel(theme: theme, uiState: state))
    }
}
