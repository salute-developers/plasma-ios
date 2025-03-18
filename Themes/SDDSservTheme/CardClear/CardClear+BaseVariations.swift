import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct CardClear {
    public static var l: ComponentAppearanceVariation<CardClear, CardAppearance> {
        var appearance = CardAppearance.base
        appearance.size = CardClearSize.l

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<CardClear, CardAppearance> {
        var appearance = CardAppearance.base
        appearance.size = CardClearSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<CardClear, CardAppearance> {
        var appearance = CardAppearance.base
        appearance.size = CardClearSize.s

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<CardAppearance>] = [
        CardClear.l.variation,
        CardClear.m.variation,
        CardClear.s.variation,
    ]
}

public struct CardClearVariation {
    public struct L {}
    public struct M {}
    public struct S {}
}

private extension CardAppearance {
    static var base: CardAppearance {
        var appearance = CardAppearance()
        appearance.backgroundColor = ColorToken.surfaceDefaultClear
        return appearance
    }
}
