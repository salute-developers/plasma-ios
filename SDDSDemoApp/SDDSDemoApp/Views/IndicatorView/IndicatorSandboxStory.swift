import SandboxCore
import SwiftUI

enum IndicatorStory: Story {
    typealias State = IndicatorUiState
    static let defaultState = IndicatorUiState()

    static let id = "indicator.story"
    static let title = "Indicator"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: IndicatorUiState, theme: Theme) -> some View {
        IndicatorView(viewModel: IndicatorViewModel(theme: theme, uiState: state))
    }
}
