import SandboxCore
import SwiftUI

enum ProgressBarStory: Story {
    typealias State = ProgressBarUiState
    static let defaultState = ProgressBarUiState()

    static let id = "progressBar.story"
    static let title = "ProgressBar"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: ProgressBarUiState, theme: Theme) -> some View {
        ProgressBarView(viewModel: ProgressBarViewModel(theme: theme, uiState: state))
    }
}
