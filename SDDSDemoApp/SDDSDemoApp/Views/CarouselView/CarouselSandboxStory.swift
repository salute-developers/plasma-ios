import SandboxCore
import SwiftUI

enum CarouselStory: Story {
    typealias State = CarouselUiState
    static let defaultState = CarouselUiState()

    static let id = "carousel.story"
    static let title = "Carousel"
    static var componentKey: ComponentKey { ComponentKey(rawValue: id) }

    @ViewBuilder
    static func content(state: CarouselUiState, theme: Theme) -> some View {
        CarouselView(
            viewModel: CarouselViewModel(theme: theme, uiState: state)
        )
    }
}
