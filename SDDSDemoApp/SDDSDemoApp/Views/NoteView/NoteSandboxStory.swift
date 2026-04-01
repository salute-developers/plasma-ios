import SandboxCore
import SwiftUI

enum NoteStory: Story {
    typealias State = NoteUiState
    static let defaultState = NoteUiState()

    static let id = "note.story"
    static let title = "Note"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: NoteUiState, theme: Theme) -> some View {
        NoteView(viewModel: NoteViewModel(theme: theme, uiState: state))
    }
}
