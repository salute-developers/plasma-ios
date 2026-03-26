import SandboxCore
import SwiftUI

enum TooltipStory: Story {
    typealias State = TooltipUiState
    static let defaultState = TooltipUiState()

    static let id = "tooltip.story"
    static let title = "Tooltip"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: TooltipUiState, theme: Theme) -> some View {
        TooltipView(viewModel: TooltipViewModel(theme: theme, uiState: state))
    }
}
