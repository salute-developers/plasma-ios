import Foundation
import SDDSComponents

struct WheelUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var wheelsCount: Int = 2
    var visibleItemsCount: Int = 5
    var selection: [Int] = [0, 0, 0]
    var wheels: [WheelData] = []
    var wheelDescriptions: [String] = ["День", "Месяц", "Год", "Час", "Минута"]
    var wheelLabels: [String] = ["", "", "", "", ""]
    var wheelTextAfter: [String] = ["", "", "", "", ""]
    var dividerStyle: WheelDividerStyle = .divider
}
