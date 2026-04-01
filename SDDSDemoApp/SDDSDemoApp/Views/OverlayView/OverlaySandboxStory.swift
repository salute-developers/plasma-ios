import SandboxCore
import SwiftUI

enum OverlayStory: Story {
    typealias State = OverlayUiState
    static let defaultState = OverlayUiState()

    static let id = "overlay.story"
    static let title = "Overlay"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: OverlayUiState, theme: Theme) -> some View {
        OverlayView(viewModel: OverlayViewModel(theme: theme, uiState: state))
    }
}
