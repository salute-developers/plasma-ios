import SandboxCore
import SwiftUI

enum ModalStory: Story {
    typealias State = ModalUiState
    static let defaultState = ModalUiState()

    static let id = "modal.story"
    static let title = "Modal"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: ModalUiState, theme: Theme) -> some View {
        ModalView(viewModel: ModalViewModel(theme: theme, uiState: state))
    }
}
