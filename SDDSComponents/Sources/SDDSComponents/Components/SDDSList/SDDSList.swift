import SwiftUI
import Foundation

/**
 `SDDSList` представляет собой компонент для отображения списка элементов, который ведет себя как стандартный SwiftUI List, но отображает SDDSListItem компоненты.

 Компонент использует SwiftUI List под капотом для обеспечения стандартного поведения (скролл, управление памятью), но с кастомными настройками отображения.

 - Parameters:
    - items: Массив SDDSListItem элементов для отображения
    - appearance: Параметры внешнего вида списка (опционально)

 ## Окружение
 - `listAppearance`: Стандартные настройки внешнего вида списка

 ## Особенности
 - Использует стандартный SwiftUI List для обеспечения нативного поведения
 - Автоматически применяет настройки внешнего вида к каждому элементу списка
 - Поддерживает скролл и эффективное управление памятью для больших списков
 - Убирает стандартные отступы и разделители строк

 ## Примеры использования
 ```swift
 // Базовый список с SDDSListItem'ами
 SDDSList(
     items: [
         SDDSListItem(title: "Первый элемент"),
         SDDSListItem(title: "Второй элемент"),
         SDDSListItem(title: "Третий элемент")
     ],
     appearance: ListNormal.m.appearance
 )
 
 // Список через ViewBuilder
 SDDSList(appearance: ListNormal.m.appearance) {
     SDDSListItem(title: "Первый элемент")
     SDDSListItem(title: "Второй элемент")
     SDDSListItem(title: "Третий элемент")
 }
 
 // Список с кастомным rightContent
 SDDSList(
     items: [
         SDDSListItem(
             title: "Элемент с иконкой",
             rightContent: { Image(systemName: "chevron.right") }
         ),
         SDDSListItem(
             title: "Элемент с кнопкой",
             rightContent: { Button("Действие") {} }
         )
     ],
     appearance: ListNormal.m.appearance
 )
 ```
 */

public struct SDDSList: View {
    @Environment(\.listAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    private let _appearance: ListAppearance?
    private let items: [AnyView]
    
    public init<RightContent: View>(
        items: [SDDSListItem<RightContent>],
        appearance: ListAppearance? = nil
    ) {
        self.items = items.map { AnyView($0) }
        self._appearance = appearance
    }
    
    public var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                    item
                        .environment(\.listItemAppearance, appearance.listItemAppearance)
                }
            }
            .background(Color.clear)
        }
    }
    
    var appearance: ListAppearance {
        _appearance ?? environmentAppearance
    }
}

extension SDDSList {
    public init<RightContent: View>(
        appearance: ListAppearance? = nil,
        @ViewBuilder content: () -> [SDDSListItem<RightContent>]
    ) {
        self.items = content().map { AnyView($0) }
        self._appearance = appearance
    }
}
