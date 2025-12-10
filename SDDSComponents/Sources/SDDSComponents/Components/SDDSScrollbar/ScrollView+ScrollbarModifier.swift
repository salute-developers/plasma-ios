import Foundation
import SwiftUI
import SDDSThemeCore

/**
 Модификатор для добавления кастомного скроллбара к ScrollView.
 
 Этот модификатор автоматически создает и управляет кастомным скроллбаром для ScrollView.
 Скроллбар появляется при скролле и автоматически исчезает через 3 секунды после остановки.
 Поддерживает вертикальное и горизонтальное направление скролла.
 
 - Parameters:
    - scrollBarData: Данные для настройки скроллбара
    - direction: Направление скроллбара (.vertical или .horizontal)
    - isScrolling: Binding для отслеживания состояния скролла (опционально)

 ## Примеры использования
 ```swift
 // Вертикальный скроллбар (по умолчанию)
 ScrollView {
     Text("Длинный контент...")
 }
 .scrollbar(scrollBarData: scrollBarData)
 
 // С отслеживанием состояния скролла
 @State private var isScrolling = false
 
 ScrollView {
     Text("Длинный контент...")
 }
 .scrollbar(scrollBarData: scrollBarData, direction: .vertical, isScrolling: $isScrolling)
 ```
 */

public extension View {
    func scrollbar(scrollBarData: ScrollBarData, direction: SDDSScrollDirection = .vertical, isScrolling: Binding<Bool> = .constant(false), subtheme: SubthemeData = SubthemeData()) -> some View {
        self.modifier(ScrollBarModifier(scrollBarData: scrollBarData, direction: direction, isScrollingToBottom: isScrolling))
            .environment(\.subtheme, subtheme)
    }
}
