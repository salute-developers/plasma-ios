import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct ScrollBar {
    public static var m: ComponentAppearanceVariation<ScrollBar, ScrollbarAppearance> {
        var appearance = ScrollbarAppearance.base
        appearance.size = ScrollBarSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<ScrollBar, ScrollbarAppearance> {
        var appearance = ScrollbarAppearance.base
        appearance.size = ScrollBarSize.s

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<ScrollbarAppearance>] = [
        ScrollBar.m.variation,
        ScrollBar.s.variation,
    ]
}

public struct ScrollBarVariation {
    public struct M {}
    public struct S {}
}

private extension ScrollbarAppearance {
    static var base: ScrollbarAppearance {
        var appearance = ScrollbarAppearance()
        appearance.thumbColor = ColorToken.surfaceDefaultSolidTertiary
        appearance.trackColor = ColorToken.surfaceDefaultTransparentPrimary
        return appearance
    }
}
