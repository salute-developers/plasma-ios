import Foundation
import SwiftUI
import SDDSComponents

struct EditableUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var text: String = "Value"
    var enabled: Bool = true
    var readOnly: Bool = false
    var singleLine: Bool = true
    var textAlign: TextAlignment = .leading
    var hasIcon: Bool = true
    var iconPlacement: EditableIconPlacement = .relative
}
