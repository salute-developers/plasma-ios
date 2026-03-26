import Foundation
import SwiftUI
import SDDSComponents

struct SegmentElementUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var title: String = "Title"
    var subtitle: String = "Value"
    var iconAttributes: ButtonIconAttributes? = nil
    var isDisabled: Bool = false
    var alignment: SDDSComponents.ButtonAlignment = .leading
    var isCounterVisible: Bool = false
    var isSelected: Bool = false
    var iconVisible: Bool = false
    var counterViewModel: CounterViewModel = CounterViewModel()
}
