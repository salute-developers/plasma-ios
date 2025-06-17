import SwiftUI
@_exported import SDDSThemeCore

public struct SkeletonAppearance {
    public var shape: PathDrawer
    public var gradient: GradientToken
    public var size: SkeletonSizeConfiguration
    public var duration: Double
    
    public init(
        shape: PathDrawer = DefaultPathDrawer(),
        gradient: GradientToken = .clearColor,
        size: SkeletonSizeConfiguration = ZeroSkeletonSizeConfiguration(),
        duration: Double = 5.0
    ) {
        self.shape = shape
        self.gradient = gradient
        self.size = size
        self.duration = duration
    }
}

extension SkeletonAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: SkeletonAppearance.self, fallback: SkeletonAppearance())
    }
} 
