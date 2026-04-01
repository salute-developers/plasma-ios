import SandboxCore
import SwiftUI

enum TextFieldMasksStory: Story {
    typealias State = TextFieldMasksUiState
    static let defaultState = TextFieldMasksUiState()

    static let id = "textFieldMasks.story"
    static let title = "TextField Masks"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: TextFieldMasksUiState, theme: Theme) -> some View {
        MaskView(viewModel: MaskViewModel(theme: theme, uiState: state))
    }
}
