import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct Segment {
    public static var l: GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.L> {
        var appearance = SegmentAppearance.base
        appearance.size = SegmentSize.l
        appearance.disabledAlpha = CGFloat(0)

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.M> {
        var appearance = SegmentAppearance.base
        appearance.size = SegmentSize.m
        appearance.disabledAlpha = CGFloat(0)

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.S> {
        var appearance = SegmentAppearance.base
        appearance.size = SegmentSize.s
        appearance.disabledAlpha = CGFloat(0)

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xl: GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.Xl> {
        var appearance = SegmentAppearance.base
        appearance.size = SegmentSize.xl
        appearance.disabledAlpha = CGFloat(0)

        return .init(
            name: "xl",
            appearance: appearance
        )
    }
    public static var xs: GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.Xs> {
        var appearance = SegmentAppearance.base
        appearance.size = SegmentSize.xs
        appearance.disabledAlpha = CGFloat(0)

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<SegmentAppearance>] = [
        Segment.l.variation,
        Segment.l.pilled.variation,
        Segment.m.variation,
        Segment.m.pilled.variation,
        Segment.s.variation,
        Segment.s.pilled.variation,
        Segment.xl.variation,
        Segment.xl.pilled.variation,
        Segment.xs.variation,
        Segment.xs.pilled.variation,
    ]
}

public struct SegmentVariation {
    public struct L {}
    public struct LPilled {}
    public struct M {}
    public struct MPilled {}
    public struct S {}
    public struct SPilled {}
    public struct Xl {}
    public struct XlPilled {}
    public struct Xs {}
    public struct XsPilled {}
}

private extension SegmentAppearance {
    static var base: SegmentAppearance {
        var appearance = SegmentAppearance()
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultTransparentSecondary, highlightedColor: ColorToken.surfaceDefaultTransparentSecondary, hoveredColor: ColorToken.surfaceDefaultTransparentSecondary, selectedColor: ColorToken.surfaceDefaultTransparentSecondary)
        appearance.disabledAlpha = CGFloat(0)
        return appearance
    }
}
