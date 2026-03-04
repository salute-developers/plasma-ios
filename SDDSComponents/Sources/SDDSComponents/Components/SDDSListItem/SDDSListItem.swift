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
    @Environment(\.subtheme) private var subtheme
    private let _appearance: ListItemAppearance?
    private let label: String?
    private let title: String
    private let subtitle: String?
    private let counterText: String?
    private let rightContent: RightContent
    private let rightContentEnabled: Bool
    private let disabled: Bool
    private let onTap: (() -> ())?
    @State private var isHighlighted: Bool = false
    @State private var isHovered: Bool = false
    
    public init(
        label: String? = nil,
        title: String = "",
        subtitle: String? = nil,
        counterText: String? = nil,
        @ViewBuilder rightContent: () -> RightContent = { EmptyView() },
        rightContentEnabled: Bool = true,
        disabled: Bool = false,
        appearance: ListItemAppearance? = nil,
        onTap: (() -> ())? = nil
    ) {
        self.label = label
        self.title = title
        self.subtitle = subtitle
        self.counterText = counterText
        self.rightContent = rightContent()
        self.rightContentEnabled = rightContentEnabled
        self.disabled = disabled
        self.onTap = onTap
        self._appearance = appearance
    }
    
    public var body: some View {
        Group {
            HStack(spacing: 0) {
                if let counterText, let counterAppearance = appearance.counterAppearance {
                    SDDSCounter(
                        text: counterText,
                        appearance: counterAppearance,
                        isAnimating: false,
                        isHighlighted: isHighlighted,
                        isHovered: isHovered,
                        isSelected: false
                    )
                    .padding(.trailing, appearance.size.contentPaddingStart)
                }
                textContent
                Spacer()
                if rightContentEnabled {
                    disclosure
                        .tint(appearance.disclosureIconColor.color(for: colorScheme, subtheme: subtheme))
                        .padding(.leading, appearance.size.contentPaddingEnd)
                }
            }
            .padding(.leading, appearance.size.paddingStart)
            .padding(.trailing, appearance.size.paddingEnd)
            .padding(.top, appearance.size.paddingTop)
            .padding(.bottom, appearance.size.paddingBottom)
        }
        .frame(height: resolvedHeight)
        .background(currentColor(for: appearance.backgroundColor))
        .opacity(contentOpacity)
        .shape(pathDrawer: appearance.size.shape)
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
        disabled ? appearance.disabledAlpha : 1.0
    }
    
    private var resolvedHeight: CGFloat? {
        appearance.size.height > 0 ? appearance.size.height : nil
    }
    
    @ViewBuilder
    private var textContent: some View {
        VStack(alignment: .leading, spacing: 0) {
            if let label, !label.isEmpty {
                Text(label)
                    .foregroundStyle(appearance.labelColor.color(for: colorScheme, subtheme: subtheme))
                    .typography(labelTypography)
            }
            Text(title)
                .foregroundStyle(appearance.titleColor.color(for: colorScheme, subtheme: subtheme))
                .typography(titleTypography)
            if let subtitle, !subtitle.isEmpty, let subtitleTypography = resolvedSubtitleTypography {
                Text(subtitle)
                    .foregroundStyle(appearance.subtitleColor.color(for: colorScheme, subtheme: subtheme))
                    .typography(subtitleTypography)
            }
        }
    }
    
    private var titleTypography: TypographyToken {
        appearance.titleTypography.typography(with: appearance.size) ?? .undefined
    }
    
    private var labelTypography: TypographyToken {
        appearance.labelTypography.typography(with: appearance.size) ?? .undefined
    }
    
    private var resolvedSubtitleTypography: TypographyToken? {
        appearance.subtitleTypography?.typography(with: appearance.size)
    }
    
    private func currentColor(for buttonColor: ButtonColor) -> Color {
        if isHovered {
            return buttonColor.hoveredColor.color(for: colorScheme, subtheme: subtheme)
        } else {
            return buttonColor.defaultColor.color(for: colorScheme, subtheme: subtheme)
        }
    }
}
