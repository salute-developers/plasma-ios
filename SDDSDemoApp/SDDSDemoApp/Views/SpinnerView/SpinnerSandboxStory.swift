import SandboxCore
import SwiftUI

enum SpinnerStory: Story {
    typealias State = SpinnerUiState
    static let defaultState = SpinnerUiState()

    static let id = "spinner.story"
    static let title = "Spinner"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: SpinnerUiState, theme: Theme) -> some View {
        SpinnerView(viewModel: SpinnerViewModel(theme: theme, uiState: state))
    }
}
