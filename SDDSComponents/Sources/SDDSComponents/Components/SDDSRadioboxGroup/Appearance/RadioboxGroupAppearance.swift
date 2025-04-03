import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public struct RadioboxGroupAppearance {
    public var size: RadioboxGroupSizeConfiguration
    public var radioboxAppearance: RadioboxAppearance
    
    public init(
        size: RadioboxGroupSizeConfiguration = ZeroRadioboxGroupSize(),
        radioboxAppearance: RadioboxAppearance = RadioboxAppearance()
    ) {
        self.size = size
        self.radioboxAppearance = radioboxAppearance
    }
}

extension RadioboxGroupAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: RadioboxGroupAppearance.self, fallback: RadioboxGroupAppearance())
    }
}

public struct ZeroRadioboxGroupSize: RadioboxGroupSizeConfiguration {
    public var verticalSpacing: CGFloat
    
    public var debugDescription: String {
        "ZeroRadioboxGroupSize"
    }
    
    public init(verticalSpacing: CGFloat = 0) {
        self.verticalSpacing = verticalSpacing
    }
}
