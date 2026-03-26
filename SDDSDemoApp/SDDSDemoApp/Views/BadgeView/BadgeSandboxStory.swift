import SandboxCore
import SwiftUI

enum BadgeStory: Story {
    typealias State = BadgeUiState
    static let defaultState = BadgeUiState()

    static let id = "badge.story"
    static let title = "Badge"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: BadgeUiState, theme: Theme) -> some View {
        BadgeView(viewModel: BadgeViewModel(theme: theme, uiState: state))
    }
}
