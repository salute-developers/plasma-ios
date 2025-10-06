import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct CardSolid {
    public static var `default`: ComponentAppearanceVariation<CardSolid, CardAppearance> {
        var appearance = CardAppearance.base
        appearance.size = CardSolidSize.`default`

        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<CardAppearance>] = [
        CardSolid.default.variation,
    ]
}

public struct CardSolidVariation {
    public struct Default {}
}

private extension CardAppearance {
    static var base: CardAppearance {
        var appearance = CardAppearance()
        return appearance
    }
}
