import SandboxCore
import SwiftUI

enum ImageStory: Story {
    typealias State = ImageUiState
    static let defaultState = ImageUiState()

    static let id = "image.story"
    static let title = "Image"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }

    @ViewBuilder
    static func content(state: ImageUiState, theme: Theme) -> some View {
        ImageView(viewModel: ImageViewModel(theme: theme, uiState: state))
    }
}
