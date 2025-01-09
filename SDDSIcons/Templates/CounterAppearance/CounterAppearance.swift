import Foundation
@_exported import SDDSThemeCore

public struct CounterAppearance {
    public let size: CounterSizeConfiguration
    public let titleTypography: TypographyConfiguration
    public let titleColor: ButtonColor
    public let backgroundColor: ButtonColor
    public let disabledAlpha: CGFloat
    public let loadingAlpha: CGFloat
    
    public init(
        size: CounterSizeConfiguration = DefaultCounterSize(),
        titleTypography: TypographyConfiguration = .default,
        titleColor: ButtonColor = ButtonColor(),
        backgroundColor: ButtonColor = ButtonColor(),
        disabledAlpha: CGFloat = 0,
        loadingAlpha: CGFloat = 0
    ) {
        self.size = size
        self.titleTypography = titleTypography
        self.titleColor = titleColor
        self.backgroundColor = backgroundColor
        self.disabledAlpha = disabledAlpha
        self.loadingAlpha = loadingAlpha
    }
}

