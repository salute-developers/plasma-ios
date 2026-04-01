import Foundation
import SwiftUI
import SDDSComponents

struct ChipUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var value: String = "Value"
    var isEnabled: Bool = true
    var iconImageEnabled: Bool = true
    var buttomImageEnabled: Bool = true
    var iconImage: Image? = nil
    var buttonImage: Image? = nil
}
