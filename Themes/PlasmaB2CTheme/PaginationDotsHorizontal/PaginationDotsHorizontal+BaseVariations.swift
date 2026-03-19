import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct PaginationDotsHorizontal {
    public static var m: GeneralAppearanceVariation<PaginationDotsHorizontal, PaginationDotsAppearance, PaginationDotsHorizontalVariation.M> {
        var appearance = PaginationDotsAppearance.base
        appearance.size = PaginationDotsHorizontalSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<PaginationDotsHorizontal, PaginationDotsAppearance, PaginationDotsHorizontalVariation.S> {
        var appearance = PaginationDotsAppearance.base
        appearance.size = PaginationDotsHorizontalSize.s

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<PaginationDotsAppearance>] = [
        PaginationDotsHorizontal.m.variation,
        PaginationDotsHorizontal.m.activeTypeLine.variation,
        PaginationDotsHorizontal.s.variation,
        PaginationDotsHorizontal.s.activeTypeLine.variation,
    ]
}

public struct PaginationDotsHorizontalVariation {
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
