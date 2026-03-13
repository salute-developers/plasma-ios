import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct SelectItemSingleTight {
    public static var l: ComponentAppearanceVariation<SelectItemSingleTight, SelectItemAppearance> {
        var appearance = SelectItemAppearance.base
        appearance.size = SelectItemSingleTightSize.l
        appearance.cellAppearance = Cell.l.appearance
        appearance.icon = Asset.done24.image

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<SelectItemSingleTight, SelectItemAppearance> {
        var appearance = SelectItemAppearance.base
        appearance.size = SelectItemSingleTightSize.m
        appearance.cellAppearance = Cell.m.appearance
        appearance.icon = Asset.done24.image

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<SelectItemSingleTight, SelectItemAppearance> {
        var appearance = SelectItemAppearance.base
        appearance.size = SelectItemSingleTightSize.s
        appearance.cellAppearance = Cell.s.appearance
        appearance.icon = Asset.done24.image

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xl: ComponentAppearanceVariation<SelectItemSingleTight, SelectItemAppearance> {
        var appearance = SelectItemAppearance.base
        appearance.size = SelectItemSingleTightSize.xl
        appearance.cellAppearance = Cell.l.appearance
        appearance.icon = Asset.done24.image

        return .init(
            name: "xl",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<SelectItemSingleTight, SelectItemAppearance> {
        var appearance = SelectItemAppearance.base
        appearance.size = SelectItemSingleTightSize.xs
        appearance.cellAppearance = Cell.xs.appearance
        appearance.icon = Asset.done16.image

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<SelectItemAppearance>] = [
        SelectItemSingleTight.l.variation,
        SelectItemSingleTight.m.variation,
        SelectItemSingleTight.s.variation,
        SelectItemSingleTight.xl.variation,
        SelectItemSingleTight.xs.variation,
    ]
}

public struct SelectItemSingleTightVariation {
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
