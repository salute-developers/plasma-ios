import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct AvatarIndicator {
    public static var l: ComponentAppearanceVariation<AvatarIndicator, IndicatorAppearance> {
        var appearance = IndicatorAppearance.base
        appearance.size = AvatarIndicatorSize.l

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<AvatarIndicator, IndicatorAppearance> {
        var appearance = IndicatorAppearance.base
        appearance.size = AvatarIndicatorSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<AvatarIndicator, IndicatorAppearance> {
        var appearance = IndicatorAppearance.base
        appearance.size = AvatarIndicatorSize.s

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static var all: [Variation<IndicatorAppearance>] {
        [
            AvatarIndicator.l.variation,
            AvatarIndicator.m.variation,
            AvatarIndicator.s.variation,
        ]
    }
}

public struct AvatarIndicatorVariation {
    public struct L {}
    public struct M {}
    public struct S {}
}

private extension IndicatorAppearance {
    static var base: IndicatorAppearance {
        var appearance = IndicatorAppearance()
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultPositive), values: [
            .init(states: [InteractiveState.inactive], value: .color(.surfaceOnLightSolidTertiary))
        ])
        return appearance
    }
}
