import SandboxCore
import SwiftUI

enum TabBarIslandStory: Story {
    typealias State = TabBarIslandUiState
    static let defaultState = TabBarIslandUiState()

    static let id = "tabBarIsland.story"
    static let title = "TabBarIsland"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: TabBarIslandUiState, theme: Theme) -> some View {
        TabBarIslandView(viewModel: TabBarIslandViewModel(theme: theme, uiState: state))
    }
}
