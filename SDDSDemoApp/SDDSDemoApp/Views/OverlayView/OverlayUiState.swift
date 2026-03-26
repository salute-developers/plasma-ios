import Foundation
import SDDSComponents

struct OverlayUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var isPresent: Bool = false
    var selectedItemId: UUID?
    var hasBlur: Bool = true
    var hasBackgroundColor: Bool = true
}
