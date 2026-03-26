import SandboxCore
import SwiftUI

enum TabsStory: Story {
    typealias State = TabsUiState
    static let defaultState = TabsUiState()

    static let id = "tabs.story"
    static let title = "Tabs"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: TabsUiState, theme: Theme) -> some View {
        TabsView(viewModel: TabsViewModel(theme: theme, uiState: state))
    }
}
