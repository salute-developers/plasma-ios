import SandboxCore
import SwiftUI

enum SegmentStory: Story {
    typealias State = SegmentUiState
    static let defaultState = SegmentUiState()

    static let id = "segment.story"
    static let title = "Segment"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: SegmentUiState, theme: Theme) -> some View {
        SegmentView(viewModel: SegmentViewModel(theme: theme, uiState: state))
    }
}
