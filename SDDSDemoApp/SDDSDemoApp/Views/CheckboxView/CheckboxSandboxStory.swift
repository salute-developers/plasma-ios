import SandboxCore
import SwiftUI

enum CheckboxStory: Story {
    typealias State = CheckboxUiState
    static let defaultState = CheckboxUiState()

    static let id = "checkbox.story"
    static let title = "Checkbox"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: CheckboxUiState, theme: Theme) -> some View {
        CheckboxView(viewModel: CheckboxViewModel(theme: theme, uiState: state))
    }
}
