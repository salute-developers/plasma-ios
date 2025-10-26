import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct Note {
    public static var l: GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.L> {
        var appearance = NoteAppearance.base
        appearance.size = NoteSize.l
        appearance.textTypography = NoteTypography(oneSize: AdaptiveTypographyToken.textLNormal.typography).asContainer
        appearance.titleTypography = NoteTypography(oneSize: AdaptiveTypographyToken.textLBold.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.M> {
        var appearance = NoteAppearance.base
        appearance.size = NoteSize.m
        appearance.textTypography = NoteTypography(oneSize: AdaptiveTypographyToken.textMNormal.typography).asContainer
        appearance.titleTypography = NoteTypography(oneSize: AdaptiveTypographyToken.textMBold.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.S> {
        var appearance = NoteAppearance.base
        appearance.size = NoteSize.s
        appearance.textTypography = NoteTypography(oneSize: AdaptiveTypographyToken.textMNormal.typography).asContainer
        appearance.titleTypography = NoteTypography(oneSize: AdaptiveTypographyToken.textMBold.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.Xs> {
        var appearance = NoteAppearance.base
        appearance.size = NoteSize.xs
        appearance.textTypography = NoteTypography(oneSize: AdaptiveTypographyToken.textMNormal.typography).asContainer
        appearance.titleTypography = NoteTypography(oneSize: AdaptiveTypographyToken.textMBold.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<NoteAppearance>] = [
        Note.l.variation,
        Note.l.contentScalable.variation,
        Note.l.hasClose.variation,
        Note.l.hasCloseContentScalable.variation,
        Note.m.variation,
        Note.m.contentScalable.variation,
        Note.m.hasClose.variation,
        Note.m.hasCloseContentScalable.variation,
        Note.s.variation,
        Note.s.contentScalable.variation,
        Note.s.hasClose.variation,
        Note.s.hasCloseContentScalable.variation,
        Note.xs.variation,
        Note.xs.contentScalable.variation,
        Note.xs.hasClose.variation,
        Note.xs.hasCloseContentScalable.variation,
    ]
}

public struct NoteVariation {
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

private extension NoteAppearance {
    static var base: NoteAppearance {
        var appearance = NoteAppearance()
        appearance.closeColor = ColorToken.textDefaultSecondary
        appearance.textColor = ColorToken.textDefaultPrimary
        appearance.titleColor = ColorToken.textDefaultPrimary
        return appearance
    }
}
