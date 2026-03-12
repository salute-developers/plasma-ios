import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct SelectMultipleTight {
    public static var l: ComponentAppearanceVariation<SelectMultipleTight, SelectAppearance> {
        var appearance = SelectAppearance.base
        appearance.size = SelectMultipleTightSize.l
        appearance.buttonAppearance = BasicButton.l.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuTight.l.appearance
        appearance.selectItemAppearance = SelectItemMultipleTight.l.appearance
        appearance.textFieldAppearance = TextField.l.default.appearance

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<SelectMultipleTight, SelectAppearance> {
        var appearance = SelectAppearance.base
        appearance.size = SelectMultipleTightSize.m
        appearance.buttonAppearance = BasicButton.m.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuTight.m.appearance
        appearance.selectItemAppearance = SelectItemMultipleTight.m.appearance
        appearance.textFieldAppearance = TextField.m.default.appearance

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<SelectMultipleTight, SelectAppearance> {
        var appearance = SelectAppearance.base
        appearance.size = SelectMultipleTightSize.s
        appearance.buttonAppearance = BasicButton.s.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuTight.s.appearance
        appearance.selectItemAppearance = SelectItemMultipleTight.s.appearance
        appearance.textFieldAppearance = TextField.s.default.appearance

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xl: ComponentAppearanceVariation<SelectMultipleTight, SelectAppearance> {
        var appearance = SelectAppearance.base
        appearance.size = SelectMultipleTightSize.xl
        appearance.buttonAppearance = BasicButton.xl.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuTight.xl.appearance
        appearance.selectItemAppearance = SelectItemMultipleTight.xl.appearance
        appearance.textFieldAppearance = TextField.xl.default.appearance

        return .init(
            name: "xl",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<SelectMultipleTight, SelectAppearance> {
        var appearance = SelectAppearance.base
        appearance.size = SelectMultipleTightSize.xs
        appearance.buttonAppearance = BasicButton.xs.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuTight.xs.appearance
        appearance.selectItemAppearance = SelectItemMultipleTight.xs.appearance
        appearance.textFieldAppearance = TextField.xs.default.appearance

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<SelectAppearance>] = [
        SelectMultipleTight.l.variation,
        SelectMultipleTight.m.variation,
        SelectMultipleTight.s.variation,
        SelectMultipleTight.xl.variation,
        SelectMultipleTight.xs.variation,
    ]
}

public struct SelectMultipleTightVariation {
    public struct L {}
    public struct M {}
    public struct S {}
    public struct Xl {}
    public struct Xs {}
}

private extension SelectAppearance {
    static var base: SelectAppearance {
        var appearance = SelectAppearance()
        return appearance
    }
}
