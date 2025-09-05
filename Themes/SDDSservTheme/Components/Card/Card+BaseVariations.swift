import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct Card {
    public static var l: ComponentAppearanceVariation<Card, CardAppearance> {
        var appearance = CardAppearance.base
        appearance.size = CardSize.l

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<Card, CardAppearance> {
        var appearance = CardAppearance.base
        appearance.size = CardSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<Card, CardAppearance> {
        var appearance = CardAppearance.base
        appearance.size = CardSize.s

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<CardAppearance>] = [
        Card.l.variation,
        Card.m.variation,
        Card.s.variation,
    ]
}

public struct CardVariation {
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
