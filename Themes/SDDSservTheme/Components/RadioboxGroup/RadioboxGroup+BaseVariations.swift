import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct RadioboxGroup {
    public static var m: ComponentAppearanceVariation<RadioboxGroup, RadioboxGroupAppearance> {
        var appearance = RadioboxGroupAppearance.base
        appearance.size = RadioboxGroupSize.m
        appearance.radioboxAppearance = Radiobox.m.appearance

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<RadioboxGroup, RadioboxGroupAppearance> {
        var appearance = RadioboxGroupAppearance.base
        appearance.size = RadioboxGroupSize.s
        appearance.radioboxAppearance = Radiobox.s.appearance

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<RadioboxGroupAppearance>] = [
        RadioboxGroup.m.variation,
        RadioboxGroup.s.variation,
    ]
}

public struct RadioboxGroupVariation {
    public struct M {}
    public struct S {}
}

private extension RadioboxGroupAppearance {
    static var base: RadioboxGroupAppearance {
        var appearance = RadioboxGroupAppearance()
        return appearance
    }
}
