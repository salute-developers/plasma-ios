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
public struct SwitchAppearance: Hashable {
    let id = UUID()
    public var size: SwitchSizeConfiguration
    public var titleTypography: TypographyConfiguration
    public var subtitleTypography: TypographyConfiguration
    public var titleColor: StatefulFillStyle
    public var subtitleColor: StatefulFillStyle
    public var toggleTrackColor: StatefulFillStyle
    public var toggleTrackColorChecked: StatefulFillStyle
    public var toggleTrackBorderColor: StatefulFillStyle
    public var toggleThumbColor: StatefulFillStyle
    public var disabledAlpha: CGFloat
    
    @available(*, deprecated, message: "Don't use it, public method will be removed")
    public var tintColor: StatefulFillStyle
    
    public init(
        size: SwitchSizeConfiguration = DefaultSwitchSize(),
        titleTypography: TypographyConfiguration = .default,
        subtitleTypography: TypographyConfiguration = .default,
        titleColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        subtitleColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        toggleTrackColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        toggleTrackColorChecked: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        toggleTrackBorderColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        toggleThumbColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
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
        self.tintColor = StatefulFillStyle(defaultValue: .color(.clearColor), values: [])
    }
    
    @available(*, deprecated, message: "Don't use it, public method will be removed")
    public init(
        size: SwitchSizeConfiguration = DefaultSwitchSize(),
        titleTypography: TypographyConfiguration = .default,
        subtitleTypography: TypographyConfiguration = .default,
        titleColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        subtitleColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        tintColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        disabledAlpha: CGFloat = 0
    ) {
        self.size = size
        self.titleTypography = titleTypography
        self.subtitleTypography = subtitleTypography
        self.titleColor = titleColor
        self.subtitleColor = subtitleColor
        self.toggleTrackColor = StatefulFillStyle(defaultValue: .color(.clearColor), values: [])
        self.toggleTrackColorChecked = StatefulFillStyle(defaultValue: .color(.clearColor), values: [])
        self.toggleTrackBorderColor = StatefulFillStyle(defaultValue: .color(.clearColor), values: [])
        self.toggleThumbColor = StatefulFillStyle(defaultValue: .color(.clearColor), values: [])
        self.disabledAlpha = disabledAlpha
        self.tintColor = tintColor
    }

    @_disfavoredOverload
    @available(*, deprecated, message: "Use StatefulFillStyle init to support gradients and states.")
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
        self.init(
            size: size,
            titleTypography: titleTypography,
            subtitleTypography: subtitleTypography,
            titleColor: titleColor.statefulColor.statefulFillStyle,
            subtitleColor: subtitleColor.statefulColor.statefulFillStyle,
            toggleTrackColor: toggleTrackColor.statefulColor.statefulFillStyle,
            toggleTrackColorChecked: toggleTrackColorChecked.statefulColor.statefulFillStyle,
            toggleTrackBorderColor: toggleTrackBorderColor.statefulColor.statefulFillStyle,
            toggleThumbColor: toggleThumbColor.statefulColor.statefulFillStyle,
            disabledAlpha: disabledAlpha
        )
    }
    
    public static func == (lhs: SwitchAppearance, rhs: SwitchAppearance) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

public extension SwitchAppearance {
    var toggleTrackStatefulColor: StatefulFillStyle {
        let defaultValue = toggleTrackColor.defaultValue
        let stateItems = toggleTrackColor.values
        let checkedItems = toggleTrackColorChecked.values.map {
            StatefulFillStyle.Item(states: $0.states.union([InteractiveState.checked.stateKey]), value: $0.value)
        }
        let checkedDefault = toggleTrackColorChecked.defaultValue.map {
            StatefulFillStyle.Item(states: [InteractiveState.checked.stateKey], value: $0)
        }
        return StatefulFillStyle(
            defaultValue: defaultValue,
            values: stateItems + checkedItems + (checkedDefault.map { [$0] } ?? [])
        )
    }

    /**
     Возвращает цвет переключателя в зависимости от его состояния (включен/выключен).
     
     - Parameter isEnabled: Флаг, указывающий, включен ли переключатель.
     - Returns: Цвет переключателя.
     */
    func tintColor(for isEnabled: Bool) -> FillStyle {
        let style = tintColor.resolvedDefaultValue()
        return isEnabled ? style : style.withOpacity(disabledAlpha)
    }

    /**
     Возвращает цвет заголовка в зависимости от состояния переключателя (включен/выключен).
     
     - Parameter isEnabled: Флаг, указывающий, включен ли переключатель.
     - Returns: Цвет заголовка.
     */
    func titleColor(for isEnabled: Bool) -> FillStyle {
        let style = titleColor.resolvedDefaultValue()
        return isEnabled ? style : style.withOpacity(disabledAlpha)
    }

    /**
     Возвращает цвет подзаголовка в зависимости от состояния переключателя (включен/выключен).
     
     - Parameter isEnabled: Флаг, указывающий, включен ли переключатель.
     - Returns: Цвет подзаголовка.
     */
    func subtitleColor(for isEnabled: Bool) -> FillStyle {
        let style = subtitleColor.resolvedDefaultValue()
        return isEnabled ? style : style.withOpacity(disabledAlpha)
    }
}

extension SwitchAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: SwitchAppearance.self, fallback: SwitchAppearance())
    }
}
