import Foundation

enum CarouselPageAlignment: String, CaseIterable, Codable {
    case start
    case center
    case end
}

struct CarouselUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var selectedIndex: Int = 0
    var itemCount: Int = 10
    var alignment: CarouselPageAlignment = .center
    var controlsEnabled: Bool = true
    var indicatorEnabled: Bool = true
    var indicatorVisibleItemCount: Int = 5
    var withGap: Bool = true
}
