import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct SegmentItem {
    public static var l: GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.L> {
        var appearance = SegmentItemAppearance.base
        appearance.size = SegmentItemSize.l
        appearance.counterAppearance = Counter.s.accent.appearance
        appearance.subtitleTypography = SegmentItemTypography(oneSize: Typographies.bodyLBold.typography).asContainer
        appearance.titleTypography = SegmentItemTypography(oneSize: Typographies.bodyLBold.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.M> {
        var appearance = SegmentItemAppearance.base
        appearance.size = SegmentItemSize.m
        appearance.counterAppearance = Counter.xs.accent.appearance
        appearance.subtitleTypography = SegmentItemTypography(oneSize: Typographies.bodyMBold.typography).asContainer
        appearance.titleTypography = SegmentItemTypography(oneSize: Typographies.bodyMBold.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.S> {
        var appearance = SegmentItemAppearance.base
        appearance.size = SegmentItemSize.s
        appearance.counterAppearance = Counter.xs.accent.appearance
        appearance.subtitleTypography = SegmentItemTypography(oneSize: Typographies.bodySBold.typography).asContainer
        appearance.titleTypography = SegmentItemTypography(oneSize: Typographies.bodySBold.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.Xs> {
        var appearance = SegmentItemAppearance.base
        appearance.size = SegmentItemSize.xs
        appearance.counterAppearance = Counter.xxs.accent.appearance
        appearance.subtitleTypography = SegmentItemTypography(oneSize: Typographies.bodyXsBold.typography).asContainer
        appearance.titleTypography = SegmentItemTypography(oneSize: Typographies.bodyXsBold.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<SegmentItemAppearance>] = [
        SegmentItem.l.variation,
        SegmentItem.l.pilled.variation,
        SegmentItem.m.variation,
        SegmentItem.m.pilled.variation,
        SegmentItem.s.variation,
        SegmentItem.s.pilled.variation,
        SegmentItem.xs.variation,
        SegmentItem.xs.pilled.variation,
    ]
}

public struct SegmentItemVariation {
    public struct L {}
    public struct LPilled {}
    public struct M {}
    public struct MPilled {}
    public struct S {}
    public struct SPilled {}
    public struct Xs {}
    public struct XsPilled {}
}

private extension SegmentItemAppearance {
    static var base: SegmentItemAppearance {
        var appearance = SegmentItemAppearance()
        appearance.disabledAlpha = CGFloat(0.4)
        return appearance
    }
}
