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
    @Binding private var contentHeight: CGFloat
    private let _appearance: ListAppearance?
    private let items: [AnyView]
    private let showDividers: Bool
    private let maxHeight: CGFloat
    
    public init<RightContent: View>(
        items: [SDDSListItem<RightContent>],
        contentHeight: Binding<CGFloat> = .constant(0),
        showDividers: Bool = false,
        maxHeight: CGFloat = .infinity,
        appearance: ListAppearance? = nil
    ) {
        self.items = items.map { AnyView($0) }
        self._appearance = appearance
        self._contentHeight = contentHeight
        self.maxHeight = maxHeight
        self.showDividers = showDividers
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                item
                    .environment(\.listItemAppearance, appearance.listItemAppearance)
                if index != items.count - 1 && showDividers {
                    SDDSDivider(appearance: appearance.dividerAppearance)
                }
            }
        }
        .background(Color.clear)
        .background(
            GeometryReader { contentGeometry in
                Color.clear
                    .onAppear {
                        print(contentGeometry.size.height)
                        contentHeight = min(contentGeometry.size.height, maxHeight)
                    }
                    .onChange(of: contentGeometry.size.height) { newHeight in
                        contentHeight = min(newHeight, maxHeight)
                    }
            }
        )
        .scrollbar(scrollBarData: scrollbarData)
    }
    
    var appearance: ListAppearance {
        _appearance ?? environmentAppearance
    }
    
    private var scrollbarData: ScrollBarData {
        .init(
            hasTrack: true,
            hoverExpand: false,
            offsetY: 0,
            totalHeight: contentHeight,
            scrollBarThickness: appearance.scrollBarAppearance.size.width,
            scrollBarPaddingTop: 0,
            scrollBarPaddingBottom: 0,
            scrollBarPaddingEnd: 2,
            scrollBarTrackColor: appearance.scrollBarAppearance.trackColor,
            scrollBarThumbColor: appearance.scrollBarAppearance.thumbColor,
            contentInsetTop: 0
        )
    }
}

extension SDDSList {
    public init<RightContent: View>(
        appearance: ListAppearance? = nil,
        showDividers: Bool = false,
        maxHeight: CGFloat = .infinity,
        @ViewBuilder content: () -> [SDDSListItem<RightContent>]
    ) {
        self.items = content().map { AnyView($0) }
        self._contentHeight = .constant(0)
        self.showDividers = showDividers
        self.maxHeight = maxHeight
        self._appearance = appearance
    }
}
