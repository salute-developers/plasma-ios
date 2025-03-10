import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

public struct Indicator {
    public static var l: ComponentAppearanceVariation<Indicator, IndicatorAppearance> {
        var appearance = IndicatorAppearance.base
        appearance.size = IndicatorSize.l

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<Indicator, IndicatorAppearance> {
        var appearance = IndicatorAppearance.base
        appearance.size = IndicatorSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<Indicator, IndicatorAppearance> {
        var appearance = IndicatorAppearance.base
        appearance.size = IndicatorSize.s

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<IndicatorAppearance>] = [
        Indicator.l.variation,
        Indicator.m.variation,
        Indicator.s.variation,
    ]
}

public struct IndicatorVariation {
    public struct L {}
    public struct M {}
    public struct S {}
}

private extension IndicatorAppearance {
    static var base: IndicatorAppearance {
        var appearance = IndicatorAppearance()
        return appearance
    }
}
