import SwiftUI
import Foundation

private struct ListScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

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
    @Environment(\.subtheme) private var subtheme
    @Binding private var contentHeight: CGFloat
    private let _appearance: ListAppearance?
    private let items: [AnyView]
    private let showDividers: Bool
    private let maxHeight: CGFloat
    private let lastItem: AnyView?
    private let onItemTap: ((Int) -> Void)?
    @State private var scrollOffset: CGFloat = 0
    
    public init<RightContent: View>(
        items: [SDDSListItem<RightContent>],
        contentHeight: Binding<CGFloat> = .constant(0),
        showDividers: Bool = false,
        maxHeight: CGFloat = .infinity,
        appearance: ListAppearance? = nil,
        onItemTap: ((Int) -> Void)? = nil
    ) {
        self.items = items.map { AnyView($0) }
        self._appearance = appearance
        self._contentHeight = contentHeight
        self.maxHeight = maxHeight
        self.showDividers = showDividers
        self.lastItem = nil
        self.onItemTap = onItemTap
    }
    
    public init<RightContent: View, LastItem: View>(
        items: [SDDSListItem<RightContent>],
        contentHeight: Binding<CGFloat> = .constant(0),
        showDividers: Bool = false,
        maxHeight: CGFloat = .infinity,
        appearance: ListAppearance? = nil,
        lastItem: @escaping () -> LastItem,
        onItemTap: ((Int) -> Void)? = nil
    ) {
        self.items = items.map { AnyView($0) }
        self._appearance = appearance
        self._contentHeight = contentHeight
        self.maxHeight = maxHeight
        self.showDividers = showDividers
        self.lastItem = AnyView(lastItem())
        self.onItemTap = onItemTap
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            ForEach(items.indices, id: \.self) { index in
                items[index]
                    .id("list-item-\(index)-\(items.count)")
                    .environment(\.listItemAppearance, appearance.listItemAppearance)
                    .environment(\.subtheme, subtheme)
                if index != items.count - 1 && showDividers {
                    SDDSDivider(appearance: appearance.dividerAppearance)
                        .environment(\.subtheme, subtheme)
                }
            }
            
            if let lastItem = lastItem {
                lastItem
            }
        }
        .id("SDDSList-\(items.count)")
        .background(Color.clear)
        .background(
            GeometryReader { contentGeometry in
                Color.clear
                    .onAppear {
                        contentHeight = min(contentGeometry.size.height, maxHeight)
                    }
                    .onChange(of: contentGeometry.size.height) { newHeight in
                        contentHeight = min(newHeight, maxHeight)
                    }
            }
        )
        .background(
            GeometryReader { geometry in
                Color.clear
                    .preference(
                        key: ListScrollOffsetPreferenceKey.self,
                        value: -geometry.frame(in: .named("scroll")).origin.y
                    )
            }
        )
        .onPreferenceChange(ListScrollOffsetPreferenceKey.self) { offset in
            scrollOffset = offset
        }
        .scrollbar(scrollBarData: scrollbarData)
        .gesture(
            DragGesture(minimumDistance: 0)
                .onEnded { value in
                    guard let onItemTap = onItemTap else {
                        return
                    }
                    let tapLocation = value.location
                    let adjustedY = tapLocation.y + scrollOffset
                    let itemHeight = appearance.listItemAppearance.size.height
                    let dividerHeight: CGFloat = showDividers ? appearance.dividerAppearance.thickness : 0
                    
                    var currentY: CGFloat = 0
                    for index in 0..<items.count {
                        let itemTop = currentY
                        let itemBottom = currentY + itemHeight
                        if adjustedY >= itemTop && adjustedY < itemBottom {
                            print("  ✅ Item \(index) selected (Y range [\(itemTop), \(itemBottom)))")
                            onItemTap(index)
                            return
                        }
                        currentY += itemHeight
                        if index < items.count - 1 && showDividers {
                            currentY += dividerHeight
                        }
                    }
                }
        )
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
        self.lastItem = nil
        self.onItemTap = nil
    }
    
    public init<RightContent: View, LastItem: View>(
        appearance: ListAppearance? = nil,
        showDividers: Bool = false,
        maxHeight: CGFloat = .infinity,
        @ViewBuilder content: () -> [SDDSListItem<RightContent>],
        @ViewBuilder lastItem: @escaping () -> LastItem
    ) {
        self.items = content().map { AnyView($0) }
        self._contentHeight = .constant(0)
        self.showDividers = showDividers
        self.maxHeight = maxHeight
        self._appearance = appearance
        self.lastItem = AnyView(lastItem())
        self.onItemTap = nil
    }
}
