import Foundation
import SwiftUI
import SDDSApiInfo
@_exported import SDDSThemeCore

/**
 `WheelAppearance` определяет внешний вид компонента Wheel.
 */
@ApiInfo
public struct WheelAppearance {    
    // Цвета текста
    public var itemTextColor: ColorToken
    public var itemTextAfterColor: ColorToken
    public var descriptionColor: ColorToken
    
    // Цвета иконок управления
    @ApiName("controlIconUpColor")
    public var controlIconUpColor: StatefulFillStyle
    @ApiName("controlIconDownColor")
    public var controlIconDownColor: StatefulFillStyle
    
    // Цвет разделителя
    public var separatorColor: ColorToken
    
    // Цвет индикатора выбранного элемента
    public var selectionIndicatorColor: ColorToken
    
    // Типографика
    public var itemTextTypography: TypographyConfiguration
    public var itemTextAfterTypography: TypographyConfiguration
    public var descriptionTypography: TypographyConfiguration
    
    // Иконки
    public var controlIconUp: Image?
    public var controlIconDown: Image?
    
    // Вложенный компонент
    public var dividerAppearance: DividerAppearance?
    
    // Стиль разделителя
    public var dividerStyle: WheelDividerStyle
    
    // Размеры
    public var size: WheelSizeConfiguration
    
    public init(
        itemTextColor: ColorToken = .clearColor,
        itemTextAfterColor: ColorToken = .clearColor,
        descriptionColor: ColorToken = .clearColor,
        controlIconUpColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        controlIconDownColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        separatorColor: ColorToken = .clearColor,
        selectionIndicatorColor: ColorToken = .clearColor,
        itemTextTypography: TypographyConfiguration = .default,
        itemTextAfterTypography: TypographyConfiguration = .default,
        descriptionTypography: TypographyConfiguration = .default,
        controlIconUp: Image? = nil,
        controlIconDown: Image? = nil,
        dividerAppearance: DividerAppearance? = nil,
        dividerStyle: WheelDividerStyle = .divider,
        size: WheelSizeConfiguration = WheelSize()
    ) {
        self.itemTextColor = itemTextColor
        self.itemTextAfterColor = itemTextAfterColor
        self.descriptionColor = descriptionColor
        self.controlIconUpColor = controlIconUpColor
        self.controlIconDownColor = controlIconDownColor
        self.separatorColor = separatorColor
        self.selectionIndicatorColor = selectionIndicatorColor
        self.itemTextTypography = itemTextTypography
        self.itemTextAfterTypography = itemTextAfterTypography
        self.descriptionTypography = descriptionTypography
        self.controlIconUp = controlIconUp
        self.controlIconDown = controlIconDown
        self.dividerAppearance = dividerAppearance
        self.dividerStyle = dividerStyle
        self.size = size
    }

    
}

// MARK: - Environment Key

extension WheelAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        WheelAppearance()
    }
}

public extension EnvironmentValues {
    var wheelAppearance: WheelAppearance {
        get { self[WheelAppearance.self] }
        set { self[WheelAppearance.self] = newValue }
    }
}
