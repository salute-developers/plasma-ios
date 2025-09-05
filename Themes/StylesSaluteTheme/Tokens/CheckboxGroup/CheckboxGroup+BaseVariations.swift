import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct CheckboxGroup {
    public static var m: ComponentAppearanceVariation<CheckboxGroup, CheckboxGroupAppearance> {
        var appearance = CheckboxGroupAppearance.base
        appearance.size = CheckboxGroupSize.m
        appearance.checkboxAppearance = Checkbox.m.default.appearance

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<CheckboxGroup, CheckboxGroupAppearance> {
        var appearance = CheckboxGroupAppearance.base
        appearance.size = CheckboxGroupSize.s
        appearance.checkboxAppearance = Checkbox.s.default.appearance

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<CheckboxGroupAppearance>] = [
        CheckboxGroup.m.variation,
        CheckboxGroup.s.variation,
    ]
}

public struct CheckboxGroupVariation {
    public struct M {}
    public struct S {}
}

private extension CheckboxGroupAppearance {
    static var base: CheckboxGroupAppearance {
        var appearance = CheckboxGroupAppearance()
        return appearance
    }
}
