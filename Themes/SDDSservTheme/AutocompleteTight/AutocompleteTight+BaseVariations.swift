import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct AutocompleteTight {
    public static var l: ComponentAppearanceVariation<AutocompleteTight, AutocompleteAppearance> {
        var appearance = AutocompleteAppearance.base
        appearance.size = AutocompleteTightSize.l
        appearance.dropdownAppearance = DropdownMenuTight.l.appearance
        appearance.textFieldAppearance = TextField.l.default.appearance

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<AutocompleteTight, AutocompleteAppearance> {
        var appearance = AutocompleteAppearance.base
        appearance.size = AutocompleteTightSize.m
        appearance.dropdownAppearance = DropdownMenuTight.m.appearance
        appearance.textFieldAppearance = TextField.m.default.appearance

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<AutocompleteTight, AutocompleteAppearance> {
        var appearance = AutocompleteAppearance.base
        appearance.size = AutocompleteTightSize.s
        appearance.dropdownAppearance = DropdownMenuTight.s.appearance
        appearance.textFieldAppearance = TextField.s.default.appearance

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xl: ComponentAppearanceVariation<AutocompleteTight, AutocompleteAppearance> {
        var appearance = AutocompleteAppearance.base
        appearance.size = AutocompleteTightSize.xl
        appearance.dropdownAppearance = DropdownMenuTight.xl.appearance
        appearance.textFieldAppearance = TextField.xl.default.appearance

        return .init(
            name: "xl",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<AutocompleteTight, AutocompleteAppearance> {
        var appearance = AutocompleteAppearance.base
        appearance.size = AutocompleteTightSize.xs
        appearance.dropdownAppearance = DropdownMenuTight.xs.appearance
        appearance.textFieldAppearance = TextField.xs.default.appearance

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<AutocompleteAppearance>] = [
        AutocompleteTight.l.variation,
        AutocompleteTight.m.variation,
        AutocompleteTight.s.variation,
        AutocompleteTight.xl.variation,
        AutocompleteTight.xs.variation,
    ]
}

public struct AutocompleteTightVariation {
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
