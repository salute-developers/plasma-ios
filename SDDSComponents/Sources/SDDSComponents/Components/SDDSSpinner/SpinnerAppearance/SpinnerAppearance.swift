import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public struct SpinnerAppearance: Hashable {
    let id = UUID()
    public var backgroundColor: StatefulFillStyle
    public var strokeCap: StrokeCap
    public var startColor: StatefulFillStyle
    public var endColor: StatefulFillStyle
    public var size: SpinnerSizeConfiguration
    
    public init(
        backgroundColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        strokeCap: StrokeCap = .round,
        startColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        endColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        size: SpinnerSizeConfiguration = DefaultSpinnerSize()
    ) {
        self.backgroundColor = backgroundColor
        self.strokeCap = strokeCap
        self.startColor = startColor
        self.endColor = endColor
        self.size = size
    }

    @available(*, deprecated, message: "ColorToken parameters are deprecated and will be replaced by StatefulFillStyle in a future release.")
    @_disfavoredOverload
    public init(
        backgroundColor: ColorToken = .clearColor,
        strokeCap: StrokeCap = .round,
        startColor: ColorToken = .clearColor,
        endColor: ColorToken = .clearColor,
        size: SpinnerSizeConfiguration = DefaultSpinnerSize()
    ) {
        self.init(
            backgroundColor: backgroundColor.statefulColor.statefulFillStyle,
            strokeCap: strokeCap,
            startColor: startColor.statefulColor.statefulFillStyle,
            endColor: endColor.statefulColor.statefulFillStyle,
            size: size
        )
    }
    
    public static func == (lhs: SpinnerAppearance, rhs: SpinnerAppearance) -> Bool {
        lhs.id == rhs.id &&
        lhs.backgroundColor == rhs.backgroundColor &&
        lhs.strokeCap == rhs.strokeCap &&
        lhs.startColor == rhs.startColor &&
        lhs.endColor == rhs.endColor
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension SpinnerAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: SpinnerAppearance.self, fallback: SpinnerAppearance())
    }
} 
