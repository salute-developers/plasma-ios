import Foundation
import SwiftUI
import SDDSComponents

struct MaskUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var value: TextFieldValue = .single("")
    var textValue: String = ""
    var title: String = "Title"
    var optionalTitle: String = "Optional"
    var placeholder: String = "Placeholder"
    var caption: String = "Caption"
    var textBefore: String = ""
    var textAfter: String = ""
    var disabled: Bool = false
    var readOnly: Bool = false
    var iconViewEnabled: Bool = true
    var iconActionViewEnabled: Bool = true
    var layout: TextFieldLayout = .default
    var selectedMaskType: MaskType = .none
    var customFormat: String = ""
    var numberFractionDigits: Int = 2
    var numberDecimalSeparator: String = ","
    var currentMask: TextFieldMask? = nil
    var maskDisplayMode: MaskDisplayMode = .onInput
}
