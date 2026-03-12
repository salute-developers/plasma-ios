import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct SelectItemSingleNormal {
    public static var l: ComponentAppearanceVariation<SelectItemSingleNormal, SelectItemAppearance> {
        var appearance = SelectItemAppearance.base
        appearance.size = SelectItemSingleNormalSize.l
        appearance.cellAppearance = Cell.l.appearance
        appearance.icon = Asset.done24.image

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<SelectItemSingleNormal, SelectItemAppearance> {
        var appearance = SelectItemAppearance.base
        appearance.size = SelectItemSingleNormalSize.m
        appearance.cellAppearance = Cell.m.appearance
        appearance.icon = Asset.done24.image

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<SelectItemSingleNormal, SelectItemAppearance> {
        var appearance = SelectItemAppearance.base
        appearance.size = SelectItemSingleNormalSize.s
        appearance.cellAppearance = Cell.s.appearance
        appearance.icon = Asset.done24.image

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xl: ComponentAppearanceVariation<SelectItemSingleNormal, SelectItemAppearance> {
        var appearance = SelectItemAppearance.base
        appearance.size = SelectItemSingleNormalSize.xl
        appearance.cellAppearance = Cell.l.appearance
        appearance.icon = Asset.done24.image

        return .init(
            name: "xl",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<SelectItemSingleNormal, SelectItemAppearance> {
        var appearance = SelectItemAppearance.base
        appearance.size = SelectItemSingleNormalSize.xs
        appearance.cellAppearance = Cell.xs.appearance
        appearance.icon = Asset.done16.image

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<SelectItemAppearance>] = [
        SelectItemSingleNormal.l.variation,
        SelectItemSingleNormal.m.variation,
        SelectItemSingleNormal.s.variation,
        SelectItemSingleNormal.xl.variation,
        SelectItemSingleNormal.xs.variation,
    ]
}

public struct SelectItemSingleNormalVariation {
    public struct L {}
    public struct M {}
    public struct S {}
    public struct Xl {}
    public struct Xs {}
}

private extension SelectItemAppearance {
    static var base: SelectItemAppearance {
        var appearance = SelectItemAppearance()
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClear, selectedColor: .clearColor)
        appearance.disabledAlpha = CGFloat(0.4)
        appearance.iconColor = ColorToken.textDefaultAccent
        appearance.itemType = .single
        return appearance
    }
}
