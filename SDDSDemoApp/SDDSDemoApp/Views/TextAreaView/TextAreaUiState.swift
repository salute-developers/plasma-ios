import Foundation
import SDDSComponents

struct TextAreaUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var value: TextAreaValue = .single("")
    var textValue: String = ""
    var title: String = "Title"
    var optionalTitle: String = "Optional"
    var placeholder: String = "Placeholder"
    var caption: String = "Caption"
    var counter: String = "Counter"
    var disabled: Bool = false
    var readOnly: Bool = false
    var iconActionViewEnabled: Bool = true
    var heightMode: TextAreaHeightMode = .dynamic
    var layout: TextAreaLayout = .default
}
