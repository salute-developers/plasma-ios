import SandboxCore
import SwiftUI

enum ToastStory: Story {
    typealias State = ToastUiState
    static let defaultState = ToastUiState()

    static let id = "toast.story"
    static let title = "Toast"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: ToastUiState, theme: Theme) -> some View {
        ToastView(viewModel: ToastViewModel(theme: theme, uiState: state))
    }
}
