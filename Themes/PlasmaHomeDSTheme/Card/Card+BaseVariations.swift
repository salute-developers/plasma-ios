import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct Card {
    public static var l: GeneralAppearanceVariation<Card, CardAppearance, CardVariation.L> {
        var appearance = CardAppearance.base
        appearance.size = CardSize.l

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<Card, CardAppearance, CardVariation.M> {
        var appearance = CardAppearance.base
        appearance.size = CardSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<Card, CardAppearance, CardVariation.S> {
        var appearance = CardAppearance.base
        appearance.size = CardSize.s

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xl: GeneralAppearanceVariation<Card, CardAppearance, CardVariation.Xl> {
        var appearance = CardAppearance.base
        appearance.size = CardSize.xl

        return .init(
            name: "xl",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<CardAppearance>] = [
        Card.l.variation,
        Card.l.hasInnerPaddings.variation,
        Card.m.variation,
        Card.m.hasInnerPaddings.variation,
        Card.s.variation,
        Card.s.hasInnerPaddings.variation,
        Card.xl.variation,
        Card.xl.hasInnerPaddings.variation,
    ]
}

public struct CardVariation {
    public struct L {}
    public struct LHasinnerpaddings {}
    public struct M {}
    public struct MHasinnerpaddings {}
    public struct S {}
    public struct SHasinnerpaddings {}
    public struct Xl {}
    public struct XlHasinnerpaddings {}
}

private extension CardAppearance {
    static var base: CardAppearance {
        var appearance = CardAppearance()
        appearance.backgroundColor = ColorToken.surfaceDefaultClear
        return appearance
    }
}
