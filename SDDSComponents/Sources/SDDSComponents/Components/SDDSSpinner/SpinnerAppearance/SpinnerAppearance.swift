import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public struct SpinnerAppearance: Hashable {
    let id = UUID()
    public var backgroundColor: ColorToken
    public var angle: CGFloat
    public var strokeCap: StrokeCap
    public var startColor: ColorToken
    public var endColor: ColorToken
    public var size: SpinnerSizeConfiguration
    
    public init(
        backgroundColor: ColorToken = .clearColor,
        angle: CGFloat = 360,
        strokeCap: StrokeCap = .round,
        startColor: ColorToken = .clearColor,
        endColor: ColorToken = .clearColor,
        size: SpinnerSizeConfiguration = DefaultSpinnerSize()
    ) {
        self.backgroundColor = backgroundColor
        self.angle = angle
        self.strokeCap = strokeCap
        self.startColor = startColor
        self.endColor = endColor
        self.size = size
    }
    
    public static func == (lhs: SpinnerAppearance, rhs: SpinnerAppearance) -> Bool {
        lhs.id == rhs.id &&
        lhs.backgroundColor == rhs.backgroundColor &&
        lhs.angle == rhs.angle &&
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
