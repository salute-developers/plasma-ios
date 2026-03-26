import SandboxCore
import SwiftUI

enum WheelStory: Story {
    typealias State = WheelUiState
    static let defaultState = WheelUiState()

    static let id = "wheel.story"
    static let title = "Wheel"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: WheelUiState, theme: Theme) -> some View {
        WheelView(
            viewModel: WheelViewModel(theme: theme, uiState: state)
        )
    }
}
