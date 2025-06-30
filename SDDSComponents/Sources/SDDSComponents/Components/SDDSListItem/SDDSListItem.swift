import SwiftUI
import Foundation
import SDDSThemeCore

/**
 `SDDSListItem` представляет собой компонент для отображения элемента списка с настраиваемым заголовком, правым контентом и интерактивностью.

 Компонент поддерживает различные состояния (обычное, наведение, отключенное) и автоматически применяет соответствующие стили.

 - Parameters:
    - title: Заголовок элемента списка
    - rightContent: Кастомный контент справа от заголовка (опционально)
    - disabled: Флаг отключения элемента
    - appearance: Параметры внешнего вида элемента списка (опционально)
    - onTap: Обработчик нажатия на элемент (опционально)

 ## Окружение
 - `listItemAppearance`: Стандартные настройки внешнего вида элемента списка

 ## Особенности
 - Поддерживает hover состояния (только на macOS)
 - Автоматически применяет opacity 0.4 для отключенных элементов
 - Использует настраиваемые отступы и размеры из appearance
 - Поддерживает кастомные формы через PathDrawer
 - Применяет типографику в зависимости от размера

 ## Примеры использования
 ```swift
 // Базовый элемент списка
 SDDSListItem(
     title: "Простой элемент",
     appearance: ListItemNormal.m.appearance
 )
 
 // Элемент с иконкой справа
 SDDSListItem(
     title: "Элемент с иконкой",
     rightContent: { Image(systemName: "chevron.right") },
     appearance: ListItemNormal.m.appearance
 )
 
 // Интерактивный элемент
 SDDSListItem(
     title: "Нажми меня",
     rightContent: { Image(systemName: "plus.circle") },
     onTap: { print("Элемент нажат") },
     appearance: ListItemNormal.m.appearance
 )
 
 // Отключенный элемент
 SDDSListItem(
     title: "Отключенный элемент",
     disabled: true,
     appearance: ListItemNormal.m.appearance
 )
 
 // Элемент с кастомным rightContent
 SDDSListItem(
     title: "С кастомным контентом",
     rightContent: {
         HStack {
             Text("Доп. текст")
             Button("Действие") {}
         }
     },
     appearance: ListItemNormal.m.appearance
 )
 ```
 */

public struct SDDSListItem<RightContent: View>: View {
    @Environment(\.listItemAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    private let _appearance: ListItemAppearance?
    private let title: String
    private let rightContent: RightContent
    private let rightContentEnabled: Bool
    private let disabled: Bool
    private let onTap: (() -> ())?
    @State private var isHighlighted: Bool = false
    @State private var isHovered: Bool = false
    
    public init(
        title: String = "",
        @ViewBuilder rightContent: () -> RightContent = { EmptyView() },
        rightContentEnabled: Bool = true,
        disabled: Bool = false,
        appearance: ListItemAppearance? = nil,
        onTap: (() -> ())? = nil
    ) {
        self.title = title
        self.rightContent = rightContent()
        self.rightContentEnabled = rightContentEnabled
        self.disabled = disabled
        self.onTap = onTap
        self._appearance = appearance
    }
    
    public var body: some View {
        Group {
            HStack(spacing: 0) {
                Text(title)
                    .foregroundStyle(appearance.titleColor.color(for: colorScheme))
                    .typography(titleTypography)
                Spacer()
                if rightContentEnabled {
                    disclosure
                        .tint(appearance.disclosureIconColor.color(for: colorScheme))
                        .padding(.leading, appearance.size.contentPaddingEnd)
                }
            }
            .padding(.leading, appearance.size.paddingStart)
            .padding(.trailing, appearance.size.paddingEnd)
            .padding(.top, appearance.size.paddingTop)
            .padding(.bottom, appearance.size.paddingBottom)
        }
        .frame(height: appearance.size.height)
        .shape(pathDrawer: appearance.size.shape)
        .background(currentColor(for: appearance.backgroundColor))
        .opacity(contentOpacity)
        .onTapGesture {
            onTap?()
        }
        .disabled(disabled)
        .onHover { hovering in
            isHovered = hovering
        }
    }
    
    @ViewBuilder var disclosure: some View {
        if let disclosureIcon = appearance.disclosureIcon {
            disclosureIcon
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            rightContent
        }

    }
    
    var appearance: ListItemAppearance {
        _appearance ?? environmentAppearance
    }
    
    private var contentOpacity: CGFloat {
        disabled ? 0.4 : 1.0
    }
    
    private var titleTypography: TypographyToken {
        appearance.titleTypography.typography(with: appearance.size) ?? .undefined
    }
    
    private func currentColor(for buttonColor: ButtonColor) -> Color {
        if isHovered {
            return buttonColor.hoveredColor.color(for: colorScheme)
        } else {
            return buttonColor.defaultColor.color(for: colorScheme)
        }
    }
}
