import Foundation
import SDDSComponents

struct RadioboxGroupUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var radioboxViewModels: [RadioboxItemViewModel] = []
}
