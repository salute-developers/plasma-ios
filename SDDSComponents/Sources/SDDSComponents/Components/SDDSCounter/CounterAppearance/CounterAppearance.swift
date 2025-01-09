import Foundation
@_exported import SDDSThemeCore

public struct CounterAppearance {
    public let size: CounterSizeConfiguration
    public let textTypography: TypographyConfiguration
    public let textColor: ButtonColor
    public let backgroundColor: ButtonColor

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

