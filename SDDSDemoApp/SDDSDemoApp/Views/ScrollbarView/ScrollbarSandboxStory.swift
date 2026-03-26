import SandboxCore
import SwiftUI

enum ScrollbarStory: Story {
    typealias State = ScrollbarUiState
    static let defaultState = ScrollbarUiState()

    static let id = "scrollbar.story"
    static let title = "Scrollbar"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: ScrollbarUiState, theme: Theme) -> some View {
        ScrollbarView(viewModel: ScrollbarViewModel(theme: theme, uiState: state))
    }
}
