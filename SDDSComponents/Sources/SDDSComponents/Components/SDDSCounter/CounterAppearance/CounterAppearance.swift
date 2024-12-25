import Foundation
@_exported import SDDSThemeCore

public struct CounterAppearance {
    public let size: CounterSizeConfiguration
    public let dataTypography: TypographyConfiguration
    public let dataColor: CounterColor
    public let backgroundColor: CounterColor
    public let disabledAlpha: CGFloat
    public let loadingAlpha: CGFloat
    
    public init(
        size: CounterSizeConfiguration = DefaultCounterSize(),
        dataTypography: TypographyConfiguration = .default,
        dataColor: CounterColor = CounterColor(),
        backgroundColor: CounterColor = CounterColor(),
        disabledAlpha: CGFloat = 0,
        loadingAlpha: CGFloat = 0
    ) {
        self.size = size
        self.dataTypography = dataTypography
        self.dataColor = dataColor
        self.backgroundColor = backgroundColor
        self.disabledAlpha = disabledAlpha
        self.loadingAlpha = loadingAlpha
    }
}

