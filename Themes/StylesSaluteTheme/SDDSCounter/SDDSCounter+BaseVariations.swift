import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

public struct SDDSCounter {
    public static var l: ComponentAppearanceVariation<SDDSCounter, CounterAppearance> {
        var appearance = CounterAppearance.base
        appearance.size = SDDSCounterSize.l
        appearance.textTypography = SDDSCounterTypography(oneSize: Typographies.bodySNormal.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<SDDSCounter, CounterAppearance> {
        var appearance = CounterAppearance.base
        appearance.size = SDDSCounterSize.m
        appearance.textTypography = SDDSCounterTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<SDDSCounter, CounterAppearance> {
        var appearance = CounterAppearance.base
        appearance.size = SDDSCounterSize.s
        appearance.textTypography = SDDSCounterTypography(oneSize: Typographies.bodyXxsNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<SDDSCounter, CounterAppearance> {
        var appearance = CounterAppearance.base
        appearance.size = SDDSCounterSize.xs
        appearance.textTypography = SDDSCounterTypography(oneSize: Typographies.bodyXxsNormal.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    public static var xxs: ComponentAppearanceVariation<SDDSCounter, CounterAppearance> {
        var appearance = CounterAppearance.base
        appearance.size = SDDSCounterSize.xxs
        appearance.textTypography = SDDSCounterTypography(oneSize: Typographies.bodyXxsNormal.typography).asContainer

        return .init(
            name: "xxs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<CounterAppearance>] = [
        SDDSCounter.l.variation,
        SDDSCounter.m.variation,
        SDDSCounter.s.variation,
        SDDSCounter.xs.variation,
        SDDSCounter.xxs.variation,
    ]
}

public struct SDDSCounterVariation {
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
