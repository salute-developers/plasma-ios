import Foundation
import SwiftUI
import SDDSThemeCore

/**
 `SwitchAppearance` определяет внешний вид переключателя, включая типографику и цвета для различных состояний.
 
 - Properties:
    - size: Конфигурация размеров для переключателя.
    - titleTypography: Типографика для заголовка переключателя.
    - subtitleTypography: Типографика для подзаголовка переключателя.
    - titleColor: Цвет заголовка, когда переключатель включен.
    - subtitleColor: Цвет подзаголовка, когда переключатель включен.
    - tintColor: Цвет переключателя, когда он включен.
 */
public struct SwitchAppearance: Hashable {
    let id = UUID()
    public var size: SwitchSizeConfiguration
    public var titleTypography: TypographyConfiguration
    public var subtitleTypography: TypographyConfiguration
    public var titleColor: ColorToken
    public var subtitleColor: ColorToken
    public var toggleTrackColor: ColorToken
    public var toggleTrackColorChecked: ColorToken
    public var toggleTrackBorderColor: ColorToken
    public var toggleThumbColor: ColorToken
    public var disabledAlpha: CGFloat
    
    @available(*, deprecated, message: "Don't use it, public method will be removed")
    public var tintColor: ColorToken
    
    public init(
        size: SwitchSizeConfiguration = DefaultSwitchSize(),
        titleTypography: TypographyConfiguration = .default,
        subtitleTypography: TypographyConfiguration = .default,
        titleColor: ColorToken = .clearColor,
        subtitleColor: ColorToken = .clearColor,
        toggleTrackColor: ColorToken = .clearColor,
        toggleTrackColorChecked: ColorToken = .clearColor,
        toggleTrackBorderColor: ColorToken = .clearColor,
        toggleThumbColor: ColorToken = .clearColor,
        disabledAlpha: CGFloat = 0
    ) {
        self.size = size
        self.titleTypography = titleTypography
        self.subtitleTypography = subtitleTypography
        self.titleColor = titleColor
        self.subtitleColor = subtitleColor
        self.toggleTrackColor = toggleTrackColor
        self.toggleTrackColorChecked = toggleTrackColorChecked
        self.toggleTrackBorderColor = toggleTrackBorderColor
        self.toggleThumbColor = toggleThumbColor
        self.disabledAlpha = disabledAlpha
        self.tintColor = .clearColor
    }
    
    @available(*, deprecated, message: "Don't use it, public method will be removed")
    public init(
        size: SwitchSizeConfiguration = DefaultSwitchSize(),
        titleTypography: TypographyConfiguration = .default,
        subtitleTypography: TypographyConfiguration = .default,
        titleColor: ColorToken = .clearColor,
        subtitleColor: ColorToken = .clearColor,
        tintColor: ColorToken = .clearColor,
        disabledAlpha: CGFloat = 0
    ) {
        self.size = size
        self.titleTypography = titleTypography
        self.subtitleTypography = subtitleTypography
        self.titleColor = titleColor
        self.subtitleColor = subtitleColor
        self.toggleTrackColor = .clearColor
        self.toggleTrackColorChecked = .clearColor
        self.toggleTrackBorderColor = .clearColor
        self.toggleThumbColor = .clearColor
        self.disabledAlpha = disabledAlpha
        self.tintColor = tintColor
    }
    
    public static func == (lhs: SwitchAppearance, rhs: SwitchAppearance) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
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

extension SwitchAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: SwitchAppearance.self, fallback: SwitchAppearance())
    }
}
