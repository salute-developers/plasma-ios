import Foundation
import SDDSComponents

struct CellUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var alignment: CellContentAlignment = .center
    var label: String = "label"
    var title: String = "title"
    var subtitle: String = "subtitle"
    var leftContentType: CellContent = .avatar
    var rightContentType: CellContent = .iconButton
    var disclosureEnabled: Bool = true
    var disclosureText: String = ""
    var isOn: Bool = false
    var isSelected: Bool = false
    var state: SelectionControlState = .deselected
}
