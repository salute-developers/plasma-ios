import Foundation
import SwiftUI
import SDDSThemeCore

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
public struct TabItemAppearance: Hashable {
    let id = UUID()
    public var size: TabItemSizeConfiguration
    public var labelColor: ButtonColor
    public var valueColor: ButtonColor
    public var startContentColor: ButtonColor
    public var endContentColor: ButtonColor
    public var actionColor: ButtonColor
    public var labelTypography: TypographyConfiguration
    public var valueTypography: TypographyConfiguration
    public var counterAppearance: CounterAppearance?
    public var actionIcon: Image?
    public var indicatorColor: ColorToken?
    
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
    
    public static func == (lhs: TabItemAppearance, rhs: TabItemAppearance) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
