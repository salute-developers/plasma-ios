import SwiftUI
import SDDSApiInfo
@_exported import SDDSThemeCore

@ApiInfo
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
