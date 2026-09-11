import Foundation
import SwiftUI
import SDDSThemeCore
import SDDSApiInfo

/**
 `TabBarItemAppearance` определяет внешний вид элемента таб-бара, включая цвета, типографику и стили.

 - Properties:
    - labelColor: Цвет текста метки
    - iconColor: Цвет иконки
    - backgroundColor: Цвет фона элемента
    - labelTypography: Типографика метки
    - counterAppearance: Стиль счетчика
    - indicatorAppearance: Стиль индикатора
    - size: Конфигурация размеров и отступов элемента
 */
@ApiInfo(components: ["TabBarItemClear", "TabBarItemSolid"])
public struct TabBarItemAppearance: Hashable {
    let id = UUID()
    @ApiName("labelColor")
    public var labelColor: StatefulFillStyle
    @ApiName("iconColor")
    public var iconColor: StatefulFillStyle
    @ApiName("backgroundColor")
    public var backgroundColor: StatefulFillStyle
    public var labelTypography: TypographyConfiguration
    public var counterAppearance: CounterAppearance?
    public var indicatorAppearance: IndicatorAppearance?
    public var size: TabBarItemSizeConfiguration
    
    public init(
        labelColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        iconColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        backgroundColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        labelTypography: TypographyConfiguration = .default,
        counterAppearance: CounterAppearance? = nil,
        indicatorAppearance: IndicatorAppearance? = nil,
        size: TabBarItemSizeConfiguration = ZeroTabBarItemSize()
    ) {
        self.labelColor = labelColor
        self.iconColor = iconColor
        self.backgroundColor = backgroundColor
        self.labelTypography = labelTypography
        self.counterAppearance = counterAppearance
        self.indicatorAppearance = indicatorAppearance
        self.size = size
    }

    @available(*, deprecated, message: "ButtonColor is deprecated and will be replaced by StatefulFillStyle in a future release.")
    @_disfavoredOverload
    public init(
        labelColor: ButtonColor = ButtonColor(),
        iconColor: ButtonColor = ButtonColor(),
        backgroundColor: ButtonColor = ButtonColor(),
        labelTypography: TypographyConfiguration = .default,
        counterAppearance: CounterAppearance? = nil,
        indicatorAppearance: IndicatorAppearance? = nil,
        size: TabBarItemSizeConfiguration = ZeroTabBarItemSize()
    ) {
        self.init(
            labelColor: labelColor.statefulColor.statefulFillStyle,
            iconColor: iconColor.statefulColor.statefulFillStyle,
            backgroundColor: backgroundColor.statefulColor.statefulFillStyle,
            labelTypography: labelTypography,
            counterAppearance: counterAppearance,
            indicatorAppearance: indicatorAppearance,
            size: size
        )
    }

    
    public static func == (lhs: TabBarItemAppearance, rhs: TabBarItemAppearance) -> Bool {
        lhs.id == rhs.id &&
        lhs.labelColor == rhs.labelColor &&
        lhs.iconColor == rhs.iconColor &&
        lhs.backgroundColor == rhs.backgroundColor
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension TabBarItemAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        TabBarItemAppearance()
    }
}
