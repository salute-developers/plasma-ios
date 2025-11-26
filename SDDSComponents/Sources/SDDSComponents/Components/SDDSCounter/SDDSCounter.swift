import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `SDDSCounter` представляет собой компонент счетчика, отображающий числовое значение с настраиваемым внешним видом и состояниями.

- Parameters:
    - text: Текст (числовое значение) для отображения в счетчике
    - appearance: Кастомизация внешнего вида счетчика (опционально)
    - isAnimating: Флаг анимации счетчика
    - isHighlighted: Флаг подсветки счетчика
    - isHovered: Флаг состояния наведения
    - isSelected: Флаг выбранного состояния

## Окружение

- `counterAppearance`: Стандартные настройки внешнего вида счетчиков

## Пример использования

```swift
// Создание счетчика с предупреждающим стилем
SDDSCounter(
    text: "1",
    appearance: Counter.l.warning.appearance,
    isAnimating: false,
    isHighlighted: true,
    isHovered: false,
    isSelected: false
)
 ```
 */

public struct SDDSCounter: View {
    public let text: String
    private let _appearance: CounterAppearance?
    
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.subtheme) private var subtheme
    @Environment(\.counterAppearance) private var environmentAppearance
    
    var isAnimating: Bool
    var isHighlighted: Bool
    var isHovered: Bool
    var isSelected: Bool
    
    public init(
        text: String,
        appearance: CounterAppearance? = nil,
        isAnimating: Bool,
        isHighlighted: Bool,
        isHovered: Bool,
        isSelected: Bool
    ) {
        self.text = text
        self._appearance = appearance
        self.isAnimating = isAnimating
        self.isHighlighted = isHighlighted
        self.isHovered = isHovered
        self.isSelected = isSelected
    }
    
    public var body: some View {
        ZStack {
            if isAuto {
                counterAutomationSize
                    .padding(appearance.size.paddings)
            } else {
                counterMinimumSize
            }
        }
        .frame(height: appearance.size.height)
        .background(currentColor(for: appearance.backgroundColor))
        .cornerRadius(cornerRadius)
    }
    
    public var counterAutomationSize: some View {
        textView(
            text: text,
            typographyToken: textTypography,
            counterColor: appearance.textColor
        )
        .fixedSize()
    }
    
    @ViewBuilder
    public var counterMinimumSize: some View {
        Circle()
            .fill(currentColor(for: appearance.backgroundColor))
        textView(
            text: text,
            typographyToken: textTypography,
            counterColor: appearance.textColor
        )
    }
    
    public func textView(text: String, typographyToken: TypographyToken, counterColor: ButtonColor) -> some View {
        Text(text)
            .typography(typographyToken)
            .foregroundColor(currentColor(for: counterColor))
    }
}

private extension SDDSCounter {
    var cornerRadius: CGFloat {
        return appearance.size.height / 2
    }
    
    var textTypography: TypographyToken {
        if let typography = appearance.textTypography.typography(with: appearance.size) {
            return typography
        } else {
            fatalError(undefinedTypographyErrorText(sizeDescription: appearance.size.debugDescription))
        }
    }
    
    func currentColor(for counterColor: ButtonColor) -> Color {
        if isSelected {
            return counterColor.selectedColor.color(for: colorScheme, subtheme: subtheme)
        } else if isHighlighted {
            return counterColor.highlightedColor.color(for: colorScheme, subtheme: subtheme)
        } else if isHovered {
            return counterColor.hoveredColor.color(for: colorScheme, subtheme: subtheme)
        } else {
            return counterColor.defaultColor.color(for: colorScheme, subtheme: subtheme)
        }
    }
    
    var isAuto: Bool {
        text.count > 1
    }
    
    var appearance: CounterAppearance {
        _appearance ?? environmentAppearance
    }
}
