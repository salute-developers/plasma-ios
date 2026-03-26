import SandboxCore
import SwiftUI

enum NoteCompactStory: Story {
    typealias State = NoteCompactUiState
    static let defaultState = NoteCompactUiState()

    static let id = "noteCompact.story"
    static let title = "NoteCompact"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: NoteCompactUiState, theme: Theme) -> some View {
        NoteCompactView(viewModel: NoteCompactViewModel(theme: theme, uiState: state))
    }
}
