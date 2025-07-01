import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct Scrollbar {
    public static var m: ComponentAppearanceVariation<Scrollbar, ScrollbarAppearance> {
        var appearance = ScrollbarAppearance.base
        appearance.size = ScrollbarSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<Scrollbar, ScrollbarAppearance> {
        var appearance = ScrollbarAppearance.base
        appearance.size = ScrollbarSize.s

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<ScrollbarAppearance>] = [
        Scrollbar.m.variation,
        Scrollbar.s.variation,
    ]
}

public struct ScrollbarVariation {
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
