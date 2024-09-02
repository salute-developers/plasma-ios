import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `SwitchSizeConfiguration` определяет конфигурацию размеров для переключателя.
 
 - Properties:
    - width: Ширина переключателя.
    - verticalGap: Вертикальный зазор между элементами.
 */
public protocol SwitchSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var width: CGFloat? { get }
    var verticalGap: CGFloat { get }
}

/**
 `SwitchAppearance` определяет внешний вид переключателя, включая типографику и цвета для различных состояний.
 
 - Properties:
    - titleTypography: Типографика для заголовка переключателя.
    - subtitleTypography: Типографика для подзаголовка переключателя.
    - titleColor: Цвет заголовка, когда переключатель включен.
    - subtitleColor: Цвет подзаголовка, когда переключатель включен.
    - tintColor: Цвет переключателя, когда он включен.
 */
public struct SwitchAppearance {
    public let titleTypography: TypographyConfiguration
    public let subtitleTypography: TypographyConfiguration
    public let titleColor: ColorToken
    public let subtitleColor: ColorToken
    public let tintColor: ColorToken
    public let disabledAlpha: CGFloat
    
    public init(titleTypography: TypographyConfiguration, subtitleTypography: TypographyConfiguration, titleColor: ColorToken, subtitleColor: ColorToken, tintColor: ColorToken, disabledAlpha: CGFloat) {
        self.titleTypography = titleTypography
        self.subtitleTypography = subtitleTypography
        self.titleColor = titleColor
        self.subtitleColor = subtitleColor
        self.tintColor = tintColor
        self.disabledAlpha = disabledAlpha
    }

}

public extension SwitchAppearance {
    /**
     Возвращает цвет переключателя в зависимости от его состояния (включен/выключен).
     
     - Parameter isEnabled: Флаг, указывающий, включен ли переключатель.
     - Returns: Цвет переключателя.
     */
    func tintColor(for isEnabled: Bool) -> ColorToken {
        return isEnabled ? tintColor : tintColor.withOpacity(disabledAlpha)
    }

    /**
     Возвращает цвет заголовка в зависимости от состояния переключателя (включен/выключен).
     
     - Parameter isEnabled: Флаг, указывающий, включен ли переключатель.
     - Returns: Цвет заголовка.
     */
    func titleColor(for isEnabled: Bool) -> ColorToken {
        return isEnabled ? titleColor : titleColor.withOpacity(disabledAlpha)
    }

    /**
     Возвращает цвет подзаголовка в зависимости от состояния переключателя (включен/выключен).
     
     - Parameter isEnabled: Флаг, указывающий, включен ли переключатель.
     - Returns: Цвет подзаголовка.
     */
    func subtitleColor(for isEnabled: Bool) -> ColorToken {
        return isEnabled ? subtitleColor : subtitleColor.withOpacity(disabledAlpha)
    }
}

/**
 `SwitchAccessibility` определяет параметры доступности для переключателя.
 
 - Properties:
    - titleLabel: Метка доступности для заголовка.
    - subtitleLabel: Метка доступности для подзаголовка.
    - toggleLabel: Метка доступности для переключателя.
    - toggleHint: Подсказка для переключателя.
    - switchLabel: Метка доступности для всего переключателя.
    - switchEnabledValue: Значение доступности, когда переключатель включен.
    - switchDisabledValue: Значение доступности, когда переключатель выключен.
 */
public struct SwitchAccessibility {
    public var titleLabel: String
    public var subtitleLabel: String
    public var toggleLabel: String
    public var toggleHint: String
    public var switchLabel: String
    public var switchEnabledValue: String
    public var switchDisabledValue: String
    
    /**
     Инициализатор для создания параметров доступности переключателя.
     
     - Parameters:
        - titleLabel: Метка доступности для заголовка.
        - subtitleLabel: Метка доступности для подзаголовка.
        - toggleLabel: Метка доступности для переключателя.
        - toggleHint: Подсказка для переключателя.
        - switchLabel: Метка доступности для всего переключателя.
        - switchEnabledValue: Значение доступности, когда переключатель включен.
        - switchDisabledValue: Значение доступности, когда переключатель выключен.
     */
    public init(
        titleLabel: String = "Title",
        subtitleLabel: String = "Subtitle",
        toggleLabel: String = "Toggle",
        toggleHint: String = "Double-tap to toggle the switch.",
        switchLabel: String = "Switch",
        switchEnabledValue: String = "Enabled",
        switchDisabledValue: String = "Disabled"
    ) {
        self.titleLabel = titleLabel
        self.subtitleLabel = subtitleLabel
        self.toggleLabel = toggleLabel
        self.toggleHint = toggleHint
        self.switchLabel = switchLabel
        self.switchEnabledValue = switchEnabledValue
        self.switchDisabledValue = switchDisabledValue
    }
}

/**
 `SDDSSwitch` представляет собой настраиваемый переключатель, который может быть настроен с помощью различных параметров.
 
 - Parameters:
    - title: Текст заголовка для переключателя.
    - subtitle: Текст подзаголовка для переключателя.
    - isOn: Связка состояния включения/выключения переключателя.
    - isEnabled: Флаг, указывающий, включен ли переключатель.
    - size: Конфигурация размеров для переключателя.
    - appearance: Параметры внешнего вида переключателя.
    - switchAccessibility: Параметры доступности для переключателя.
 */
public struct SDDSSwitch: View {
    public let title: String
    public let subtitle: String
    @Binding public var isOn: Bool
    public let isEnabled: Bool
    public let size: SwitchSizeConfiguration
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
        - size: Конфигурация размеров для переключателя.
        - appearance: Параметры внешнего вида переключателя.
        - switchAccessibility: Параметры доступности для переключателя.
     */
    public init(
        title: String = "",
        subtitle: String = "",
        isOn: Binding<Bool> = .constant(true),
        isEnabled: Bool = true,
        size: SwitchSizeConfiguration,
        appearance: SwitchAppearance,
        switchAccessibility: SwitchAccessibility
    ) {
        self.title = title
        self.subtitle = subtitle
        self._isOn = isOn
        self.isEnabled = isEnabled
        self.size = size
        self.appearance = appearance
        self.switchAccessibility = switchAccessibility
    }
    
    public var body: some View {
        if let width = size.width {
            content
                .frame(width: width)
        } else {
            content
                .fixedSize(horizontal: true, vertical: false)
        }
    }
    
    private var content: some View {
        VStack(alignment: .leading, spacing: size.verticalGap) {
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
        if let typography = appearance.titleTypography.typography(with: size) {
            return typography
        } else {
            fatalError("Undefined Switch Typography for size \(size.debugDescription).")
        }
    }

    var subtitleTypography: TypographyToken {
        if let typography = appearance.subtitleTypography.typography(with: size) {
            return typography
        } else {
            fatalError("Undefined Switch Typography for size \(size.debugDescription). Using a default value.")
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
