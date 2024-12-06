import Foundation

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
