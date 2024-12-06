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
 */
public struct SDDSSwitch: View {
    public let title: String
    public let subtitle: String
    @Binding public var isOn: Bool
    public let isEnabled: Bool
    public let appearance: SwitchAppearance
    public let switchAccessibility: SwitchAccessibility
    
    @Environment(\.colorScheme) var colorScheme
    
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
        appearance: SwitchAppearance,
        switchAccessibility: SwitchAccessibility
    ) {
        self.title = title
        self.subtitle = subtitle
        self._isOn = isOn
        self.isEnabled = isEnabled
        self.appearance = appearance
        self.switchAccessibility = switchAccessibility
    }
    
    public var body: some View {
        if let width = appearance.size.width {
            content
                .frame(width: width)
        } else {
            content
                .fixedSize(horizontal: true, vertical: false)
        }
    }
    
    private var content: some View {
        VStack(alignment: .leading, spacing: appearance.size.verticalGap) {
            HStack {
                if !title.isEmpty {
                    Text(title)
                        .typography(titleTypography)
                        .foregroundColor(appearance.titleColor(for: isEnabled).color(for: colorScheme))
                        .accessibilityLabel(Text(switchAccessibility.titleLabel))
                        .accessibilityValue(Text(title))
                } else if !subtitle.isEmpty {
                    subtitleText
                }
                if title.isEmpty && subtitle.isEmpty {
                    Spacer(minLength: 0)
                }
                Toggle("", isOn: $isOn)
                    .toggleStyle(SwitchToggleStyle(tint: appearance.tintColor(for: isEnabled).color(for: colorScheme)))
                    .padding(.leading, -10.0)
                    .accessibilityLabel(Text(switchAccessibility.toggleLabel))
                    .accessibilityValue(Text(isOn ? "On" : "Off"))
                    .accessibilityHint(Text(switchAccessibility.toggleHint))
            }
            if !subtitle.isEmpty && !title.isEmpty {
                subtitleText
            }
        }
        .disabled(!isEnabled)
        .padding([.leading, .trailing], 1.0)
        .accessibilityElement(children: .combine) // Объединяет элементы переключателя в один элемент доступности
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
        Text(subtitle)
            .typography(subtitleTypography)
            .foregroundColor(appearance.subtitleColor(for: isEnabled).color(for: colorScheme))
            .accessibilityLabel(Text(switchAccessibility.subtitleLabel))
            .accessibilityValue(Text(subtitle))
    }
}
