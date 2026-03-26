import Foundation
import SDDSComponents

struct ButtonGroupUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var buttons: [ButtonData] = []
    var buttonGroupType: SDDSButtonGroupType = .basic
    var layout: ButtonGroupLayout = .horizontal
    var iconEnabled: Bool = true
    var subtitleEnabled: Bool = true
    var value: String = "Button"
    var subtitleValue: String = "Subtitle"
}
