import Foundation
import SwiftUI
import SDDSComponents

struct SegmentUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var data: [SDDSSegmentItemData<AnyView>] = []
    var value: String = "Value"
    var helperText: String = "Helper Text"
    var iconAttributes: ButtonIconAttributes? = nil
    var isIconVisible: Bool = false
    var alignment: SDDSComponents.ButtonAlignment = .leading
    var isCounterVisible: Bool = true
    var counterText: String = "1"
    var isDisabled: Bool = false
    var layoutOrientation: SegmentLayoutOrientation = .horizontal
    var stretch: Bool = false
    var hasBackground: Bool = true
    var selectedItemId: UUID?
}
