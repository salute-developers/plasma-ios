import Foundation
import SDDSComponents

struct ChipGroupUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var chips: [ChipData] = []
    var iconImageEnabled: Bool = true
    var buttomImageEnabled: Bool = true
    var gapStyle: ChipGroupGapStyle = .wide
    var chipGroupStyle: ChipGroupStyle = .default
    var value: String = "Value"
}
