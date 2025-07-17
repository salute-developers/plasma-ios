import SwiftUI
import Foundation
import SDDSThemeCore

/**
 `SDDSAccordionItem` представляет собой компонент для отображения сворачиваемого элемента с заголовком и контентом.

 Компонент поддерживает различные состояния и автоматически применяет соответствующие стили.

 - Parameters:
    - title: Заголовок элемента аккордеона
    - content: Контент элемента аккордеона
    - isExpanded: Состояние развернутости элемента
    - appearance: Параметры внешнего вида элемента аккордеона (опционально)
    - onToggle: Обработчик переключения состояния элемента (опционально)

 ## Окружение
 - `accordionItemAppearance`: Стандартные настройки внешнего вида элемента аккордеона

 ## Особенности
 - Поддерживает hover состояния (только на macOS)
 - Автоматически применяет анимацию вращения disclosure
 - Использует настраиваемые отступы и размеры из appearance
 - Поддерживает кастомные формы через PathDrawer
 - Применяет типографику в зависимости от размера
 - Disclosure может быть размещен слева или справа

 ## Примеры использования
 ```swift
 // Базовый элемент аккордеона
 SDDSAccordionItem(
     title: "Заголовок",
     content: "Содержимое элемента аккордеона",
     appearance: AccordionItemSolidActionEnd.m.appearance
 )
 
 // Элемент с обработчиком
 SDDSAccordionItem(
     title: "Нажми меня",
     content: "Этот контент появится при нажатии",
     onToggle: { isExpanded in
         print("Элемент \(isExpanded ? "развернут" : "свернут")")
     },
     appearance: AccordionItemSolidActionEnd.m.appearance
 )
 
 // Элемент с управляемым состоянием
 @State private var isExpanded = false
 
 SDDSAccordionItem(
     title: "Управляемый элемент",
     content: "Контент с управляемым состоянием",
     isExpanded: $isExpanded,
     appearance: AccordionItemSolidActionEnd.m.appearance
 )
 ```
 */

public struct SDDSAccordionItem: View {
    @Environment(\.accordionItemAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    private let _appearance: AccordionItemAppearance?
    private let title: String
    private let content: String
    private let onToggle: ((Bool) -> ())?
    @State private var isExpanded: Bool
    @State private var isHovered: Bool = false
    
    public init(
        title: String = "",
        content: String = "",
        isExpanded: Bool = false,
        appearance: AccordionItemAppearance? = nil,
        onToggle: ((Bool) -> ())? = nil
    ) {
        self.title = title
        self.content = content
        self._isExpanded = State(initialValue: isExpanded)
        self.onToggle = onToggle
        self._appearance = appearance
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            titleCell
                .highPriorityGesture(
                    TapGesture().onEnded { _ in
                        withAnimation(.easeInOut(duration: 0.2)) {
                            isExpanded.toggle()
                            onToggle?(isExpanded)
                        }
                    }
                )
                .onHover { hovering in
                    isHovered = hovering
                }
            
            if isExpanded {
                contentCell
                    .transition(.opacity)
            }
        }
        .shape(pathDrawer: appearance.size.shape)
    }
    
    @ViewBuilder private var titleCell: some View {
        HStack(alignment: .center, spacing: 0) {
            if appearance.size.iconPlacement == .start {
                disclosureIcon
                    .padding(.trailing, appearance.size.iconPadding)
            }
            
            Text(title)
                .foregroundStyle(appearance.titleColor.color(for: colorScheme))
                .typography(titleTypography)
            
            Spacer()
            
            if appearance.size.iconPlacement == .end {
                disclosureIcon
                    .padding(.leading, appearance.size.iconPadding)
            }
        }
        .padding(.leading, appearance.size.paddingStart)
        .padding(.trailing, appearance.size.paddingEnd)
        .padding(.top, appearance.size.paddingTop)
        .padding(.bottom, appearance.size.paddingBottom)
        .background(appearance.backgroundColor.color(for: colorScheme))
        .contentShape(Rectangle())
    }
    
    @ViewBuilder private var contentCell: some View {
        Text(content)
            .foregroundStyle(appearance.contentTextColor.color(for: colorScheme))
            .typography(contentTextTypography)
            .padding(.leading, appearance.size.contentPaddingStart)
            .padding(.trailing, appearance.size.contentPaddingEnd)
            .padding(.bottom, appearance.size.contentPaddingBottom)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(appearance.backgroundColor.color(for: colorScheme))
    }
    
    @ViewBuilder private var disclosureIcon: some View {
        if let icon = isExpanded ? appearance.openedIcon : appearance.closedIcon {
            icon
                .renderingMode(.template)
                //.resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: iconSize, height: iconSize)
                .foregroundStyle(appearance.titleColor.color(for: colorScheme))
                .rotationEffect(.degrees(isExpanded ? rotation : 0))
                .animation(.easeInOut(duration: 0.2), value: isExpanded)
        }
    }
    
    private var iconSize: CGFloat {
        titleTypography.lineHeight
    }
    
    var appearance: AccordionItemAppearance {
        _appearance ?? environmentAppearance
    }
    
    private var rotation: CGFloat {
        appearance.size.iconRotation + (appearance.size.iconPlacement == .end ? 90.0 : -180.0)
    }
    
    private var titleTypography: TypographyToken {
        appearance.titleTypography.typography(with: appearance.size) ?? .undefined
    }
    
    private var contentTextTypography: TypographyToken {
        appearance.contentTextTypography.typography(with: appearance.size) ?? .undefined
    }
}
