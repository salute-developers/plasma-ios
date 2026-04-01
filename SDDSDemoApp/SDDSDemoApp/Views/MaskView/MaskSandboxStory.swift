import SandboxCore
import SwiftUI

enum MaskStory: Story {
    typealias State = MaskUiState
    static let defaultState = MaskUiState()

    static let id = "mask.story"
    static let title = "Mask"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: MaskUiState, theme: Theme) -> some View {
        MaskView(viewModel: MaskViewModel(theme: theme, uiState: state))
    }
}
