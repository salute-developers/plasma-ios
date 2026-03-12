import Foundation
import SwiftUI
import SDDSThemeCore

public enum SelectItemType: String, CaseIterable {
    case single
    case multiple
}

public struct SelectItemAppearance {
    public var itemType: SelectItemType
    public var iconColor: ColorToken
    public var backgroundColor: ButtonColor
    public var disabledAlpha: CGFloat
    public var cellAppearance: CellAppearance
    public var checkboxAppearance: CheckboxAppearance?
    public var icon: Image?
    public var size: SelectItemSizeConfiguration
    
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
        self.itemType = itemType
        self.iconColor = iconColor
        self.backgroundColor = backgroundColor
        self.disabledAlpha = disabledAlpha
        self.cellAppearance = cellAppearance
        self.checkboxAppearance = checkboxAppearance
        self.icon = icon
        self.size = size
    }
}

extension SelectItemAppearance: EnvironmentKey {
    public static var defaultValue: SelectItemAppearance {
        SelectItemAppearance()
    }
}

