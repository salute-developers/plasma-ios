import Foundation
import SDDSComponents

struct AccordionUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var title: String = "Title"
    var content: String = "Content text"
    var itemsCount: Int = 10
    var showDividers: Bool = false
    var layout: AccordionLayout = .solidActionEnd
}
