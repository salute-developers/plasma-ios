import SandboxCore
import SwiftUI

enum EditableStory: Story {
    typealias State = EditableUiState
    static let defaultState = EditableUiState()

    static let id = "editable.story"
    static let title = "Editable"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: EditableUiState, theme: Theme) -> some View {
        EditableView(viewModel: EditableViewModel(theme: theme, uiState: state))
    }
}
