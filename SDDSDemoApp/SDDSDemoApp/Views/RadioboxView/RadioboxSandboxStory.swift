import SandboxCore
import SwiftUI

enum RadioboxStory: Story {
    typealias State = RadioboxUiState
    static let defaultState = RadioboxUiState()

    static let id = "radiobox.story"
    static let title = "Radiobox"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: RadioboxUiState, theme: Theme) -> some View {
        RadioboxView(viewModel: RadioboxViewModel(theme: theme, uiState: state))
    }
}
