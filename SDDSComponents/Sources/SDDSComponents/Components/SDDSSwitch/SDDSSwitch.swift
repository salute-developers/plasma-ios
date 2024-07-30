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
    - enabledTitleColor: Цвет заголовка, когда переключатель включен.
    - enabledSubtitleColor: Цвет подзаголовка, когда переключатель включен.
    - enabledTintColor: Цвет переключателя, когда он включен.
    - disabledTitleColor: Цвет заголовка, когда переключатель выключен.
    - disabledSubtitleColor: Цвет подзаголовка, когда переключатель выключен.
    - disabledTintColor: Цвет переключателя, когда он выключен.
 */
public struct SwitchAppearance {
    public let titleTypography: TypographyConfiguration
    public let subtitleTypography: TypographyConfiguration
    public let enabledTitleColor: ColorToken
    public let enabledSubtitleColor: ColorToken
    public let enabledTintColor: ColorToken
    public let disabledTitleColor: ColorToken
    public let disabledSubtitleColor: ColorToken
    public let disabledTintColor: ColorToken
    
    public init(titleTypography: TypographyConfiguration, subtitleTypography: TypographyConfiguration, enabledTitleColor: ColorToken, enabledSubtitleColor: ColorToken, enabledTintColor: ColorToken, disabledTitleColor: ColorToken, disabledSubtitleColor: ColorToken, disabledTintColor: ColorToken) {
        self.titleTypography = titleTypography
        self.subtitleTypography = subtitleTypography
        self.enabledTitleColor = enabledTitleColor
        self.enabledSubtitleColor = enabledSubtitleColor
        self.enabledTintColor = enabledTintColor
        self.disabledTitleColor = disabledTitleColor
        self.disabledSubtitleColor = disabledSubtitleColor
        self.disabledTintColor = disabledTintColor
    }
}

public extension SwitchAppearance {
    /**
     Возвращает цвет переключателя в зависимости от его состояния (включен/выключен).
     
     - Parameter isEnabled: Флаг, указывающий, включен ли переключатель.
     - Returns: Цвет переключателя.
     */
    func tintColor(for isEnabled: Bool) -> ColorToken {
        return isEnabled ? enabledTintColor : disabledTintColor
    }

    /**
     Возвращает цвет заголовка в зависимости от состояния переключателя (включен/выключен).
     
     - Parameter isEnabled: Флаг, указывающий, включен ли переключатель.
     - Returns: Цвет заголовка.
     */
    func titleColor(for isEnabled: Bool) -> ColorToken {
        return isEnabled ? enabledTitleColor : disabledTitleColor
    }

    /**
     Возвращает цвет подзаголовка в зависимости от состояния переключателя (включен/выключен).
     
     - Parameter isEnabled: Флаг, указывающий, включен ли переключатель.
     - Returns: Цвет подзаголовка.
     */
    func subtitleColor(for isEnabled: Bool) -> ColorToken {
        return isEnabled ? enabledSubtitleColor : disabledSubtitleColor
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

// MARK: - Preview
struct SDDSSwitchPreview: PreviewProvider {
    static var previews: some View {
        SDDSSwitch.defaultExample
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default")
            .debug()
        
        SDDSSwitch.emptyDescription
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Empty Description")
            .debug()
        
        SDDSSwitch.emptyTitle
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Empty Title")
            .debug()
        
        SDDSSwitch.onlyToggle
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Only Toggle")
            .debug()
    }
}

struct SwitchSize: SwitchSizeConfiguration {
    var debugDescription: String {
        String(reflecting: self)
    }

    var width: CGFloat?
    var verticalGap: CGFloat
    
    init(width: CGFloat? = 170, verticalGap: CGFloat = 0) {
        self.width = width
        self.verticalGap = verticalGap
    }
}

extension SDDSSwitch {
    static var defaultExample: SDDSSwitch {
        SDDSSwitch(
            title: "Title",
            subtitle: "Description",
            isOn: .constant(true),
            isEnabled: true,
            size: SwitchSize(),
            appearance: SwitchAppearance.defaultAppearance,
            switchAccessibility: SwitchAccessibility()
        )
    }
    
    static var emptyDescription: SDDSSwitch {
        SDDSSwitch(
            title: "Title",
            subtitle: "",
            isOn: .constant(true),
            isEnabled: true,
            size: SwitchSize(),
            appearance: SwitchAppearance.defaultAppearance,
            switchAccessibility: SwitchAccessibility()
        )
    }
    
    static var emptyTitle: SDDSSwitch {
        SDDSSwitch(
            title: "",
            subtitle: "Description",
            isOn: .constant(true),
            isEnabled: true,
            size: SwitchSize(),
            appearance: SwitchAppearance.defaultAppearance,
            switchAccessibility: SwitchAccessibility()
        )
    }
    
    static var onlyToggle: SDDSSwitch {
        SDDSSwitch(
            title: "",
            subtitle: "",
            isOn: .constant(true),
            isEnabled: true,
            size: SwitchSize(width: nil),
            appearance: SwitchAppearance.defaultAppearance,
            switchAccessibility: SwitchAccessibility()
        )
    }
}

struct SwitchTypography: GeneralTypographyConfiguration {
    let token: TypographyToken
    
    func typography(with size: SizeConfiguration) -> TypographyToken? {
        return token
    }
}

extension SwitchTypography {
    static func typography(_ token: TypographyToken) -> TypographyConfiguration {
        SwitchTypography(token: token).asContainer
    }
}

public extension SwitchAppearance {
    static var defaultAppearance: SwitchAppearance {
        .init(
            titleTypography: SwitchTypography.typography(.semibold14),
            subtitleTypography: SwitchTypography.typography(.semibold12),
            enabledTitleColor: .blackTitleColor,
            enabledSubtitleColor: .subtitleColor,
            enabledTintColor: .greenColor,
            disabledTitleColor: .blackTitleColor.withOpacity(0.3),
            disabledSubtitleColor: .subtitleColor.withOpacity(0.3),
            disabledTintColor: .greenColor.withOpacity(0.3)
        )
    }
}
