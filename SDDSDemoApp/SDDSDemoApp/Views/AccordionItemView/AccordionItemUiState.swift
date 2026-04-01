import Foundation
import SDDSComponents

struct AccordionItemUiState: StoryUiState, DefaultUiState {
    var variant: String = ""
    var appearance: String = ""
    var title: String = "Заголовок элемента аккордеона"
    var content: String = "Это содержимое элемента аккордеона. Здесь может быть любой текст, который будет отображаться при разворачивании элемента."
    var isExpanded: Bool = false
    var layout: AccordionItemLayout = .solidActionEnd
}
