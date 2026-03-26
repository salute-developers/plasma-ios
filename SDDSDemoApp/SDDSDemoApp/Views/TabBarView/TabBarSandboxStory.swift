import SandboxCore
import SwiftUI

enum TabBarStory: Story {
    typealias State = TabBarUiState
    static let defaultState = TabBarUiState()

    static let id = "tabBar.story"
    static let title = "TabBar"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: TabBarUiState, theme: Theme) -> some View {
        TabBarView(viewModel: TabBarViewModel(theme: theme, uiState: state))
    }
}
