import SandboxCore
import SwiftUI

enum ListStory: Story {
    typealias State = ListUiState
    static let defaultState = ListUiState()

    static let id = "list.story"
    static let title = "List"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: ListUiState, theme: Theme) -> some View {
        ListView(viewModel: ListViewModel(theme: theme, uiState: state))
    }
}
