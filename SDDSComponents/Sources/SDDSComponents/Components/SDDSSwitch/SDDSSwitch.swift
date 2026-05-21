import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `SDDSSwitch` представляет собой настраиваемый переключатель, который может быть настроен с помощью различных параметров.
 
 - Parameters:
    - title: Текст заголовка для переключателя.
    - subtitle: Текст подзаголовка для переключателя.
    - isOn: Связка состояния включения/выключения переключателя.
    - isEnabled: Флаг, указывающий, включен ли переключатель.
    - appearance: Параметры внешнего вида переключателя.
    - switchAccessibility: Параметры доступности для переключателя.

 ## Окружение
 
 - `switchAppearance`: Стандартные настройки внешнего вида переключателя

 ## Пример использования
 ```swift
 @State isOn: Bool = true
 
 SDDSSwitch(
     title: "Label",
     subtitle: "Description",
     isOn: $isOn,
     isEnabled: true,
     appearance: Switch.l.appearance,
     switchAccessibility: SwitchAccessibility()
 )
```
 */
public struct SDDSSwitch: View {
    public let title: String
    public let subtitle: String
    @Binding public var isOn: Bool
    public let isEnabled: Bool
    public let switchAccessibility: SwitchAccessibility
    private var _appearance: SwitchAppearance?
    @Environment(\.switchAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.subtheme) private var subtheme
    /**
     Инициализатор для создания переключателя с заданными параметрами.
     
     - Parameters:
        - title: Текст заголовка для переключателя.
        - subtitle: Текст подзаголовка для переключателя.
        - isOn: Связка состояния включения/выключения переключателя.
        - isEnabled: Флаг, указывающий, включен ли переключатель.
        - appearance: Параметры внешнего вида переключателя.
        - switchAccessibility: Параметры доступности для переключателя.
     */
    public init(
        title: String = "",
        subtitle: String = "",
        isOn: Binding<Bool> = .constant(true),
        isEnabled: Bool = true,
        appearance: SwitchAppearance? = nil,
        switchAccessibility: SwitchAccessibility
    ) {
        self.title = title
        self.subtitle = subtitle
        self._isOn = isOn
        self.isEnabled = isEnabled
        self._appearance = appearance
        self.switchAccessibility = switchAccessibility
    }
    
    public var body: some View {
        content
    }
    
    private var content: some View {
        VStack(alignment: .leading, spacing: appearance.size.descriptionPadding) {
            HStack(spacing: appearance.size.textPadding) {
                if !title.isEmpty {
                    let titleStyle = appearance.titleColor(for: isEnabled)
                    Text(title)
                        .typography(titleTypography)
                        .fillForeground(style: titleStyle)
                        .accessibilityLabel(Text(switchAccessibility.titleLabel))
                        .accessibilityValue(Text(title))
                    Spacer()
                }
                SDDSToggle(
                    isOn: $isOn,
                    size: appearance.size,
                    onColor: appearance.toggleTrackStatefulColor.resolvedValue(for: Set([InteractiveState.checked])),
                    offColor: appearance.toggleTrackStatefulColor.resolvedValue(for: Set<InteractiveState>()),
                    thumbColor: appearance.toggleThumbColor.resolvedDefaultValue()
                )
                .opacity(isEnabled ? 1.0 : appearance.disabledAlpha)
                .overlay(switchBorder)
                .accessibilityLabel(Text(switchAccessibility.toggleLabel))
                .accessibilityValue(Text(isOn ? "On" : "Off"))
                .accessibilityHint(Text(switchAccessibility.toggleHint))
            }
            if !subtitle.isEmpty && !title.isEmpty {
                HStack {
                    subtitleText
                    Spacer()
                }
            }
        }
        .disabled(!isEnabled)
        .padding([.leading, .trailing], 1.0)
        .accessibilityElement(children: .combine)
        .accessibilityLabel(Text(switchAccessibility.switchLabel))
        .accessibilityValue(Text(isEnabled ? switchAccessibility.switchEnabledValue : switchAccessibility.switchDisabledValue))
    }

    var titleTypography: TypographyToken {
        if let typography = appearance.titleTypography.typography(with: appearance.size) {
            return typography
        } else {
            fatalError("Undefined Switch Typography for size \(appearance.size.debugDescription).")
        }
    }

    var subtitleTypography: TypographyToken {
        if let typography = appearance.subtitleTypography.typography(with: appearance.size) {
            return typography
        } else {
            fatalError("Undefined Switch Typography for size \(appearance.size.debugDescription). Using a default value.")
        }
    }
    
    @ViewBuilder
    private var subtitleText: some View {
        let subtitleStyle = appearance.subtitleColor(for: isEnabled)
        Text(subtitle)
            .typography(subtitleTypography)
            .fillForeground(style: subtitleStyle)
            .accessibilityLabel(Text(switchAccessibility.subtitleLabel))
            .accessibilityValue(Text(subtitle))
    }

    @ViewBuilder
    private var switchBorder: some View {
        let path = appearance.size.toggleTrackPathDrawer.path(
            in: CGRect(x: 0, y: 0, width: appearance.size.toggleTrackWidth, height: appearance.size.toggleTrackHeight)
        )
        let style = appearance.toggleTrackBorderColor.resolvedDefaultValue()
        switch style {
        case .color(let colorToken):
            path.stroke(colorToken.color(for: colorScheme, subtheme: subtheme), lineWidth: 1)
        case .gradient(let gradientToken):
            Rectangle()
                .gradient(gradientToken, colorScheme: colorScheme, subtheme: subtheme)
                .mask(path.stroke(style: StrokeStyle(lineWidth: 1)))
        }
    }
    
    var appearance: SwitchAppearance {
        _appearance ?? environmentAppearance
    }
}
