import Foundation
import SDDSComponents

struct ButtonUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var buttonType: SDDSButtonType = .basic
    var label: String = "Label"
    var value: String = "Value"
    var iconVisible: Bool = false
    var alignment: SDDSComponents.ButtonAlignment = .leading
    var layoutMode: ButtonLayoutMode = .wrapContent
    var isDisabled: Bool = false
    var isLoading: Bool = false
}
