import Foundation
import SwiftUI
import UIKit
import SDDSComponents

struct TextFieldUiState: StoryUiState, DefaultUiState {
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
    var secureEntry: Bool = false
    var keyboardType: UIKeyboardType = .default
    var iconViewEnabled: Bool = true
    var iconActionViewEnabled: Bool = true
    var layout: TextFieldLayout = .default
}
