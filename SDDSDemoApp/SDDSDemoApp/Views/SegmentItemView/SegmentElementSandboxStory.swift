import SandboxCore
import SwiftUI

enum SegmentElementStory: Story {
    typealias State = SegmentElementUiState
    static let defaultState = SegmentElementUiState()

    static let id = "segmentElement.story"
    static let title = "SegmentElement"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: SegmentElementUiState, theme: Theme) -> some View {
        SegmentItemView(viewModel: SegmentItemViewModel(theme: theme, uiState: state))
    }
}
