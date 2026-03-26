import SandboxCore
import SwiftUI

enum RectSkeletonStory: Story {
    typealias State = RectSkeletonUiState
    static let defaultState = RectSkeletonUiState()

    static let id = "rectSkeleton.story"
    static let title = "RectSkeleton"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: RectSkeletonUiState, theme: Theme) -> some View {
        RectSkeletonView(viewModel: RectSkeletonViewModel(theme: theme, uiState: state))
    }
}
