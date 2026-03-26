import Foundation
import SDDSComponents

struct CheckboxUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var title: String = ""
    var subtitle: String = ""
    var state: SelectionControlState = .deselected
    var isEnabled: Bool = true
}
