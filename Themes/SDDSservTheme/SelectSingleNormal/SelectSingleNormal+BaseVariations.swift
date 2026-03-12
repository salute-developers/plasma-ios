import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct SelectSingleNormal {
    public static var l: ComponentAppearanceVariation<SelectSingleNormal, SelectAppearance> {
        var appearance = SelectAppearance.base
        appearance.size = SelectSingleNormalSize.l
        appearance.buttonAppearance = BasicButton.l.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuNormal.l.appearance
        appearance.selectItemAppearance = SelectItemSingleNormal.l.appearance
        appearance.textFieldAppearance = TextField.l.default.appearance

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<SelectSingleNormal, SelectAppearance> {
        var appearance = SelectAppearance.base
        appearance.size = SelectSingleNormalSize.m
        appearance.buttonAppearance = BasicButton.m.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuNormal.m.appearance
        appearance.selectItemAppearance = SelectItemSingleNormal.m.appearance
        appearance.textFieldAppearance = TextField.m.default.appearance

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<SelectSingleNormal, SelectAppearance> {
        var appearance = SelectAppearance.base
        appearance.size = SelectSingleNormalSize.s
        appearance.buttonAppearance = BasicButton.s.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuNormal.s.appearance
        appearance.selectItemAppearance = SelectItemSingleNormal.s.appearance
        appearance.textFieldAppearance = TextField.s.default.appearance

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xl: ComponentAppearanceVariation<SelectSingleNormal, SelectAppearance> {
        var appearance = SelectAppearance.base
        appearance.size = SelectSingleNormalSize.xl
        appearance.buttonAppearance = BasicButton.xl.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuNormal.xl.appearance
        appearance.selectItemAppearance = SelectItemSingleNormal.xl.appearance
        appearance.textFieldAppearance = TextField.xl.default.appearance

        return .init(
            name: "xl",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<SelectSingleNormal, SelectAppearance> {
        var appearance = SelectAppearance.base
        appearance.size = SelectSingleNormalSize.xs
        appearance.buttonAppearance = BasicButton.xs.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuNormal.xs.appearance
        appearance.selectItemAppearance = SelectItemSingleNormal.xs.appearance
        appearance.textFieldAppearance = TextField.xs.default.appearance

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<SelectAppearance>] = [
        SelectSingleNormal.l.variation,
        SelectSingleNormal.m.variation,
        SelectSingleNormal.s.variation,
        SelectSingleNormal.xl.variation,
        SelectSingleNormal.xs.variation,
    ]
}

public struct SelectSingleNormalVariation {
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
