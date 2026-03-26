import SandboxCore
import SwiftUI

enum AutocompleteStory: Story {
    typealias State = AutocompleteUiState
    static let defaultState = AutocompleteUiState()

    static let id = "autocomplete.story"
    static let title = "Autocomplete"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: AutocompleteUiState, theme: Theme) -> some View {
        AutocompleteView(viewModel: AutocompleteViewModel(theme: theme, uiState: state))
    }
}
