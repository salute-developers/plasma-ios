import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct AutocompleteNormal {
    public static var l: ComponentAppearanceVariation<AutocompleteNormal, AutocompleteAppearance> {
        var appearance = AutocompleteAppearance.base
        appearance.size = AutocompleteNormalSize.l
        appearance.dropdownAppearance = DropdownMenuNormal.l.appearance
        appearance.textFieldAppearance = TextField.l.default.appearance

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<AutocompleteNormal, AutocompleteAppearance> {
        var appearance = AutocompleteAppearance.base
        appearance.size = AutocompleteNormalSize.m
        appearance.dropdownAppearance = DropdownMenuNormal.m.appearance
        appearance.textFieldAppearance = TextField.m.default.appearance

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<AutocompleteNormal, AutocompleteAppearance> {
        var appearance = AutocompleteAppearance.base
        appearance.size = AutocompleteNormalSize.s
        appearance.dropdownAppearance = DropdownMenuNormal.s.appearance
        appearance.textFieldAppearance = TextField.s.default.appearance

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xl: ComponentAppearanceVariation<AutocompleteNormal, AutocompleteAppearance> {
        var appearance = AutocompleteAppearance.base
        appearance.size = AutocompleteNormalSize.xl
        appearance.dropdownAppearance = DropdownMenuNormal.xl.appearance
        appearance.textFieldAppearance = TextField.xl.default.appearance

        return .init(
            name: "xl",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<AutocompleteNormal, AutocompleteAppearance> {
        var appearance = AutocompleteAppearance.base
        appearance.size = AutocompleteNormalSize.xs
        appearance.dropdownAppearance = DropdownMenuNormal.xs.appearance
        appearance.textFieldAppearance = TextField.xs.default.appearance

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<AutocompleteAppearance>] = [
        AutocompleteNormal.l.variation,
        AutocompleteNormal.m.variation,
        AutocompleteNormal.s.variation,
        AutocompleteNormal.xl.variation,
        AutocompleteNormal.xs.variation,
    ]
}

public struct AutocompleteNormalVariation {
    public struct L {}
    public struct M {}
    public struct S {}
    public struct Xl {}
    public struct Xs {}
}

private extension AutocompleteAppearance {
    static var base: AutocompleteAppearance {
        var appearance = AutocompleteAppearance()
        return appearance
    }
}
