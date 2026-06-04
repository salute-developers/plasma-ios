import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public struct CounterAppearance: Modifiable {
    public typealias ModifiableType = Self
    
    public var size: CounterSizeConfiguration
    public var textTypography: TypographyConfiguration
    public var textColor: StatefulFillStyle
    public var backgroundColor: StatefulFillStyle

    public init(
        size: CounterSizeConfiguration = DefaultCounterSize(),
        textTypography: TypographyConfiguration = .default,
        textColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        backgroundColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: [])
    ) {
        self.size = size
        self.textTypography = textTypography
        self.textColor = textColor
        self.backgroundColor = backgroundColor
    }

    @available(*, deprecated, message: "ButtonColor is deprecated and will be replaced by StatefulFillStyle in a future release.")
    @_disfavoredOverload
    public init(
        size: CounterSizeConfiguration = DefaultCounterSize(),
        textTypography: TypographyConfiguration = .default,
        textColor: ButtonColor = ButtonColor(),
        backgroundColor: ButtonColor = ButtonColor()
    ) {
        self.init(
            size: size,
            textTypography: textTypography,
            textColor: textColor.statefulColor.statefulFillStyle,
            backgroundColor: backgroundColor.statefulColor.statefulFillStyle
        )
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

