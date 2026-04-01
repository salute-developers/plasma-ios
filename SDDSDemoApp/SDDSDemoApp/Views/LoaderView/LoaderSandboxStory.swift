import SandboxCore
import SwiftUI

enum LoaderStory: Story {
    typealias State = LoaderUiState
    static let defaultState = LoaderUiState()

    static let id = "loader.story"
    static let title = "Loader"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: LoaderUiState, theme: Theme) -> some View {
        LoaderView(viewModel: LoaderViewModel(theme: theme, uiState: state))
    }
}
