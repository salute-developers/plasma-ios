import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct SelectItemMultipleNormal {
    public static var l: ComponentAppearanceVariation<SelectItemMultipleNormal, SelectItemAppearance> {
        var appearance = SelectItemAppearance.base
        appearance.size = SelectItemMultipleNormalSize.l
        appearance.cellAppearance = Cell.l.appearance
        appearance.checkboxAppearance = Checkbox.m.default.appearance

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<SelectItemMultipleNormal, SelectItemAppearance> {
        var appearance = SelectItemAppearance.base
        appearance.size = SelectItemMultipleNormalSize.m
        appearance.cellAppearance = Cell.m.appearance
        appearance.checkboxAppearance = Checkbox.m.default.appearance

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<SelectItemMultipleNormal, SelectItemAppearance> {
        var appearance = SelectItemAppearance.base
        appearance.size = SelectItemMultipleNormalSize.s
        appearance.cellAppearance = Cell.s.appearance
        appearance.checkboxAppearance = Checkbox.m.default.appearance

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xl: ComponentAppearanceVariation<SelectItemMultipleNormal, SelectItemAppearance> {
        var appearance = SelectItemAppearance.base
        appearance.size = SelectItemMultipleNormalSize.xl
        appearance.cellAppearance = Cell.l.appearance
        appearance.checkboxAppearance = Checkbox.m.default.appearance

        return .init(
            name: "xl",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<SelectItemMultipleNormal, SelectItemAppearance> {
        var appearance = SelectItemAppearance.base
        appearance.size = SelectItemMultipleNormalSize.xs
        appearance.cellAppearance = Cell.xs.appearance
        appearance.checkboxAppearance = Checkbox.s.default.appearance

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<SelectItemAppearance>] = [
        SelectItemMultipleNormal.l.variation,
        SelectItemMultipleNormal.m.variation,
        SelectItemMultipleNormal.s.variation,
        SelectItemMultipleNormal.xl.variation,
        SelectItemMultipleNormal.xs.variation,
    ]
}

public struct SelectItemMultipleNormalVariation {
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
        appearance.itemType = .multiple
        return appearance
    }
}
