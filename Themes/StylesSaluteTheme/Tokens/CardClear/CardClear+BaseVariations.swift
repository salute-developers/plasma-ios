import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct CardClear {
    public static var `default`: ComponentAppearanceVariation<CardClear, CardAppearance> {
        var appearance = CardAppearance.base
        appearance.size = CardClearSize.`default`

        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<CardAppearance>] = [
        CardClear.default.variation,
    ]
}

public struct CardClearVariation {
    public struct Default {}
}

private extension CardAppearance {
    static var base: CardAppearance {
        var appearance = CardAppearance()
        return appearance
    }
}
