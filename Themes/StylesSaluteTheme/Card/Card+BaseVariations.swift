import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct Card {
    
    public static let all: [Variation<CardAppearance>] = [
    ]
}

public struct CardVariation {
}

private extension CardAppearance {
    static var base: CardAppearance {
        var appearance = CardAppearance()
        return appearance
    }
}
