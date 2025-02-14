import Foundation
import SwiftUI
@_exported import SDDSThemeCore

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
public struct SwitchAppearance: EnvironmentKey, Hashable {
    public static let defaultValue: Self = .init()
    
    let id = UUID()
    public let size: SwitchSizeConfiguration
    public let titleTypography: TypographyConfiguration
    public let subtitleTypography: TypographyConfiguration
    public let titleColor: ColorToken
    public let subtitleColor: ColorToken
    public let tintColor: ColorToken
    public let disabledAlpha: CGFloat
    
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
        self.tintColor = tintColor
        self.disabledAlpha = disabledAlpha
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
