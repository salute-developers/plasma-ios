import SwiftUI
@_exported import SDDSThemeCore

public struct DividerAppearance {
    public var shape: PathDrawer
    public var thickness: CGFloat
    public var backgroundColor: ColorToken
    public var size: DividerSizeConfiguration
    
    public init(shape: PathDrawer = DefaultPathDrawer(), thickness: CGFloat = 0, backgroundColor: ColorToken = .clearColor, size: DividerSizeConfiguration = ZeroDividerSizeConfiguration()) {
        self.shape = shape
        self.thickness = thickness
        self.backgroundColor = backgroundColor
        self.size = size
    }
}

extension DividerAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: DividerAppearance.self, fallback: DividerAppearance())
    }
}
