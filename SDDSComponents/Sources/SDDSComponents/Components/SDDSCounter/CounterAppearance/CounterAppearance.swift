import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public struct CounterAppearance: Modifiable {
    public typealias ModifiableType = Self
    
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
    
    public func modify(_ value: CounterAppearance) -> CounterAppearance {
        var result = self
        result.textTypography = value.textTypography
        result.textColor = value.textColor
        result.backgroundColor = value.backgroundColor
        return result
    }
}

extension CounterAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: CounterAppearance.self, fallback: CounterAppearance())
    }
}

