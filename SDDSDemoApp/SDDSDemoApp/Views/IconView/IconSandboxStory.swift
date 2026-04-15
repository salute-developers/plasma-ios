import SandboxCore
import SwiftUI

enum IconStory: Story {
    typealias State = IconUiState
    static let defaultState = IconUiState()

    static let id = "icon.story"
    static let title = "Icon"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }

    @ViewBuilder
    static func content(state: IconUiState, theme: Theme) -> some View {
        IconView(viewModel: IconViewModel(theme: theme, uiState: state))
    }
}
