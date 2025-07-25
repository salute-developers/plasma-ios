import SwiftUI
import SDDSComponents

final class AccordionItemViewModel: ComponentViewModel<AccordionItemVariationProvider> {
    @Published var title: String = "Заголовок элемента аккордеона"
    @Published var content: String = "Это содержимое элемента аккордеона. Здесь может быть любой текст, который будет отображаться при разворачивании элемента."
    @Published var isExpanded: Bool = false
    
    @Published var layout: AccordionItemLayout = .solidActionEnd {
        didSet {
            variationProvider.layout = layout
            self.selectVariation(variations.first)
        }
    }
    
    init() {
        super.init(variationProvider: AccordionItemVariationProvider())
    }
} 
