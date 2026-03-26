import Foundation
import SDDSComponents

struct SwitchUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var title: String = "Label"
    var subtitle: String = "Description"
    var isOn: Bool = true
    var isEnabled: Bool = true
    var switchAccessibility: SwitchAccessibility = SwitchAccessibility()
}
