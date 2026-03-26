import SandboxCore
import SwiftUI

enum CellStory: Story {
    typealias State = CellUiState
    static let defaultState = CellUiState()

    static let id = "cell.story"
    static let title = "Cell"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: CellUiState, theme: Theme) -> some View {
        CellView(viewModel: CellViewModel(theme: theme, uiState: state))
    }
}
