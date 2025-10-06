import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct CardSolid {
    public static var l: ComponentAppearanceVariation<CardSolid, CardAppearance> {
        var appearance = CardAppearance.base
        appearance.size = CardSolidSize.l

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<CardSolid, CardAppearance> {
        var appearance = CardAppearance.base
        appearance.size = CardSolidSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<CardSolid, CardAppearance> {
        var appearance = CardAppearance.base
        appearance.size = CardSolidSize.s

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<CardAppearance>] = [
        CardSolid.l.variation,
        CardSolid.m.variation,
        CardSolid.s.variation,
    ]
}

public struct CardSolidVariation {
    public struct L {}
    public struct M {}
    public struct S {}
}

private extension CardAppearance {
    static var base: CardAppearance {
        var appearance = CardAppearance()
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidCard
        return appearance
    }
}
