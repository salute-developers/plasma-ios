import Foundation
import SDDSComponents

struct CodeFieldUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var code: String = ""
    var caption: String = "Enter the code"
    var captionAlignment: CodeFieldAlignment = .center
    var selectedGroupType: CodeFieldGroupType = .four
    var successToastDisplayed: Bool = false
    var validationResult: CodeFieldValidationResult = .success(.initial)
    var isHidden: Bool = false
    var validation: CodeFieldValidation = CodeFieldDisabledValidation()
}
