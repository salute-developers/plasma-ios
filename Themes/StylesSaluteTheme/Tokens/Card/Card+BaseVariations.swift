import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct Card {
    public static var `default`: ComponentAppearanceVariation<Card, CardAppearance> {
        var appearance = CardAppearance.base
        appearance.size = CardSize.`default`

        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<CardAppearance>] = [
        Card.default.variation,
    ]
}

public struct CardVariation {
    public struct Default {}
}

private extension CardAppearance {
    static var base: CardAppearance {
        var appearance = CardAppearance()
        return appearance
    }
}
