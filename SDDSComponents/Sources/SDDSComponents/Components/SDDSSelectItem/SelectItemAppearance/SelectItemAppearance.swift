import Foundation
import SwiftUI
import SDDSThemeCore
import SDDSApiInfo

public enum SelectItemType: String, CaseIterable {
    case single
    case multiple
}

@ApiInfo(components: ["SelectItemMultipleNormal", "SelectItemMultipleTight", "SelectItemSingleNormal", "SelectItemSingleTight"])
public struct SelectItemAppearance {
    public var itemType: SelectItemType
    public var iconColor: StatefulFillStyle
    @ApiName("backgroundColor")
    public var backgroundColor: StatefulFillStyle
    public var disabledAlpha: CGFloat
    public var cellAppearance: CellAppearance
    public var checkboxAppearance: CheckboxAppearance?
    public var icon: Image?
    public var size: SelectItemSizeConfiguration
    
    public init(
        itemType: SelectItemType = .single,
        iconColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        backgroundColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        disabledAlpha: CGFloat = 0.4,
        cellAppearance: CellAppearance = .defaultValue,
        checkboxAppearance: CheckboxAppearance? = nil,
        icon: Image? = nil,
        size: SelectItemSizeConfiguration = ZeroSelectItemSize()
    ) {
        self.itemType = itemType
        self.iconColor = iconColor
        self.backgroundColor = backgroundColor
        self.disabledAlpha = disabledAlpha
        self.cellAppearance = cellAppearance
        self.checkboxAppearance = checkboxAppearance
        self.icon = icon
        self.size = size
    }

    @available(*, deprecated, message: "ColorToken/ButtonColor are deprecated and will be replaced by StatefulFillStyle in a future release.")
    @_disfavoredOverload
    public init(
        itemType: SelectItemType = .single,
        iconColor: ColorToken = .clearColor,
        backgroundColor: ButtonColor = ButtonColor(),
        disabledAlpha: CGFloat = 0.4,
        cellAppearance: CellAppearance = .defaultValue,
        checkboxAppearance: CheckboxAppearance? = nil,
        icon: Image? = nil,
        size: SelectItemSizeConfiguration = ZeroSelectItemSize()
    ) {
        self.init(
            itemType: itemType,
            iconColor: iconColor.fill,
            backgroundColor: backgroundColor.statefulColor.statefulFillStyle,
            disabledAlpha: disabledAlpha,
            cellAppearance: cellAppearance,
            checkboxAppearance: checkboxAppearance,
            icon: icon,
            size: size
        )
    }
}

extension SelectItemAppearance: EnvironmentKey {
    public static var defaultValue: SelectItemAppearance {
        SelectItemAppearance()
    }
}

