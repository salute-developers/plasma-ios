import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct NoteCompact {
    public static var l: GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.L> {
        var appearance = NoteCompactAppearance.base
        appearance.size = NoteCompactSize.l
        appearance.textTypography = NoteCompactTypography(oneSize: AdaptiveTypographyToken.textLNormal.typography).asContainer
        appearance.titleTypography = NoteCompactTypography(oneSize: AdaptiveTypographyToken.textLBold.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.M> {
        var appearance = NoteCompactAppearance.base
        appearance.size = NoteCompactSize.m
        appearance.textTypography = NoteCompactTypography(oneSize: AdaptiveTypographyToken.textMNormal.typography).asContainer
        appearance.titleTypography = NoteCompactTypography(oneSize: AdaptiveTypographyToken.textMBold.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.S> {
        var appearance = NoteCompactAppearance.base
        appearance.size = NoteCompactSize.s
        appearance.textTypography = NoteCompactTypography(oneSize: AdaptiveTypographyToken.textSNormal.typography).asContainer
        appearance.titleTypography = NoteCompactTypography(oneSize: AdaptiveTypographyToken.textSBold.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.Xs> {
        var appearance = NoteCompactAppearance.base
        appearance.size = NoteCompactSize.xs
        appearance.textTypography = NoteCompactTypography(oneSize: AdaptiveTypographyToken.textXsNormal.typography).asContainer
        appearance.titleTypography = NoteCompactTypography(oneSize: AdaptiveTypographyToken.textXsBold.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<NoteCompactAppearance>] = [
        NoteCompact.l.variation,
        NoteCompact.l.contentScalable.variation,
        NoteCompact.l.hasClose.variation,
        NoteCompact.l.hasCloseContentScalable.variation,
        NoteCompact.m.variation,
        NoteCompact.m.contentScalable.variation,
        NoteCompact.m.hasClose.variation,
        NoteCompact.m.hasCloseContentScalable.variation,
        NoteCompact.s.variation,
        NoteCompact.s.contentScalable.variation,
        NoteCompact.s.hasClose.variation,
        NoteCompact.s.hasCloseContentScalable.variation,
        NoteCompact.xs.variation,
        NoteCompact.xs.contentScalable.variation,
        NoteCompact.xs.hasClose.variation,
        NoteCompact.xs.hasCloseContentScalable.variation,
    ]
}

public struct NoteCompactVariation {
    public struct L {}
    public struct LContentscalable {}
    public struct LHasclose {}
    public struct LHasclosecontentscalable {}
    public struct M {}
    public struct MContentscalable {}
    public struct MHasclose {}
    public struct MHasclosecontentscalable {}
    public struct S {}
    public struct SContentscalable {}
    public struct SHasclose {}
    public struct SHasclosecontentscalable {}
    public struct Xs {}
    public struct XsContentscalable {}
    public struct XsHasclose {}
    public struct XsHasclosecontentscalable {}
}

private extension NoteCompactAppearance {
    static var base: NoteCompactAppearance {
        var appearance = NoteCompactAppearance()
        appearance.closeColor = ColorToken.textDefaultSecondary
        appearance.textColor = ColorToken.textDefaultPrimary
        appearance.titleColor = ColorToken.textDefaultPrimary
        return appearance
    }
}
