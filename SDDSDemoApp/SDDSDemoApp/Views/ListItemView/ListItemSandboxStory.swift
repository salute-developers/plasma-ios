import SandboxCore
import SwiftUI

enum ListItemStory: Story {
    typealias State = ListItemUiState
    static let defaultState = ListItemUiState()

    static let id = "listItem.story"
    static let title = "ListItem"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: ListItemUiState, theme: Theme) -> some View {
        ListItemView(viewModel: ListItemViewModel(theme: theme, uiState: state))
    }
}
