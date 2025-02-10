import Foundation
import SDDSComponents
import SDDSThemeCore

public struct SegmentItem {
    public static var l: ComponentAppearanceVariation<SegmentItem, SegmentItemAppearance> {
        var appearance = SegmentItemAppearance.base
        appearance.size = SegmentItemSize.large
        appearance.titleTypography = SwitchTypography.label
        appearance.subtitleTypography = SwitchTypography.description
        appearance.counterAppearance = Counter.s.accent.appearance
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<SegmentItem, SegmentItemAppearance> {
        var appearance = SegmentItemAppearance.base
        appearance.size = SegmentItemSize.medium
        appearance.titleTypography = SwitchTypography.label
        appearance.subtitleTypography = SwitchTypography.description
        appearance.counterAppearance = Counter.xs.accent.appearance
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<SegmentItem, SegmentItemAppearance> {
        var appearance = SegmentItemAppearance.base
        appearance.size = SegmentItemSize.small
        appearance.titleTypography = SwitchTypography.label
        appearance.subtitleTypography = SwitchTypography.description
<<<<<<< HEAD
        appearance.counterAppearance = Counter.xs.accent.appearance
=======
        appearance.counterAppearance = Counter.s.accent.appearance
>>>>>>> 7e47872f (feat: added multiple themes support)
        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<SegmentItem, SegmentItemAppearance> {
        var appearance = SegmentItemAppearance.base
        appearance.size = SegmentItemSize.extraSmall
        appearance.titleTypography = SwitchTypography.label
        appearance.subtitleTypography = SwitchTypography.description
<<<<<<< HEAD
        appearance.counterAppearance = Counter.xxs.accent.appearance
=======
        appearance.counterAppearance = Counter.xs.accent.appearance
>>>>>>> 7e47872f (feat: added multiple themes support)
        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<SegmentItemAppearance>] = [l, m, s, xs].map { $0.variation }
}

extension SegmentItemAppearance {
    static var base: SegmentItemAppearance {
        return SegmentItemAppearance()
    }
}
