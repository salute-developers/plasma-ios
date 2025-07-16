import Foundation
import SwiftUI

/**
 `AccordionData` представляет собой структуру данных для элемента аккордеона.

 Структура содержит все необходимые параметры для создания `SDDSAccordionItem`.

 - Parameters:
    - title: Заголовок элемента аккордеона
    - content: Контент элемента аккордеона
    - isExpanded: Состояние развернутости элемента
    - appearance: Параметры внешнего вида элемента аккордеона (опционально)
    - onToggle: Обработчик переключения состояния элемента (опционально)
 */

public struct AccordionData: Identifiable {
    public let id = UUID()
    public let title: String
    public let content: String
    public var isExpanded: Bool
    public let appearance: AccordionItemAppearance?
    public let onToggle: ((Bool) -> ())?
    
    public init(
        title: String = "",
        content: String = "",
        isExpanded: Bool = false,
        appearance: AccordionItemAppearance? = nil,
        onToggle: ((Bool) -> ())? = nil
    ) {
        self.title = title
        self.content = content
        self.isExpanded = isExpanded
        self.appearance = appearance
        self.onToggle = onToggle
    }
} 