import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct SelectMultipleNormal {
    public static var l: ComponentAppearanceVariation<SelectMultipleNormal, SelectAppearance> {
        var appearance = SelectAppearance.base
        appearance.size = SelectMultipleNormalSize.l
        appearance.buttonAppearance = BasicButton.l.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuNormal.l.appearance
        appearance.selectItemAppearance = SelectItemMultipleNormal.l.appearance
        appearance.textFieldAppearance = TextField.l.default.appearance

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<SelectMultipleNormal, SelectAppearance> {
        var appearance = SelectAppearance.base
        appearance.size = SelectMultipleNormalSize.m
        appearance.buttonAppearance = BasicButton.m.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuNormal.m.appearance
        appearance.selectItemAppearance = SelectItemMultipleNormal.m.appearance
        appearance.textFieldAppearance = TextField.m.default.appearance

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<SelectMultipleNormal, SelectAppearance> {
        var appearance = SelectAppearance.base
        appearance.size = SelectMultipleNormalSize.s
        appearance.buttonAppearance = BasicButton.s.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuNormal.s.appearance
        appearance.selectItemAppearance = SelectItemMultipleNormal.s.appearance
        appearance.textFieldAppearance = TextField.s.default.appearance

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xl: ComponentAppearanceVariation<SelectMultipleNormal, SelectAppearance> {
        var appearance = SelectAppearance.base
        appearance.size = SelectMultipleNormalSize.xl
        appearance.buttonAppearance = BasicButton.xl.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuNormal.xl.appearance
        appearance.selectItemAppearance = SelectItemMultipleNormal.xl.appearance
        appearance.textFieldAppearance = TextField.xl.default.appearance

        return .init(
            name: "xl",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<SelectMultipleNormal, SelectAppearance> {
        var appearance = SelectAppearance.base
        appearance.size = SelectMultipleNormalSize.xs
        appearance.buttonAppearance = BasicButton.xs.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuNormal.xs.appearance
        appearance.selectItemAppearance = SelectItemMultipleNormal.xs.appearance
        appearance.textFieldAppearance = TextField.xs.default.appearance

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<SelectAppearance>] = [
        SelectMultipleNormal.l.variation,
        SelectMultipleNormal.m.variation,
        SelectMultipleNormal.s.variation,
        SelectMultipleNormal.xl.variation,
        SelectMultipleNormal.xs.variation,
    ]
}

public struct SelectMultipleNormalVariation {
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
