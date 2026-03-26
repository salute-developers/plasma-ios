import Foundation
import SDDSComponents

struct CheckboxGroupUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var checkboxViewModels: [CheckboxItemViewModel] = []
    var groupBehaviour: CheckboxGroupBehaviour?
    var states: [Int: SelectionControlState] = [:]
}
