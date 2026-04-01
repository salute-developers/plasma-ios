import SandboxCore
import SwiftUI

enum CounterStory: Story {
    typealias State = CounterUiState
    static let defaultState = CounterUiState()

    static let id = "counter.story"
    static let title = "Counter"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: CounterUiState, theme: Theme) -> some View {
        CounterView(viewModel: CounterViewModel(theme: theme, uiState: state))
    }
}
