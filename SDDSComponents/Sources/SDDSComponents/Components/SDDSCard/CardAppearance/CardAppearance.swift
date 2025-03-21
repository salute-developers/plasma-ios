import SwiftUI
import Foundation
import SDDSThemeCore

public struct CardAppearance: EnvironmentKey {
    public static var defaultValue: CardAppearance = CardAppearance()
    
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
