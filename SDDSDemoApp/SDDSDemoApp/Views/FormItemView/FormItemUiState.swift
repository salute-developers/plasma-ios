import Foundation

struct FormItemUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var content: String = "Form item text content.\nSecond line text."
    var title: String = "Title"
    var titleCaption: String = ""
    var caption: String = "Caption"
    var counter: String = ""
    var optional: String = "Optional"
    var hasHint: Bool = false
    var hasCaptionIcon: Bool = true
    var enabled: Bool = true
}
