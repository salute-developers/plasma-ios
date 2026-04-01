import SandboxCore
import SwiftUI

enum NavigationBarStory: Story {
    typealias State = NavigationBarUiState
    static let defaultState = NavigationBarUiState()

    static let id = "navigationBar.story"
    static let title = "NavigationBar"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: NavigationBarUiState, theme: Theme) -> some View {
        NavigationBarView(viewModel: NavigationBarViewModel(theme: theme, uiState: state))
    }
}
