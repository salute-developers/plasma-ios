import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct SelectSingleTight {
    public static var l: ComponentAppearanceVariation<SelectSingleTight, SelectAppearance> {
        var appearance = SelectAppearance.base
        appearance.size = SelectSingleTightSize.l
        appearance.buttonAppearance = BasicButton.l.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuTight.l.appearance
        appearance.selectItemAppearance = SelectItemSingleTight.l.appearance
        appearance.textFieldAppearance = TextField.l.default.appearance

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<SelectSingleTight, SelectAppearance> {
        var appearance = SelectAppearance.base
        appearance.size = SelectSingleTightSize.m
        appearance.buttonAppearance = BasicButton.m.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuTight.m.appearance
        appearance.selectItemAppearance = SelectItemSingleTight.m.appearance
        appearance.textFieldAppearance = TextField.m.default.appearance

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<SelectSingleTight, SelectAppearance> {
        var appearance = SelectAppearance.base
        appearance.size = SelectSingleTightSize.s
        appearance.buttonAppearance = BasicButton.s.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuTight.s.appearance
        appearance.selectItemAppearance = SelectItemSingleTight.s.appearance
        appearance.textFieldAppearance = TextField.s.default.appearance

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xl: ComponentAppearanceVariation<SelectSingleTight, SelectAppearance> {
        var appearance = SelectAppearance.base
        appearance.size = SelectSingleTightSize.xl
        appearance.buttonAppearance = BasicButton.xl.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuTight.xl.appearance
        appearance.selectItemAppearance = SelectItemSingleTight.xl.appearance
        appearance.textFieldAppearance = TextField.xl.default.appearance

        return .init(
            name: "xl",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<SelectSingleTight, SelectAppearance> {
        var appearance = SelectAppearance.base
        appearance.size = SelectSingleTightSize.xs
        appearance.buttonAppearance = BasicButton.xs.secondary.appearance
        appearance.dropdownAppearance = DropdownMenuTight.xs.appearance
        appearance.selectItemAppearance = SelectItemSingleTight.xs.appearance
        appearance.textFieldAppearance = TextField.xs.default.appearance

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<SelectAppearance>] = [
        SelectSingleTight.l.variation,
        SelectSingleTight.m.variation,
        SelectSingleTight.s.variation,
        SelectSingleTight.xl.variation,
        SelectSingleTight.xs.variation,
    ]
}

public struct SelectSingleTightVariation {
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
