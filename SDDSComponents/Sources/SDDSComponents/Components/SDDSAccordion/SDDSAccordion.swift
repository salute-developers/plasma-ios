import SwiftUI
import Foundation
import SDDSThemeCore

/**
 `SDDSAccordion` представляет собой компонент для отображения списка сворачиваемых элементов.

 Компонент автоматически создает `SDDSAccordionItem` для каждого элемента в массиве `AccordionData`.

 - Parameters:
    - items: Массив данных элементов аккордеона
    - showDividers: Флаг отображения разделителей между элементами
    - appearance: Параметры внешнего вида аккордеона (опционально)

 ## Окружение
 - `accordionAppearance`: Стандартные настройки внешнего вида аккордеона

 ## Особенности
 - Автоматически создает `SDDSAccordionItem` для каждого элемента
 - Использует настраиваемые отступы между элементами из appearance
 - Поддерживает кастомные appearance для отдельных элементов
 - Применяет стандартные настройки из environment для элементов без кастомного appearance
 - Поддерживает отображение разделителей между элементами

 ## Примеры использования
 ```swift
 // Базовый аккордеон
 SDDSAccordion(
     items: [
         AccordionData(
             title: "Первый элемент",
             content: "Содержимое первого элемента"
         ),
         AccordionData(
             title: "Второй элемент",
             content: "Содержимое второго элемента"
         )
     ]
 )
 
 // Аккордеон с разделителями
 SDDSAccordion(
     items: [
         AccordionData(
             title: "Первый элемент",
             content: "Содержимое первого элемента"
         ),
         AccordionData(
             title: "Второй элемент",
             content: "Содержимое второго элемента"
         )
     ],
     showDividers: true
 )
 
 // Аккордеон с кастомным appearance
 SDDSAccordion(
     items: [
         AccordionData(
             title: "Элемент с кастомным стилем",
             content: "Содержимое элемента",
             appearance: AccordionItemSolidActionEnd.m.appearance
         )
     ],
     appearance: AccordionClearActionStart.m.appearance
 )
 
 // Аккордеон с обработчиками
 SDDSAccordion(
     items: [
         AccordionData(
             title: "Интерактивный элемент",
             content: "Содержимое",
             onToggle: { isExpanded in
                 print("Элемент \(isExpanded ? "развернут" : "свернут")")
             }
         )
     ]
 )
 ```
 */

public struct SDDSAccordion: View {
    @Environment(\.accordionAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    private let _appearance: AccordionAppearance?
    private let items: [AccordionData]
    private let showDividers: Bool
    
    public init(
        items: [AccordionData],
        showDividers: Bool = false,
        appearance: AccordionAppearance? = nil
    ) {
        self.items = items
        self.showDividers = showDividers
        self._appearance = appearance
    }
    
    public var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 0) {
                ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                    SDDSAccordionItem(
                        title: item.title,
                        content: item.content,
                        isExpanded: item.isExpanded,
                        appearance: item.appearance ?? appearance.accordionItemAppearance,
                        onToggle: item.onToggle
                    )
                    .padding([.bottom], appearance.size.itemSpacing)
                    if index != items.count - 1 && showDividers {
                        SDDSDivider(appearance: appearance.dividerAppearance)
                    }
                }
            }
        }
    }
    
    var appearance: AccordionAppearance {
        _appearance ?? environmentAppearance
    }
}
