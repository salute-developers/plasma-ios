import SwiftUI
@_exported import SDDSThemeCore

public struct ImageAppearance {
    public var size: ImageSizeConfiguration

    public init(size: ImageSizeConfiguration = DefaultImageSize()) {
        self.size = size
    }
}

extension ImageAppearance: EnvironmentKey {
    public static var defaultValue: ImageAppearance {
        EnvironmentValueProvider.shared.value(forKey: ImageAppearance.self, fallback: ImageAppearance())
    }
}
