import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct NoteCompact {
    public static var contentBeforeFixed: GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.Contentbeforefixed> {
        var appearance = NoteCompactAppearance.base
        appearance.size = NoteCompactSize.contentBeforeFixed

        return .init(
            name: "contentBeforeFixed",
            appearance: appearance
        )
    }
    public static var contentBeforeScalable: GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.Contentbeforescalable> {
        var appearance = NoteCompactAppearance.base
        appearance.size = NoteCompactSize.contentBeforeScalable

        return .init(
            name: "contentBeforeScalable",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<NoteCompactAppearance>] = [
        NoteCompact.contentBeforeFixed.variation,
        NoteCompact.contentBeforeFixed.hasClose.variation,
        NoteCompact.contentBeforeScalable.variation,
        NoteCompact.contentBeforeScalable.hasClose.variation,
    ]
}

public struct NoteCompactVariation {
    public struct Contentbeforefixed {}
    public struct ContentbeforefixedHasclose {}
    public struct Contentbeforescalable {}
    public struct ContentbeforescalableHasclose {}
}

private extension NoteCompactAppearance {
    static var base: NoteCompactAppearance {
        var appearance = NoteCompactAppearance()
        appearance.closeColor = ColorToken.textDefaultSecondary
        appearance.textColor = ColorToken.textDefaultPrimary
        appearance.textTypography = NoteCompactTypography(oneSize: AdaptiveTypographyToken.textSNormal.typography).asContainer
        appearance.titleColor = ColorToken.textDefaultPrimary
        appearance.titleTypography = NoteCompactTypography(oneSize: AdaptiveTypographyToken.textSBold.typography).asContainer
        return appearance
    }
}
