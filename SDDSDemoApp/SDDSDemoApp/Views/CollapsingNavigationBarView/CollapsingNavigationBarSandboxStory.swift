import SandboxCore
import SwiftUI

enum CollapsingNavigationBarStory: Story {
    typealias State = CollapsingNavigationBarUiState
    static let defaultState = CollapsingNavigationBarUiState()

    static let id = "collapsingNavigationBar.story"
    static let title = "CollapsingNavigationBar"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: CollapsingNavigationBarUiState, theme: Theme) -> some View {
        CollapsingNavigationView(viewModel: CollapsingNavigationBarViewModel(theme: theme, uiState: state))
    }
}
