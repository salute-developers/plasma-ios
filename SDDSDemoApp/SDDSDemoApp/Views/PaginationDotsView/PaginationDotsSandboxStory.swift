import SandboxCore
import SwiftUI

enum PaginationDotsStory: Story {
    typealias State = PaginationDotsUiState
    static let defaultState = PaginationDotsUiState()

    static let id = "paginationDots.story"
    static let title = "PaginationDots"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: PaginationDotsUiState, theme: Theme) -> some View {
        PaginationDotsView(
            viewModel: PaginationDotsViewModel(theme: theme, uiState: state)
        )
    }
}
