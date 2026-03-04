import SwiftUI
@_exported import SDDSThemeCore

public struct OverlayAppearance {
    public var backgroundColor: FillStyle
    public var blurRadius: CGFloat
    public var size: OverlaySizeConfiguration
    
    public init(backgroundColor: FillStyle = .color(.clearColor), blurRadius: CGFloat = 0) {
        self.backgroundColor = backgroundColor
        self.blurRadius = blurRadius
        self.size = ZeroOverlaySize()
    }
}

public struct ZeroOverlaySize: OverlaySizeConfiguration {
    public var debugDescription: String {
        "ZeroOverlaySize"
    }
}

extension OverlayAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: OverlayAppearance.self, fallback: OverlayAppearance())
    }
}
