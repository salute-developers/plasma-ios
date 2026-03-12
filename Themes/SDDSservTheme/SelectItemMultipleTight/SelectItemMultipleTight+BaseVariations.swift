import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct SelectItemMultipleTight {
    public static var l: ComponentAppearanceVariation<SelectItemMultipleTight, SelectItemAppearance> {
        var appearance = SelectItemAppearance.base
        appearance.size = SelectItemMultipleTightSize.l
        appearance.cellAppearance = Cell.l.appearance
        appearance.checkboxAppearance = Checkbox.m.default.appearance

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<SelectItemMultipleTight, SelectItemAppearance> {
        var appearance = SelectItemAppearance.base
        appearance.size = SelectItemMultipleTightSize.m
        appearance.cellAppearance = Cell.m.appearance
        appearance.checkboxAppearance = Checkbox.m.default.appearance

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<SelectItemMultipleTight, SelectItemAppearance> {
        var appearance = SelectItemAppearance.base
        appearance.size = SelectItemMultipleTightSize.s
        appearance.cellAppearance = Cell.s.appearance
        appearance.checkboxAppearance = Checkbox.m.default.appearance

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xl: ComponentAppearanceVariation<SelectItemMultipleTight, SelectItemAppearance> {
        var appearance = SelectItemAppearance.base
        appearance.size = SelectItemMultipleTightSize.xl
        appearance.cellAppearance = Cell.l.appearance
        appearance.checkboxAppearance = Checkbox.m.default.appearance

        return .init(
            name: "xl",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<SelectItemMultipleTight, SelectItemAppearance> {
        var appearance = SelectItemAppearance.base
        appearance.size = SelectItemMultipleTightSize.xs
        appearance.cellAppearance = Cell.xs.appearance
        appearance.checkboxAppearance = Checkbox.s.default.appearance

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<SelectItemAppearance>] = [
        SelectItemMultipleTight.l.variation,
        SelectItemMultipleTight.m.variation,
        SelectItemMultipleTight.s.variation,
        SelectItemMultipleTight.xl.variation,
        SelectItemMultipleTight.xs.variation,
    ]
}

public struct SelectItemMultipleTightVariation {
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
