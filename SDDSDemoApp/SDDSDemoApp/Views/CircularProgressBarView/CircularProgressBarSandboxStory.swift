import SandboxCore
import SwiftUI

enum CircularProgressBarStory: Story {
    typealias State = CircularProgressBarUiState
    static let defaultState = CircularProgressBarUiState()

    static let id = "circularProgressBar.story"
    static let title = "CircularProgressBar"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: CircularProgressBarUiState, theme: Theme) -> some View {
        CircularProgressBarView(viewModel: CircularProgressBarViewModel(theme: theme, uiState: state))
    }
}
