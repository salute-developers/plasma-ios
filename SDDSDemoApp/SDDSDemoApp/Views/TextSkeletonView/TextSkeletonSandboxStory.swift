import SandboxCore
import SwiftUI

enum TextSkeletonStory: Story {
    typealias State = TextSkeletonUiState
    static let defaultState = TextSkeletonUiState()

    static let id = "textSkeleton.story"
    static let title = "TextSkeleton"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }


    @ViewBuilder
    static func content(state: TextSkeletonUiState, theme: Theme) -> some View {
        TextSkeletonView(viewModel: TextSkeletonViewModel(theme: theme, uiState: state))
    }
}
