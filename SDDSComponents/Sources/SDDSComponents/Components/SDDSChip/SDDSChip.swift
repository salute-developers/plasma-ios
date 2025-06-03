import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `SDDSChip` представляет собой настраиваемый чип, который может быть настроен с помощью различных параметров.
 
 - Parameters:
    - title: Текст заголовка для чипа.
    - isEnabled: Флаг, указывающий, включен ли чип.
    - iconImage: Изображение иконки для чипа.
    - buttonImage: Изображение кнопки для чипа.
    - appearance: Параметры внешнего вида чипа.
    - accessibility: Параметры доступности для чипа.
    - removeAction: Действие при нажатии на кнопку удаления.

 ## Окружение
 
 - `chipAppearance`: Стандартные настройки внешнего вида чипов

 ## Пример использования

 ```swift
 // Простой чип
 SDDSChip(
     title: "Label",
     isEnabled: true,
     iconImage: Image.image("chipIcon"),
     buttonImage: Image.image("chipClose"),
     appearance: Chip.m.pilled.accent.appearance,
     removeAction: {}
 )
 ```
 */
public struct SDDSChip: View {
    let title: String
    let isEnabled: Bool
    let iconImage: Image?
    let buttonImage: Image?
    private let _appearance: ChipAppearance?
    let accessibility: ChipAccessibility
    let removeAction: () -> Void
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.chipAppearance) private var environmentAppearance

    /**
     Инициализатор для создания чипа с заданными параметрами.
     
     - Parameters:
        - title: Текст заголовка для чипа.
        - isEnabled: Флаг, указывающий, включен ли чип.
        - iconImage: Изображение иконки для чипа (по умолчанию nil).
        - buttonImage: Изображение кнопки для чипа (по умолчанию nil).
        - appearance: Параметры внешнего вида чипа.
        - accessibility: Параметры доступности для чипа (по умолчанию `ChipAccessibility`).
        - removeAction: Действие при нажатии на кнопку удаления.
     */
    public init(
        title: String,
        isEnabled: Bool,
        iconImage: Image? = nil,
        buttonImage: Image? = nil,
        appearance: ChipAppearance? = nil,
        accessibility: ChipAccessibility = ChipAccessibility(),
        removeAction: @escaping () -> Void) {
        self.title = title
        self.isEnabled = isEnabled
        self.iconImage = iconImage
        self.buttonImage = buttonImage
        self._appearance = appearance
        self.accessibility = accessibility
        self.removeAction = removeAction
    }
    
    /**
     Инициализатор для создания чипа на основе данных структуры `ChipData`.
     
     - Parameters:
        - data: Структура `ChipData`, содержащая все параметры для создания чипа.
     */
    public init(data: ChipData) {
        self.title = data.title
        self.isEnabled = data.isEnabled
        self.iconImage = data.iconImage
        self.buttonImage = data.buttonImage
        self._appearance = data.appearance
        self.accessibility = data.accessibility
        self.removeAction = data.removeAction
    }
    
    public init(data: ChipData, appearance: ChipAppearance) {
        self.title = data.title
        self.isEnabled = data.isEnabled
        self.iconImage = data.iconImage
        self.buttonImage = data.buttonImage
        self._appearance = appearance
        self.accessibility = data.accessibility
        self.removeAction = data.removeAction
    }
    
    public var body: some View {
        HStack(spacing: 0) {
            Spacer()
                .frame(width: appearance.size.leadingInset)
            if let contentStart = iconImage {
                contentStart
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: appearance.size.iconImageSize.width, height: appearance.size.iconImageSize.height)
                    .foregroundColor(appearance.imageTintColor.defaultColor.color(for: colorScheme))
                    .accessibilityHidden(true)
                Spacer()
                    .frame(width: appearance.size.contentStartPadding)
            }
            
            Text(title)
                .lineLimit(1)
                .typography(appearance.titleTypography.typography(with: appearance.size) ?? .undefined)
                .frame(width: textWidth)
                .foregroundColor(appearance.titleColor.defaultColor.color(for: colorScheme))
                .accessibilityLabel(Text(accessibility.titleLabel))
                .accessibilityValue(Text(title))
            
            if let contentEnd = buttonImage {
                Spacer()
                    .frame(width: appearance.size.contentEndPadding)
                Button(action: handleRemove) {
                    contentEnd
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: appearance.size.buttonImageSize.width, height: appearance.size.buttonImageSize.height)
                        .foregroundColor(appearance.buttonTintColor.defaultColor.color(for: colorScheme))
                        .accessibilityLabel(Text(accessibility.removeButtonLabel))
                        .accessibilityHint(Text(accessibility.removeButtonHint))
                        .accessibilityAddTraits(.isButton)
                }
            }
            Spacer()
                .frame(width: appearance.size.trailingInset)
        }
        .onTapGesture(perform: handleRemove)
        .frame(height: appearance.size.height)
        .background(
            RoundedRectangle(cornerRadius: borderRadius)
                .fill(appearance.backgroundColor.defaultColor.color(for: colorScheme))
                .opacity(isEnabled ? 1.0 : appearance.disabledAlpha)
        )
        .accessibilityElement(children: .combine)
    }
    
    private var textWidth: CGFloat {
        let titleTypography = appearance.titleTypography.typography(with: appearance.size) ?? .undefined
        let textWidth = title.size(withAttributes: [.font: titleTypography.uiFont]).width
        
        return textWidth
    }
    
    private var borderRadius: CGFloat {
        return appearance.size.cornerRadius
    }
    
    private func handleRemove() {
        guard isEnabled else {
            return
        }
        removeAction()
    }
    
    var appearance: ChipAppearance {
        _appearance ?? environmentAppearance
    }
}
