import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct SegmentItemCounter {
    public static var l: ComponentAppearanceVariation<SegmentItemCounter, CounterAppearance> {
        var appearance = CounterAppearance.base
        appearance.size = SegmentItemCounterSize.l
        appearance.textTypography = SegmentItemCounterTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<SegmentItemCounter, CounterAppearance> {
        var appearance = CounterAppearance.base
        appearance.size = SegmentItemCounterSize.m
        appearance.textTypography = SegmentItemCounterTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<SegmentItemCounter, CounterAppearance> {
        var appearance = CounterAppearance.base
        appearance.size = SegmentItemCounterSize.s
        appearance.textTypography = SegmentItemCounterTypography(oneSize: AdaptiveTypographyToken.bodyXxsNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<SegmentItemCounter, CounterAppearance> {
        var appearance = CounterAppearance.base
        appearance.size = SegmentItemCounterSize.xs
        appearance.textTypography = SegmentItemCounterTypography(oneSize: AdaptiveTypographyToken.bodyXxsNormal.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    public static var xxs: ComponentAppearanceVariation<SegmentItemCounter, CounterAppearance> {
        var appearance = CounterAppearance.base
        appearance.size = SegmentItemCounterSize.xxs
        appearance.textTypography = SegmentItemCounterTypography(oneSize: AdaptiveTypographyToken.bodyXxsNormal.typography).asContainer

        return .init(
            name: "xxs",
            appearance: appearance
        )
    }
    
    public static var all: [Variation<CounterAppearance>] {
        [
            SegmentItemCounter.l.variation,
            SegmentItemCounter.m.variation,
            SegmentItemCounter.s.variation,
            SegmentItemCounter.xs.variation,
            SegmentItemCounter.xxs.variation,
        ]
    }
}

public struct SegmentItemCounterVariation {
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
