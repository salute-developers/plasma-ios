import SandboxCore
import SwiftUI

enum TabItemStory: Story {
    typealias State = TabItemUiState
    static let defaultState = TabItemUiState()

    static let id = "tabItem.story"
    static let title = "TabItem"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: TabItemUiState, theme: Theme) -> some View {
        TabItemView(viewModel: TabItemViewModel(theme: theme, uiState: state))
    }
}
