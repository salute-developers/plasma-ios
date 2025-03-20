import SwiftUI
import Foundation
import SDDSThemeCore

public struct CardAppearance {
    public var size: CardSizeConfiguration
    public var backgroundColor: ColorToken
    
    public init(
        backgroundColor: ColorToken = .clearColor,
        size: CardSizeConfiguration = DefaultCardSize()
    ) {
        self.backgroundColor = backgroundColor
        self.size = size
    }
}

extension CardAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: CardAppearance.self, fallback: CardAppearance())
    }
}
