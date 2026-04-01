import SandboxCore
import SwiftUI

enum DividerStory: Story {
    typealias State = DividerUiState
    static let defaultState = DividerUiState()

    static let id = "divider.story"
    static let title = "Divider"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: DividerUiState, theme: Theme) -> some View {
        DividerView(viewModel: DividerViewModel(theme: theme, uiState: state))
    }
}
