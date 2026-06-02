import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct PaginationDotsVertical {
    public static var m: GeneralAppearanceVariation<PaginationDotsVertical, PaginationDotsAppearance, PaginationDotsVerticalVariation.M> {
        var appearance = PaginationDotsAppearance.base
        appearance.size = PaginationDotsVerticalSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<PaginationDotsVertical, PaginationDotsAppearance, PaginationDotsVerticalVariation.S> {
        var appearance = PaginationDotsAppearance.base
        appearance.size = PaginationDotsVerticalSize.s

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static var all: [Variation<PaginationDotsAppearance>] {
        [
            PaginationDotsVertical.m.variation,
            PaginationDotsVertical.m.activeTypeLine.variation,
            PaginationDotsVertical.s.variation,
            PaginationDotsVertical.s.activeTypeLine.variation,
        ]
    }
}

public struct PaginationDotsVerticalVariation {
    public struct M {}
    public struct MActivetypeline {}
    public struct S {}
    public struct SActivetypeline {}
}

private extension PaginationDotsAppearance {
    static var base: PaginationDotsAppearance {
        var appearance = PaginationDotsAppearance()
        appearance.dotBackgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.dotBackgroundColorActivated = ColorToken.surfaceDefaultSolidDefault
        return appearance
    }
}
