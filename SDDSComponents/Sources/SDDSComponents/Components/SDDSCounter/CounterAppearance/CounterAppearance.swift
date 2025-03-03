import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public struct CounterAppearance: EnvironmentKey {
    public static let defaultValue: Self = .init()
    
    public var size: CounterSizeConfiguration
    public var textTypography: TypographyConfiguration
    public var textColor: ButtonColor
    public var backgroundColor: ButtonColor

    public init(
        size: CounterSizeConfiguration = DefaultCounterSize(),
        textTypography: TypographyConfiguration = .default,
        textColor: ButtonColor = ButtonColor(),
        backgroundColor: ButtonColor = ButtonColor()
    ) {
        self.size = size
        self.textTypography = textTypography
        self.textColor = textColor
        self.backgroundColor = backgroundColor
    }
}

