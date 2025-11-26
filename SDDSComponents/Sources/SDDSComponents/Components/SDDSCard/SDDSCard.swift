import SwiftUI
import Foundation
import SDDSThemeCore

/**
 `SDDSCard` представляет собой контейнерный компонент для отображения содержимого в виде карточки с настраиваемым внешним видом.

 - Parameters:
   - appearance: Кастомизация внешнего вида карточки (опционально)
   - backgroundColor: Цвет фона карточки (опционально)
   - content: Содержимое карточки

 ## Окружение
 
 - `cardAppearance`: Стандартные настройки внешнего вида карточек

 ## Пример использования

 ```swift
 // Простая карточка с текстом
 SDDSCard(appearance: Card.m.default.appearance) {
      VStack(alignment: .leading, spacing: 8) {
          Text("Header")
          Text("Description")
      }
  }
 ```
 */

public struct SDDSCard<Content: View>: View {
    @Environment(\.cardAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.subtheme) private var subtheme
    private let _appearance: CardAppearance?
    private let backgroundColor: Color?
    
    public let content: Content
    
    public init(appearance: CardAppearance? = nil, backgroundColor: Color? = nil, @ViewBuilder content: () -> Content) {
        self._appearance = appearance
        self.backgroundColor = backgroundColor
        self.content = content()
    }
    
    public var body: some View {
        content
            .applyIf(appearance.size.paddingTop > 0) {
                $0.padding(.top, appearance.size.paddingTop)
            }
            .applyIf(appearance.size.paddingBottom > 0) {
                $0.padding(.bottom, appearance.size.paddingBottom)
            }
            .applyIf(appearance.size.paddingStart > 0) {
                $0.padding(.leading, appearance.size.paddingStart)
            }
            .applyIf(appearance.size.paddingEnd > 0) {
                $0.padding(.trailing, appearance.size.paddingEnd)
            }
            .background(backgroundColor ?? appearance.backgroundColor.color(for: colorScheme, subtheme: subtheme))
            .shape(pathDrawer: appearance.size.pathDrawer)
    }
    
    private var appearance: CardAppearance {
        _appearance ?? environmentAppearance
    }
}
