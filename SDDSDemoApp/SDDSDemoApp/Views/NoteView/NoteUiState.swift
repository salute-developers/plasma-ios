import Foundation

struct NoteUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var title: String = "Title"
    var text: String = "Text"
    var hasContentBefore: Bool = true
    var hasAction: Bool = true
}
