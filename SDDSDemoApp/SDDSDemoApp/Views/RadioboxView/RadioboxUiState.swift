import Foundation

struct RadioboxUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var title: String = ""
    var subtitle: String = ""
    var isSelected: Bool = false
    var isEnabled: Bool = true
}
