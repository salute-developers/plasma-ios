import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct Counter {
    public static var l: ComponentAppearanceVariation<Counter, CounterAppearance> {
        var appearance = CounterAppearance.base
        appearance.size = CounterSize.l
        appearance.textTypography = CounterTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<Counter, CounterAppearance> {
        var appearance = CounterAppearance.base
        appearance.size = CounterSize.m
        appearance.textTypography = CounterTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<Counter, CounterAppearance> {
        var appearance = CounterAppearance.base
        appearance.size = CounterSize.s
        appearance.textTypography = CounterTypography(oneSize: AdaptiveTypographyToken.bodyXxsNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<Counter, CounterAppearance> {
        var appearance = CounterAppearance.base
        appearance.size = CounterSize.xs
        appearance.textTypography = CounterTypography(oneSize: AdaptiveTypographyToken.bodyXxsNormal.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    public static var xxs: ComponentAppearanceVariation<Counter, CounterAppearance> {
        var appearance = CounterAppearance.base
        appearance.size = CounterSize.xxs
        appearance.textTypography = CounterTypography(oneSize: AdaptiveTypographyToken.bodyXxsNormal.typography).asContainer

        return .init(
            name: "xxs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<CounterAppearance>] = [
        Counter.l.variation,
        Counter.m.variation,
        Counter.s.variation,
        Counter.xs.variation,
        Counter.xxs.variation,
    ]
}

public struct CounterVariation {
    public struct L {}
    public struct M {}
    public struct S {}
    public struct Xs {}
    public struct Xxs {}
}

private extension CounterAppearance {
    static var base: CounterAppearance {
        var appearance = CounterAppearance()
        return appearance
    }
}
