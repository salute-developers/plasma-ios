import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct Note {
    public static var contentBeforeFixed: GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.Contentbeforefixed> {
        var appearance = NoteAppearance.base
        appearance.size = NoteSize.contentBeforeFixed

        return .init(
            name: "contentBeforeFixed",
            appearance: appearance
        )
    }
    public static var contentBeforeScalable: GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.Contentbeforescalable> {
        var appearance = NoteAppearance.base
        appearance.size = NoteSize.contentBeforeScalable

        return .init(
            name: "contentBeforeScalable",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<NoteAppearance>] = [
        Note.contentBeforeFixed.variation,
        Note.contentBeforeFixed.hasClose.variation,
        Note.contentBeforeScalable.variation,
        Note.contentBeforeScalable.hasClose.variation,
    ]
}

public struct NoteVariation {
    public struct Contentbeforefixed {}
    public struct ContentbeforefixedHasclose {}
    public struct Contentbeforescalable {}
    public struct ContentbeforescalableHasclose {}
}

private extension NoteAppearance {
    static var base: NoteAppearance {
        var appearance = NoteAppearance()
        appearance.closeColor = ColorToken.textDefaultSecondary
        appearance.textColor = ColorToken.textDefaultPrimary
        appearance.textTypography = NoteTypography(oneSize: AdaptiveTypographyToken.textSNormal.typography).asContainer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = NoteTypography(oneSize: AdaptiveTypographyToken.textSBold.typography).asContainer
        return appearance
    }
}
