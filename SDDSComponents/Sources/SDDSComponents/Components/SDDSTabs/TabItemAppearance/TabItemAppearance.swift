import Foundation
import SwiftUI
import SDDSThemeCore
import SDDSApiInfo

/**
 `TabItemAppearance` определяет внешний вид элемента вкладки.
 
 - Properties:
    - size: Конфигурация размеров элемента вкладки
    - labelColor: Цвет текста метки с состояниями
    - valueColor: Цвет текста значения с состояниями
    - startContentColor: Цвет начального контента с состояниями
    - endContentColor: Цвет конечного контента с состояниями
    - actionColor: Цвет действия с состояниями
    - labelTypography: Типографика метки
    - valueTypography: Типографика значения
    - counterAppearance: Внешний вид счетчика
    - actionIcon: Иконка действия
    - indicatorColor: Цвет индикатора выбора (опционально, если nil - берется из TabsAppearance)
 */
@ApiInfo(components: ["IconTabItem", "TabItemDefault", "TabItemHeader"])
public struct TabItemAppearance: Hashable {
    let id = UUID()
    public var size: TabItemSizeConfiguration
    @ApiName("labelColor")
    public var labelColor: StatefulFillStyle
    @ApiName("valueColor")
    public var valueColor: StatefulFillStyle
    @ApiName("startContentColor")
    public var startContentColor: StatefulFillStyle
    @ApiName("endContentColor")
    public var endContentColor: StatefulFillStyle
    @ApiName("actionColor")
    public var actionColor: StatefulFillStyle
    public var labelTypography: TypographyConfiguration
    public var valueTypography: TypographyConfiguration
    public var counterAppearance: CounterAppearance?
    public var actionIcon: Image?
    public var indicatorColor: ColorToken?
    
    public init(
        size: TabItemSizeConfiguration = ZeroTabItemSize(),
        labelColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        valueColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        startContentColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        endContentColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        actionColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        labelTypography: TypographyConfiguration = .default,
        valueTypography: TypographyConfiguration = .default,
        counterAppearance: CounterAppearance? = nil,
        actionIcon: Image? = nil,
        indicatorColor: ColorToken? = nil
    ) {
        self.size = size
        self.labelColor = labelColor
        self.valueColor = valueColor
        self.startContentColor = startContentColor
        self.endContentColor = endContentColor
        self.actionColor = actionColor
        self.labelTypography = labelTypography
        self.valueTypography = valueTypography
        self.counterAppearance = counterAppearance
        self.actionIcon = actionIcon
        self.indicatorColor = indicatorColor
    }

    @available(*, deprecated, message: "ButtonColor is deprecated and will be replaced by StatefulFillStyle in a future release.")
    @_disfavoredOverload
    public init(
        size: TabItemSizeConfiguration = ZeroTabItemSize(),
        labelColor: ButtonColor = ButtonColor(),
        valueColor: ButtonColor = ButtonColor(),
        startContentColor: ButtonColor = ButtonColor(),
        endContentColor: ButtonColor = ButtonColor(),
        actionColor: ButtonColor = ButtonColor(),
        labelTypography: TypographyConfiguration = .default,
        valueTypography: TypographyConfiguration = .default,
        counterAppearance: CounterAppearance? = nil,
        actionIcon: Image? = nil,
        indicatorColor: ColorToken? = nil
    ) {
        self.init(
            size: size,
            labelColor: labelColor.statefulColor.statefulFillStyle,
            valueColor: valueColor.statefulColor.statefulFillStyle,
            startContentColor: startContentColor.statefulColor.statefulFillStyle,
            endContentColor: endContentColor.statefulColor.statefulFillStyle,
            actionColor: actionColor.statefulColor.statefulFillStyle,
            labelTypography: labelTypography,
            valueTypography: valueTypography,
            counterAppearance: counterAppearance,
            actionIcon: actionIcon,
            indicatorColor: indicatorColor
        )
    }

    public static func == (lhs: TabItemAppearance, rhs: TabItemAppearance) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
