import SandboxCore
import SwiftUI

enum CheckboxGroupStory: Story {
    typealias State = CheckboxGroupUiState
    static let defaultState = CheckboxGroupUiState()

    static let id = "checkboxGroup.story"
    static let title = "CheckboxGroup"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: CheckboxGroupUiState, theme: Theme) -> some View {
        CheckboxGroupView(viewModel: CheckboxGroupViewModel(theme: theme, uiState: state))
    }
}
